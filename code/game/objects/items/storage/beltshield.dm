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
	var/shield_health = 20
	var/shield_recharge_delay = 5 SECONDS
	var/shield_recharge_increment_delay = 1 SECONDS
	var/shielded_vulnerability = MELEE_ATTACK
	var/vulnerability_multiplier = 1.5
	var/shielded_resistance = PROJECTILE_ATTACK
	var/resistance_divider = 3
	var/static/list/unblockable_attack_types = list(UNARMED_ATTACK)

/obj/item/beltshield/Initialize(mapload)
	. = ..()
	add_shield_component()

/obj/item/beltshield/proc/add_shield_component()
	var/charge_recovery_division = clamp((shield_health/3), 1, shield_health)
	AddComponent(/datum/component/shielded, max_charges = shield_health, recharge_start_delay = shield_recharge_delay, charge_increment_delay = shield_recharge_increment_delay, \
	charge_recovery = charge_recovery_division, lose_multiple_charges = TRUE, starting_charges = shield_health, cannot_block_types = unblockable_attack_types, shield_weakness = shielded_vulnerability, \
	shield_weakness_multiplier = vulnerability_multiplier, shield_resistance = shielded_resistance, shield_resistance_divider = resistance_divider, no_overlay = TRUE)

/obj/item/beltshield/equipped(mob/user, slot, initial)
	. = ..()
	RegisterSignal(user, COMSIG_HUMAN_CHECK_SHIELDS, PROC_REF(shield_reaction))

/obj/item/beltshield/dropped(mob/user, silent)
	. = ..()
	UnregisterSignal(user, COMSIG_HUMAN_CHECK_SHIELDS)

/obj/item/beltshield/proc/shield_reaction(mob/living/carbon/human/owner, atom/movable/hitby, damage = 0, attack_text = "the attack", attack_type = MELEE_ATTACK, armour_penetration = 0)
	if(SEND_SIGNAL(src, COMSIG_ITEM_HIT_REACT, owner, hitby, attack_text, 0, damage, attack_type) & COMPONENT_HIT_REACTION_BLOCK)
		return SHIELD_BLOCK
