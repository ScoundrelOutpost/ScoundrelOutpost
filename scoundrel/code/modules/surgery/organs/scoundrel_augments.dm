/obj/item/organ/internal/cyberimp/arm/dualmodesword
	name = "Dual-Mode Energy Blade"
	desc = "A surgically attached, extending energy blade."
	icon = 'scoundrel/icons/obj/weapons/transforming_melee.dmi'
	icon_state = "dualmodesword_dead"
	extend_sound = 'sound/scoundrel/weapons/energy_unsheathe.ogg'
	retract_sound = 'sound/scoundrel/weapons/energy_sheathe.ogg'

	items_to_create = list(/obj/item/melee/tonfa/dualmodesword)

/obj/item/organ/internal/cyberimp/arm/dualmodesword/left
	zone = BODY_ZONE_L_ARM

/obj/item/melee/tonfa/dualmodesword
	name = "\improper Elite Energy Blade"
	desc = "An advanced energy blade outfitted with two modes; stun and kill."
	icon = 'scoundrel/icons/obj/weapons/transforming_melee.dmi'
	icon_state = "dualmodesword"
	hitsound = 'sound/scoundrel/weapons/energy_sword_swing1.ogg'
	inhand_icon_state = "dualmodesword"
	inhand_x_dimension = 64
	inhand_y_dimension = 64
//	worn_icon_state = null
	lefthand_file = 'scoundrel/icons/mob/inhands/64x64_weapons_left.dmi'
	righthand_file = 'scoundrel/icons/mob/inhands/64x64_weapons_right.dmi'
	slot_flags = null

	w_class = WEIGHT_CLASS_BULKY

	damtype = STAMINA
	force = 22
	throwforce = 25
	w_class = WEIGHT_CLASS_BULKY
	armour_penetration = 20

	///Determines our active effects
	active_w_class = WEIGHT_CLASS_BULKY

	active_force = 18
	active_damage_type = BRUTE
	active_sharpness = SHARP_EDGED
	active_hit_sound = 'sound/scoundrel/weapons/energy_sword_swing3.ogg'
	active_throwforce = 25
	active_verb_continuous = list("tests")
	active_verb_simple = list("test")
	activate_sound = 'sound/scoundrel/weapons/energy_switch.ogg'
	activate_sound_volume = 100
	activate_balloon = FALSE

/obj/item/melee/tonfa/dualmodesword/add_blood_DNA(list/blood_dna)
	return FALSE



/obj/item/organ/internal/cyberimp/arm/dualmodesword/captain
	name = "Akhune"
	desc = "An exotic, extendible cybernetic energy blade subdermally attached to the arm. \
	A collector would kill for this."

	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF //steal objective items are hard to destroy.

	items_to_create = list(/obj/item/melee/tonfa/dualmodesword/captain)

/obj/item/organ/internal/cyberimp/arm/dualmodesword/captain/left
	zone = BODY_ZONE_L_ARM

/obj/item/melee/tonfa/dualmodesword/captain
	name = "Akhune"
	desc = "An elite energy blade outfitted with two modes; disable and kill. \
	This exotic model is exceedingly rare and often sought by high-ranking officers and opulent-rich collectors. \
	It looks exceptionally well-maintained at that."

	obj_flags = UNIQUE_RENAME
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF //steal objective items are hard to destroy.
