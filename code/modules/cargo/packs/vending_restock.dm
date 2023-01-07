/datum/supply_pack/vending
	group = "Vending Restocks"

// Sales vendors
/datum/supply_pack/vending/bartending
	name = "Booze-o-mat and Coffee Supply Crate"
	desc = "Bring on the booze and coffee vending machine refills. \
		Microcharges may apply."
	cost = CARGO_CRATE_VALUE * 1
	contains = list(/obj/item/vending_refill/boozeomat,
					/obj/item/vending_refill/coffee,
				)
	crate_name = "bartending supply crate"

/datum/supply_pack/vending/cigarette
	name = "Cigarette Supply Crate"
	desc = "Don't believe the reports - smoke today! Contains a \
		cigarette vending machine refill. Microcharges may apply."
	cost = CARGO_CRATE_VALUE * 1
	contains = list(/obj/item/vending_refill/cigarette)
	crate_name = "cigarette supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/snack
	name = "Snack Supply Crate"
	desc = "One vending machine refill of cavity-bringin' goodness! \
		The number one dentist recommended order! Microcharges may apply."
	cost = CARGO_CRATE_VALUE * 1
	contains = list(/obj/item/vending_refill/snack)
	crate_name = "snacks supply crate"

/datum/supply_pack/vending/cola
	name = "Softdrinks Supply Crate"
	desc = "Got whacked by a toolbox, but you still have those pesky teeth? \
		Get rid of those pearly whites with this soda machine refill, today! \
		Microcharges may apply."
	cost = CARGO_CRATE_VALUE * 1
	contains = list(/obj/item/vending_refill/cola)
	crate_name = "soft drinks supply crate"

// Dispenser vendors (free to crew)
/datum/supply_pack/vending/clothesmate
	name = "ClothesMate Supply Crate"
	desc = "Out of cowboy boots? Buy this crate."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/clothing)
	crate_name = "\improper ClothesMate supply crate"

/datum/supply_pack/vending/ptech
	name = "PTech Supply Crate"
	desc = "Not enough cartridges after half the crew lost their PDA \
		to explosions? This may fix it."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/vending_refill/cart)
	crate_name = "\improper PTech supply crate"

/datum/supply_pack/vending/medical
	name = "Medical Vending Crate"
	desc = "Contains one NanoMed Plus refill, one NanoDrug Plus refill, \
		and one wall-mounted NanoMed refill."
	cost = CARGO_CRATE_VALUE * 16
	contains = list(/obj/item/vending_refill/medical,
					/obj/item/vending_refill/drugs,
					/obj/item/vending_refill/wallmed,
				)
	crate_name = "medical vending crate"

/datum/supply_pack/vending/vendomat
	name = "Part-Mart & YouTool Supply Crate"
	desc = "More tools for your IED testing facility."
	cost = CARGO_CRATE_VALUE * 12
	contains = list(/obj/item/vending_refill/assist,
					/obj/item/vending_refill/youtool,
				)
	crate_name = "\improper Part-Mart & YouTool supply crate"

/datum/supply_pack/vending/hydro_refills
	name = "Hydroponics Vending Machines Refills"
	desc = "When the clown takes all the banana seeds. \
		Contains a NutriMax refill and a MegaSeed Servitor refill."
	cost = CARGO_CRATE_VALUE * 4
	crate_type = /obj/structure/closet/crate
	contains = list(/obj/item/vending_refill/hydroseeds,
					/obj/item/vending_refill/hydronutrients,
				)
	crate_name = "hydroponics supply crate"

/datum/supply_pack/vending/games
	name = "Games Supply Crate"
	desc = "Get your game on with this game vending machine refill."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/vending_refill/games)
	crate_name = "games supply crate"
	crate_type = /obj/structure/closet/crate

// not actually free to crew. reminder to fix this
/datum/supply_pack/vending/science/modularpc
	name = "Deluxe Silicate Selections Restock"
	desc = "What's a computer? Contains a Deluxe Silicate Selections restocking unit."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/vending_refill/modularpc)
	crate_name = "computer supply crate"

/datum/supply_pack/vending/engivend
	name = "EngiVend Supply Crate"
	desc = "The engineers are out of metal foam grenades? This should help."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/vending_refill/engivend)
	crate_name = "engineering supply crate"

/datum/supply_pack/vending/dinnerware
	name = "Dinnerware Supply Crate"
	desc = "More knives for the chef."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/vending_refill/dinnerware)
	crate_name = "dinnerware supply crate"
