/datum/species/scoundrel_android
	name = "Cyberform"
	id = SPECIES_SCOUNDREL_ANDROID
	say_mod = "states"
	species_traits = list(NO_DNA_COPY, EYECOLOR, NOTRANSSTING, HAIR, HAS_BONE, HAS_FLESH)
	inherent_traits = list(
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_GENELESS,
		TRAIT_XENO_IMMUNE,
		TRAIT_VIRUSIMMUNE,
//		TRAIT_NOCLONELOSS, doesn't do anything
	)
	brute_damage_desc = ROBOTIC_BRUTE_EXAMINE_TEXT
	burn_damage_desc = ROBOTIC_BURN_EXAMINE_TEXT
	heatmod = 2.5

	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID

	exotic_blood = /datum/reagent/fuel/oil

	meat = /obj/item/stack/rods/ten
	mutanttongue = /obj/item/organ/internal/tongue/robot
	mutantlungs = /obj/item/organ/internal/lungs/cybernetic
	mutantstomach = /obj/item/organ/internal/stomach/cybernetic
	mutantheart = /obj/item/organ/internal/heart/cybernetic
	mutanteyes = /obj/item/organ/internal/eyes/robotic/basic/nocolor
	mutantears = /obj/item/organ/internal/ears/cybernetic
	mutantliver = /obj/item/organ/internal/liver/cybernetic
	mutantbrain = /obj/item/organ/internal/brain/scoundrel_android

	death_sound = 'sound/voice/borg_deathsound.ogg'

	wings_icons = list("Robotic")
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT

	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/robot,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/robot,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/robot,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/robot,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/robot,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/robot,
	)
	examine_limb_id = SPECIES_HUMAN

/datum/species/scoundrel_android/get_scream_sound(mob/living/carbon/human/scoundrel_android)
	return pick(
		'sound/machines/boltsdown.ogg',
		'sound/machines/boltsup.ogg',
		'sound/machines/buzz-two.ogg',
	)

/datum/species/scoundrel_android/random_name(gender,unique,lastname)
	
	var/new_name
	var/randname
	new_name = pick(GLOB.posibrain_names)
	randname = "[new_name]-[rand(100, 999)]"

	return randname

// fluff

/datum/species/scoundrel_android/get_species_description()
	return "Cyberforms are advanced robotic-Humanoids owing their intelligence to strange technology."

/datum/species/scoundrel_android/get_species_lore()
	return list(
		"There are many theories to the origin of the Cyberform brain. While feasible to replicate, the true nature of its' machinations are \
		barely understood. It can be inferred from the details of their circuitry that they're incredibly complex, although the chassis \
		a Cyberform inhabits seldom shares that in common.",

		"Due to the affordability of its' production and infantile AI-rights protections, Cyberforms often live their entire lives in shoddy, disposable shells \
		as corporate workforces. Despite efforts to alienate the machine from means of self-expression, Cyberforms exhibit exceptional intelligence and \
		a broad capacity for human-empathy.",

		"Many Cyberforms in more comfortable circumstances wear synthetic-hair attachments as a form of self-expression and social conformity. \
		You shouldn't ask them about it. It's rude."
	)

/datum/species/scoundrel_android/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		/*
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "wind",
			SPECIES_PERK_NAME = "Spaceproof",
			SPECIES_PERK_DESC = "Cyberforms are immune to hazardous atmospheric pressures, and do not need to breathe.",
		),
		*/
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "user-shield",
			SPECIES_PERK_NAME = "Inorganic",
			SPECIES_PERK_DESC = "Cyberforms are unaffected by viruses.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "bone",
			SPECIES_PERK_NAME = "Wound Immunity",
			SPECIES_PERK_DESC = "Cyberforms cannot ordinarily be wounded or dismembered in combat.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "wrench",
			SPECIES_PERK_NAME = "Modular Components",
			SPECIES_PERK_DESC = "Cyberforms are capable of easily modifying themselves through robotic self-surgery.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "wrench",
			SPECIES_PERK_NAME = "Low-Quality Components",
			SPECIES_PERK_DESC = "This particular chassis has some low-quality components that don't work as well as standard organs.",
		),
		/*
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "hard-hat",
			SPECIES_PERK_NAME = "Slow Servos",
			SPECIES_PERK_DESC = "Cyberforms tend to be a little slower getting around than most humanoids.",
		),
		*/
	)

	return to_add
