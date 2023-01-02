/datum/supply_pack/weapons
	group = "Weapons"
	crate_type = /obj/structure/closet/crate/secure/gear

// requires access to open
/datum/supply_pack/weapons/protected
	access = ACCESS_COMMAND

/datum/supply_pack/weapons/single
	goody = TRUE

/datum/supply_pack/weapons/protected/thermal_pistols
	name = "Thermal Pistol Crate"
	desc = "Contains a pair of holsters each with two experimental thermal pistols, \
		using nanites as the basis for their ammo."
	cost = CARGO_CRATE_VALUE * 24
	contains = list(/obj/item/storage/belt/holster/thermal = 2)
	crate_name = "thermal pistol crate"

/datum/supply_pack/weapons/protected/defender_pistols
	name = "Bulk Defender Pistols"
	desc = "Contains three frontier-tested defender pistols."
	cost = CARGO_CRATE_VALUE * 12
	contains = list(/obj/item/gun/energy/e_gun/defender = 3)
	crate_name = "defender pistol crate"

/datum/supply_pack/weapons/protected/bolaboxes
	name = "Bulk Bolas"
	desc = "Three boxes of hunting bolas - the low-tech bounty hunter's solution."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/storage/box/bolas = 3)
	crate_name = "bulk bola crate"

// goodies
/datum/supply_pack/weapons/single/defender_pistol
	name = "(Single) Defender Pistol"
	desc = "Lose your piece? Get yourself back up to speed."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/gun/energy/e_gun/defender = 1)
	goody = TRUE

/datum/supply_pack/weapons/single/defender_pistol_mini
	name = "(Single) Mini-Defender Pistol"
	desc = "A compact version of the defender, easier to conceal and carry around."
	cost = CARGO_CRATE_VALUE * 6.5
	contains = list(/obj/item/gun/energy/e_gun/defender/mini = 1)
	goody = TRUE

/datum/supply_pack/weapons/single/doublebarrel_shotgun
	name = "(Single) Double-Barreled Shotgun"
	desc = "Self-defense? We just like the recoil. Does not come with extra shells!"
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/gun/ballistic/shotgun/doublebarrel = 1)
	goody = TRUE

/datum/supply_pack/weapons/single/agentpistol
	name = "(Single) Agent Pistol"
	desc = "A sleek yet simple, compact 9mm pistol. Favored by field operatives. Does not come with ammunition!"
	cost = CARGO_CRATE_VALUE * 7
	contains = list(/obj/item/gun/ballistic/automatic/pistol/empty = 1)
	goody = TRUE
	contraband = TRUE

/datum/supply_pack/weapons/single/sniper
	name = "(Single) .50 Sniper Rifle"
	desc = "A high-caliber, long-range anti-materiel rifle, for piercing through hulls and eliminating priority targets. \
	They won't know what hit 'em. Does not come with ammunition!"
	cost = CARGO_CRATE_VALUE * 20
	contains = list(/obj/item/gun/ballistic/automatic/sniper_rifle/empty = 1)
	goody = TRUE
	contraband = TRUE

/datum/supply_pack/weapons/single/suppressor
	name = "(Single) Universal Suppressor"
	desc = "A cheap suppressor that fits most standard ballistic guns."
	cost = CARGO_CRATE_VALUE * 1
	contains = list(/obj/item/suppressor = 1)
	goody = TRUE
	contraband = TRUE

/datum/supply_pack/weapons/single/bolabox
	name = "(Single) Box of Bolas"
	desc = "A single box of hunting bolas, for decoration or personal use."
	cost = CARGO_CRATE_VALUE * 1
	contains = list(/obj/item/storage/box/bolas = 1)
	goody = TRUE

/datum/supply_pack/weapons/secure
	access = ACCESS_COMMAND
