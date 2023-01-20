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

/datum/supply_pack/ammunition/surplus_sniper_magazine
	name = "(Single) Surplus .50 Sniper Magazine"
	desc = "A magazine of surplus .50 Sniper ammunition. Won't pack as mean a punch as military-grade ammo, but good luck \
	finding that!"
	cost = CARGO_CRATE_VALUE * 3
	contains = list(/obj/item/ammo_box/magazine/sniper_rounds/surplus,)
	goody = TRUE
	contraband = TRUE

/datum/supply_pack/ammunition/surplus_autorifle_ammo
	name = "(Single) Surplus WT Autorifle Magazine"
	desc = "A magazine of surplus WT Autorifle rounds. Who needs quality when you've got quantity?"
	cost = CARGO_CRATE_VALUE * 1
	contains = list(/obj/item/ammo_box/magazine/wt550m9/surplus)
	goody = TRUE

/datum/supply_pack/ammunition/laser_minislug_pouch
	name = "(Single) Low-Yield Minislug Pouch"
	desc = "A pouch loaded with low-yield laser minislugs for use with low-caliber tech weapons."
	cost = CARGO_CRATE_VALUE * 1
	contains = list(/obj/item/storage/pouch/bullet/ammo_minislug_surplus)
	goody = TRUE
