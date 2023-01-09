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

/datum/supply_pack/security/protected/personal_shields
	name = "Bulk Civilian Shields"
	desc = "A crate containing 3 civilian-grade personal shield-emitters, provided by the JX Corporation. Requires bridge access to open."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/personalshield/standard = 3)
	crate_name = "civilian shield crate"

/datum/supply_pack/security/protected/personal_shields_advanced
	name = "Bulk Advanced Shields"
	desc = "A crate containing 3 advanced personal shield-emitters, provided by the JX Corporation. Requires bridge access to open."
	cost = CARGO_CRATE_VALUE * 22
	contains = list(/obj/item/personalshield/standard/advanced = 3)
	crate_name = "advanced shield crate"

// goodies
/datum/supply_pack/security/basic_armor
	name = "(Single) Personal Armor Pack"
	desc = "Your vital organs might be in danger. This armor pack contains a general-protection armor vest and helmet, for protecting \
	the important parts."
	cost = CARGO_CRATE_VALUE * 6
	contains = list(/obj/item/clothing/suit/armor/vest,
	/obj/item/clothing/head/helmet/scoundrel,)
	goody = TRUE

/datum/supply_pack/security/personal_shield
	name = "(Single) Civilian Shield-Emitter"
	desc = "No one's in a good position being vulnerable to high-speed projectiles. You need a JX Co. personal shield-emitter to protect your body."
	cost = CARGO_CRATE_VALUE * 2
	contains = list(/obj/item/personalshield/standard)
	goody = TRUE

/datum/supply_pack/security/personal_shield_advanced
	name = "(Single) Advanced Shield-Emitter"
	desc = "VIPs need not worry about encasing themselves in unbecoming power armor, JX Co. has you covered. This enhanced, efficient and \
	stylish shield-emitter is ideal for protecting the stellar community's elite."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/personalshield/standard/advanced)
	goody = TRUE
