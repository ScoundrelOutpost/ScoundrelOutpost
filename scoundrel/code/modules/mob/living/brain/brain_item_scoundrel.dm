// all the code here is derived from posibrains, look there for more
/obj/item/organ/internal/brain/cyberbrain
	name = "Cyber Brain"
	desc = "some1 forgot to set a description"
	organ_traits = list(TRAIT_ADVANCEDTOOLUSER, TRAIT_CAN_STRIP)
	var/posibrain_job_path = /datum/job/positronic_brain
	var/list/ckeys_entered = list()
	var/ask_role = ""
	///Delay after polling ghosts
	var/ask_delay = 60 SECONDS
	var/list/possible_names
	var/mecha = FALSE
	///Message sent as a visible message on success
	var/success_message = "<span class='notice'>The silicon brain pings, and its lights start flashing. Success!</span>"
	///Message sent as a visible message on failure
	var/fail_message = "<span class='notice'>Something went wrong with the silicon brain...</span>"

/obj/item/organ/internal/brain/cyberbrain/proc/set_brainmob(mob/living/brain/new_brainmob)
	if(brainmob == new_brainmob)
		return FALSE
	. = brainmob
	SEND_SIGNAL(src, COMSIG_MMI_SET_BRAINMOB, new_brainmob)
	brainmob = new_brainmob

/obj/item/organ/internal/brain/cyberbrain/Topic(href, href_list)
	if(href_list["activate"])
		var/mob/dead/observer/ghost = usr
		if(istype(ghost))
			activate(ghost)


///Notify ghosts that the posibrain is up for grabs
/obj/item/organ/internal/brain/cyberbrain/proc/ping_ghosts(msg, newlymade)
	if(newlymade || GLOB.posibrain_notify_cooldown <= world.time)
		notify_ghosts("[name] [msg] in [get_area(src)]!", ghost_sound = !newlymade ? 'sound/effects/ghost2.ogg':null, notify_volume = 75, enter_link = "<a href=?src=[REF(src)];activate=1>(Click to enter)</a>", source = src, action = NOTIFY_ATTACK, flashwindow = FALSE, ignore_key = POLL_IGNORE_POSIBRAIN, notify_suiciders = FALSE)
		if(!newlymade)
			GLOB.posibrain_notify_cooldown = world.time + ask_delay


/obj/item/organ/internal/brain/cyberbrain/attack_ghost(mob/user)
	activate(user)

/obj/item/organ/internal/brain/cyberbrain/proc/is_occupied()
	if(brainmob.key)
		return TRUE
	return FALSE

/obj/item/organ/internal/brain/cyberbrain/proc/activate(mob/user)
	to_chat(user, span_warning("Entering attempt made"))
		
	if(QDELETED(brainmob))
		return
	to_chat(user, span_warning("qdeleted check success"))

	if(is_occupied() || is_banned_from(user.ckey, ROLE_POSIBRAIN) || QDELETED(brainmob) || QDELETED(src) || QDELETED(user))
		return
	to_chat(user, span_warning("is occcupied check success"))

	if(user.suiciding) //if they suicided, they're out forever.
		to_chat(user, span_warning("[src] fizzles slightly. Sadly it doesn't take those who suicided!"))
		return
	to_chat(user, span_warning("suicide check success"))

	var/posi_ask = tgui_alert(user, "Become a [name]? (Warning, You can no longer be revived, and all past lives will be forgotten!)", "Confirm", list("Yes","No"))
	if(posi_ask != "Yes" || QDELETED(src))
		return
	to_chat(user, span_warning("ui check success"))

	if(brainmob.suiciding) //clear suicide status if the old occupant suicided.
		brainmob.set_suicide(FALSE)
	to_chat(user, span_warning("attempting transfer"))

	transfer_personality(user)

/obj/item/organ/internal/brain/cyberbrain/transfer_identity(mob/living/carbon/transfered_user)
	name = "[initial(name)] ([transfered_user])"
	brainmob.name = transfered_user.real_name
	brainmob.real_name = transfered_user.real_name
	if(transfered_user.has_dna())
		if(!brainmob.stored_dna)
			brainmob.stored_dna = new /datum/dna/stored(brainmob)
		transfered_user.dna.copy_dna(brainmob.stored_dna)
	brainmob.timeofhostdeath = transfered_user.timeofdeath
	brainmob.set_stat(CONSCIOUS)
	if(brainmob.mind)
		brainmob.mind.set_assigned_role(SSjob.GetJobType(posibrain_job_path))
	if(transfered_user.mind)
		transfered_user.mind.transfer_to(brainmob)

	brainmob.mind.remove_all_antag_datums()
	brainmob.mind.wipe_memory()
	update_appearance()

/obj/item/organ/internal/brain/cyberbrain/proc/transfer_personality(mob/candidate)
	to_chat(candidate, span_warning("transfer_personality initiated"))
	if(QDELETED(brainmob))
		return
	if(is_occupied()) //Prevents hostile takeover if two ghosts get the prompt or link for the same brain.
		to_chat(candidate, span_warning("This [name] was taken over before you could get to it! Perhaps it might be available later?"))
		return FALSE
	if(candidate.mind && !isobserver(candidate))
		candidate.mind.transfer_to(brainmob)
	else
		brainmob.ckey = candidate.ckey
	name = "[initial(name)] ([brainmob.name])"
	var/policy = get_policy(ROLE_POSIBRAIN)
	if(policy)
		to_chat(brainmob, policy)
	brainmob.mind.set_assigned_role(SSjob.GetJobType(posibrain_job_path))
	brainmob.set_stat(CONSCIOUS)

	check_success()
	ckeys_entered |= brainmob.ckey
	return TRUE


/obj/item/organ/internal/brain/cyberbrain/Initialize(mapload, autoping = TRUE)
	. = ..()
	set_brainmob(new /mob/living/brain(src))
	var/new_name
	if(!LAZYLEN(possible_names))
		new_name = pick(GLOB.posibrain_names)
	else
		new_name = pick(possible_names)
	brainmob.name = "[new_name]-[rand(100, 999)]"
	brainmob.real_name = brainmob.name
	brainmob.forceMove(src)
	brainmob.container = src
	if(autoping)
		ping_ghosts("created", TRUE)


/obj/item/organ/internal/brain/cyberbrain/proc/check_success()
	if(QDELETED(brainmob))
		return
	if(brainmob.client)
		visible_message(success_message)
		playsound(src, 'sound/machines/ping.ogg', 15, TRUE)
	else
		visible_message(fail_message)
