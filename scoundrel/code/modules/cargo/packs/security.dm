/datum/supply_pack/security
	group = "Security"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/security/basic_armor
	name = "Personal Armor Pack"
	desc = "desc pending"
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/item/clothing/suit/armor/vest,
	/obj/item/clothing/head/helmet/sec,)
	goody = TRUE

/datum/supply_pack/security/protected
	access = ACCESS_COMMAND

/datum/supply_pack/security/protected/basic_armor
	name = "Armor Crate"
	desc = "desc pending. Requires bridge access to open."
	cost = CARGO_CRATE_VALUE * 15
	contains = list(/obj/item/clothing/suit/armor/vest = 3,
	/obj/item/clothing/head/helmet/sec = 3,)
	crate_name = "armor crate"
