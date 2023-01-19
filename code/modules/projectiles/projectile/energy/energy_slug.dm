/obj/projectile/energy/slug
	name = "lethal energy slug"
	icon_state = "infernoshot"
	damage = 1
	damage_type = BURN
	armor_flag = ENERGY
	wound_bonus = 0
	bare_wound_bonus = 10
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser

/obj/projectile/energy/nl_slug
	name = "nonlethal energy slug"
	icon_state = "cryoshot"
	damage = 1
	damage_type = STAMINA
	armor_flag = ENERGY
	hitsound = 'sound/weapons/tap.ogg'
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
