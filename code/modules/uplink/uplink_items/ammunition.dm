// File ordered by progression

/datum/uplink_category/ammo
	name = "Ammunition"
	weight = 7

/datum/uplink_item/ammo
	category = /datum/uplink_category/ammo
	surplus = 40

// No progression cost

/datum/uplink_item/ammo/toydarts
	name = "Box of Riot Darts"
	desc = "A box of 40 Donksoft riot darts, for reloading any compatible foam dart magazine. Don't forget to share!"
	item = /obj/item/ammo_box/foambox/riot
	cost = 10
	surplus = 0
	illegal_tech = FALSE
	purchasable_from = ~UPLINK_NUKE_OPS

// Low progression cost

/datum/uplink_item/ammo/pistol
	name = "9mm Handgun Ammo-Pouch"
	desc = "A pouch with three 8-round 9mm magazines, compatible with the Makarov pistol."
	item = /obj/item/storage/pouch/tactical/ammo_9mm
	cost = 10
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
	illegal_tech = FALSE

// Medium progression cost

/*/datum/uplink_item/ammo/pistolap
	name = "9mm Armour Piercing Magazine"
	desc = "An additional 8-round 9mm magazine, compatible with the Makarov pistol. \
			These rounds are less effective at injuring the target but penetrate protective gear."
	progression_minimum = 30 MINUTES
	item = /obj/item/ammo_box/magazine/m9mm/ap
	cost = 10
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)*/

/*/datum/uplink_item/ammo/pistolhp
	name = "9mm Hollow Point Magazine"
	desc = "An additional 8-round 9mm magazine, compatible with the Makarov pistol. \
			These rounds are more damaging but ineffective against armour."
	progression_minimum = 30 MINUTES
	item = /obj/item/ammo_box/magazine/m9mm/hp
	cost = 15
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)*/

/datum/uplink_item/ammo/pistolfire
	name = "9mm Incendiary Ammo-Pouch"
	desc = "A pouch with three 8-round 9mm magazines, compatible with the Makarov pistol. \
			Loaded with incendiary rounds which inflict little damage, but ignite the target."
	item = /obj/item/storage/pouch/tactical/ammo_9mm_fire
	cost = 15
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/ammo/revolver
	name = ".357 Speed Loader"
	desc = "A speed loader that contains seven additional .357 Magnum rounds; usable with the Syndicate revolver. \
			For when you really need a lot of things dead."
	progression_minimum = 30 MINUTES
	item = /obj/item/ammo_box/a357
	cost = 15
	purchasable_from = ~UPLINK_CLOWN_OPS
	illegal_tech = FALSE

/datum/uplink_item/ammo/laser_minislug
	name = "Laser Minislug Ammo-Pouch"
	desc = "A pouch filled with fourteen standard darkmatter-driven laser minislugs; for use with the Executive Pistol."
	item = /obj/item/storage/pouch/bullet/ammo_minislug
	cost = 5
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
	illegal_tech = FALSE

/datum/uplink_item/ammo/revolver_pouch
	name = ".357 Ammo-Pouch"
	desc = "A pouch filled with fourteen high-grade .357 bullets; usable with the Syndicate revolver. \
	Significantly more cost-efficient than speedloaders, but it takes a quick hand to load a revolver by hand in the middle of combat."
	item = /obj/item/storage/pouch/bullet/ammo_357
	cost = 5
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
	illegal_tech = FALSE
