/obj/item/clothing/gloves/toagloves // does this count as a weapon? i think so
	name = "\improper Toa gauntlets"
	desc = "Commonly understood to be the mark of an accomplished warrior within the Toa tribe. \
	Exotic nanotechnology is woven into these advanced combat gloves, granting the wearer \
	increased dexterity in unarmed combat, along with the capacity to generate nonlethal \
	energy throwing-stars."
	icon = 'scoundrel/icons/obj/weapons/melee.dmi'
	icon_state = "toagloves"
	worn_icon = 'scoundrel/icons/mob/clothing/scoundrel_gloves.dmi'
	worn_icon_state = "toagloves"
	lefthand_file = null
	righthand_file = null

	w_class = WEIGHT_CLASS_NORMAL // harder to hide
	siemens_coefficient = 0
	strip_delay = 60
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF //steal objective items are hard to destroy.

	var/star_hitsound = 'sound/scoundrel/weapons/energystar2.ogg'
	var/star_throwsound = 'sound/scoundrel/weapons/energystar1.ogg'
	var/star_throwvolume = 50
	var/star_pickupsound = 'sound/scoundrel/weapons/energy_unsheathe.ogg' // vars for debugging and admin abuse

	actions_types = list(/datum/action/item_action/toa_energystar)
	COOLDOWN_DECLARE(spawn_cd)
	// needs heat protection

/obj/item/clothing/gloves/toagloves/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/scoundrel_punchcooldown)

/datum/component/wearertargeting/scoundrel_punchcooldown
	var/unarmed_cd_reduction = 2 // idk how to add this var to the root item

	signals = list(COMSIG_HUMAN_MELEE_UNARMED_ATTACK, COMSIG_LIVING_SLAP_MOB)
	mobtype = /mob/living/carbon
	proctype = PROC_REF(reducecooldown)
	valid_slots = list(ITEM_SLOT_GLOVES)

/datum/component/wearertargeting/scoundrel_punchcooldown/proc/reducecooldown(mob/living/carbon/M, atom/target)
	if((M.combat_mode && isliving(target)) || istype(M.get_active_held_item(), /obj/item/hand_item/slapper))
		M.changeNext_move(CLICK_CD_MELEE - unarmed_cd_reduction)

/obj/item/clothing/gloves/toagloves/ui_action_click(mob/user, action)
	if(COOLDOWN_FINISHED(src, spawn_cd))
		COOLDOWN_START(src, spawn_cd, 0.5 SECONDS)

		spawn_star(user)

/obj/item/clothing/gloves/toagloves/proc/spawn_star/(mob/living/user)
	var/obj/item/throwing_star/energy/created = new /obj/item/throwing_star/energy(src)
	created.hitsound = star_hitsound
	created.throwsound = star_throwsound
	created.throwvolume = star_throwvolume
	created.pickup_sound = star_pickupsound
	if(!HAS_TRAIT(user, TRAIT_INCAPACITATED))
		user.put_in_hands(created, del_on_fail = TRUE)


/obj/item/throwing_star/energy
	name = "energy star" // generic name for readability
	desc = "A nonlethal throwing-star composed of a pseudofluid hardlight structure. \
	Effortlessly slips through most shields and armor when thrown."
	icon = 'scoundrel/icons/obj/weapons/melee.dmi'
	icon_state = "energystar"
	inhand_icon_state = "energystar"
	lefthand_file = 'scoundrel/icons/mob/inhands/scoundrel_lefthand.dmi'
	righthand_file = 'scoundrel/icons/mob/inhands/scoundrel_righthand.dmi'

	// overriden by the gloves
	pickup_sound = null
	var/throwsound = null
	var/throwvolume = 0
	hitsound = null

	// combat stats
	damtype = STAMINA
	force = 21
	throwforce = 21
	throw_speed = 2
	throw_range = 10
	armour_penetration = 40

//	light_range = 2
//	light_color = "#00FF00" // these lights are stationary when applied. come back and fix this eventually...

	embedding = null
	sharpness = null
	resistance_flags = null // why did i make this a subtype again?
	custom_materials = null
	w_class = WEIGHT_CLASS_HUGE // can't store it. maybe this should get a new define

/obj/item/throwing_star/energy/Initialize(mapload)
	. = ..()
	update_icon(UPDATE_OVERLAYS)

/obj/item/throwing_star/energy/worn_overlays(mutable_appearance/standing, isinhands, icon_file)
	. = ..()
	if(isinhands)
		. += emissive_appearance(icon_file, "energystar", src, alpha = src.alpha)

/obj/item/throwing_star/energy/update_overlays()
	. = ..()
	. += emissive_appearance(icon, "energystar", src, alpha = src.alpha)

/obj/item/throwing_star/energy/throw_at(atom/target, range, speed, mob/thrower, spin=1, diagonals_first = 0, datum/callback/callback, gentle = FALSE, quickstart = TRUE)
	if(!..())
		return
	playsound(src.loc,throwsound, throwvolume, TRUE)

/obj/item/throwing_star/energy/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(proximity_flag && !isturf(target))
		terminate_star()

/obj/item/throwing_star/energy/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	terminate_star()

/obj/item/throwing_star/energy/dropped() // this could be done better, but it works
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(terminate_star)), 1 SECONDS)

/obj/item/throwing_star/energy/proc/terminate_star()
	do_sparks(2, TRUE, src)
	qdel(src)

/datum/action/item_action/toa_energystar
	name = "Generate Energy Star"
	desc = "Hardlight projectors in the Toa gauntlets generate an energy throwing-star."
	icon_icon = 'scoundrel/icons/obj/weapons/melee.dmi'
	button_icon_state = "energystar"

// agent energysword
/obj/item/melee/tonfa/esword
	name = "plasma blade"
	desc = "A contained-plasma energy blade, effective at penetrating armor. It can be folded into a compact shape for concealed carrying."
	icon = 'scoundrel/icons/obj/weapons/transforming_melee.dmi'
	icon_state = "esword"
	inhand_icon_state = "esword"
	inhand_x_dimension = 64
	inhand_y_dimension = 64
//	worn_icon_state = null
	lefthand_file = 'scoundrel/icons/mob/inhands/64x64_weapons_left.dmi'
	righthand_file = 'scoundrel/icons/mob/inhands/64x64_weapons_right.dmi'
	slot_flags = null

	damtype = BRUTE
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL
	armour_penetration = 50
	wound_bonus = 10
	bare_wound_bonus = 10

	///Determines our active effects
	active_w_class = WEIGHT_CLASS_BULKY

	active_force = 20
	active_damage_type = BRUTE
	active_sharpness = SHARP_EDGED
	active_hit_sound = 'sound/scoundrel/weapons/energy_sword_swing5.ogg'
	active_throwforce = 25
	active_verb_continuous = list("slashes","phases","stabs","ripostes")
	active_verb_simple = list("slash","phase","stab","riposte")
	activate_sound = 'sound/scoundrel/weapons/esword_on.ogg'
	activate_sound_volume = 38
	activate_balloon = FALSE

/obj/item/melee/tonfa/esword/add_blood_DNA(list/blood_dna)
	return FALSE

/obj/item/melee/tonfa/esword/ignition_effect(atom/atom, mob/user)
	if(!weapon_active)
		user.visible_message("[user] tries to light [atom] using [user.p_their()] [name], but it was off. Nice one.")
		playsound(loc, hitsound, get_clamped_volume(), TRUE, -1)
		return ""

	var/in_mouth = ""
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		if(carbon_user.wear_mask)
			in_mouth = ", barely missing [carbon_user.p_their()] nose"
	. = span_warning("[user] swings [user.p_their()] [name][in_mouth]. [user.p_they(TRUE)] light[user.p_s()] [user.p_their()] [atom.name] in the process.")
	playsound(loc, hitsound, get_clamped_volume(), TRUE, -1)
	add_fingerprint(user)

// tracking throwingstar
/obj/item/throwing_star/tracking
	name = "tracking shuriken"
	desc = "A throwing star loaded with a GPS unit and coated in microscopic metallic bristles for maximum embedding grip. \
	Intensely uncomfortable and difficult to remove, but not very dangerous."
	icon_state = "trackingstar"
	embedding = list(ignore_throwspeed_threshold = TRUE, "pain_mult" = 0.25, "embed_chance" = 100, "fall_chance" = 0, "rip_time" = 10 SECONDS, "jostle_chance" = 0)

	// will only activate once
	var/used_up = FALSE
	// the label seen on GPS units
	var/gpstag = "TRACKING"
	// time before the gps expires after initial embed
	var/gps_timer = 120 SECONDS

/obj/item/throwing_star/tracking/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/gps, gpstag)
	disable_gps()

/obj/item/throwing_star/tracking/embedded(atom/embedded_target, obj/item/bodypart/part)
	. = ..()
	var/datum/component/gps/gps_unit = GetComponent(/datum/component/gps)
	if(gps_unit && used_up == FALSE)
		gps_unit.tracking = TRUE
		addtimer(CALLBACK(src, PROC_REF(disable_gps)), gps_timer)

/obj/item/throwing_star/tracking/proc/disable_gps()
	var/datum/component/gps/gps_unit = GetComponent(/datum/component/gps)
	if(gps_unit)
		gps_unit.tracking = FALSE

/obj/item/throwing_star/tracking/unembedded()
	. = ..()
	var/datum/component/gps/gps_unit = GetComponent(/datum/component/gps)
	if(gps_unit && used_up == FALSE)
		used_up = TRUE
		desc += "\n[span_notice("The GPS is expended. This won't be tracking anything anymore.")]"
		gps_unit.tracking = FALSE
		icon_state = "[initial(icon_state)]_dead"
	

/obj/item/throwing_star/tracking/traitor
	name = "hunting shuriken"
	desc = "A suspicious black throwing star loaded with a GPS unit that activates when embedded. \
	Razor-sharp molecular fibers prevent it from being easily removed, and it has an extended lifespan."
	icon_state = "trackingstar_black"
	throwforce = 15
	embedding = list(ignore_throwspeed_threshold = TRUE, "pain_mult" = 0.05, "embed_chance" = 100, "fall_chance" = 0, "rip_time" = 120 SECONDS, "jostle_chance" = 0, "pain_chance" = 1)
	gps_timer = 10 MINUTES // can't ignore it
	gpstag = "HUNT" // reminder to add a feature to huntingstars to rename the gps when used inhand
