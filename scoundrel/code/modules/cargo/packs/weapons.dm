/datum/supply_pack/weapons
	group = "Weapons"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/weapons/single
	goody = TRUE

/datum/supply_pack/weapons/thermal_pistols
	name = "Thermal Pistol Crate"
	desc = "Contains a pair of holsters each with two experimental thermal pistols, \
		using nanites as the basis for their ammo."
	cost = CARGO_CRATE_VALUE * 24
	contains = list(/obj/item/storage/belt/holster/thermal = 2)
	crate_name = "thermal pistol crate"

/datum/supply_pack/weapons/defender_pistols
	name = "Bulk Defender Pistols"
	desc = "Contains three frontier-tested defender pistols."
	cost = CARGO_CRATE_VALUE * 12
	contains = list(/obj/item/gun/energy/e_gun/defender = 3)
	crate_name = "defender pistol crate"

// goodies
/datum/supply_pack/weapons/single/defender_pistol
	name = "Single Defender Pistol"
	desc = "Lose your piece? Get yourself back up to speed."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/gun/energy/e_gun/defender = 1)
	goody = TRUE

/datum/supply_pack/weapons/single/defender_pistol_mini
	name = "Single Mini-Defender Pistol"
	desc = "Lose your piece? Get yourself back up to speed."
	cost = CARGO_CRATE_VALUE * 6.5
	contains = list(/obj/item/gun/energy/e_gun/defender/mini = 1)
	goody = TRUE

/datum/supply_pack/weapons/single/doublebarrel_shotgun
	name = "Single Double-Barreled Shotgun"
	desc = "Lose your piece? Get yourself back up to speed."
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/gun/ballistic/shotgun/doublebarrel = 1)
	goody = TRUE

/datum/supply_pack/weapons/secure
	access = ACCESS_COMMAND
