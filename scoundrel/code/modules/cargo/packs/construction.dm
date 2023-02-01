/// Construction

/datum/supply_pack/construction
	group = "Construction"
	crate_type = /obj/structure/closet/crate/engineering

/datum/supply_pack/tools/ripley
	name = "APLU MK-I Crate"
	desc = "A do-it-yourself kit for building an ALPU MK-I \"Ripley\", designed for lifting, \
		carrying heavy equipment, and other station tasks. Batteries not included."
	cost = CARGO_CRATE_VALUE * 10
	contains = list(/obj/item/mecha_parts/chassis/ripley,
					/obj/item/mecha_parts/part/ripley_torso,
					/obj/item/mecha_parts/part/ripley_right_arm,
					/obj/item/mecha_parts/part/ripley_left_arm,
					/obj/item/mecha_parts/part/ripley_right_leg,
					/obj/item/mecha_parts/part/ripley_left_leg,
					/obj/item/stock_parts/capacitor,
					/obj/item/stock_parts/scanning_module,
					/obj/item/circuitboard/mecha/ripley/main,
					/obj/item/circuitboard/mecha/ripley/peripherals,
					/obj/item/mecha_parts/mecha_equipment/drill,
					/obj/item/mecha_parts/mecha_equipment/hydraulic_clamp,
				)
	crate_name= "\improper APLU MK-I kit"

/datum/supply_pack/tools/conveyor
	name = "Conveyor Assembly Crate"
	desc = "Keep production moving along with thirty conveyor belts. Conveyor switch included. \
		If you have any questions, check out the enclosed instruction book."
	cost = CARGO_CRATE_VALUE * 3.5
	contains = list(/obj/item/stack/conveyor/thirty,
					/obj/item/conveyor_switch_construct,
					/obj/item/paper/guides/conveyor,
				)
	crate_name = "conveyor assembly crate"

/datum/supply_pack/construction/emitter
	name = "Emitter Crate"
	desc = "Useful for powering forcefield generators while destroying locked crates \
		and intruders alike. Contains two high-powered energy emitters. Requires CE access to open."
	cost = CARGO_CRATE_VALUE * 7
	access = ACCESS_CE
	contains = list(/obj/machinery/power/emitter = 2)
	crate_name = "emitter crate"
	crate_type = /obj/structure/closet/crate/secure/engineering
	dangerous = TRUE

/datum/supply_pack/construction/field_gen
	name = "Field Generator Crate"
	desc = "Typically the only thing standing between the station and a messy death. \
		Powered by emitters. Contains two field generators."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/machinery/field/generator = 2)
	crate_name = "field generator crate"

/datum/supply_pack/construction/grounding_rods
	name = "Grounding Rod Crate"
	desc = "Four grounding rods guaranteed to keep any uppity tesla coil's lightning under control."
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/obj/machinery/power/energy_accumulator/grounding_rod = 4)
	crate_name = "grounding rod crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/construction/solar
	name = "Solar Panel Crate"
	desc = "Go green with this DIY advanced solar array. Contains twenty one solar assemblies, \
		a solar-control circuit board, and tracker. If you have any questions, \
		please check out the enclosed instruction book."
	cost = CARGO_CRATE_VALUE * 8
	contains = list(/obj/item/solar_assembly = 21,
					/obj/item/circuitboard/computer/solar_control,
					/obj/item/electronics/tracker,
					/obj/item/paper/guides/jobs/engi/solars,
				)
	crate_name = "solar panel crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/construction/supermatter_shard
	name = "Supermatter Shard Crate"
	desc = "The power of the heavens condensed into a single crystal. Requires CE access to open."
	cost = CARGO_CRATE_VALUE * 20
	access = ACCESS_CE
	contains = list(/obj/machinery/power/supermatter_crystal/shard)
	crate_name = "supermatter shard crate"
	crate_type = /obj/structure/closet/crate/secure/engineering
	dangerous = TRUE

/datum/supply_pack/construction/tesla_coils
	name = "Tesla Coil Crate"
	desc = "Whether it's high-voltage executions, creating research points, or just plain old \
		assistant electrofrying: this pack of four Tesla coils can do it all!"
	cost = CARGO_CRATE_VALUE * 10
	contains = list(/obj/machinery/power/energy_accumulator/tesla_coil = 4)
	crate_name = "tesla coil crate"
	crate_type = /obj/structure/closet/crate/engineering/electrical

/datum/supply_pack/construction/hypertorus_fusion_reactor
	name = "HFR Crate"
	desc = "The new and improved fusion reactor. Requires CE access to open."
	cost = CARGO_CRATE_VALUE * 23
	access = ACCESS_CE
	contains = list(/obj/item/hfr_box/corner = 4,
					/obj/item/hfr_box/body/fuel_input,
					/obj/item/hfr_box/body/moderator_input,
					/obj/item/hfr_box/body/waste_output,
					/obj/item/hfr_box/body/interface,
					/obj/item/hfr_box/core,
				)
	crate_name = "HFR crate"
	crate_type = /obj/structure/closet/crate/secure/engineering
	dangerous = TRUE

/datum/supply_pack/construction/shieldgen
	name = "Anti-breach Shield Projector Crate"
	desc = "Hull breaches again? Say no more with the Nanotrasen Anti-Breach Shield Projector! \
		Uses forcefield technology to keep the air in, and the space out. Contains two shield projectors."
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/machinery/shieldgen = 2)
	crate_name = "anti-breach shield projector crate"

/datum/supply_pack/construction/shuttle_engine
	name = "Shuttle Engine Crate"
	desc = "Through advanced bluespace-shenanigans, our engineers have managed to fit an entire \
		shuttle engine into one tiny little crate. Requires CE access to open."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/machinery/power/shuttle_engine/propulsion/burst/cargo)
	crate_name = "shuttle engine crate"
	crate_type = /obj/structure/closet/crate/secure/engineering
	special = TRUE

// station objectives
/datum/supply_pack/construction/bsa
	name = "Bluespace Artillery Parts"
	desc = "The pride of Nanotrasen Naval Command. The legendary Bluespace Artillery Cannon is a \
		devastating feat of human engineering and testament to wartime determination. \
		Highly advanced research is required for proper construction. "
	cost = CARGO_CRATE_VALUE * 30
	special = TRUE
	contains = list(/obj/item/circuitboard/machine/bsa/front,
					/obj/item/circuitboard/machine/bsa/middle,
					/obj/item/circuitboard/machine/bsa/back,
					/obj/item/circuitboard/computer/bsa_control,
				)
	crate_name= "bluespace artillery parts crate"

/datum/supply_pack/construction/dna_vault
	name = "DNA Vault Parts"
	desc = "Secure the longevity of the current state of humanity within this massive \
		library of scientific knowledge, capable of granting superhuman powers and abilities. \
		Highly advanced research is required for proper construction. Also contains five DNA probes."
	cost = CARGO_CRATE_VALUE * 24
	special = TRUE
	contains = list(/obj/item/circuitboard/machine/dna_vault,
					/obj/item/dna_probe = 5,
				)
	crate_name= "dna vault parts crate"

/datum/supply_pack/construction/dna_probes
	name = "DNA Vault Samplers"
	desc = "Contains five DNA probes for use in the DNA vault."
	cost = CARGO_CRATE_VALUE * 6
	special = TRUE
	contains = list(/obj/item/dna_probe = 5)
	crate_name= "dna samplers crate"


/datum/supply_pack/construction/shield_sat
	name = "Shield Generator Satellite"
	desc = "Protect the very existence of this station with these Anti-Meteor defenses. \
		Contains three Shield Generator Satellites."
	cost = CARGO_CRATE_VALUE * 6
	special = TRUE
	contains = list(/obj/machinery/satellite/meteor_shield = 3)
	crate_name= "shield sat crate"


/datum/supply_pack/construction/shield_sat_control
	name = "Shield System Control Board"
	desc = "A control system for the Shield Generator Satellite system."
	cost = CARGO_CRATE_VALUE * 10
	special = TRUE
	contains = list(/obj/item/circuitboard/computer/sat_control)
	crate_name= "shield control board crate"

/datum/supply_pack/construction/construction_capsule
	name = "Construction Capsules"
	desc = "Two 11x11 bluespace capsules capable of providing a basic construction area following quick deployment."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/survivalcapsule/construction_pod = 2)
	crate_name = "construction capsule crate"

/datum/supply_pack/construction/construction_capsule_single
	name = "(Single) Construction Capsule"
	desc = "A 11x11 bluespace capsule capable of providing a basic construction area following quick deployment."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/survivalcapsule/construction_pod)
	goody = TRUE
