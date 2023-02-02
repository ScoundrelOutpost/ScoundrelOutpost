/// Hardstun without knockdown
/datum/smite/hardstun
	name = "Induce Headache"
	var/is_painful = null
	var/scream = null
	var/duration = null

/datum/smite/hardstun/configure(client/user)
	duration = input("How long do you want to stun the victim? In seconds.") as num|null
	var/static/list/how_loud = list("Silent", "Force Scream")
	is_painful = input(user, "Do you want it to hurt?") in how_loud

/datum/smite/hardstun/effect(client/user, mob/living/target)
	. = ..()
	var/duration_seconds = duration SECONDS
	if (!iscarbon(target))
		to_chat(user, span_warning("This must be used on a carbon mob."), confidential = TRUE)
		return

	switch(is_painful)
		if("Silent")
			scream = FALSE
		if("Force Scream")
			scream = TRUE

	if (!duration_seconds)
		return
		
	to_chat(target, "<span class='reallybig hypnophrase'>You can't think straight! Your head hurts!</span>")
	to_chat(user, span_mind_control("[target] stunned for [duration] seconds!"))
	var/mob/living/carbon/C = target
	C.Stun(duration_seconds, TRUE)
	if(scream == TRUE)
		C.emote("scream")
	addtimer(CALLBACK(src, PROC_REF(aftereffect), user, target), duration_seconds)

/datum/smite/hardstun/proc/aftereffect(client/user, mob/living/target)
	to_chat(user, span_mind_control("[target] is no longer stunned!"))
