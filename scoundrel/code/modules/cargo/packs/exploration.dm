/// Exploration drone unlockables ///

/datum/supply_pack/exploration
	special = TRUE
	group = "Exploration"

/datum/supply_pack/exploration/scrapyard
	name = "Scrapyard Crate"
	desc = "Outsourced crate containing various junk."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/relic,
					/obj/item/broken_bottle,
					/obj/item/pickaxe/rusted)
	crate_name = "scrapyard crate"

/datum/supply_pack/exploration/catering
	name = "Catering Crate"
	desc = "No cook? No problem! Food quality may vary depending on provider."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/food/sandwich = 5)
	crate_name = "outsourced food crate"

/datum/supply_pack/exploration/catering/fill(obj/structure/closet/crate/crate)
	. = ..()
	if(!prob(30))
		return

	for(var/obj/item/food/food_item in crate)
		// makes all of our items GROSS
		food_item.name = "spoiled [food_item.name]"
		food_item.AddComponent(/datum/component/edible, foodtypes = GROSS)

/datum/supply_pack/exploration/shrubbery
	name = "Shrubbery Crate"
	desc = "Crate full of hedge shrubs."
	cost = CARGO_CRATE_VALUE * 5
	crate_name = "shrubbery crate"
	var/shrub_amount = 8

/datum/supply_pack/exploration/shrubbery/fill(obj/structure/closet/crate/C)
	for(var/i in 1 to shrub_amount)
		new /obj/item/grown/shrub(C)

/datum/supply_pack/exploration/exploration_drone
	name = "Exploration Drone"
	desc = "A replacement long-range exploration drone."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/exodrone)
	crate_name = "exodrone crate"

/datum/supply_pack/exploration/exploration_fuel
	name = "Drone Fuel Pellet"
	desc = "A fresh tank of exploration drone fuel."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/fuel_pellet)
	crate_name = "exodrone fuel crate"

/datum/supply_pack/exploration/unlocked
	special = FALSE

/datum/supply_pack/exploration/unlocked/advanced_jetpacks
	name = "Advanced Jetpacks"
	desc = "Contains three advanced jetpacks suited to local-longrange single-personnel space exploration."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/tank/jetpack/advanced = 3)
	crate_name = "advanced jetpack crate"

/datum/supply_pack/exploration/unlocked/eva_suits
	name = "EVA Space Suits"
	desc = "Contains three old-fashioned atmos-sealed EVA suits, allowing for space exploration & maintenance. \
	Yes, we're still in production! They're more durable than starsuits, leakproof guaranteed."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/clothing/suit/space/eva = 3,
					/obj/item/clothing/head/helmet/space/eva = 3,)
	crate_name = "EVA suit crate"

/datum/supply_pack/exploration/unlocked/starsuits
	name = "Starsuits"
	desc = "Contains three complete form-fitting starsuits, allowing for space exploration & maintenance. Can be worn as an undersuit."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/clothing/under/starsuit = 3,
					/obj/item/clothing/head/helmet/space/starsuit = 3,)
	crate_name = "starsuit crate"
