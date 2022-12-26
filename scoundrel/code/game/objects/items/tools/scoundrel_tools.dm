// stealth tools
/obj/item/multitool/stealth
	name = "multitool"
	desc = "A silent, stealthy multitool. Bespoke casing & components prevents excessive, noisy rattling."
	icon = 'icons/obj/device.dmi'
	icon_state = "multitool_syndicate"

	force = 8
	throwforce = 14

	toolspeed = 0.7

	usesound = null
	drop_sound = null
	pickup_sound = null

/obj/item/screwdriver/nuke/stealth
	name = "screwdriver"
	desc = "A subsonic screwdriver with a sturdy polymer head and an internal localized sound dampener. Ideal for covert screwing."
	icon = 'icons/obj/tools.dmi'
	icon_state = "screwdriver_stealth"
	inhand_icon_state = "screwdriver_nuke"

	flags_1 = CONDUCT_1

	force = 10
	throwforce = 14
	throw_range = 8

	toolspeed = 0.7

	usesound = null
	drop_sound = null
	pickup_sound = null

	random_color = FALSE
	greyscale_config_inhand_left = null
	greyscale_config_inhand_right = null
