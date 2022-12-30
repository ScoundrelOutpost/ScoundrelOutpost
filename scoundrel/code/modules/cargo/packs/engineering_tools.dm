/datum/supply_pack/tools
	group = "Engineering Tools"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/tools/engiequipment
	name = "Engineering Gear Crate"
	desc = "Gear up with three toolbelts, high-visibility vests, welding helmets, hardhats, \
		and two pairs of meson goggles!"
	cost = CARGO_CRATE_VALUE * 2.5
	contains = list(/obj/item/storage/belt/utility = 3,
					/obj/item/clothing/suit/hazardvest = 3,
					/obj/item/clothing/head/utility/welding = 3,
					/obj/item/clothing/head/utility/hardhat = 3,
					/obj/item/clothing/glasses/meson/engine = 2,
				)
	crate_name = "engineering gear crate"

/datum/supply_pack/tools/insulatedgloves
	name = "Insulated Gloves Crate"
	desc = "The backbone of modern society. Barely ever ordered for actual engineering. \
		Contains three insulated gloves."
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/obj/item/clothing/gloves/color/yellow = 3)
	crate_name = "insulated gloves crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/tools/inducers
	name = "NT-75 Electromagnetic Power Inducers Crate"
	desc = "No rechargers? No problem, with the NT-75 EPI, you can recharge any standard \
		cell-based equipment anytime, anywhere. Contains two Inducers."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/inducer/sci {cell_type = /obj/item/stock_parts/cell/inducer_supply; opened = 0} = 2) //FALSE doesn't work in modified type paths apparently.
	crate_name = "inducer crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/tools/pacman
	name = "P.A.C.M.A.N Generator Crate"
	desc = "Engineers can't set up the engine? Not an issue for you, once you get your hands \
		on this P.A.C.M.A.N. Generator! Takes in plasma and spits out sweet sweet energy."
	cost = CARGO_CRATE_VALUE * 3
	access_view = ACCESS_ENGINEERING
	contains = list(/obj/machinery/power/port_gen/pacman)
	crate_name = "\improper PACMAN generator crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/tools/power
	name = "Power Cell Crate"
	desc = "Looking for power overwhelming? Look no further. Contains three high-voltage power cells."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/stock_parts/cell/high = 3)
	crate_name = "power cell crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/tools/tools
	name = "Toolbox Crate"
	desc = "Any robust spaceman is never far from their trusty toolbox. Contains three electrical \
		toolboxes and three mechanical toolboxes."
	contains = list(/obj/item/storage/toolbox/electrical = 3,
					/obj/item/storage/toolbox/mechanical = 3,
				)
	cost = CARGO_CRATE_VALUE * 5
	crate_name = "toolbox crate"

/datum/supply_pack/tools/portapump
	name = "Portable Air Pump Crate"
	desc = "Did someone let the air out of the shuttle again? We've got you covered. \
		Contains two portable air pumps."
	cost = CARGO_CRATE_VALUE * 4.5
	contains = list(/obj/machinery/portable_atmospherics/pump = 2)
	crate_name = "portable air pump crate"

/datum/supply_pack/tools/portascrubber
	name = "Portable Scrubber Crate"
	desc = "Clean up that pesky plasma leak with your very own set of two portable scrubbers."
	cost = CARGO_CRATE_VALUE * 4.5
	contains = list(/obj/machinery/portable_atmospherics/scrubber = 2)
	crate_name = "portable scrubber crate"

/datum/supply_pack/tools/hugescrubber
	name = "Huge Portable Scrubber Crate"
	desc = "A huge portable scrubber for huge atmospherics mistakes."
	cost = CARGO_CRATE_VALUE * 7.5
	contains = list(/obj/machinery/portable_atmospherics/scrubber/huge/movable/cargo)
	crate_name = "huge portable scrubber crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/tools/space_heater
	name = "Space Heater Crate"
	desc = "A dual purpose heater/cooler for when things are too chilly/toasty."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/machinery/space_heater)
	crate_name = "space heater crate"
	crate_type = /obj/structure/closet/crate/large
