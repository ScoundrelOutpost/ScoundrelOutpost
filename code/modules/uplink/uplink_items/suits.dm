// File ordered by progression

/datum/uplink_category/suits
	name = "Space Suits"
	weight = 3

/datum/uplink_item/suits
	category = /datum/uplink_category/suits
	surplus = 40

/datum/uplink_item/suits/infiltrator_bundle
	name = "Infiltrator MODsuit"
	desc = "Developed by the Roseus Galactic Actors Guild in conjunction with the Gorlex Marauders to produce a functional suit for urban operations, \
			this suit proves to be cheaper than your standard issue MODsuit, with none of the movement restrictions of the space suits employed by the company. \
			However, this greater mobility comes at a cost, and the suit is ineffective at protecting the wearer from the vacuum of space. \
			The suit does come pre-equipped with a special psi-emitter stealth module that makes it impossible to recognize the wearer \
			as well as causing significant demoralization amongst Nanotrasen crew."
	item = /obj/item/mod/control/pre_equipped/infiltrator
	cost = 30

/datum/uplink_item/suits/space_suit
	name = "Syndicate Space Suit"
	desc = "This red and black Syndicate space suit is less encumbering than Nanotrasen variants, \
			fits inside bags, and has a weapon slot. Nanotrasen crew members are trained to report red space suit \
			sightings, however."
	item = /obj/item/storage/box/syndie_kit/space
	cost = 15

/datum/uplink_item/suits/syndicate_hardsuit
	name = "Syndicate Hardsuit & Jetpack"
	desc = "A sleek, compact combat EVA suit with heightened mobility. Frequently employed by high-profile nuclear strike teams. \
			Folds into an easily stored shape for quick hit-and-run covert-ops. As a bonus, it comes with an advanced compact jetpack. \
			Tends to be associated with extreme danger; expect a preemptive response."
	item = /obj/item/storage/toolbox/syndicatehardsuit
	cost = 30
