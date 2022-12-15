/obj/item/tank/jetpack
	name = "jetpack (empty)"
	desc = "A tank of compressed gas for use as propulsion in zero-gravity areas. Use with caution."
	icon_state = "jetpack"
	inhand_icon_state = "jetpack"
	lefthand_file = 'icons/mob/inhands/equipment/jetpacks_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/jetpacks_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	distribute_pressure = ONE_ATMOSPHERE * O2STANDARD
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_SUITSTORE
	actions_types = list(/datum/action/item_action/set_internals, /datum/action/item_action/toggle_jetpack, /datum/action/item_action/jetpack_stabilization)
	var/gas_type = /datum/gas/oxygen
	var/on = FALSE
	var/stabilizers = FALSE
	var/full_speed = FALSE // If the jetpack will have a speedboost in space/nograv or not
	var/datum/callback/get_mover
	var/datum/callback/check_on_move

/obj/item/tank/jetpack/Initialize(mapload)
	. = ..()
	get_mover = CALLBACK(src, PROC_REF(get_user))
	check_on_move = CALLBACK(src, PROC_REF(allow_thrust), 0.01)
	refresh_jetpack()

/obj/item/tank/jetpack/Destroy()
	get_mover = null
	check_on_move = null
	return ..()

/obj/item/tank/jetpack/proc/refresh_jetpack()
	AddComponent(/datum/component/jetpack, stabilizers, COMSIG_JETPACK_ACTIVATED, COMSIG_JETPACK_DEACTIVATED, JETPACK_ACTIVATION_FAILED, get_mover, check_on_move, /datum/effect_system/trail_follow/ion)

/obj/item/tank/jetpack/item_action_slot_check(slot)
	if(slot & slot_flags)
		return TRUE

/obj/item/tank/jetpack/equipped(mob/user, slot, initial)
	. = ..()
	if(on && !(slot & slot_flags))
		turn_off(user)

/obj/item/tank/jetpack/dropped(mob/user, silent)
	. = ..()
	if(on)
		turn_off(user)

/obj/item/tank/jetpack/populate_gas()
	if(gas_type)
		var/datum/gas_mixture/our_mix = return_air()
		our_mix.assert_gas(gas_type)
		our_mix.gases[gas_type][MOLES] = ((6 * ONE_ATMOSPHERE) * volume / (R_IDEAL_GAS_EQUATION * T20C))

/obj/item/tank/jetpack/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_jetpack))
		cycle(user)
	else if(istype(action, /datum/action/item_action/jetpack_stabilization))
		if(on)
			set_stabilizers(!stabilizers)
			to_chat(user, span_notice("You turn the jetpack stabilization [stabilizers ? "on" : "off"]."))
	else
		toggle_internals(user)

/obj/item/tank/jetpack/proc/cycle(mob/user)
	if(user.incapacitated())
		return

	if(!on)
		if(turn_on(user))
			to_chat(user, span_notice("You turn the jetpack on."))
		else
			to_chat(user, span_notice("You fail to turn the jetpack on."))
			return
	else
		turn_off(user)
		to_chat(user, span_notice("You turn the jetpack off."))
	update_action_buttons()

/obj/item/tank/jetpack/proc/set_stabilizers(new_stabilizers)
	if(new_stabilizers == stabilizers)
		return
	stabilizers = new_stabilizers
	refresh_jetpack()

/obj/item/tank/jetpack/proc/turn_on(mob/user)
	if(SEND_SIGNAL(src, COMSIG_JETPACK_ACTIVATED) & JETPACK_ACTIVATION_FAILED)
		return FALSE
	on = TRUE
	icon_state = "[initial(icon_state)]-on"
	if(full_speed)
		user.add_movespeed_modifier(/datum/movespeed_modifier/jetpack/fullspeed)
	return TRUE

/obj/item/tank/jetpack/proc/turn_off(mob/user)
	SEND_SIGNAL(src, COMSIG_JETPACK_DEACTIVATED)
	on = FALSE
	set_stabilizers(FALSE)
	icon_state = initial(icon_state)
	if(user)
		user.remove_movespeed_modifier(/datum/movespeed_modifier/jetpack/fullspeed)

/obj/item/tank/jetpack/proc/allow_thrust(num, use_fuel = TRUE)
	if((num < 0.005 || air_contents.total_moles() < num))
		turn_off(get_user())
		return FALSE

	// We've got the gas, it's chill
	if(!use_fuel)
		return TRUE

	var/datum/gas_mixture/removed = remove_air(num)
	if(removed.total_moles() < 0.005)
		turn_off(get_user())
		return FALSE

	var/turf/T = get_turf(src)
	T.assume_air(removed)
	return TRUE

// Gives the jetpack component the user it expects
/obj/item/tank/jetpack/proc/get_user()
	if(!ismob(loc))
		return null
	return loc

/obj/item/tank/jetpack/suicide_act(mob/living/user)
	if (!ishuman(user))
		return
	var/mob/living/carbon/human/suffocater = user
	suffocater.say("WHAT THE FUCK IS CARBON DIOXIDE?")
	suffocater.visible_message(span_suicide("[user] is suffocating [user.p_them()]self with [src]! It looks like [user.p_they()] didn't read what that jetpack says!"))
	return OXYLOSS

/obj/item/tank/jetpack/improvised
	name = "improvised jetpack"
	desc = "A jetpack made from two air tanks, a fire extinguisher and some atmospherics equipment. It doesn't look like it can hold much."
	icon_state = "jetpack-improvised"
	inhand_icon_state = "jetpack-improvised"
	worn_icon_state = "jetpack-improvised"
	volume = 35 //normal jetpacks have 70 volume
	gas_type = null //it starts empty

/obj/item/tank/jetpack/void
	name = "void jetpack"
	desc = "It works well in a void. It has an oxygen label on the tank."
	icon_state = "jetpack-void"
	inhand_icon_state = "jetpack-void"

/obj/item/tank/jetpack/oxygen
	name = "jetpack"
	desc = "A tank of compressed gas for use as propulsion in zero-gravity areas. Use with caution. It has an oxygen label on the tank."
	icon_state = "jetpack"
	inhand_icon_state = "jetpack"

/obj/item/tank/jetpack/oxygen/harness
	name = "jet harness"
	desc = "A lightweight tactical harness, used by those who don't want to be weighed down by traditional jetpacks. It has an oxygen label on the tank."
	icon_state = "jetpack-mini"
	inhand_icon_state = "jetpack-black"
	volume = 40
	throw_range = 7
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/tank/jetpack/oxygen/captain
	name = "captain's jetpack"
	desc = "A compact, lightweight jetpack containing a high amount of compressed gas. It has an oxygen label on the tank."
	icon_state = "jetpack-captain"
	inhand_icon_state = "jetpack-captain"
	w_class = WEIGHT_CLASS_NORMAL
	volume = 90
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF //steal objective items are hard to destroy.

/obj/item/tank/jetpack/oxygen/security
	name = "red jetpack"
	desc = "A tank of compressed gas for use as propulsion in zero-gravity areas. Use with caution. It has an oxygen label on the tank."
	icon_state = "jetpack-sec"
	inhand_icon_state = "jetpack-sec"



/obj/item/tank/jetpack/carbondioxide
	name = "black jetpack"
	desc = "A tank of compressed gas for use as propulsion in zero-gravity areas. Use with caution. It has a carbon dioxide label on the tank."
	icon_state = "jetpack-black"
	inhand_icon_state = "jetpack-black"
	distribute_pressure = 0
	gas_type = /datum/gas/carbon_dioxide



// scoundrel content - advanced jetpacks
/obj/item/tank/jetpack/advanced
	name = "advanced jetpack"
	desc = "A back-mounted propulsion system based on rapid expulsion of compressed gas. It's equipped with a recharging ion-propulsor for space travel. It has an oxygen label on the tank."
	icon_state = "jetpack-mini"
	inhand_icon_state = "jetpack-black"
	actions_types = list(/datum/action/item_action/set_internals, /datum/action/item_action/toggle_jetpack, /datum/action/item_action/jetpack_stabilization, /datum/action/item_action/jetboost)
// scoundrel content - jetpack boost
	var/jumpdistance = 0 //-1 from to see the actual distance, e.g 4 goes over 3 tiles
	var/jumpspeed = 1.5
	var/recharging_rate = 60 //default 6 seconds between each dash
	var/recharging_time = 0 //time until next dash

/obj/item/tank/jetpack/advanced/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_jetpack))
		cycle(user)
	else if(istype(action, /datum/action/item_action/jetpack_stabilization))
		if(on)
			set_stabilizers(!stabilizers)
			to_chat(user, span_notice("You turn the jetpack stabilization [stabilizers ? "on" : "off"]."))
	
	// scoundrel content - jump boots (shoes/bhop) code
	else if(istype(action, /datum/action/item_action/jetboost))
		if(!isliving(user))
			return

		if(recharging_time > world.time)
			to_chat(user, span_warning("The jetpack's internal propulsion needs to recharge still!"))
			return

		var/atom/target = get_edge_target_turf(user, user.dir) //gets the user's direction

		ADD_TRAIT(user, TRAIT_MOVE_FLOATING, LEAPING_TRAIT)  //Throwing itself doesn't protect mobs against lava (because gulag).
		if (user.throw_at(target, jumpdistance, jumpspeed, spin = FALSE, diagonals_first = TRUE, callback = TRAIT_CALLBACK_REMOVE(user, TRAIT_MOVE_FLOATING, LEAPING_TRAIT)))
			playsound(src, 'sound/effects/stealthoff.ogg', 50, TRUE, TRUE)
			user.visible_message(span_warning("[usr] fires a jet of ion particles from their jetpack!"))
			recharging_time = world.time + recharging_rate
		else
			to_chat(user, span_warning("Something prevents you from boosting!"))
	// scoundrel content ^^^

	else
		toggle_internals(user)

/obj/item/tank/jetpack/advanced/compact/syndicate
	name = "covert jetpack"
	desc = "An advanced jetpack with folding thrusters for compact storage. It has an oxygen label on the tank, and a sinister look about it."
	w_class = WEIGHT_CLASS_NORMAL
