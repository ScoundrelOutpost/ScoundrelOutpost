/obj/item/beltshield
	name = "shield belt"
	desc = "This is a basic level shield belt. Blocks forceful attacks, but permits hands through, and not especially durable."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "utility"
	inhand_icon_state = "utility"
	worn_icon_state = "utility"
	lefthand_file = 'icons/mob/inhands/equipment/belt_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/belt_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	attack_verb_continuous = list("whips", "lashes", "disciplines")
	attack_verb_simple = list("whip", "lash", "discipline")
	max_integrity = 300
	equip_sound = 'sound/items/equip/toolbelt_equip.ogg'
	w_class = WEIGHT_CLASS_BULKY
	actions_types = list(/datum/action/item_action/toggle_beltshield)
	var/shield_health = 20
	var/shield_recharge_delay = 5 SECONDS
	var/shield_recovery_amount = 5
	var/shield_recharge_increment_delay = 1 SECONDS
	var/shielded_vulnerability = MELEE_ATTACK
	var/vulnerability_multiplier = 1.5
	var/shielded_resistance = PROJECTILE_ATTACK
	var/resistance_multiplier = 0.3
	var/static/list/unblockable_attack_types = list(UNARMED_ATTACK)
	var/shield_tracked_health
	var/on = FALSE
	var/obj/item/stock_parts/cell/cell
	var/cell_type

/obj/item/beltshield/Initialize(mapload)
	. = ..()
	if(cell_type)
		cell = new cell_type(src)
	else
		cell = new(src)

/obj/item/beltshield/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_beltshield))
		toggle_shields(user)

/obj/item/beltshield/proc/toggle_shields(mob/user)
	if(user.incapacitated())
		return
	if(!on)
		if(add_shield_component(user))
			to_chat(user, span_notice("You toggle the [name]."))
		else
			return
	else
		remove_shield_component(user)

/obj/item/beltshield/proc/add_shield_component(mob/user)
	if(cell?.charge >= 0)
		AddComponent(/datum/component/shielded, max_charges = shield_health, recharge_start_delay = shield_recharge_delay, charge_increment_delay = shield_recharge_increment_delay, \
		charge_recovery = shield_recovery_amount, lose_multiple_charges = TRUE, starting_charges = shield_tracked_health, cannot_block_types = unblockable_attack_types, shield_weakness = shielded_vulnerability, \
		shield_weakness_multiplier = vulnerability_multiplier, shield_resistance = shielded_resistance, shield_resistance_multiplier = resistance_multiplier, no_overlay = TRUE)
		to_chat(user, span_notice("You turn the [name] on."))
		on = TRUE
		update_action_buttons()
	else
		to_chat(user, span_notice("Not enough power to turn the [name] on."))
		return

/obj/item/beltshield/proc/remove_shield_component(mob/user)
	if(on)
		var/datum/component/shielded/shield = GetComponent(/datum/component/shielded)
		shield_tracked_health = shield.current_charges
		on = FALSE
		qdel(shield)
		to_chat(user, span_notice("You turn the [name] off."))
		update_action_buttons()

/obj/item/beltshield/equipped(mob/user, slot, initial)
	. = ..()
	RegisterSignal(user, COMSIG_HUMAN_CHECK_SHIELDS, PROC_REF(shield_reaction))

/obj/item/beltshield/dropped(mob/user, silent)
	. = ..()
	UnregisterSignal(user, COMSIG_HUMAN_CHECK_SHIELDS)

/obj/item/beltshield/proc/shield_reaction(mob/living/carbon/human/owner, atom/movable/hitby, damage = 0, attack_text = "the attack", attack_type = MELEE_ATTACK, armour_penetration = 0)
	if(SEND_SIGNAL(src, COMSIG_ITEM_HIT_REACT, owner, hitby, attack_text, 0, damage, attack_type) & COMPONENT_HIT_REACTION_BLOCK)
		drain_cell_power(owner, damage, attack_type)
		return SHIELD_BLOCK
	return NONE

/obj/item/beltshield/proc/drain_cell_power(mob/living/carbon/human/owner, damage = 0, attack_type = MELEE_ATTACK)
	var/cell_reduction_amount = damage*100
	if(attack_type == shielded_vulnerability)
		cell_reduction_amount = damage*vulnerability_multiplier
	if(attack_type == shielded_resistance)
		cell_reduction_amount = damage*resistance_multiplier
	if(!cell)
		return
	. = cell.use(cell_reduction_amount)
	if(on && cell.charge <= 0)
		remove_shield_component(owner)
		playsound(src, SFX_SPARKS, 75, TRUE, -1)

/obj/item/beltshield/emp_act(severity)
	. = ..()
	if (!cell)
		return
	if (!(. & EMP_PROTECT_SELF))
		drain_cell_power(1000 / severity)

/datum/action/item_action/toggle_beltshield
	name = "Toggle Shield Belt"
	desc = "Turns it on."
	icon_icon = 'icons/mob/actions/actions_mecha.dmi'
	button_icon_state = "mech_overload_off"
