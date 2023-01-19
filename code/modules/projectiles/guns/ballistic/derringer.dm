/obj/item/gun/ballistic/derringer
	name = "\improper derringer pistol"
	desc = "A small derringer pistol. Uses .357 ammo."
	icon_state = "derringer"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/derringer
	fire_sound = 'sound/weapons/gun/revolver/shot_alt.ogg'
	load_sound = 'sound/weapons/gun/revolver/load_bullet.ogg'
	eject_sound = 'sound/weapons/gun/revolver/empty.ogg'
	fire_sound_volume = 90
	dry_fire_sound = 'sound/weapons/gun/revolver/dry_fire.ogg'
	casing_ejector = FALSE
	internal_magazine = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	tac_reloads = FALSE
	projectile_damage_multiplier = 45

/obj/item/gun/ballistic/derringer/energy
	name = "\improper energy derringer pistol"
	desc = "An advanced energy derringer pistol. Uses energy slugs."
	icon_state = "derringer"
	mag_type = /obj/item/ammo_box/magazine/internal/derringer/energy
	fire_sound = 'sound/weapons/thermalpistol.ogg'
