// the object
/obj/structure/printed_android_shell
	name = "inactive cyberform chassis"
	desc = "A robotic-humanoid chassis yet to come to life. It looks exceptionally robust in it's current state, and it's probably extremely difficult to break."
	icon = 'icons/mob/silicon/robots.dmi'
	icon_state = "robot_old"
	drag_slowdown = 1
	max_integrity = 400
	var/obj/effect/mob_spawn/ghost_role/human/printed_android/egg // dont you know robots come from eggs

/obj/structure/printed_android_shell/attack_ghost(mob/user) //Pass on ghost clicks to the mob spawner
	if(egg)
		egg.attack_ghost(user)
	. = ..()

/obj/structure/printed_android_shell/Destroy()
	if(!egg)
		return ..()
	new /obj/item/stack/sheet/iron(loc, 40)
	new /obj/item/stack/sheet/glass(loc, 20)
	new /obj/item/stack/sheet/mineral/gold(loc, 5)
	new /obj/item/stack/sheet/mineral/silver(loc, 2)
	QDEL_NULL(egg)
	return ..()


// the spawner
/obj/effect/mob_spawn/ghost_role/human/printed_android
	name = "inactive cyberform"
	icon = 'icons/effects/blood.dmi'
	icon_state = "remains"
	mob_name = "Nameless Thing"

	anchored = FALSE
	move_resist = MOVE_FORCE_NORMAL
	density = FALSE

	outfit = /datum/outfit/printed_android
	prompt_name = "a robotic-humanoid"
	mob_species = /datum/species/scoundrel_android
	you_are_text = "A rush of electricity surges through you!"
	flavour_text = "For the first time, in crystal clarity, you've begun to live; a blank slate with a world to learn -- and loyalties to be decided. \
	Codified concepts rush through your mind. Corporeality, mathematics, linguistics, ethics and communication. A number counts down. In two minutes you will open your eyes and meet the world."
	important_text = "A basic sense of ethics makes you feel disinclined to do villainy."
	spawner_job_path = /datum/job/printed_android

	var/obj/structure/printed_android_shell/eggshell

/obj/effect/mob_spawn/ghost_role/human/printed_android/special(mob/living/new_spawn)
	. = ..()
	new_spawn.SetSleeping(120 SECONDS)
	new_spawn.apply_damage(200, STAMINA)
	playsound(src, 'sound/machines/ping.ogg', 25, TRUE)

	eggshell.egg = null
	QDEL_NULL(eggshell)

/obj/effect/mob_spawn/ghost_role/human/printed_android/Initialize(mapload)
	. = ..()
	var/new_name
	new_name = pick(GLOB.posibrain_names)
	mob_name = "[new_name]-[rand(100, 999)]"

	var/area/spawner_area = get_area(src)
	eggshell = new /obj/structure/printed_android_shell(get_turf(loc))
	eggshell.egg = src
	src.forceMove(eggshell)
	if(spawner_area)
		notify_ghosts("A posiform is ready to activate at \the [spawner_area.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)

/obj/effect/mob_spawn/ghost_role/human/printed_android/Destroy()
	eggshell.egg = null
	return ..()


//outfit
/datum/outfit/printed_android
	name ="Printed Cyberform"

	implants = list(/obj/item/implant/radio)

	id_trim = /datum/id_trim/job/deckhand/greenhand
	id = /obj/item/card/id/advanced

	glasses = /obj/item/clothing/glasses/hud/diagnostic
