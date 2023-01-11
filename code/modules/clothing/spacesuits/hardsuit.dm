// scoundrel content
// base
/obj/item/clothing/suit/hooded/hardsuit
	actions_types = list(/datum/action/item_action/toggle_helmet)
	icon = 'icons/scoundrel/obj/hardsuit_obj.dmi'
	worn_icon = 'icons/scoundrel/mob/hardsuit.dmi'
	equip_sound = 'sound/mecha/mechmove03.ogg'
	pickup_sound = 'sound/items/handling/toolbelt_pickup.ogg'

	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE|THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

	allowed = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/tank/jetpack,
		)

/obj/item/clothing/head/hooded/hardsuit
	icon = 'icons/scoundrel/obj/hardsuit_helmet_obj.dmi'
	worn_icon = 'icons/scoundrel/mob/hardsuit_helmet.dmi'
	equip_sound = 'sound/mecha/mechmove03.ogg'
	pickup_sound = 'sound/mecha/mechmove03.ogg'

	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | SNUG_FIT | PLASMAMAN_HELMET_EXEMPT | HEADINTERNALS
	body_parts_covered = HEAD
	resistance_flags = NONE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF

/*/obj/item/clothing/head/hooded/hardsuit/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, LOCKED_HELMET_TRAIT)*/ // doesn't do anything of value atm but it might be useful for reference

// syndicate
/obj/item/clothing/suit/hooded/hardsuit/syndicate
	name = "blood-red hardsuit"
	desc = "A sleek piece of covert-aggression military hardware. Advanced servos allow for heightened mobility without sacrificing protection. \
	Equipment this high-grade usually means serious business."
	worn_icon_state = "syndi"
	icon_state = "syndi"
	inhand_icon_state = "space_suit_syndicate"
	armor = GENERIC_ARMOR_T3_SEALED
	resistance_flags = FIRE_PROOF | ACID_PROOF

	allowed = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/tank/jetpack,
		/obj/item/gun,
		/obj/item/melee,
		)

	hoodtype = /obj/item/clothing/head/hooded/hardsuit/syndicate

// head
/obj/item/clothing/head/hooded/hardsuit/syndicate
	name = "blood-red hardsuit helmet"
	desc = "A sleek piece of covert-aggression military hardware. Advanced servos allow for heightened mobility without sacrificing protection. \
	Equipment this high-grade usually means serious business."
	worn_icon_state = "syndi"
	icon_state = "syndi"

	armor = GENERIC_ARMOR_T3_SEALED
	flash_protect = FLASH_PROTECTION_WELDER
	resistance_flags = FIRE_PROOF | ACID_PROOF
