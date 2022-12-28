/obj/item/clothing/under/starsuit
	name = "starsuit"
	desc = "A mobile, form-fitting EVA suit. Sleek and fashionable, but not particularly warming or durable. Don't forget to wear a jacket."
	icon = 'scoundrel/icons/obj/clothing/scoundrel_under.dmi'
	icon_state = "starsuit"
	worn_icon = 'scoundrel/icons/mob/clothing/scoundrel_under.dmi'
	worn_icon_state = "starsuit"
	lefthand_file = 'icons/mob/inhands/clothing/suits_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing/suits_righthand.dmi'
	alternate_worn_layer = OVER_HANDS_LAYER
	slot_flags = ITEM_SLOT_ICLOTHING

	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

	equip_sound = 'sound/items/equip/jumpsuit_equip.ogg'
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'

	strip_delay = 80
	equip_delay_other = 80
	limb_integrity = 60
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 50, FIRE = 0, ACID = 100, WOUND = 0)
	clothing_flags = STOPSPRESSUREDAMAGE
	w_class = WEIGHT_CLASS_NORMAL
//	slowdown = 0.5 need to figure out a better downside than this

	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	can_adjust = FALSE

/obj/item/clothing/head/helmet/space/starsuit // this goes here because it's less trouble to look up
	name = "starsuit helmet"
	desc = "A reinforced polymer-glass helmet with a broad field of vision and a heavy UV-reflective tint. Some internal padding \
	keeps it pretty comfortable."
	icon = 'scoundrel/icons/obj/clothing/scoundrel_head.dmi'
	icon_state = "starsuit"
	worn_icon = 'scoundrel/icons/mob/clothing/scoundrel_head.dmi'
	worn_icon_state = "starsuit"

/obj/item/clothing/head/helmet/space/starsuit/engineer
	name = "starsuit hardhat"
	desc = "A starsuit helmet with a reinforced hardhat built in, for hazardous EVA construction and maintenance operations."
	icon_state = "starsuit_hardhat"
	worn_icon_state = "starsuit_hardhat"

	armor = list(MELEE = 10, BULLET = 10, LASER = 10,ENERGY = 10, BOMB = 30, BIO = 100, FIRE = 80, ACID = 70)
