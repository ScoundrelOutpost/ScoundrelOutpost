/obj/projectile/energy/minislug
	name = "laser minislug"
	icon_state = "infernoshot"
	damage = 1
	damage_type = BURN
	armor_flag = LASER
	wound_bonus = 0
	bare_wound_bonus = 10
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser

/obj/projectile/energy/nonlethal_minislug
	name = "energy minislug"
	icon_state = "cryoshot"
	damage = 1
	damage_type = STAMINA
	armor_flag = ENERGY
	hitsound = 'sound/weapons/tap.ogg'
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser

/obj/projectile/energy/minislug/surplus
	name = "low-yield minislug"
	damage = 0.6
