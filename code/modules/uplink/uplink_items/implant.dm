// File ordered based on progression

/datum/uplink_category/implants
	name = "Implants"
	weight = 2


/datum/uplink_item/implants
	category = /datum/uplink_category/implants
	surplus = 50

// No progression cost
/datum/uplink_item/implants/adrenal
	name = "Adrenal Implant"
	desc = "An implant injected into the body, and later activated at the user's will. It will increase user speed, \
	reduce fatigue buildup, and mend a small amount of physical damage. Side effects include a brief period of \
	pathological nonviolence, and overdose can be lethal. Has three charges."
	item = /obj/item/storage/box/syndie_kit/imp_adrenal
	cost = 50

/datum/uplink_item/implants/adrenal/single
	name = "Budget Adrenal Implant"
	desc = "An adrenal implant with a single charge, an emergency get-out-of-jail card for agents of all expertise."
	item = /obj/item/storage/box/syndie_kit/imp_adrenal/single
	cost = 20

/datum/uplink_item/implants/freedom
	name = "Freedom Implant"
	desc = "An implant injected into the body and later activated at the user's will. It will attempt to free the \
			user from common restraints such as handcuffs."
	item = /obj/item/storage/box/syndie_kit/imp_freedom
	cost = 25

/datum/uplink_item/implants/radio
	name = "Internal Syndicate Radio Implant"
	desc = "An implant injected into the body, allowing the use of an internal Syndicate radio. \
			Used just like a regular headset, but can be disabled to use external headsets normally and to avoid detection."
	item = /obj/item/storage/box/syndie_kit/imp_radio
	cost = 10
	restricted = TRUE


/datum/uplink_item/implants/stealthimplant
	name = "Stealth Implant"
	desc = "This one-of-a-kind implant will make you almost invisible if you play your cards right. \
			On activation, it will conceal you inside a chameleon cardboard box that is only revealed once someone bumps into it."
	item = /obj/item/storage/box/syndie_kit/imp_stealth
	cost = 35

/datum/uplink_item/implants/storage
	name = "Storage Implant"
	desc = "An implant injected into the body, and later activated at the user's will. It will open a small bluespace \
			pocket capable of storing two regular-sized items."
	item = /obj/item/storage/box/syndie_kit/imp_storage
	cost = 40

/datum/uplink_item/implants/uplink
	name = "Uplink Implant"
	desc = "An implant injected into the body, and later activated at the user's will. Has no telecrystals and must be charged by the use of physical telecrystals. \
			Undetectable (except via surgery), and excellent for escaping confinement."
	item = /obj/item/storage/box/syndie_kit // the actual uplink implant is generated later on in spawn_item
	cost = UPLINK_IMPLANT_TELECRYSTAL_COST
	// An empty uplink is kinda useless.
	surplus = 0
	restricted = TRUE

/datum/uplink_item/implants/uplink/spawn_item(spawn_path, mob/user, datum/uplink_handler/uplink_handler, atom/movable/source)
	var/obj/item/storage/box/syndie_kit/uplink_box = ..()
	uplink_box.name = "Uplink Implant Box"
	new /obj/item/implanter/uplink(uplink_box, uplink_handler)
	return uplink_box


/*

Can't leave the ventcrawling implants readily accessible ingame in good conscience, there are too many exploits I have yet to figure out how to deal with.
As of writing this, exiting atmos pipes by any means other than leaving through a vent causes undesirable retention of TRAIT_MOVE_VENTCRAWLING
and any other temporary traits. - Jan 2023

/datum/uplink_item/implants/ventcrawling_deluxe
	name = "Bluespace Contortion Implant"
	desc = "An implant injected into the body, passively allowing the user to spatially fold themself, enabling them to \
	fit into vents and other small spaces with ease. Advances in transdimensional-organic safety tech allows for \
	worn items to be carried with them. CAUTION! Ventilation ducts may trap you! The implant will provide \
	protection from most hazardous atmospheres while contorting, but does not guarantee your safety!"
	item = /obj/item/implanter/ventcrawling/deluxe
	cost = 60

/datum/uplink_item/implants/ventcrawling
	name = "Budget Contortion Implant"
	desc = "An implant injected into the body, passively allowing the user to spatially fold themself, enabling them to \
	fit into vents and other small spaces with relative ease. The user must be completely unclothed for the mechanics to function \
	in many cases. CAUTION! Ventilation ducts may trap you! The implant will provide \
	protection from most hazardous atmospheres while contorting, but does not guarantee your safety!"
	item = /obj/item/implanter/ventcrawling
	cost = 10
*/
