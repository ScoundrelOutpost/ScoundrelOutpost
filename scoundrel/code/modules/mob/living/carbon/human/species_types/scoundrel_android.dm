/datum/species/scoundrel_android
	name = "Posiform"
	id = SPECIES_SCOUNDREL_ANDROID
	say_mod = "states"
	species_traits = list(NOBLOOD, NO_DNA_COPY, NOTRANSSTING, NOSTOMACH)
	inherent_traits = list(
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_GENELESS,
		TRAIT_NOBREATH,
		TRAIT_NOCLONELOSS,
		TRAIT_NOFIRE,
		TRAIT_NOHUNGER,
		TRAIT_NOMETABOLISM,
		TRAIT_PIERCEIMMUNE,
		TRAIT_RADIMMUNE,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_TOXIMMUNE,
		TRAIT_XENO_IMMUNE,
	)
	brute_damage_desc = ROBOTIC_BRUTE_EXAMINE_TEXT
	burn_damage_desc = ROBOTIC_BURN_EXAMINE_TEXT
	burnmod = 1.2
	heatmod = 2

	sexes = FALSE

	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	meat = /obj/item/stack/rods/ten
	mutanttongue = /obj/item/organ/internal/tongue/robot

	wings_icons = list("Robotic")
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/robot,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/robot,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/robot/surplus,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/robot/surplus,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/robot/surplus,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/robot/surplus,
	)
	examine_limb_id = SPECIES_HUMAN

/datum/species/scoundrel_android/on_species_gain(mob/living/carbon/C)
	. = ..()
	// Androids don't eat, hunger or metabolise foods. Let's do some cleanup.
	C.set_safe_hunger_level()
