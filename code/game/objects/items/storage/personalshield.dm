#define PERSONAL_SHIELD_STEP_FLAGS IGNORE_USER_LOC_CHANGE|IGNORE_TARGET_LOC_CHANGE|IGNORE_SLOWDOWNS|IGNORE_HELD_ITEM

/obj/item/personalshield
	name = "personal shield device"
	desc = "This is a basic level personal shield device. Blocks forceful attacks, but permits hands through, and not especially durable. You probably shouldn't have this!"
	icon = 'scoundrel/icons/obj/personal_shields.dmi'
	icon_state = "personalshield"
	inhand_icon_state = "electronic"
	worn_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/items/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items/devices_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_SUITSTORE | ITEM_SLOT_POCKETS
	attack_verb_continuous = list("whips", "lashes", "disciplines")
	attack_verb_simple = list("whip", "lash", "discipline")
	max_integrity = 300
	equip_sound = 'sound/items/handling/component_pickup.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	actions_types = list(/datum/action/item_action/toggle_personalshield)

	var/no_overlay = TRUE
	var/shield_icon_file = 'icons/effects/effects.dmi'
	var/shield_icon = "shield"

	// sound played when you toggle it on
	var/activate_start_sound = 'sound/scoundrel/shield/shield_activate2.ogg'
	var/activate_start_sound_volume = 50

	// sound played when the battery runs dry
	var/drained_sound = 'sound/machines/defib_failed.ogg'
	var/drained_sound_volume = 80

	// sound played when the shield is broken
	var/overload_sound = 'sound/scoundrel/shield/shieldshatter3.ogg'
	var/overload_sound_volume = 80

	// sound played when the shield intercepts damage
	var/impact_sound = 'sound/scoundrel/shield/shieldimpact.ogg'
	var/impact_sound_volume = 80

	// sound played when the shield regains charge
	var/recharge_sound_effect = 'sound/scoundrel/shield/shieldrecharge.ogg'
	var/recharge_sound_effect_volume = 50

	// sound played when the shield finished recharging
	var/recharge_finished_sound_effect = 'sound/machines/defib_success.ogg'
	var/recharge_finished_sound_effect_volume = 70

	var/activate_sound = 'sound/scoundrel/shield/optimisticbeep.ogg'
	var/deactivate_sound = 'sound/scoundrel/shield/shield_deactivate.ogg'
	var/activate_sound_volume = 40
	var/deactivate_sound_volume = 40

// shield stats
	var/shield_health = 100
	var/shield_recharge_delay = 60 SECONDS
	var/shield_recovery_amount = 2
	var/shield_recharge_increment_delay = 1 SECONDS
	var/list/shielded_vulnerability = list(MELEE_ATTACK)
	var/vulnerability_multiplier = 1.5
	var/list/shielded_resistance = list(PROJECTILE_ATTACK)
	var/resistance_multiplier = 0.5
	var/list/unblockable_attack_types = list(UNARMED_ATTACK)
	var/shield_tracked_health
	var/on = FALSE
	var/activating = FALSE
	var/activation_time = 5 SECONDS

	// cell charge lost for every point of damage to the shield
	// do cell.charge/shield_health to find the cell_power_lost required for the cell to last a single overload
	var/cell_power_loss = 10
	// the amount of cell charge before our shield switches off the shield entirely.
	var/cell_failsafe_value = 100
	// Our cell. Loses power when the shield is hit while active equal to the damage inflicted to the shield.
	var/obj/item/stock_parts/cell/cell
	var/cell_type

/obj/item/personalshield/Initialize(mapload)
	. = ..()
	if(cell_type)
		cell = new cell_type(src)
	else
		cell = new(src)

/obj/item/personalshield/get_cell()
	return cell

// add this back when it's usable inhand
/*/obj/item/personalshield/attack_self(mob/living/carbon/user)
	if(user)
		toggle_shields(user)*/

/obj/item/personalshield/examine(mob/user)
	. = ..()
	if(cell)
		. += span_notice("\The [src] is [round(cell.percent())]% charged.")

/obj/item/personalshield/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_personalshield))
		toggle_shields(user)

/obj/item/personalshield/proc/toggle_shields(mob/user)
	if(user.incapacitated())
		return
	if(!on)
		if(add_shield_component(user))
			to_chat(user, span_notice("You toggle the [src]."))
		else
			return
	else
		playsound(src, deactivate_sound, deactivate_sound_volume, FALSE, -2)
		remove_shield_component(user)

/obj/item/personalshield/proc/add_shield_component(mob/user)
	// if the button is pressed during startup sequence
	if(activating)
		to_chat(user, span_notice("[src] already starting up!"))
		return

	if(!on && ishuman(user))
		var/mob/living/carbon/human/wearer = user
		if(cell?.charge >= cell_failsafe_value)
			if(slot_check(wearer, FALSE))
				// cleared to start / feedback
				activating = TRUE
				to_chat(wearer, span_notice("[src] is activating!"))
				playsound(src, activate_start_sound, activate_start_sound_volume, FALSE, -2)
				// begin startup sequence
				if(do_after(wearer, activation_time, wearer, PERSONAL_SHIELD_STEP_FLAGS, extra_checks=CALLBACK(src, PROC_REF(slot_check), wearer)))
					AddComponent(/datum/component/shielded, max_charges = shield_health, recharge_start_delay = shield_recharge_delay, shield_icon_file = shield_icon_file, shield_icon = shield_icon, charge_increment_delay = shield_recharge_increment_delay, \
					charge_recovery = shield_recovery_amount, lose_multiple_charges = TRUE, starting_charges = shield_tracked_health, cannot_block_types = unblockable_attack_types, shield_weakness = shielded_vulnerability, \
					shield_weakness_multiplier = vulnerability_multiplier, shield_resistance = shielded_resistance, shield_resistance_multiplier = resistance_multiplier, no_overlay = no_overlay, \
					recharge_sound_effect = recharge_sound_effect, recharge_sound_effect_volume = recharge_sound_effect_volume, recharge_finished_sound_effect = recharge_finished_sound_effect, recharge_finished_sound_effect_volume = recharge_finished_sound_effect_volume, \
					run_hit_callback = CALLBACK(src, PROC_REF(shield_damaged)))
					to_chat(wearer, span_notice("You turn the [src] on."))
					on = TRUE
					activating = FALSE
					update_appearance()
					playsound(src, activate_sound, activate_sound_volume, FALSE, -2)
					update_action_buttons()
				// didn't start
				else
					to_chat(wearer, span_notice("Failed to activate [src]"))
					playsound(src, drained_sound, drained_sound_volume, FALSE, -2)
					activating = FALSE
					return
			// didn't start because it wasn't being worn
			else
				to_chat(wearer, span_notice("You need to be wearing [src] to turn it on."))
				return
		// didn't start because it didn't have enough power
		else
			to_chat(wearer, span_notice("Not enough power to turn [src] on."))
			playsound(src, drained_sound, drained_sound_volume, FALSE, -2)
			return

/obj/item/personalshield/proc/remove_shield_component(mob/user)
	if(on)
		var/datum/component/shielded/shield = GetComponent(/datum/component/shielded)
		shield_tracked_health = shield.current_charges
		on = FALSE
		qdel(shield)
		to_chat(user, span_notice("You turn the [src] off."))
		update_appearance()
		update_action_buttons()

/obj/item/personalshield/proc/slot_check(mob/living/carbon/human/wearer, interference_check = TRUE)
	var/equipped_to_valid_slot = FALSE
	if(wearer.belt == src)
		equipped_to_valid_slot = TRUE
	if(wearer.s_store == src)
		equipped_to_valid_slot = TRUE
	if(wearer.r_store == src | wearer.l_store == src)
		equipped_to_valid_slot = TRUE
	if(interference_check)
		for(var/obj/item/personalshield/additional_shields in loc.get_all_contents())
			if(additional_shields.type != type || additional_shields == src || !additional_shields.on)
				continue
			to_chat(wearer, span_warning("[src] won't function if you have another personal shield active."))
			return FALSE
	return equipped_to_valid_slot

/obj/item/personalshield/equipped(mob/user, slot, initial)
	. = ..()
	RegisterSignal(user, COMSIG_HUMAN_CHECK_SHIELDS, PROC_REF(shield_reaction))

/obj/item/personalshield/dropped(mob/user, silent)
	. = ..()
	remove_shield_component()
	UnregisterSignal(user, COMSIG_HUMAN_CHECK_SHIELDS)

/obj/item/personalshield/proc/shield_reaction(mob/living/carbon/human/owner, atom/movable/hitby, damage = 0, attack_text = "the attack", attack_type = MELEE_ATTACK, armour_penetration = 0)
	if(SEND_SIGNAL(src, COMSIG_ITEM_HIT_REACT, owner, hitby, attack_text, 0, damage, attack_type) & COMPONENT_HIT_REACTION_BLOCK && slot_check(owner))
		drain_cell_power(owner, damage, attack_type)
		return SHIELD_BLOCK
	return NONE

/obj/item/personalshield/proc/drain_cell_power(mob/living/carbon/human/owner, damage = 0, attack_type)
	if(!cell)
		return

	var/cell_reduction_amount = clamp(damage*cell_power_loss, 0, cell.charge)
	if(attack_type in shielded_vulnerability)
		cell_reduction_amount = clamp(damage*vulnerability_multiplier*cell_power_loss, 0, cell.charge)
	if(attack_type in shielded_resistance)
		cell_reduction_amount = clamp(damage*resistance_multiplier*cell_power_loss, damage, cell.charge)

	. = cell.use(cell_reduction_amount)
	if(on && cell.charge <= cell_failsafe_value)
		remove_shield_component(owner)
		playsound(src, drained_sound, drained_sound_volume, FALSE, 2)

/obj/item/personalshield/emp_act(severity)
	. = ..()
	if (!cell)
		return
	if (!(. & EMP_PROTECT_SELF))
		drain_cell_power(1000 / severity)

/obj/item/personalshield/update_icon_state()
	if(on)
		icon_state = "[initial(icon_state)]_on"
	else
		icon_state = "[initial(icon_state)]"
	return ..()

/obj/item/personalshield/proc/shield_damaged(mob/living/wearer, attack_text, new_current_charges)

	if(new_current_charges != 0)
		playsound(src, impact_sound, impact_sound_volume, FALSE)
		wearer.visible_message(span_danger("[wearer]'s [src] deflects [attack_text] with a shimmering barrier!"))
		new /obj/effect/temp_visual/personalshield(get_turf(wearer))
	if(new_current_charges == 0)
		playsound(src, overload_sound, overload_sound_volume, FALSE)
		wearer.visible_message(span_danger("The [src] emits a light beep as the barrier arounded [wearer] shatters!"))
		new /obj/effect/temp_visual/personalshield_break(get_turf(wearer))

/obj/effect/temp_visual/personalshield
	icon = 'icons/effects/personalshields.dmi'
	name = "shield impact"
	icon_state = "shieldimpact"
	randomdir = FALSE
	duration = 1 SECONDS

/obj/effect/temp_visual/personalshield_break
	icon = 'icons/effects/personalshields.dmi'
	name = "shield shatter"
	icon_state = "shieldbreak"
	randomdir = FALSE
	duration = 1 SECONDS

/datum/action/item_action/toggle_personalshield
	name = "Toggle Shield-Emitter"
//	desc = null

/obj/item/personalshield/standard
	name = "personal shield-emitter"
	desc = "A civilian-grade dynamic-field projector that encloses the entire body. High-kinetic projectiles and \
	energetic bursts are halted as long as the field integrity remains stable. It has a basic cell that will last one \
	lifetime of integrity."

/*	desc = "A civilian-grade dynamic-field projector that encloses the entire body. High-kinetic projectiles and \
	energetic bursts are halted as long as the field integrity remains stable. It has a protection rating of [shield_health] \
	and the internal cell has a lifespan of [((cell.charge/cell_power_loss)/shield_health)]. It takes [shield_recharge_delay/20] seconds \
	to resume charging after taking damage, and recovers [shield_recovery_amount] integrity every [shield_recharge_increment_delay/20] seconds."*/
	// thing to add post implementation

	shield_health = 80
	shield_recharge_delay = 10 SECONDS
	shield_recovery_amount = 25
	shield_recharge_increment_delay = 5 SECONDS

	shielded_vulnerability = null
	vulnerability_multiplier = 4
	shielded_resistance = list(PROJECTILE_ATTACK)
	resistance_multiplier = 1
	unblockable_attack_types = list(UNARMED_ATTACK, MELEE_ATTACK, THROWN_PROJECTILE_ATTACK)

	cell_power_loss = 12.5 // with a standard cell of 1000 charge, empty after 80 health is lost

/obj/item/personalshield/standard/advanced
	name = "advanced personal shield-emitter"
	desc = "A high-grade dynamic-field projector that encloses the entire body. High-kinetic projectiles and \
	energetic bursts are halted as long as the field integrity remains stable. It features an efficient lattice \
	that will sustain slightly more damage than the standard, and uses less power."
	icon_state = "advanced"
	shield_health = 100

	cell_power_loss = 6 // almost two full lifespans

/obj/item/personalshield/debug
	name = "debug shield emitter"
	desc = "for admin abuse, more likely"
	icon_state = "syndicate"

	shield_health = 10000000
	cell_power_loss = 6
	shielded_vulnerability = null
	shielded_resistance = list(UNARMED_ATTACK, MELEE_ATTACK, THROWN_PROJECTILE_ATTACK, PROJECTILE_ATTACK)
	unblockable_attack_types = null
	resistance_multiplier = 0
