/datum/supply_pack/misc
	group = "Miscellaneous Supplies"
/datum/supply_pack/goody
	group = "Miscellaneous Supplies"
	
/datum/supply_pack/misc/artsupply
	name = "Art Supplies"
	desc = "Make some happy little accidents with a rapid pipe cleaner layer, \
		three spraycans, and lots of crayons!"
	cost = CARGO_CRATE_VALUE * 1.8
	contains = list(/obj/item/rcl,
					/obj/item/storage/toolbox/artistic,
					/obj/item/toy/crayon/spraycan = 3,
					/obj/item/storage/crayons,
					/obj/item/toy/crayon/white,
					/obj/item/toy/crayon/rainbow,
				)
	crate_name = "art supply crate"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/misc/tattoo_kit
	name = "Tattoo Kit"
	desc = "A tattoo kit with some extra starting ink."
	cost = CARGO_CRATE_VALUE * 1.8
	contains = list(
		/obj/item/tattoo_kit,
		/obj/item/toner = 2)
	crate_name = "tattoo crate"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/misc/bicycle
	name = "Bicycle"
	desc = "Nanotrasen reminds all employees to never toy with powers outside their control."
	cost = 1000000 //Special case, we don't want to make this in terms of crates because having bikes be a million credits is the whole meme.
	contains = list(/obj/vehicle/ridden/bicycle)
	crate_name = "bicycle crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/misc/book_crate
	name = "Book Crate"
	desc = "Surplus from the Nanotrasen Archives, these seven books are sure to be good reads."
	cost = CARGO_CRATE_VALUE * 3
	access_view = ACCESS_LIBRARY
	contains = list(/obj/item/book/codex_gigas,
					/obj/item/book/manual/random = 3,
					/obj/item/book/random = 3,
				)
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/misc/wrapping_paper
	name = "Festive Wrapping Paper Crate"
	desc = "Want to mail your loved ones gift-wrapped chocolates, stuffed animals, the Clown's severed head? \
		You can do all that, with this crate full of wrapping paper."
	cost = CARGO_CRATE_VALUE * 1.8
	contains = list(/obj/item/stack/wrapping_paper)
	crate_type = /obj/structure/closet/crate/wooden
	crate_name = "festive wrapping paper crate"

/datum/supply_pack/misc/funeral
	name = "Funeral Supply crate"
	desc = "At the end of the day, someone's gonna want someone dead. Give them a proper send-off with these \
		funeral supplies! Contains a coffin with burial garmets and flowers."
	cost = CARGO_CRATE_VALUE * 1.6
	access_view = ACCESS_CHAPEL_OFFICE
	contains = list(/obj/item/clothing/under/misc/burial,
					/obj/item/food/grown/harebell,
					/obj/item/food/grown/poppy/geranium,
				)
	crate_name = "coffin"
	crate_type = /obj/structure/closet/crate/coffin

/datum/supply_pack/misc/empty
	name = "Empty Supplypod"
	desc = "Presenting the New Nanotrasen-Brand Bluespace Supplypod! Transport cargo with grace and ease! \
		Call today and we'll shoot over a demo unit for just 300 credits!"
	cost = CARGO_CRATE_VALUE * 0.6 //Empty pod, so no crate refund
	contains = list()
	drop_pod_only = TRUE
	crate_type = null
	special_pod = /obj/structure/closet/supplypod/bluespacepod

/datum/supply_pack/misc/empty/generate(atom/A, datum/bank_account/paying_account)
	return

/datum/supply_pack/misc/toner
	name = "Toner Crate"
	desc = "Spent too much ink printing butt pictures? Fret not, with these six toner refills, \
		you'll be printing butts 'till the cows come home!'"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/toner = 6)
	crate_name = "toner crate"

/datum/supply_pack/misc/training_toolbox
	name = "Training Toolbox Crate"
	desc = "Hone your combat abiltities with two AURUMILL-Brand Training Toolboxes! \
		Guarenteed to count hits made against living beings!"
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/training_toolbox = 2)
	crate_name = "training toolbox crate"

/datum/supply_pack/misc/blackmarket_telepad
	name = "Black Market LTSRBT"
	desc = "Need a faster and better way of transporting your illegal goods from and to the \
		station? Fear not, the Long-To-Short-Range-Bluespace-Transceiver (LTSRBT for short) \
		is here to help. Contains a LTSRBT circuit, two bluespace crystals, and one ansible."
	cost = CARGO_CRATE_VALUE * 20
	contraband = TRUE
	contains = list(/obj/item/circuitboard/machine/ltsrbt,
					/obj/item/stack/ore/bluespace_crystal/artificial = 2,
					/obj/item/stock_parts/subspace/ansible,
				)
	crate_name = "crate"

/datum/supply_pack/misc/dyespray
	name = "(Single) Hairdye Spray"
	desc = "An advanced hairdye applicator for honing your unique appearance."
	cost = CARGO_CRATE_VALUE * 0.5
	contains = list(/obj/item/dyespray = 1)
	goody = TRUE

/datum/supply_pack/misc/soap_single
	name = "(Single) Soap"
	desc = "A bar of unscented soap, an ancient staple of hygiene and wellness."
	cost = CARGO_CRATE_VALUE * 0.5
	contains = list(/obj/item/soap = 1)
	goody = TRUE

/datum/supply_pack/misc/fashionbeacon
	name = "(Single) Outfit Beacon"
	desc = "Choose a new outfit with this fashion-forward quantum potential package."
	cost = CARGO_CRATE_VALUE * 0.5
	contains = list(/obj/item/choice_beacon/fashionable = 1)
	goody = TRUE

/datum/supply_pack/misc/herobeacon
	name = "(Single) Heroic Beacon"
	desc = "Choose an outfit reenacting a piece of ancient history with this quantum potential package."
	cost = CARGO_CRATE_VALUE * 1.5
	contains = list(/obj/item/choice_beacon/hero = 1)
	goody = TRUE
	contraband = TRUE

/datum/supply_pack/misc/nullrod
	name = "(Single) Obsidian Rod"
	desc = "An engraved rod of solid obsidian with inlays of rosegold. An object of particular spiritual importance for some."
	cost = CARGO_CRATE_VALUE * 1.5
	contains = list(/obj/item/nullrod = 1)
	goody = TRUE

/datum/supply_pack/misc/advanced_pda
	name = "(Single) Advanced PDA"
	desc = "An advanced micro-computer for personal data, with an expanded datastore and an inbuilt multiool jack. Comes with a free screwdriver pen, \
	and many preloaded programs for station upkeep."
	cost = CARGO_CRATE_VALUE * 0.75
	contains = list(/obj/item/modular_computer/tablet/pda/deckhand/leader = 1)
	goody = TRUE
