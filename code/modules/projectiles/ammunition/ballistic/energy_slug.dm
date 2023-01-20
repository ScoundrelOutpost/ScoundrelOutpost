// Energy Slugs (Energy Derringer)

/obj/item/ammo_casing/minislug
	name = "laser minislug"
	desc = "A laser minislug capacitor."
	icon_state = "laser_small"
	caliber = CALIBER_MINISLUG
	projectile_type = /obj/projectile/energy/minislug

/obj/item/ammo_casing/minislug/nonlethal
	name = "energy minislug"
	desc = "An energy minislug capacitor."
	icon_state = "energy_small"
	caliber = CALIBER_MINISLUG
	projectile_type = /obj/projectile/energy/nonlethal_minislug

/obj/item/ammo_casing/minislug/surplus
	name = "low-yield minislug"
	desc = "A low-yield laser minislug capacitor."
	projectile_type = /obj/projectile/energy/minislug/surplus
