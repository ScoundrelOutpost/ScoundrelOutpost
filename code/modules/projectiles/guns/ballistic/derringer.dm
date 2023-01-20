/obj/item/gun/ballistic/derringer
	name = "\improper derringer pistol"
	desc = "A compact, potent derringer pistol. Uses .357 ammo."
	icon_state = "derringer"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/derringer
	fire_sound = 'sound/weapons/gun/revolver/shot_alt.ogg'
	load_sound = 'sound/weapons/gun/revolver/load_bullet.ogg'
	eject_sound = 'sound/weapons/gun/revolver/empty.ogg'
	fire_sound_volume = 50
	dry_fire_sound = 'sound/weapons/gun/revolver/dry_fire.ogg'
	casing_ejector = FALSE
	internal_magazine = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	tac_reloads = FALSE
	projectile_damage_multiplier = 45

	item_flags = NEEDS_PERMIT|EXAMINE_SKIP // stealthy
	pickup_sound = null // still stealthy
	inhand_icon_state = null // stealth

/obj/item/gun/ballistic/derringer/energy
	name = "executive pistol"
	desc = "A compact personal defense weapon with an exotic firing mechanism and some old-fashioned flare. \
	JX-EXECUTIVE is engraved on the barrel."
	icon_state = "e_derringer2"
	mag_type = /obj/item/ammo_box/magazine/internal/derringer/energy
	fire_sound = 'sound/scoundrel/weapons/ederringer.ogg'
