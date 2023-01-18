// scoundrel content

// premium vendors
// bodyhack
/obj/machinery/vending/bodymods
	name = "\improper BodyHack"
	desc = "A vending machine presented by Cybersun Industries, for open-market cybernetic augments & implants. Great lengths have been gone to \
	protect the merchandise from theft, and it looks pretty secure."
	default_price = 300
	extra_price = 600
	icon_state = "custom"
	icon_deny = "custom-deny"
	light_mask = "custom-light-mask"
	panel_type = "panel20"
	payment_department = NO_FREEBIES

	// anti exploitation vars
	tiltable = FALSE
	integrity_failure = 0
	shoot_inventory_chance = 0

	products = list(
		/obj/item/organ/internal/cyberimp/mouth/breathing_tube = 2,
		/obj/item/organ/internal/cyberimp/eyes/hud/diagnostic = 2,
		/obj/item/organ/internal/cyberimp/chest/nutriment = 2,
		/obj/item/implantcase = 4,
		/obj/item/implanter = 4,
	)
	contraband = list(
		/obj/item/organ/internal/cyberimp/chest/thrusters = 1,
		/obj/item/organ/internal/eyes/robotic/shield = 1,
	)
	premium = list(
		/obj/item/organ/internal/cyberimp/arm/surgery = 1,
		/obj/item/implanter/radio = 1,
	)
	refill_canister = /obj/item/vending_refill/bodymods

/obj/item/vending_refill/bodymods
	machine_name = "BodyHack"
	icon_state = "refill_engi"

// free vendors
// umatter
/obj/machinery/vending/umatter
	name = "\improper U-Matter"
	desc = "In case you were wondering. Don't forget to return unused materials!"
	products = list(
		/obj/item/stack/cable_coil = 3,
		/obj/item/stack/sheet/mineral/wood = 15,
		/obj/item/stack/sheet/cloth = 15,
		/obj/item/stack/sheet/plastic = 15,
		/obj/item/stack/sheet/leather = 5,
		/obj/item/stack/sheet/cardboard = 15,
		/obj/item/stack/package_wrap = 3,
		/obj/item/paper_bin = 3,
		/obj/item/hand_labeler_refill = 2,
	)
	contraband = list(
		/obj/item/circuitboard/machine/sheetifier = 1,
		/obj/item/stack/sheet/bluespace_crystal = 1,
		/obj/item/stack/sheet/mineral/bananium = 5,
	)
	premium = list(
		/obj/item/stack/sheet/plasteel = 10,
		/obj/item/toner = 2,
		/obj/item/pai_card = 2,
	)
	refill_canister = /obj/item/vending_refill/umatter

/obj/item/vending_refill/umatter
	machine_name = "U-Matter"
	icon_state = "refill_parts"

// npcs

/obj/machinery/vending/npc
	name = "NPC Vendor"
	desc = "You probably shouldn't be seeing this!"
//	default_price = 300
//	extra_price = 600
	icon = 'scoundrel/icons/obj/traders/traders.dmi'
	icon_state = "apprentice"
	icon_deny = null
	light_mask = null
	panel_type = null
	payment_department = NO_FREEBIES
	damage_deflection = 1000
	can_be_unanchored = FALSE
	onstation_override = TRUE // i applied it globally lmao

	verb_ask = "says"
	verb_exclaim = "says"
	verb_say = "says"

	// anti exploitation vars
	tiltable = FALSE
	integrity_failure = 0
	shoot_inventory_chance = 0

	products = list(
		/obj/item/bikehorn = 1,
	)
	contraband = list(
		/obj/item/bikehorn = 1,
	)
	premium = list(
		/obj/item/bikehorn = 1,
	)

/obj/machinery/vending/npc/waypost
	name = "Sen Ilid"
	desc = "They look like they might sell a thing or two."
	icon_state = "spacer-jacket"

	default_price = 300
	extra_price = 800

	vend_reply = "Burn bright, spacer."

	products = list(
		//tools
		/obj/item/knife/combat/survival = 2,
		/obj/item/storage/belt/utility/full = 2,
		/obj/item/storage/backpack/satchel/flat/with_tools = 1,
		//exotic
		/obj/item/organ/internal/eyes/robotic/shield = 1,
		/obj/item/forcefield_projector = 1,
		/obj/item/seeds/random = 10,
		/obj/item/seeds/tomato/blue/bluespace = 1,
		/obj/item/ammo_box/magazine/m9mm/fire = 1,
		/obj/item/implanter/radio = 1,
		//fluff
		/obj/item/toy/plush/beeplushie = 1,
	)
	contraband = list(
		/obj/item/seeds/kudzu = 1,
		/obj/item/toy/plush/carpplushie/dehy_carp = 1,
		/obj/item/camera_bug = 1,
	)
	premium = list(
		//tools
		/obj/item/retractor/advanced = 1,
		/obj/item/crowbar/power = 1,
		/obj/item/construction/rcd/loaded/upgraded = 1,
		/obj/item/melee/tonfa/shock_tonfa = 1,
		//exotic
		/obj/item/organ/internal/cyberimp/arm/toolset = 1,
		/obj/item/organ/internal/cyberimp/brain/anti_drop = 1,
		/obj/item/reagent_containers/cup/bottle/potion/flight = 1,
		//fluff
		/obj/item/storage/backpack/duffelbag/clown/syndie = 1,
	)
