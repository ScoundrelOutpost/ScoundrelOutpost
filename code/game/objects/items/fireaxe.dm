/*
 * Fireaxe
 */
/obj/item/fireaxe  // DEM AXES MAN, marker -Agouri
	icon = 'icons/obj/weapons/fireaxe.dmi'
	icon_state = "fireaxe0"
	base_icon_state = "fireaxe"
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	name = "fire axe"
	desc = "Truly, the weapon of a madman. Who would think to fight fire with an axe?"
	force = 12
	throwforce = 15
	demolition_mod = 1.25
	w_class = WEIGHT_CLASS_BULKY
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	attack_verb_continuous = list("attacks", "chops", "cleaves", "tears", "lacerates", "cuts")
	attack_verb_simple = list("attack", "chop", "cleave", "tear", "lacerate", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 100, ACID = 30)
	resistance_flags = FIRE_PROOF
	wound_bonus = -15
	bare_wound_bonus = 20
	/// How much damage to do unwielded
	var/force_unwielded = 12
	/// How much damage to do wielded
	var/force_wielded = 18

/obj/item/fireaxe/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/butchering, \
		speed = 10 SECONDS, \
		effectiveness = 80, \
		bonus_modifier = 0 , \
		butcher_sound = hitsound, \
	)
	//axes are not known for being precision butchering tools
	AddComponent(/datum/component/two_handed, force_unwielded=force_unwielded, force_wielded=force_wielded, icon_wielded="[base_icon_state]1")

/obj/item/fireaxe/update_icon_state()
	icon_state = "[base_icon_state]0"
	return ..()

/obj/item/fireaxe/suicide_act(mob/living/user)
	user.visible_message(span_suicide("[user] axes [user.p_them()]self from head to toe! It looks like [user.p_theyre()] trying to commit suicide!"))
	return BRUTELOSS

/obj/item/fireaxe/afterattack(atom/A, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(HAS_TRAIT(src, TRAIT_WIELDED)) //destroys windows and grilles in one hit
		if(istype(A, /obj/structure/window) || istype(A, /obj/structure/grille))
			var/obj/structure/W = A
			var/base_damage = force * demolition_mod
			// if a third of the atom's max_integrity is greater than the damage the axe deals normally
			if(W.max_integrity / 3 > base_damage)
				// find the difference between a third of the atom's max_integrity and the axe's base damage
				var/additive_damage = round((W.max_integrity / 3) - base_damage) + 1
				// so it deals an amount cumulative to a third of the atom's max_integrity
				W.take_damage(additive_damage)
				// in effect, it will always deal at least a third of a window's max health per hit

/*
 * Bone Axe
 */
/obj/item/fireaxe/boneaxe  // Blatant imitation of the fireaxe, but made out of bone.
	icon_state = "bone_axe0"
	base_icon_state = "bone_axe"
	name = "bone axe"
	desc = "A large, vicious axe crafted out of several sharpened bone plates and crudely tied together. Made of monsters, by killing monsters, for killing monsters."
	force_unwielded = 12
	force_wielded = 20

/*
 * Metal Hydrogen Axe
 */
/obj/item/fireaxe/metal_h2_axe
	icon_state = "metalh2_axe0"
	base_icon_state = "metalh2_axe"
	name = "metallic hydrogen axe"
	desc = "A lightweight crowbar with an extreme sharp fire axe head attached. It trades it's hefty as a weapon by making it easier to carry around when holstered to suits without having to sacrifice your backpack."
	force_unwielded = 12
	force_wielded = 22
	demolition_mod = 2
	tool_behaviour = TOOL_CROWBAR
	toolspeed = 1
