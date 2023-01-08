/datum/supply_pack/security
	group = "Security"
	crate_type = /obj/structure/closet/crate/secure/gear


/datum/supply_pack/security/recharger
	name = "Recharger Crate"
	desc = "A crate containing 3 basic rechargers, for replenishing power-based weapons and tools."
	cost = CARGO_CRATE_VALUE * 5
	contains = list(/obj/machinery/recharger/unanchored = 3,
	/obj/item/wrench = 1,)
	crate_name = "recharger crate"
	
// protected
/datum/supply_pack/security/protected
	access = ACCESS_COMMAND

/datum/supply_pack/security/protected/basic_armor
	name = "Bulk Armor Pack"
	desc = "A crate containing 3 general-protection armor vests and helmets. Requires bridge access to open."
	cost = CARGO_CRATE_VALUE * 16
	contains = list(/obj/item/clothing/suit/armor/vest = 3,
	/obj/item/clothing/head/helmet/scoundrel = 3,)
	crate_name = "armor crate"

// goodies
/datum/supply_pack/security/basic_armor
	name = "(Single) Personal Armor Pack"
	desc = "Your vital organs might be in danger. This armor pack contains a general-protection armor vest and helmet, for protecting \
	the important parts."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/clothing/suit/armor/vest,
	/obj/item/clothing/head/helmet/scoundrel,)
	goody = TRUE
