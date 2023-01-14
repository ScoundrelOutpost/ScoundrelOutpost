/datum/supply_pack/fishing
	group = "Fishing"

/datum/supply_pack/fishing/aquarium_kit
	name = "Aquarium Kit"
	desc = "Everything you need to start your own aquarium. Contains aquarium construction kit, \
		fish catalog, fish food and three freshwater fish from our collection."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/book/fish_catalog,
					/obj/item/storage/fish_case/random/freshwater = 3,
					/obj/item/fish_feed,
					/obj/item/storage/box/aquarium_props,
					/obj/item/aquarium_kit,
				)
	crate_name = "aquarium kit crate"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/fishing/fishing_portal
	name = "Fishing Portal Generator Crate"
	desc = "Not enough fish near your location? Fishing portal has your back."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/machinery/fishing_portal_generator)
	crate_name = "fishing portal crate"

/datum/supply_pack/fishing/fishing_toolbox
	name = "Fishing Supplies"
	desc = "Contains two toolboxes filled with fishing necessities."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/toolbox/fishing = 2)
	crate_name = "fishing supplies crate"

// singles
/datum/supply_pack/fishing/fishing_toolbox/single
	name = "(Single) Fishing Toolbox"
	desc = "Become the ire of fish and the desire of women on your relaxing fishing getaway."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/storage/toolbox/fishing = 2)
	goody = TRUE
