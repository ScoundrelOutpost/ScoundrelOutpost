/obj/effect/mob_spawn/ghost_role/human/printed_android
	name = "inactive posiform shell"
	icon = 'icons/effects/blood.dmi'
	icon_state = "remains"
//	mob_name = "skeleton"
	prompt_name = "robotic humanoid"
	mob_species = /datum/species/scoundrel_android
	you_are_text = "By unknown powers, your skeletal remains have been reanimated!"
	flavour_text = "Walk this mortal plane and terrorize all living adventurers who dare cross your path."
	spawner_job_path = /datum/job/printed_android

/obj/effect/mob_spawn/ghost_role/human/printed_android/special(mob/living/new_spawn)
	. = ..()
	var/new_name
	new_name = pick(GLOB.posibrain_names)
	name = "[new_name]-[rand(100, 999)]"
