#define SLAM_COMBO "HG"
#define KICK_COMBO "HH"
#define RESTRAIN_COMBO "GGH"
#define PRESSURE_COMBO "DH"
#define CONSECUTIVE_COMBO "HDH"

/datum/martial_art/cqc
	name = "CQC"
	id = MARTIALART_CQC
	help_verb = /mob/living/proc/CQC_help
	display_combos = TRUE
	var/old_grab_state = null
	var/mob/restraining_mob

/datum/martial_art/cqc/teach(mob/living/cqc_user, make_temporary)
	. = ..()
	RegisterSignal(cqc_user, COMSIG_PARENT_ATTACKBY, PROC_REF(on_attackby))

/datum/martial_art/cqc/on_remove(mob/living/cqc_user)
	UnregisterSignal(cqc_user, COMSIG_PARENT_ATTACKBY)
	. = ..()

///Signal from getting attacked with an item, for a special interaction with touch spells
/datum/martial_art/cqc/proc/on_attackby(mob/living/cqc_user, obj/item/attack_weapon, mob/attacker, params)
	SIGNAL_HANDLER

	if(!istype(attack_weapon, /obj/item/melee/touch_attack))
		return
	if(!can_use(cqc_user))
		return
	cqc_user.visible_message(
		span_danger("[cqc_user] twists [attacker]'s arm, sending their [attack_weapon] back towards them!"),
		span_userdanger("Making sure to avoid [attacker]'s [attack_weapon], you twist their arm to send it right back at them!"),
	)
	var/obj/item/melee/touch_attack/touch_weapon = attack_weapon
	var/datum/action/cooldown/spell/touch/touch_spell = touch_weapon.spell_which_made_us?.resolve()
	if(!touch_spell)
		return
	INVOKE_ASYNC(touch_spell, TYPE_PROC_REF(/datum/action/cooldown/spell/touch, do_hand_hit), touch_weapon, attacker, attacker)
	return COMPONENT_NO_AFTERATTACK

/datum/martial_art/cqc/reset_streak(mob/living/new_target)
	if(new_target && new_target != restraining_mob)
		restraining_mob = null
	return ..()

/datum/martial_art/cqc/proc/check_streak(mob/living/A, mob/living/D)
	if(!can_use(A))
		return FALSE
	if(findtext(streak,CONSECUTIVE_COMBO))
		reset_streak()
		return Consecutive(A,D)
	if(findtext(streak,SLAM_COMBO))
		reset_streak()
		return Slam(A,D)
	if(findtext(streak,KICK_COMBO))
		reset_streak()
		return Kick(A,D)
	if(findtext(streak,RESTRAIN_COMBO))
		reset_streak()
		return Restrain(A,D)
	if(findtext(streak,PRESSURE_COMBO))
		reset_streak()
		return Pressure(A,D)
	return FALSE

/datum/martial_art/cqc/proc/Slam(mob/living/A, mob/living/D)
	if(!can_use(A))
		return FALSE
	if(D.body_position == STANDING_UP)
		D.visible_message(span_danger("[A] sweeps the legs out from under [D]"), \
			span_userdanger("Your legs are swept out from under you by [A]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), null, A)
		to_chat(A, span_danger("You sweep the legs out from under [D]!"))
		playsound(get_turf(A), SFX_KICK, 50, TRUE, -1)
		A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
		D.apply_damage(8, A.get_attack_type())
		D.Knockdown(2 SECONDS)
		log_combat(A, D, "legsweeped (CQC)")
	else
		D.visible_message(span_danger("[A] viciously stomps on [D]"), \
			span_userdanger("[A] viciously stomps on you!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), null, A)
		to_chat(A, span_danger("You viciously stomp on [D]!"))
		playsound(get_turf(A), SFX_KICK, 50, TRUE, -1)
		A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
		D.apply_damage(18, A.get_attack_type())
		log_combat(A, D, "stomped (CQC)")
	return TRUE

/datum/martial_art/cqc/proc/Kick(mob/living/A, mob/living/D)
	if(!can_use(A))
		return FALSE
	D.visible_message(span_danger("[A] kicks [D] back!"), \
		span_userdanger("You're kicked back by [A]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, A)
	to_chat(A, span_danger("You kick [D] back!"))
	playsound(get_turf(A), SFX_PUNCH2, 50, TRUE, -1)
	A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
	var/atom/throw_target = get_edge_target_turf(D, A.dir)
	D.throw_at(throw_target, 2, 4, A)
	D.apply_damage(10, A.get_attack_type())
	log_combat(A, D, "kicked (CQC)")
	. = TRUE

/datum/martial_art/cqc/proc/Pressure(mob/living/A, mob/living/D)
	if(!can_use(A))
		return FALSE
	log_combat(A, D, "pressured (CQC)")
	D.visible_message(span_danger("[A] punches [D]'s neck!"), \
					span_userdanger("Your neck is punched by [A]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, A)
	to_chat(A, span_danger("You punch [D]'s neck!"))
	D.apply_damage(8, A.get_attack_type())
	D.apply_damage(10, OXY)
	D.adjust_silence_up_to(8 SECONDS, 8 SECONDS)
	playsound(get_turf(A), SFX_SMACK, 50, TRUE, -1)
	A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
	return TRUE

/datum/martial_art/cqc/proc/Restrain(mob/living/A, mob/living/D)
	if(restraining_mob)
		return
	if(!can_use(A))
		return FALSE
	log_combat(A, D, "restrained (CQC)")
	D.visible_message(span_danger("[A] restrained [D]"), \
		span_userdanger("You're locked into a restraining position by [A]!"), span_hear("You hear aggressive shuffling!"), COMBAT_MESSAGE_RANGE, A)
	to_chat(A, span_danger("You lock [D] into a restraining position."))
	A.do_attack_animation(D, ATTACK_EFFECT_DISARM)
	D.Stun(2 SECONDS)
	restraining_mob = D
	addtimer(VARSET_CALLBACK(src, restraining_mob, null), 50, TIMER_UNIQUE)
	return TRUE

/datum/martial_art/cqc/proc/Consecutive(mob/living/A, mob/living/D)
	if(!can_use(A))
		return FALSE
	if(!D.stat)
		D.visible_message(span_danger("[A] strikes [D]'s abdomen, neck and back consecutively"), \
						span_userdanger("Your abdomen, neck and back are struck consecutively by [A]!"), span_hear("You hear a sickening sound of flesh hitting flesh!"), COMBAT_MESSAGE_RANGE, A)
		to_chat(A, span_danger("You strike [D]'s abdomen, neck and back consecutively!"))
		playsound(get_turf(D), SFX_KICK, 50, TRUE, -1)
		A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
		var/obj/item/I = D.get_active_held_item()
		if(I && D.temporarilyRemoveItemFromInventory(I))
			A.put_in_hands(I)
		D.adjustStaminaLoss(5)
		D.apply_damage(15, A.get_attack_type())
		var/atom/throw_target = get_edge_target_turf(D, A.dir)
		D.throw_at(throw_target, 1, 1, A)
		D.Paralyze(0.1)
		log_combat(A, D, "consecutive CQC'd (CQC)", "[I ? " disarming \the [I]" : ""]")
		return TRUE

/datum/martial_art/cqc/grab_act(mob/living/A, mob/living/D)
	if(A != D)
		add_to_streak("G",D)
		if(check_streak(A,D))
			return TRUE
	log_combat(A, D, "grabbed (CQC)")
	return ..()

/datum/martial_art/cqc/harm_act(mob/living/A, mob/living/D)
	if(A != D)
		add_to_streak("H",D)
		if(check_streak(A,D))
			return TRUE
	log_combat(A, D, "harmed (CQC)")
	return ..()

/datum/martial_art/cqc/disarm_act(mob/living/A, mob/living/D)
	if(A != D)
		add_to_streak("D",D)
		if(check_streak(A,D))
			return TRUE
	log_combat(A, D, "disarmed (CQC)")
	return ..()


/mob/living/proc/CQC_help()
	set name = "Remember the Basics"
	set desc = "You try to remember some of the basics of CQC."
	set category = "CQC"
	to_chat(usr, "<b><i>You try to remember some of the basics of CQC.</i></b>")

	to_chat(usr, "[span_notice("Legsweep")]: Harm Grab. Knocks your opponent to the ground.")
	to_chat(usr, "[span_notice("Forward Kick")]: Harm Harm. Knocks your opponent back a brief distance.")
	to_chat(usr, "[span_notice("Restrain")]: Grab Grab Harm. Locks opponents into a restraining position.")
	to_chat(usr, "[span_notice("Pressure")]: Disarm Harm. A strike to the neck that causes suffocation and silences the target for 8 seconds.")
	to_chat(usr, "[span_notice("Consecutive Strikes")]: Harm Disarm Harm. A combo that deals significant damage and disarms your opponent.")

///Subtype of CQC. Only used for the chef.
/datum/martial_art/cqc/under_siege
	name = "Close Quarters Cooking"
	///List of all areas that CQC will work in, defaults to Kitchen.
	var/list/kitchen_areas = list(/area/station/service/kitchen)

/// Refreshes the valid areas from the cook's mapping config, adding areas in config to the list of possible areas.
/datum/martial_art/cqc/under_siege/proc/refresh_valid_areas()
	var/list/job_changes = SSmapping.config.job_changes

	if(!length(job_changes))
		return

	var/list/cook_changes = job_changes[JOB_COOK]

	if(!length(cook_changes))
		return

	var/list/additional_cqc_areas = cook_changes["additional_cqc_areas"]

	if(!additional_cqc_areas)
		return

	if(!islist(additional_cqc_areas))
		stack_trace("Incorrect CQC area format from mapping configs. Expected /list, got: \[[additional_cqc_areas.type]\]")
		return

	for(var/path_as_text in additional_cqc_areas)
		var/path = text2path(path_as_text)
		if(!ispath(path, /area))
			stack_trace("Invalid path in mapping config for chef CQC: \[[path_as_text]\]")
			continue

		kitchen_areas |= path

/// Limits where the chef's CQC can be used to only whitelisted areas.
/datum/martial_art/cqc/under_siege/can_use(mob/living/owner)
	if(!is_type_in_list(get_area(owner), kitchen_areas))
		return FALSE
	return ..()
