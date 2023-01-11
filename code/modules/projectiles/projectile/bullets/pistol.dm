// 9mm (Makarov and Stechkin APS)

/obj/projectile/bullet/c9mm
	name = "9mm bullet"
	damage = 1
	embedding = list(embed_chance=15, fall_chance=3, jostle_chance=4, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=5, jostle_pain_mult=6, rip_time=10)

/obj/projectile/bullet/c9mm/ap
	name = "9mm armor-piercing bullet"
	damage = 0.9
	armour_penetration = 40
	embedding = null
	shrapnel_type = null

/obj/projectile/bullet/c9mm/hp
	name = "9mm hollow-point bullet"
	damage = 1.2
	weak_against_armour = TRUE

/obj/projectile/bullet/incendiary/c9mm
	name = "9mm incendiary bullet"
	damage = 0.7
	fire_stacks = 2

// 10mm

/obj/projectile/bullet/c10mm
	name = "10mm bullet"
	damage = 1

/obj/projectile/bullet/c10mm/ap
	name = "10mm armor-piercing bullet"
	damage = 0.9
	armour_penetration = 40

/obj/projectile/bullet/c10mm/hp
	name = "10mm hollow-point bullet"
	damage = 1.2
	weak_against_armour = TRUE

/obj/projectile/bullet/incendiary/c10mm
	name = "10mm incendiary bullet"
	damage = 0.7
	fire_stacks = 2

// scoundrel content
/obj/projectile/bullet/c9mm/surplus
	damage = 0.6
