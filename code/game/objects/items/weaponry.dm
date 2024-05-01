/obj/item/banhammer
	desc = "A banhammer."
	name = "banhammer"
	icon = 'icons/obj/weapons/items_and_weapons.dmi'
	icon_state = "toyhammer"
	slot_flags = ITEM_SLOT_BELT
	throwforce = 0
	force = 1
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 3
	throw_range = 7
	attack_verb_continuous = list("bans")
	attack_verb_simple = list("ban")
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 100, ACID = 70)
	resistance_flags = FIRE_PROOF

/obj/item/banhammer/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/kneejerk)

/obj/item/banhammer/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] is hitting [user.p_them()]self with [src]! It looks like [user.p_theyre()] trying to ban [user.p_them()]self from life."))
	return (BRUTELOSS|FIRELOSS|TOXLOSS|OXYLOSS)
/*
oranges says: This is a meme relating to the english translation of the ss13 russian wiki page on lurkmore.
mrdoombringer sez: and remember kids, if you try and PR a fix for this item's grammar, you are admitting that you are, indeed, a newfriend.
for further reading, please see: https://github.com/tgstation/tgstation/pull/30173 and https://translate.google.com/translate?sl=auto&tl=en&js=y&prev=_t&hl=en&ie=UTF-8&u=%2F%2Flurkmore.to%2FSS13&edit-text=&act=url
*/
/obj/item/banhammer/attack(mob/M, mob/living/user)
	if(user.zone_selected == BODY_ZONE_HEAD)
		M.visible_message(span_danger("[user] are stroking the head of [M] with a bangammer."), span_userdanger("[user] are stroking your head with a bangammer."), span_hear("You hear a bangammer stroking a head.")) // see above comment
	else
		M.visible_message(span_danger("[M] has been banned FOR NO REISIN by [user]!"), span_userdanger("You have been banned FOR NO REISIN by [user]!"), span_hear("You hear a banhammer banning someone."))
	playsound(loc, 'sound/effects/adminhelp.ogg', 15) //keep it at 15% volume so people don't jump out of their skin too much
	if(user.combat_mode)
		return ..(M, user)

/obj/item/sord
	name = "\improper SORD"
	desc = "This thing is so unspeakably shitty you are having a hard time even holding it."
	icon_state = "sord"
	inhand_icon_state = "sord"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	force = 2
	throwforce = 1
	w_class = WEIGHT_CLASS_NORMAL
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb_continuous = list("attacks", "slashes", "stabs", "slices", "tears", "lacerates", "rips", "dices", "cuts")
	attack_verb_simple = list("attack", "slash", "stab", "slice", "tear", "lacerate", "rip", "dice", "cut")

/obj/item/sord/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] is trying to impale [user.p_them()]self with [src]! It might be a suicide attempt if it weren't so shitty."), \
	span_suicide("You try to impale yourself with [src], but it's USELESS..."))
	return SHAME

/obj/item/claymore
	name = "claymore"
	desc = "What are you standing around staring at this for? Get to killing!"
	icon_state = "claymore"
	inhand_icon_state = "claymore"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	force = 40
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb_continuous = list("attacks", "slashes", "stabs", "slices", "tears", "lacerates", "rips", "dices", "cuts")
	attack_verb_simple = list("attack", "slash", "stab", "slice", "tear", "lacerate", "rip", "dice", "cut")
	block_chance = 50
	sharpness = SHARP_EDGED
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF

/obj/item/claymore/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/butchering, \
	speed = 4 SECONDS, \
	effectiveness = 105, \
	)

/obj/item/claymore/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] is falling on [src]! It looks like [user.p_theyre()] trying to commit suicide!"))
	return BRUTELOSS

//statistically similar to e-cutlasses
/obj/item/claymore/cutlass
	name = "cutlass"
	desc = "A piratey sword used by buckaneers to \"negotiate\" the transfer of treasure."
	icon_state = "cutlass"
	inhand_icon_state = "cutlass"
	worn_icon_state = "cutlass"
	slot_flags = ITEM_SLOT_BACK
	force = 30
	throwforce = 20
	throw_speed = 3
	throw_range = 5
	armour_penetration = 35

/obj/item/claymore/highlander //ALL COMMENTS MADE REGARDING THIS SWORD MUST BE MADE IN ALL CAPS
	desc = "<b><i>THERE CAN BE ONLY ONE, AND IT WILL BE YOU!!!</i></b>\nActivate it in your hand to point to the nearest victim."
	flags_1 = CONDUCT_1
	item_flags = DROPDEL //WOW BRO YOU LOST AN ARM, GUESS WHAT YOU DONT GET YOUR SWORD ANYMORE //I CANT BELIEVE SPOOKYDONUT WOULD BREAK THE REQUIREMENTS
	slot_flags = null
	block_chance = 0 //RNG WON'T HELP YOU NOW, PANSY
	light_range = 3
	attack_verb_continuous = list("brutalizes", "eviscerates", "disembowels", "hacks", "carves", "cleaves") //ONLY THE MOST VISCERAL ATTACK VERBS
	attack_verb_simple = list("brutalize", "eviscerate", "disembowel", "hack", "carve", "cleave")
	var/notches = 0 //HOW MANY PEOPLE HAVE BEEN SLAIN WITH THIS BLADE
	var/obj/item/disk/nuclear/nuke_disk //OUR STORED NUKE DISK

/obj/item/claymore/highlander/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HIGHLANDER_TRAIT)
	START_PROCESSING(SSobj, src)

/obj/item/claymore/highlander/Destroy()
	if(nuke_disk)
		nuke_disk.forceMove(get_turf(src))
		nuke_disk.visible_message(span_warning("The nuke disk is vulnerable!"))
		nuke_disk = null
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/claymore/highlander/process()
	if(ishuman(loc))
		var/mob/living/carbon/human/holder = loc
		SET_PLANE_EXPLICIT(holder, GAME_PLANE_UPPER_FOV_HIDDEN, src) //NO HIDING BEHIND PLANTS FOR YOU, DICKWEED (HA GET IT, BECAUSE WEEDS ARE PLANTS)
		ADD_TRAIT(holder, TRAIT_NOBLEED, HIGHLANDER_TRAIT) //AND WE WON'T BLEED OUT LIKE COWARDS
	else
		if(!(flags_1 & ADMIN_SPAWNED_1))
			qdel(src)


/obj/item/claymore/highlander/pickup(mob/living/user)
	. = ..()
	to_chat(user, span_notice("The power of Scotland protects you! You are shielded from all stuns and knockdowns."))
	user.add_stun_absorption("highlander", INFINITY, 1, " is protected by the power of Scotland!", "The power of Scotland absorbs the stun!", " is protected by the power of Scotland!")
	user.ignore_slowdown(HIGHLANDER)

/obj/item/claymore/highlander/dropped(mob/living/user)
	. = ..()
	user.unignore_slowdown(HIGHLANDER)

/obj/item/claymore/highlander/examine(mob/user)
	. = ..()
	. += "It has [!notches ? "nothing" : "[notches] notches"] scratched into the blade."
	if(nuke_disk)
		. += span_boldwarning("It's holding the nuke disk!")

/obj/item/claymore/highlander/attack(mob/living/target, mob/living/user)
	. = ..()
	if(!QDELETED(target) && target.stat == DEAD && target.mind && target.mind.special_role == "highlander")
		user.fully_heal() //STEAL THE LIFE OF OUR FALLEN FOES
		add_notch(user)
		target.visible_message(span_warning("[target] crumbles to dust beneath [user]'s blows!"), span_userdanger("As you fall, your body crumbles to dust!"))
		target.investigate_log("has been dusted by a highlander claymore.", INVESTIGATE_DEATHS)
		target.dust()

/obj/item/claymore/highlander/attack_self(mob/living/user)
	var/closest_victim
	var/closest_distance = 255
	for(var/mob/living/carbon/human/scot in GLOB.player_list - user)
		if(scot.mind.special_role == "highlander" && (!closest_victim || get_dist(user, closest_victim) < closest_distance))
			closest_victim = scot
	for(var/mob/living/silicon/robot/siliscot in GLOB.player_list - user)
		if(siliscot.mind.special_role == "highlander" && (!closest_victim || get_dist(user, closest_victim) < closest_distance))
			closest_victim = siliscot

	if(!closest_victim)
		to_chat(user, span_warning("[src] thrums for a moment and falls dark. Perhaps there's nobody nearby."))
		return
	to_chat(user, span_danger("[src] thrums and points to the [dir2text(get_dir(user, closest_victim))]."))

/obj/item/claymore/highlander/IsReflect()
	return 1 //YOU THINK YOUR PUNY LASERS CAN STOP ME?

/obj/item/claymore/highlander/proc/add_notch(mob/living/user) //DYNAMIC CLAYMORE PROGRESSION SYSTEM - THIS IS THE FUTURE
	notches++
	force++
	var/new_name = name
	switch(notches)
		if(1)
			to_chat(user, span_notice("Your first kill - hopefully one of many. You scratch a notch into [src]'s blade."))
			to_chat(user, span_warning("You feel your fallen foe's soul entering your blade, restoring your wounds!"))
			new_name = "notched claymore"
		if(2)
			to_chat(user, span_notice("Another falls before you. Another soul fuses with your own. Another notch in the blade."))
			new_name = "double-notched claymore"
			add_atom_colour(rgb(255, 235, 235), ADMIN_COLOUR_PRIORITY)
		if(3)
			to_chat(user, span_notice("You're beginning to</span> <span class='danger'><b>relish</b> the <b>thrill</b> of <b>battle.</b>"))
			new_name = "triple-notched claymore"
			add_atom_colour(rgb(255, 215, 215), ADMIN_COLOUR_PRIORITY)
		if(4)
			to_chat(user, span_notice("You've lost count of</span> <span class='boldannounce'>how many you've killed."))
			new_name = "many-notched claymore"
			add_atom_colour(rgb(255, 195, 195), ADMIN_COLOUR_PRIORITY)
		if(5)
			to_chat(user, span_boldannounce("Five voices now echo in your mind, cheering the slaughter."))
			new_name = "battle-tested claymore"
			add_atom_colour(rgb(255, 175, 175), ADMIN_COLOUR_PRIORITY)
		if(6)
			to_chat(user, span_boldannounce("Is this what the vikings felt like? Visions of glory fill your head as you slay your sixth foe."))
			new_name = "battle-scarred claymore"
			add_atom_colour(rgb(255, 155, 155), ADMIN_COLOUR_PRIORITY)
		if(7)
			to_chat(user, span_boldannounce("Kill. Butcher. <i>Conquer.</i>"))
			new_name = "vicious claymore"
			add_atom_colour(rgb(255, 135, 135), ADMIN_COLOUR_PRIORITY)
		if(8)
			to_chat(user, span_userdanger("IT NEVER GETS OLD. THE <i>SCREAMING</i>. THE <i>BLOOD</i> AS IT <i>SPRAYS</i> ACROSS YOUR <i>FACE.</i>"))
			new_name = "bloodthirsty claymore"
			add_atom_colour(rgb(255, 115, 115), ADMIN_COLOUR_PRIORITY)
		if(9)
			to_chat(user, span_userdanger("ANOTHER ONE FALLS TO YOUR BLOWS. ANOTHER WEAKLING UNFIT TO LIVE."))
			new_name = "gore-stained claymore"
			add_atom_colour(rgb(255, 95, 95), ADMIN_COLOUR_PRIORITY)
		if(10)
			user.visible_message(span_warning("[user]'s eyes light up with a vengeful fire!"), \
			span_userdanger("YOU FEEL THE POWER OF VALHALLA FLOWING THROUGH YOU! <i>THERE CAN BE ONLY ONE!!!</i>"))
			new_name = "GORE-DRENCHED CLAYMORE OF [pick("THE WHIMSICAL SLAUGHTER", "A THOUSAND SLAUGHTERED CATTLE", "GLORY AND VALHALLA", "ANNIHILATION", "OBLITERATION")]"
			icon_state = "claymore_gold"
			inhand_icon_state = "cultblade"
			lefthand_file = 'icons/mob/inhands/64x64_lefthand.dmi'
			righthand_file = 'icons/mob/inhands/64x64_righthand.dmi'
			remove_atom_colour(ADMIN_COLOUR_PRIORITY)
			user.update_held_items()

	name = new_name
	playsound(user, 'sound/items/screwdriver2.ogg', 50, TRUE)

/obj/item/claymore/highlander/robot //BLOODTHIRSTY BORGS NOW COME IN PLAID
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "claymore_cyborg"
	var/mob/living/silicon/robot/robot

/obj/item/claymore/highlander/robot/Initialize(mapload)
	var/obj/item/robot_model/kiltkit = loc
	robot = kiltkit.loc
	. = ..()
	if(!istype(robot))
		return INITIALIZE_HINT_QDEL

/obj/item/claymore/highlander/robot/process()
	SET_PLANE_IMPLICIT(loc, GAME_PLANE_UPPER_FOV_HIDDEN)

/obj/item/katana
	name = "katana"
	desc = "Woefully underpowered in D20."
	icon_state = "katana"
	inhand_icon_state = "katana"
	worn_icon_state = "katana"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	force = 40
	throwforce = 10
	w_class = WEIGHT_CLASS_HUGE
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb_continuous = list("attacks", "slashes", "stabs", "slices", "tears", "lacerates", "rips", "dices", "cuts")
	attack_verb_simple = list("attack", "slash", "stab", "slice", "tear", "lacerate", "rip", "dice", "cut")
	block_chance = 50
	sharpness = SHARP_EDGED
	max_integrity = 200
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 100, ACID = 50)
	resistance_flags = FIRE_PROOF

/obj/item/katana/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] is slitting [user.p_their()] stomach open with [src]! It looks like [user.p_theyre()] trying to commit seppuku!"))
	return BRUTELOSS

/obj/item/katana/cursed //used by wizard events, see the tendril_loot.dm file for the miner one
	slot_flags = null

/obj/item/wirerod
	name = "wired rod"
	desc = "A rod with some wire wrapped around the top. It'd be easy to attach something to the top bit."
	icon_state = "wiredrod"
	inhand_icon_state = "rods"
	flags_1 = CONDUCT_1
	force = 9
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	custom_materials = list(/datum/material/iron=1150, /datum/material/glass=75)
	attack_verb_continuous = list("hits", "bludgeons", "whacks", "bonks")
	attack_verb_simple = list("hit", "bludgeon", "whack", "bonk")

/obj/item/wirerod/Initialize(mapload)
	. = ..()

	var/static/list/hovering_item_typechecks = list(
		/obj/item/shard = list(
			SCREENTIP_CONTEXT_LMB = "Craft spear",
		),

		/obj/item/assembly/igniter = list(
			SCREENTIP_CONTEXT_LMB = "Craft stunprod",
		),
	)

	AddElement(/datum/element/contextual_screentip_item_typechecks, hovering_item_typechecks)

/obj/item/wirerod/attackby(obj/item/attacking_item, mob/user, params)
	if(istype(attacking_item, /obj/item/shard))
		var/obj/item/spear/crafted_spear = new /obj/item/spear()

		remove_item_from_storage(user)
		if (!user.transferItemToLoc(attacking_item, crafted_spear))
			return
		crafted_spear.CheckParts(list(attacking_item))
		qdel(src)

		user.put_in_hands(crafted_spear)
		user.balloon_alert(user, "crafted spear")
		return

	if(isigniter(attacking_item) && !(HAS_TRAIT(attacking_item, TRAIT_NODROP)))
		var/obj/item/unfinished_stunprod/prod = new

		remove_item_from_storage(user)

		qdel(attacking_item)
		qdel(src)

		user.put_in_hands(prod)
		user.balloon_alert(user, "crafted stunprod")
		return

	return ..()

/obj/item/unfinished_stunprod
	name = "stunprod"
	desc = "A makeshift shock-prod. Looks like it's missing a power cell."
	icon = 'icons/obj/weapons/items_and_weapons.dmi'
	icon_state = "stunprod_nocell"
	force = 12
	throwforce = 12

/obj/item/unfinished_stunprod/attackby(obj/item/attacking_item, mob/user, params)
	if(istype(attacking_item, /obj/item/stock_parts/cell))
		var/obj/item/melee/tonfa/shock_tonfa/stunprod/prod = new /obj/item/melee/tonfa/shock_tonfa/stunprod()

		remove_item_from_storage(user)
		if (!user.transferItemToLoc(attacking_item, prod))
			return
		prod.CheckParts(list(attacking_item))
		qdel(src)

		user.put_in_hands(prod)
		user.balloon_alert(user, "finished stunprod")
	return

/obj/item/throwing_star
	name = "shuriken"
	desc = "An ancient weapon still used to this day, due to its ease of lodging itself into its victim's body parts."
	icon = 'scoundrel/icons/obj/weapons/melee.dmi'
	icon_state = "throwingstar"
	inhand_icon_state = "eshield"
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	force = 2
	throwforce = 10
	throw_speed = 2
	embedding = list(ignore_throwspeed_threshold = TRUE, "pain_mult" = 0.5, "embed_chance" = 100, "fall_chance" = 0)
	armour_penetration = 40

	w_class = WEIGHT_CLASS_SMALL
	sharpness = SHARP_POINTY
	custom_materials = list(/datum/material/iron=500, /datum/material/glass=500)
	resistance_flags = FIRE_PROOF

/obj/item/throwing_star/stamina
	name = "shock shuriken"
	desc = "An aerodynamic disc designed to cause excruciating pain when stuck inside fleeing targets, hopefully without causing fatal harm."
	throwforce = 5
	embedding = list("pain_chance" = 5, "embed_chance" = 100, "fall_chance" = 0, "jostle_chance" = 10, "pain_stam_pct" = 0.8, "jostle_pain_mult" = 3)

/obj/item/throwing_star/toy
	name = "toy throwing star"
	desc = "An aerodynamic disc strapped with adhesive for sticking to people, good for playing pranks and getting yourself killed by security."
	sharpness = NONE
	force = 0
	throwforce = 0
	embedding = list("pain_mult" = 0, "jostle_pain_mult" = 0, "embed_chance" = 100, "fall_chance" = 0)

/obj/item/switchblade
	name = "switchblade"
	desc = "A sharp, concealable, spring-loaded knife."
	icon = 'scoundrel/icons/obj/weapons/transforming_melee.dmi'
	icon_state = "switchblade"
	base_icon_state = "switchblade"
	inhand_icon_state = "switchblade"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	flags_1 = CONDUCT_1
	w_class = WEIGHT_CLASS_SMALL
	throw_speed = 4
	throw_range = 8
	custom_materials = list(/datum/material/iron=12000)
	hitsound = 'sound/weapons/genhit.ogg'
	attack_verb_continuous = list("stubs", "pokes")
	attack_verb_simple = list("stub", "poke")
	resistance_flags = FIRE_PROOF

	wound_bonus = 15

	// sound played when extended/retracted
	var/on_sound = 'sound/weapons/batonextend.ogg'
	/// Whether the switchblade starts extended or not.
	var/start_extended = FALSE

/obj/item/switchblade/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob, ITEM_SLOT_HANDS)
	AddComponent(/datum/component/butchering, \
	speed = 7 SECONDS, \
	effectiveness = 100, \
	)

	AddComponent(/datum/component/transforming, \
		start_transformed = start_extended, \
		force_on = 12, \
		throwforce_on = 15, \
		throw_speed_on = throw_speed, \
		sharpness_on = SHARP_EDGED, \
		hitsound_on = 'sound/weapons/bladeslice.ogg', \
		w_class_on = WEIGHT_CLASS_NORMAL, \
		attack_verb_continuous_on = list("slashes", "stabs", "slices", "tears", "lacerates", "rips", "dices", "cuts"), \
		attack_verb_simple_on = list("slash", "stab", "slice", "tear", "lacerate", "rip", "dice", "cut"), \
	)

	RegisterSignal(src, COMSIG_TRANSFORMING_ON_TRANSFORM, PROC_REF(on_transform))

/obj/item/switchblade/proc/on_transform(obj/item/source, mob/user, active)
	SIGNAL_HANDLER
	playsound(user ? user : src, on_sound, 50, TRUE)
	tool_behaviour = (active ? TOOL_KNIFE : NONE)
	return COMPONENT_NO_DEFAULT_MESSAGE

/obj/item/switchblade/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] is slitting [user.p_their()] own throat with [src]! It looks like [user.p_theyre()] trying to commit suicide!"))
	return BRUTELOSS

/obj/item/switchblade/extended
	start_extended = TRUE

/obj/item/phone
	name = "red phone"
	desc = "Should anything ever go wrong..."
	icon = 'icons/obj/weapons/items_and_weapons.dmi'
	icon_state = "red_phone"
	force = 12
	throwforce = 15
	throw_speed = 3
	throw_range = 4
	w_class = WEIGHT_CLASS_SMALL
	attack_verb_continuous = list("calls", "rings")
	attack_verb_simple = list("call", "ring")
	hitsound = 'sound/weapons/ring.ogg'

/obj/item/phone/suicide_act(mob/living/user)
	if(locate(/obj/structure/chair/stool) in user.loc)
		user.visible_message(span_suicide("[user] begins to tie a noose with [src]'s cord! It looks like [user.p_theyre()] trying to commit suicide!"))
	else
		user.visible_message(span_suicide("[user] is strangling [user.p_them()]self with [src]'s cord! It looks like [user.p_theyre()] trying to commit suicide!"))
	return OXYLOSS

/obj/item/cane
	name = "cane"
	desc = "A cane used by a true gentleman. Or a clown."
	icon = 'icons/obj/weapons/items_and_weapons.dmi'
	icon_state = "cane"
	inhand_icon_state = "stick"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 10
	throwforce = 12
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron=50)
	attack_verb_continuous = list("bludgeons", "whacks", "disciplines", "thrashes")
	attack_verb_simple = list("bludgeon", "whack", "discipline", "thrash")

/obj/item/cane/white
	name = "white cane"
	desc = "A cane traditionally used by the blind to help them see. Folds down to be easier to transport."
	icon_state = "cane_white"
	inhand_icon_state = "cane_white"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 1
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron = 600)

/obj/item/cane/white/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/transforming, \
		force_on = 7, \
		hitsound_on = hitsound, \
		w_class_on = WEIGHT_CLASS_BULKY, \
		clumsy_check = FALSE, \
		attack_verb_continuous_on = list("smacks", "strikes", "cracks", "beats"), \
		attack_verb_simple_on = list("smack", "strike", "crack", "beat"))
	RegisterSignal(src, COMSIG_TRANSFORMING_ON_TRANSFORM, PROC_REF(on_transform))
	ADD_TRAIT(src, TRAIT_BLIND_TOOL, ITEM_BLIND_TRAIT)

/*
 * Signal proc for [COMSIG_TRANSFORMING_ON_TRANSFORM].
 *
 * Gives feedback to the user and makes it show up inhand.
 */
/obj/item/cane/white/proc/on_transform(obj/item/source, mob/user, active)
	SIGNAL_HANDLER

	balloon_alert(user, active ? "extended" : "collapsed")
	playsound(user ? user : src, 'sound/weapons/batonextend.ogg', 50, TRUE)
	return COMPONENT_NO_DEFAULT_MESSAGE

/obj/item/staff
	name = "wizard staff"
	desc = "Apparently a staff used by the wizard."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "staff"
	inhand_icon_state = "staff"
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'
	force = 10
	throwforce = 12
	throw_speed = 2
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	armour_penetration = 100
	attack_verb_continuous = list("bludgeons", "whacks", "disciplines")
	attack_verb_simple = list("bludgeon", "whack", "discipline")
	resistance_flags = FLAMMABLE

/obj/item/staff/broom
	name = "broom"
	desc = "Used for sweeping, and flying into the night while cackling. Black cat not included."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "broom"
	inhand_icon_state = "broom"
	resistance_flags = FLAMMABLE

/obj/item/staff/stick
	name = "stick"
	desc = "A great tool to drag someone else's drinks across the bar."
	icon = 'icons/obj/weapons/items_and_weapons.dmi'
	icon_state = "cane"
	inhand_icon_state = "stick"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 3
	throwforce = 5
	throw_speed = 2
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ectoplasm
	name = "ectoplasm"
	desc = "Spooky."
	gender = PLURAL
	icon = 'icons/obj/wizard.dmi'
	icon_state = "ectoplasm"

/obj/item/ectoplasm/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] is inhaling [src]! It looks like [user.p_theyre()] trying to visit the astral plane!"))
	return OXYLOSS

/obj/item/ectoplasm/angelic
	icon = 'icons/obj/wizard.dmi'
	icon_state = "angelplasm"

/obj/item/ectoplasm/mystic
	icon_state = "mysticplasm"


/obj/item/mounted_chainsaw
	name = "mounted chainsaw"
	desc = "A chainsaw that has replaced your arm."
	icon_state = "chainsaw_on"
	inhand_icon_state = "mounted_chainsaw"
	lefthand_file = 'icons/mob/inhands/weapons/chainsaw_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/chainsaw_righthand.dmi'
	item_flags = ABSTRACT | DROPDEL
	w_class = WEIGHT_CLASS_HUGE
	force = 24
	throwforce = 0
	throw_range = 0
	throw_speed = 0
	sharpness = SHARP_EDGED
	attack_verb_continuous = list("saws", "tears", "lacerates", "cuts", "chops", "dices")
	attack_verb_simple = list("saw", "tear", "lacerate", "cut", "chop", "dice")
	hitsound = 'sound/weapons/chainsawhit.ogg'
	tool_behaviour = TOOL_SAW
	toolspeed = 1

/obj/item/mounted_chainsaw/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, HAND_REPLACEMENT_TRAIT)

/obj/item/mounted_chainsaw/Destroy()
	var/obj/item/bodypart/part
	new /obj/item/chainsaw(get_turf(src))
	if(iscarbon(loc))
		var/mob/living/carbon/holder = loc
		var/index = holder.get_held_index_of_item(src)
		if(index)
			part = holder.hand_bodyparts[index]
	. = ..()
	if(part)
		part.drop_limb()

/obj/item/statuebust
	name = "bust"
	desc = "A priceless ancient marble bust, the kind that belongs in a museum." //or you can hit people with it
	icon = 'icons/obj/art/statue.dmi'
	icon_state = "bust"
	force = 15
	throwforce = 10
	throw_speed = 5
	throw_range = 2
	attack_verb_continuous = list("busts")
	attack_verb_simple = list("bust")
	var/impressiveness = 45

/obj/item/statuebust/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/art, impressiveness)
	AddElement(/datum/element/beauty, 1000)

/obj/item/statuebust/hippocratic
	name = "hippocrates bust"
	desc = "A bust of the famous Greek physician Hippocrates of Kos, often referred to as the father of western medicine."
	icon_state = "hippocratic"
	impressiveness = 50

/obj/item/melee/skateboard
	name = "skateboard"
	desc = "A skateboard. It can be placed on its wheels and ridden, or used as a radical weapon."
	icon_state = "skateboard"
	inhand_icon_state = "skateboard"
	force = 12
	throwforce = 4
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb_continuous = list("smacks", "whacks", "slams", "smashes")
	attack_verb_simple = list("smack", "whack", "slam", "smash")
	///The vehicle counterpart for the board
	var/board_item_type = /obj/vehicle/ridden/scooter/skateboard

/obj/item/melee/skateboard/attack_self(mob/user)
	var/obj/vehicle/ridden/scooter/skateboard/S = new board_item_type(get_turf(user))//this probably has fucky interactions with telekinesis but for the record it wasn't my fault
	S.buckle_mob(user)
	qdel(src)

/obj/item/melee/skateboard/improvised
	name = "improvised skateboard"
	desc = "A jury-rigged skateboard. It can be placed on its wheels and ridden, or used as a radical weapon."
	board_item_type = /obj/vehicle/ridden/scooter/skateboard/improvised

/obj/item/melee/skateboard/pro
	name = "skateboard"
	desc = "An EightO brand professional skateboard. It looks sturdy and well made."
	icon_state = "skateboard2"
	inhand_icon_state = "skateboard2"
	board_item_type = /obj/vehicle/ridden/scooter/skateboard/pro
	//custom_premium_price = PAYCHECK_COMMAND * 5

/obj/item/melee/skateboard/hoverboard
	name = "hoverboard"
	desc = "A blast from the past, so retro!"
	icon_state = "hoverboard_red"
	inhand_icon_state = "hoverboard_red"
	board_item_type = /obj/vehicle/ridden/scooter/skateboard/hoverboard
	//custom_premium_price = PAYCHECK_COMMAND * 5.4 //If I can't make it a meme I'll make it RAD

/obj/item/melee/skateboard/hoverboard/admin
	name = "Board Of Directors"
	desc = "The engineering complexity of a spaceship concentrated inside of a board. Just as expensive, too."
	icon_state = "hoverboard_nt"
	inhand_icon_state = "hoverboard_nt"
	board_item_type = /obj/vehicle/ridden/scooter/skateboard/hoverboard/admin

/obj/item/melee/baseball_bat
	name = "baseball bat"
	desc = "There ain't a skull in the league that can withstand a swatter."
	icon = 'icons/obj/weapons/items_and_weapons.dmi'
	icon_state = "baseball_bat"
	inhand_icon_state = "baseball_bat"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 15
	throwforce = 18
	demolition_mod = 1.25
	attack_verb_continuous = list("beats", "smacks")
	attack_verb_simple = list("beat", "smack")
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 3.5)
	w_class = WEIGHT_CLASS_HUGE
	/// How fast it launches struck mobs
	var/melee_throw_speed = 2
	/// Are we able to do a homerun?
	var/homerun_able = FALSE
	/// Are we ready to do a homerun?
	var/homerun_ready = FALSE
	/// Can we launch mobs thrown at us away?
	var/mob_thrower = FALSE
	/// List of all thrown datums we sent.
	var/list/thrown_datums = list()

/obj/item/melee/baseball_bat/Initialize(mapload)
	. = ..()
	if(prob(1))
		name = "cricket bat"
		icon_state = "baseball_bat_brit"
		inhand_icon_state = "baseball_bat_brit"
		desc = pick("You've got red on you.", "You gotta know what a crumpet is to understand cricket.")

	AddElement(/datum/element/kneecapping)

/obj/item/melee/baseball_bat/attack_self(mob/user)
	if(!homerun_able)
		return ..()
	if(homerun_ready)
		to_chat(user, span_warning("You're already ready to do a home run!"))
		return ..()
	to_chat(user, span_warning("You begin gathering strength..."))
	playsound(get_turf(src), 'sound/magic/lightning_chargeup.ogg', 65, TRUE)
	if(do_after(user, 9 SECONDS, target = src))
		to_chat(user, span_userdanger("You gather power! Time for a home run!"))
		homerun_ready = TRUE
	return ..()

/obj/item/melee/baseball_bat/attack(mob/living/target, mob/living/user)
	// we obtain the relative direction from the bat itself to the target
	var/relative_direction = get_cardinal_dir(src, target)
	var/atom/throw_target = get_edge_target_turf(target, relative_direction)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_PACIFISM))
		return
	if(homerun_ready)
		user.visible_message(span_userdanger("It's a home run!"))
		if(!QDELETED(target))
			target.throw_at(throw_target, rand(8,10), 14, user)
		SSexplosions.medturf += throw_target
		playsound(get_turf(src), 'sound/weapons/homerun.ogg', 100, TRUE)
		homerun_ready = FALSE
		return
	else if(!QDELETED(target) && !target.anchored)
		target.throw_at(throw_target, 1, melee_throw_speed, user, gentle = TRUE)

/obj/item/melee/baseball_bat/Destroy(force)
	for(var/target in thrown_datums)
		var/datum/thrownthing/throw_datum = thrown_datums[target]
		throw_datum.callback.Invoke()
	thrown_datums.Cut()
	return ..()

/obj/item/melee/baseball_bat/pre_attack(atom/movable/target, mob/living/user, params)
	var/turf/target_turf = get_turf(target)
	if(!target_turf)
		return ..()
	for(var/atom/movable/atom as anything in target_turf)
		if(!try_launch(atom, user))
			continue
		return TRUE
	return ..()

/obj/item/melee/baseball_bat/proc/try_launch(atom/movable/target, mob/living/user)
	if(!target.throwing || (ismob(target) && !mob_thrower))
		return FALSE
	var/datum/thrownthing/throw_datum = target.throwing
	var/datum_throw_speed = throw_datum.speed
	var/angle = 0
	var/target_to_user = get_dir(target, user)
	if(target.dir & turn(target_to_user, 90))
		angle = 270
	if(target.dir & turn(target_to_user, 270))
		angle = 90
	if(target.dir & turn(target_to_user, 180))
		angle = 180
	if(target.dir & target_to_user)
		angle = 360
	var/turf/return_to_sender = get_ranged_target_turf_direct(user, throw_datum.starting_turf, round(target.throw_range * 1.5, 1), offset = angle + (rand(-1, 1) * 10))
	throw_datum.finalize(hit = FALSE)
	target.mouse_opacity = MOUSE_OPACITY_TRANSPARENT //dont mess with our ball
	target.color = list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,3) //make them super light
	animate(target, 0.5 SECONDS, color = null, flags = ANIMATION_PARALLEL)
	user.color = list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,3)
	animate(user, 0.5 SECONDS, color = null, flags = ANIMATION_PARALLEL)
	playsound(src, 'sound/items/baseballhit.ogg', 100, TRUE)
	user.do_attack_animation(target, used_item = src)
	ADD_TRAIT(user, TRAIT_IMMOBILIZED, type)
	addtimer(CALLBACK(src, PROC_REF(launch_back), target, user, return_to_sender, datum_throw_speed), 0.5 SECONDS)
	return TRUE

/obj/item/melee/baseball_bat/proc/launch_back(atom/movable/target, mob/living/user, turf/target_turf, datum_throw_speed)
	playsound(target, 'sound/magic/tail_swing.ogg', 50, TRUE)
	REMOVE_TRAIT(user, TRAIT_IMMOBILIZED, type)
	target.mouse_opacity = initial(target.mouse_opacity)
	target.add_filter("baseball_launch", 3, motion_blur_filter(1, 3))
	target.throwforce *= 2
	target.throw_at(target_turf, get_dist(target, target_turf), datum_throw_speed + 1, user, callback = CALLBACK(src, PROC_REF(on_hit), target))
	thrown_datums[target] = target.throwing

/obj/item/melee/baseball_bat/proc/on_hit(atom/movable/target)
	target.remove_filter("baseball_launch")
	target.throwforce *= 0.5
	thrown_datums -= target

/obj/item/melee/baseball_bat/homerun
	name = "home run bat"
	desc = "This thing looks dangerous... Dangerously good at baseball, that is."
	icon_state = "baseball_bat_home"
	inhand_icon_state = "baseball_bat_home"
	homerun_able = TRUE
	mob_thrower = TRUE

/obj/item/melee/baseball_bat/ablative
	name = "metal baseball bat"
	desc = "This bat is made of highly reflective, highly armored material."
	icon_state = "baseball_bat_metal"
	inhand_icon_state = "baseball_bat_metal"
	force = 18
	throwforce = 20
	mob_thrower = TRUE

/obj/item/melee/baseball_bat/ablative/IsReflect()//some day this will reflect thrown items instead of lasers
	playsound(src, pick('sound/weapons/effects/batreflect1.ogg', 'sound/weapons/effects/batreflect2.ogg'), 50, TRUE)
	return TRUE

/obj/item/melee/flyswatter
	name = "flyswatter"
	desc = "Useful for killing pests of all sizes."
	icon = 'icons/obj/weapons/items_and_weapons.dmi'
	icon_state = "flyswatter"
	inhand_icon_state = "flyswatter"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 1
	throwforce = 1
	attack_verb_continuous = list("swats", "smacks")
	attack_verb_simple = list("swat", "smack")
	hitsound = 'sound/effects/snap.ogg'
	w_class = WEIGHT_CLASS_SMALL
	/// Things in this list will be instantly splatted.  Flyman weakness is handled in the flyman species weakness proc.
	var/list/splattable
	/// Things in this list which take a lot more damage from the fly swatter, but not be necessarily killed by it.
	var/list/strong_against
	/// How much extra damage the fly swatter does against mobs it is strong against
	var/extra_strength_damage = 24

/obj/item/melee/flyswatter/Initialize(mapload)
	. = ..()
	splattable = typecacheof(list(
		/mob/living/simple_animal/hostile/bee,
		/mob/living/simple_animal/butterfly,
		/mob/living/basic/cockroach,
		/obj/item/queen_bee,
		/obj/structure/spider/spiderling,
		/mob/living/simple_animal/hostile/ant,
		/obj/effect/decal/cleanable/ants,
	))
	strong_against = typecacheof(list(
		/mob/living/simple_animal/hostile/giant_spider,
	))


/obj/item/melee/flyswatter/afterattack(atom/target, mob/user, proximity_flag)
	. = ..()
	if(!proximity_flag || HAS_TRAIT(user, TRAIT_PACIFISM))
		return

	if(is_type_in_typecache(target, splattable))
		new /obj/effect/decal/cleanable/insectguts(target.drop_location())
		to_chat(user, span_warning("You easily splat [target]."))
		if(isliving(target))
			var/mob/living/bug = target
			bug.investigate_log("has been splatted by a flyswatter.", INVESTIGATE_DEATHS)
			bug.gib()
		else
			qdel(target)
		return
	if(is_type_in_typecache(target, strong_against) && isliving(target))
		var/mob/living/living_target = target
		living_target.adjustBruteLoss(extra_strength_damage)

/obj/item/proc/can_trigger_gun(mob/living/user)
	if(!user.can_use_guns(src))
		return FALSE
	return TRUE

/obj/item/extendohand
	name = "extendo-hand"
	desc = "Futuristic tech has allowed these classic spring-boxing toys to essentially act as a fully functional hand-operated hand prosthetic."
	icon = 'icons/obj/weapons/items_and_weapons.dmi'
	icon_state = "extendohand"
	inhand_icon_state = "extendohand"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 0
	throwforce = 5
	reach = 2
	var/min_reach = 2

/obj/item/extendohand/acme
	name = "\improper ACME Extendo-Hand"
	desc = "A novelty extendo-hand produced by the ACME corporation. Originally designed to knock out roadrunners."

/obj/item/extendohand/attack(atom/M, mob/living/carbon/human/user, params)
	var/dist = get_dist(M, user)
	if(dist < min_reach)
		to_chat(user, span_warning("[M] is too close to use [src] on."))
		return
	var/list/modifiers = params2list(params)
	M.attack_hand(user, modifiers)

/obj/item/gohei
	name = "gohei"
	desc = "A wooden stick with white streamers at the end. Originally used by shrine maidens to purify things. Now used by the station's valued weeaboos."
	force = 5
	throwforce = 5
	hitsound = SFX_SWING_HIT
	attack_verb_continuous = list("whacks", "thwacks", "wallops", "socks")
	attack_verb_simple = list("whack", "thwack", "wallop", "sock")
	icon = 'icons/obj/weapons/items_and_weapons.dmi'
	icon_state = "gohei"
	inhand_icon_state = "gohei"
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'

/obj/item/melee/moonlight_greatsword
	name = "moonlight greatsword"
	desc = "Don't tell anyone you put any points into dex, though."
	icon_state = "swordon"
	inhand_icon_state = "swordon"
	worn_icon_state = "swordon"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	block_chance = 20
	sharpness = SHARP_EDGED
	force = 18
	throwforce = 20
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb_continuous = list("attacks", "slashes", "stabs", "slices", "tears", "lacerates", "rips", "dices", "cuts")
	attack_verb_simple = list("attack", "slash", "stab", "slice", "tear", "lacerate", "rip", "dice", "cut")

//High Frequency Blade

/obj/item/highfrequencyblade
	name = "high frequency blade"
	desc = "A sword reinforced by a powerful alternating current and resonating at extremely high vibration frequencies. \
		This oscillation weakens the molecular bonds of anything it cuts, thereby increasing its cutting ability."
	icon_state = "hfrequency0"
	worn_icon_state = "hfrequency0"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	force = 18
	throwforce = 20
	throw_speed = 4
	embedding = list("embed_chance" = 100)
	sharpness = SHARP_EDGED
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	/// The color of the slash we create
	var/slash_color = COLOR_BLUE
	/// Previous x position of where we clicked on the target's icon
	var/previous_x
	/// Previous y position of where we clicked on the target's icon
	var/previous_y
	/// The previous target we attacked
	var/datum/weakref/previous_target

/obj/item/highfrequencyblade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, \
		wield_callback = CALLBACK(src, PROC_REF(on_wield)), \
		unwield_callback = CALLBACK(src, PROC_REF(on_unwield)), \
	)
	AddElement(/datum/element/update_icon_updates_onmob, ITEM_SLOT_HANDS)

/obj/item/highfrequencyblade/update_icon_state()
	icon_state = "hfrequency[HAS_TRAIT(src, TRAIT_WIELDED)]"
	return ..()

/obj/item/highfrequencyblade/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(attack_type == PROJECTILE_ATTACK)
		if(HAS_TRAIT(src, TRAIT_WIELDED) || prob(final_block_chance))
			owner.visible_message(span_danger("[owner] deflects [attack_text] with [src]!"))
			playsound(src, pick('sound/weapons/bulletflyby.ogg', 'sound/weapons/bulletflyby2.ogg', 'sound/weapons/bulletflyby3.ogg'), 75, TRUE)
			return TRUE
		return FALSE
	if(prob(final_block_chance * (HAS_TRAIT(src, TRAIT_WIELDED) ? 2 : 1)))
		owner.visible_message(span_danger("[owner] parries [attack_text] with [src]!"))
		return TRUE

/obj/item/highfrequencyblade/attack(mob/living/target, mob/living/user, params)
	if(!HAS_TRAIT(src, TRAIT_WIELDED))
		return ..()
	slash(target, user, params)

/obj/item/highfrequencyblade/attack_atom(atom/target, mob/living/user, params)
	if(HAS_TRAIT(src, TRAIT_WIELDED))
		return
	return ..()

/obj/item/highfrequencyblade/afterattack(atom/target, mob/user, proximity_flag, params)
	if(!HAS_TRAIT(src, TRAIT_WIELDED))
		return ..()
	if(!proximity_flag || !(isclosedturf(target) || isitem(target) || ismachinery(target) || isstructure(target) || isvehicle(target)))
		return
	slash(target, user, params)

/// triggered on wield of two handed item
/obj/item/highfrequencyblade/proc/on_wield(obj/item/source, mob/user)
	update_icon(UPDATE_ICON_STATE)

/// triggered on unwield of two handed item
/obj/item/highfrequencyblade/proc/on_unwield(obj/item/source, mob/user)
	update_icon(UPDATE_ICON_STATE)

/obj/item/highfrequencyblade/proc/slash(atom/target, mob/living/user, params)
	user.changeNext_move(0.1 SECONDS)
	user.do_attack_animation(target, "nothing")
	var/list/modifiers = params2list(params)
	var/damage_mod = 1
	var/x_slashed = text2num(modifiers[ICON_X]) || world.icon_size/2 //in case we arent called by a client
	var/y_slashed = text2num(modifiers[ICON_Y]) || world.icon_size/2 //in case we arent called by a client
	new /obj/effect/temp_visual/slash(get_turf(target), target, x_slashed, y_slashed, slash_color)
	if(target == previous_target?.resolve()) //if the same target, we calculate a damage multiplier if you swing your mouse around
		var/x_mod = previous_x - x_slashed
		var/y_mod = previous_y - y_slashed
		damage_mod = max(1, round((sqrt(x_mod ** 2 + y_mod ** 2) / 10), 0.1))
	previous_target = WEAKREF(target)
	previous_x = x_slashed
	previous_y = y_slashed
	playsound(src, 'sound/weapons/bladeslice.ogg', 100, vary = TRUE)
	playsound(src, 'sound/weapons/zapbang.ogg', 50, vary = TRUE)
	if(isliving(target))
		var/mob/living/living_target = target
		living_target.apply_damage(force*damage_mod, BRUTE, sharpness = SHARP_EDGED, wound_bonus = wound_bonus, bare_wound_bonus = bare_wound_bonus, def_zone = user.zone_selected)
		log_combat(user, living_target, "slashed", src)
		if(living_target.stat == DEAD && prob(force*damage_mod*0.5))
			living_target.visible_message(span_danger("[living_target] explodes in a shower of gore!"), blind_message = span_hear("You hear organic matter ripping and tearing!"))
			living_target.investigate_log("has been gibbed by [src].", INVESTIGATE_DEATHS)
			living_target.gib()
			log_combat(user, living_target, "gibbed", src)
	else if(target.uses_integrity)
		target.take_damage(force*damage_mod*3, BRUTE, MELEE, FALSE, null, 50)
	else if(iswallturf(target) && prob(force*damage_mod*0.5))
		var/turf/closed/wall/wall_target = target
		wall_target.dismantle_wall()
	else if(ismineralturf(target) && prob(force*damage_mod))
		var/turf/closed/mineral/mineral_target = target
		mineral_target.gets_drilled()

/obj/effect/temp_visual/slash
	icon_state = "highfreq_slash"
	alpha = 150
	duration = 0.5 SECONDS
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE

/obj/effect/temp_visual/slash/Initialize(mapload, atom/target, x_slashed, y_slashed, slash_color)
	. = ..()
	if(!target)
		return
	var/matrix/new_transform = matrix()
	new_transform.Turn(rand(1, 360)) // Random slash angle
	var/datum/decompose_matrix/decomp = target.transform.decompose()
	new_transform.Translate((x_slashed - world.icon_size/2) * decomp.scale_x, (y_slashed - world.icon_size/2) * decomp.scale_y) // Move to where we clicked
	//Follow target's transform while ignoring scaling
	new_transform.Turn(decomp.rotation)
	new_transform.Translate(decomp.shift_x, decomp.shift_y)
	new_transform.Translate(target.pixel_x, target.pixel_y) // Follow target's pixel offsets
	transform = new_transform
	//Double the scale of the matrix by doubling the 2x2 part without touching the translation part
	var/matrix/scaled_transform = new_transform + matrix(new_transform.a, new_transform.b, 0, new_transform.d, new_transform.e, 0)
	animate(src, duration*0.5, color = slash_color, transform = scaled_transform, alpha = 255)

/obj/item/highfrequencyblade/wizard
	desc = "A blade that was mastercrafted by a legendary blacksmith. Its' enchantments let it slash through anything."
	force = 8
	throwforce = 20
	wound_bonus = 20
	bare_wound_bonus = 25

/obj/item/highfrequencyblade/wizard/attack_self(mob/user, modifiers)
	if(!IS_WIZARD(user))
		balloon_alert(user, "you're too weak!")
		return
	return ..()
