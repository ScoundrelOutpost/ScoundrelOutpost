/obj/item/book/granter/martial/cqc
	martial = /datum/martial_art/cqc
	name = "CQC manual"
	martial_name = "close quarters combat"
	desc = "A small black manual. There are illustrated instructions on tactical hand-to-hand combat."
	greet = "<span class='boldannounce'>You've mastered the basics of CQC.</span>"
	icon_state = "cqcmanual"
	remarks = list(
		"Kick... Slam...",
		"Lock... Kick...",
		"Strike their abdomen, neck and back for critical damage...",
		"Slam... Lock...",
		"Words that kill...",
		"The last and final moment is yours...",
	)

/obj/item/book/granter/martial/cqc/on_reading_finished(mob/living/carbon/user)
	. = ..()
	if(uses <= 0)
		to_chat(user, span_warning("[src] beeps ominously..."))

/obj/item/book/granter/martial/cqc/recoil(mob/living/user)
	to_chat(user, span_warning("[src] explodes!"))
	playsound(src,'sound/effects/explosion1.ogg',40,TRUE)
	user.flash_act(1, 1)
	user.adjustBruteLoss(15)
	user.adjustFireLoss(5)
	user.Knockdown(2 SECONDS)
	qdel(src)
