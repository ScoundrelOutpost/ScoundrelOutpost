// scoundrel content
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
