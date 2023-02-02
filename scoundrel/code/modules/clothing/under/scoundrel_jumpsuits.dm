/obj/item/clothing/under/starsuit
	name = "starsuit"
	desc = "A mobile, form-fitting EVA suit. Sleek and fashionable, but not particularly warming or durable. Don't forget to wear a jacket.\n\
	It can be worn as an undersuit or oversuit, but it doesn't have any vital tracking attached."
	icon = 'scoundrel/icons/obj/clothing/scoundrel_under.dmi'
	icon_state = "starsuit"
	worn_icon = 'scoundrel/icons/mob/clothing/scoundrel_under.dmi'
	worn_icon_state = "starsuit"
	lefthand_file = 'icons/mob/inhands/clothing/suits_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing/suits_righthand.dmi'
	// whether this suit uses emissives. important for drawing things properly, for some reason
	var/will_emit = TRUE
	alternate_worn_layer = OVER_HANDS_LAYER
	slot_flags = ITEM_SLOT_ICLOTHING | ITEM_SLOT_OCLOTHING

	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

	equip_sound = 'sound/items/equip/jumpsuit_equip.ogg'
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'

	strip_delay = 80
	equip_delay_other = 80
	limb_integrity = 30
	armor = STARSUIT_ARMOR
	clothing_flags = STOPSPRESSUREDAMAGE|PLASMAMAN_PREVENT_IGNITION
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = null
//	slowdown = 0.5 need to figure out a better downside than this

	has_sensor = NO_SENSORS
	random_sensor = FALSE
	can_adjust = FALSE

/obj/item/clothing/under/starsuit/Initialize(mapload)
	. = ..()
	allowed += GLOB.space_suit_allowed
	allowed += GLOB.generic_suit_allowed

/obj/item/clothing/under/starsuit/worn_overlays(mutable_appearance/standing, isinhands, icon_file)
	. = ..()
	if(!isinhands && will_emit)
		. += emissive_appearance(icon_file, "[icon_state]_emissive", src, alpha = src.alpha)

/obj/item/clothing/head/helmet/space/starsuit // this goes here because it's less trouble to look up
	name = "starsuit helmet"
	desc = "A reinforced polymer-glass helmet with a broad field of vision and a heavy UV-reflective tint. Some internal padding \
	keeps it pretty comfortable."
	icon = 'scoundrel/icons/obj/clothing/scoundrel_head.dmi'
	icon_state = "starsuit"
	worn_icon = 'scoundrel/icons/mob/clothing/scoundrel_head.dmi'
	worn_icon_state = "starsuit"
	
	flash_protect = 0
	armor = STARSUIT_ARMOR

/obj/item/clothing/head/helmet/space/starsuit/engineer
	name = "starsuit hardhat"
	desc = "A starsuit helmet with a reinforced hardhat built in, for hazardous EVA construction and maintenance operations."
	icon_state = "starsuit_hardhat"
	worn_icon_state = "starsuit_hardhat"

	armor = STARSUIT_HARDHAT_ARMOR

/obj/item/clothing/head/helmet/space/starsuit/engineer/worn_overlays(mutable_appearance/standing, isinhands, icon_file)
	. = ..()
	if(!isinhands)
		. += emissive_appearance(icon_file, "[icon_state]_emissive", src, alpha = src.alpha)

// Executive Starsuit
/obj/item/clothing/under/starsuit/executive
	name = "executive starsuit"
	desc = "A mobile, form-fitting EVA suit, with decorations resembling an expensive, finely-woven silk suit. \
	To the touch though, it feels more rugged, like denim. Unlike most starsuits, light protective padding makes it impossible to \
	wear on a skintight layer. At least it's warm."
	worn_icon_state = "starsuit_exec"
	icon_state = "starsuit_exec"
	slot_flags = ITEM_SLOT_OCLOTHING
	will_emit = FALSE

	armor = GENERIC_ARMOR_T1_SEALED
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT

	w_class = WEIGHT_CLASS_SMALL

// admin starsuit
/obj/item/clothing/under/starsuit/admin
	name = "administrator starsuit"
	worn_icon_state = "starsuit_exec"
	icon_state = "starsuit_exec"
	strip_delay = 1 HOURS
	equip_delay_other = 1 HOURS // you simply cannot have it
	limb_integrity = 100000
	armor = ADMIN_ARMOR

/obj/item/clothing/head/helmet/space/starsuit/admin
	name = "administrator starsuit helmet"
	armor = ADMIN_ARMOR
	strip_delay = 1 HOURS
	equip_delay_other = 1 HOURS // you simply cannot have it

// normal
/obj/item/clothing/under/suit/green
	icon = 'icons/obj/clothing/under/centcom.dmi'
	worn_icon = 'icons/mob/clothing/under/centcom.dmi'
	name = "green suit"
	desc = "A green suit, for people who are very professional about green."
	icon_state = "official"
	inhand_icon_state = "dg_suit"

/obj/item/clothing/under/syndicate/tracking_on
	sensor_mode = SENSOR_COORDS

/obj/item/clothing/under/turtleneck/purple
	icon = 'icons/obj/clothing/under/rnd.dmi'
	worn_icon = 'icons/mob/clothing/under/rnd.dmi'
	name = "purple turtleneck"
	desc = "A royally purple turtleneck."
	icon_state = "rdturtle"
	inhand_icon_state = "p_suit"
	can_adjust = TRUE
	alt_covers_chest = TRUE
