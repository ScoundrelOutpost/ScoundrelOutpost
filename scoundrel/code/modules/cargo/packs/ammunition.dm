/datum/supply_pack/ammunition
	group = "Ammunition"

/datum/supply_pack/ammunition/rubbershot
	name = "(Single) Rubbershot Pack"
	desc = "A single box of 7 rubbershot shotgun shells."
	cost = CARGO_CRATE_VALUE * 1
	contains = list(/obj/item/storage/box/rubbershot )
	goody = TRUE

/datum/supply_pack/ammunition/surplus_9mm_magazine
	name = "(Single) Surplus 9mm Magazine"
	desc = "A magazine of surplus 9mm ammunition. It's hard to find military-grade ammo on the open market, settle for less!"
	cost = CARGO_CRATE_VALUE * 1
	contains = list(/obj/item/ammo_box/magazine/m9mm/surplus,)
	goody = TRUE

/datum/supply_pack/ammunition/surplus_9mm_box
	name = "(Single) Surplus 9mm Box"
	desc = "A box of 30 surplus 9mm bullets. It's hard to find military-grade ammo on the open market, settle for less!"
	cost = CARGO_CRATE_VALUE * 1.5
	contains = list(/obj/item/ammo_box/c9mm/surplus,)
	goody = TRUE
