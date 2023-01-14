// .45 (M1911 & C20r)

/obj/projectile/bullet/c45
	name = ".45 bullet"
	damage = 1

/obj/projectile/bullet/c45/ap
	name = ".45 armor-piercing bullet"
	damage = 0.9
	armour_penetration = 50

/obj/projectile/bullet/incendiary/c45
	name = ".45 incendiary bullet"
	damage = 0.7
	fire_stacks = 2

// 4.6x30mm (Autorifles)

/obj/projectile/bullet/c46x30mm
	name = "4.6x30mm bullet"
	damage = 1
	embed_falloff_tile = -4

/obj/projectile/bullet/c46x30mm/ap
	name = "4.6x30mm armor-piercing bullet"
	damage = 0.9
	armour_penetration = 40
	embedding = null

/obj/projectile/bullet/incendiary/c46x30mm
	name = "4.6x30mm incendiary bullet"
	damage = 0.7
	fire_stacks = 1

/obj/projectile/bullet/c46x30mm/surplus
	name = "surplus 4.6x30mm bullet"
	damage = 0.6
