/* Emags
 * Contains:
 * EMAGS AND DOORMAGS
 */


/*
 * EMAG AND SUBTYPES
 */
/obj/item/card/emag
	desc = "It's a card with a magnetic strip attached to some circuitry."
	name = "cryptographic sequencer"
	icon_state = "emag"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	item_flags = NO_MAT_REDEMPTION | NOBLUDGEON
	slot_flags = ITEM_SLOT_ID
	worn_icon_state = "emag"
	var/prox_check = TRUE //If the emag requires you to be in range
	var/type_blacklist //List of types that require a specialized emag

/obj/item/card/emag/attack_self(mob/user) //for traitors with balls of plastitanium
	if(Adjacent(user))
		user.visible_message(span_notice("[user] shows you: [icon2html(src, viewers(user))] [name]."), span_notice("You show [src]."))
	add_fingerprint(user)

/obj/item/card/emag/bluespace
	name = "bluespace cryptographic sequencer"
	desc = "It's a blue card with a magnetic strip attached to some circuitry. It appears to have some sort of transmitter attached to it."
	color = rgb(40, 130, 255)
	prox_check = FALSE

/obj/item/card/emag/halloween
	name = "hack-o'-lantern"
	desc = "It's a pumpkin with a cryptographic sequencer sticking out."
	icon_state = "hack_o_lantern"

/obj/item/card/emagfake
	desc = "It's a card with a magnetic strip attached to some circuitry. Closer inspection shows that this card is a poorly made replica, with a \"Donk Co.\" logo stamped on the back."
	name = "cryptographic sequencer"
	icon_state = "emag"
	inhand_icon_state = "card-id"
	slot_flags = ITEM_SLOT_ID
	worn_icon_state = "emag"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'

/obj/item/card/emagfake/attack_self(mob/user) //for assistants with balls of plasteel
	if(Adjacent(user))
		user.visible_message(span_notice("[user] shows you: [icon2html(src, viewers(user))] [name]."), span_notice("You show [src]."))
	add_fingerprint(user)

/obj/item/card/emagfake/afterattack()
	. = ..()
	playsound(src, 'sound/items/bikehorn.ogg', 50, TRUE)

/obj/item/card/emag/Initialize(mapload)
	. = ..()
	type_blacklist = list(typesof(/obj/machinery/door/airlock), typesof(/obj/machinery/door/window/), typesof(/obj/machinery/door/firedoor)) //list of all typepaths that require a specialized emag to hack.

/obj/item/card/emag/attack()
	return

/obj/item/card/emag/afterattack(atom/target, mob/user, proximity)
	. = ..()
	var/atom/A = target
	if(!proximity && prox_check)
		return
	if(!can_emag(target, user))
		return
	log_combat(user, A, "attempted to emag")
	A.emag_act(user, src)

/obj/item/card/emag/proc/can_emag(atom/target, mob/user)
	for (var/subtypelist in type_blacklist)
		if (target.type in subtypelist)
			to_chat(user, span_warning("The [target] cannot be affected by the [src]! A more specialized hacking device is required."))
			return FALSE
	return TRUE

/*
 * DOORMAG
 */
/obj/item/card/emag/doorjack
	desc = "Commonly known as a \"doorjack\", this device is a specialized cryptographic sequencer specifically designed to override station airlock access codes. Uses self-refilling charges to hack airlocks."
	name = "airlock authentication override card"
	icon_state = "doorjack"
	worn_icon_state = "doorjack"
	var/type_whitelist //List of types
	var/charges = 3
	var/max_charges = 3
	var/list/charge_timers = list()
	var/charge_time = 1800 //three minutes

/obj/item/card/emag/doorjack/Initialize(mapload)
	. = ..()
	type_whitelist = list(typesof(/obj/machinery/door/airlock), typesof(/obj/machinery/door/window/), typesof(/obj/machinery/door/firedoor)) //list of all acceptable typepaths that this device can affect

/obj/item/card/emag/doorjack/proc/use_charge(mob/user)
	charges --
	to_chat(user, span_notice("You use [src]. It now has [charges] charge[charges == 1 ? "" : "s"] remaining."))
	charge_timers.Add(addtimer(CALLBACK(src, PROC_REF(recharge)), charge_time, TIMER_STOPPABLE))

/obj/item/card/emag/doorjack/proc/recharge(mob/user)
	charges = min(charges+1, max_charges)
	playsound(src,'sound/machines/twobeep.ogg',10,TRUE, extrarange = SILENCED_SOUND_EXTRARANGE, falloff_distance = 0)
	charge_timers.Remove(charge_timers[1])

/obj/item/card/emag/doorjack/examine(mob/user)
	. = ..()
	. += span_notice("It has [charges] charges remaining.")
	if (length(charge_timers))
		. += "[span_notice("<b>A small display on the back reads:")]</b>"
	for (var/i in 1 to length(charge_timers))
		var/timeleft = timeleft(charge_timers[i])
		var/loadingbar = num2loadingbar(timeleft/charge_time)
		. += span_notice("<b>CHARGE #[i]: [loadingbar] ([DisplayTimeText(timeleft)])</b>")

/obj/item/card/emag/doorjack/can_emag(atom/target, mob/user)
	if (charges <= 0)
		to_chat(user, span_warning("[src] is recharging!"))
		return FALSE
	for (var/list/subtypelist in type_whitelist)
		if (target.type in subtypelist)
			return TRUE
	to_chat(user, span_warning("[src] is unable to interface with this. It only seems to fit into airlock electronics."))
	return FALSE

/*
 * Battlecruiser Access
 */
/obj/item/card/emag/battlecruiser
	name = "battlecruiser coordinates upload card"
	desc = "An ominous card that contains the location of the station, and when applied to a communications console, \
	the ability to long-distance contact the Syndicate fleet."
	icon_state = "battlecruisercaller"
	worn_icon_state = "battlecruisercaller"
	///whether we have called the battlecruiser
	var/used = FALSE
	/// The battlecruiser team that the battlecruiser will get added to
	var/datum/team/battlecruiser/team

/obj/item/card/emag/battlecruiser/proc/use_charge(mob/user)
	used = TRUE
	to_chat(user, span_boldwarning("You use [src], and it interfaces with the communication console. No going back..."))

/obj/item/card/emag/battlecruiser/examine(mob/user)
	. = ..()
	. += span_notice("It can only be used on the communications console.")

/obj/item/card/emag/battlecruiser/can_emag(atom/target, mob/user)
	if(used)
		to_chat(user, span_warning("[src] is used up."))
		return FALSE
	if(!istype(target, /obj/machinery/computer/communications))
		to_chat(user, span_warning("[src] is unable to interface with this. It only seems to interface with the communication console."))
		return FALSE
	return TRUE

// scoundrel content
/obj/item/card/access_inscriber
	name = "access inscriber"
	desc = "A tool used to quickly inscribe access to airlocks and machinery."
	icon_state = "doorjack"
	worn_icon_state = "doorjack"
	inhand_icon_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	item_flags = NO_MAT_REDEMPTION | NOBLUDGEON
	slot_flags = ITEM_SLOT_ID
	// whether the inscriber needs to be used in immediate proximity to function
	var/prox_check = TRUE
	var/inscribed_access = null // must be a list or null
	var/inscribed_one_access = null // must be a list or null
	var/access_string = "It's programmed to reset access to defaults."
	var/charges = 0
	var/max_charges = 3
	var/list/charge_timers = list()

	// how long it takes to hijack access. null skips the do_after and makes it instant
	var/hijack_time = 16 SECONDS
	var/locker_hijack_time = 45 SECONDS // discourage bad behavior
	// used for APCs and air alarms
	var/aux_hijack_time = 8 SECONDS
	var/recharge_time = 90 SECONDS

	// the security level of an airlock that the inscriber is willing to ignore. greater than 1 will also bypass the screwdriver panel
	var/security_override = 0

/obj/item/card/access_inscriber/Initialize(mapload)
	. = ..()
	charges = max_charges

/obj/item/card/access_inscriber/examine(mob/user)
	. = ..()
	. += span_notice("It has [charges] out of [max_charges] charges. It'll take [recharge_time / 10] seconds to recharge.")
	. += span_notice("[access_string]")


/obj/item/card/access_inscriber/afterattack(atom/target, mob/user, proximity)
	. = ..()
	var/obj/O = target
	if(!proximity && prox_check)
		return

	// airlocks
	if(istype(O, /obj/machinery/door/airlock))
		log_combat(user, O, "attempted to inscribe")
		var/obj/machinery/door/airlock/airlock = O
		if(charges < 1)
			to_chat(user, span_warning("[src] buzzes quietly. It needs to recharge!"))
			return

		else if(airlock.security_level > security_override)
			to_chat(user, span_warning("You need access to the electronics!"))
			return
		
		if(airlock.panel_open == FALSE && airlock.security_level >= security_override)
			to_chat(user, span_warning("You need access to the electronics!"))
			return

		if(hijack_time)
			do_sparks(1, TRUE, src)
			to_chat(user, span_warning("You begin reprogramming the electronics!"))
			if(do_after(user, hijack_time))
				hijack_access(airlock, user)
		else
			hijack_access(airlock, user)

	// lockers
	if(istype(O, /obj/structure/closet/secure_closet))
		log_combat(user, O, "attempted to inscribe")
		var/obj/structure/closet/secure_closet/locker = O
		if(charges < 1)
			to_chat(user, span_warning("[src] buzzes quietly. It needs to recharge!"))
			return
		else if(locker_hijack_time)
			to_chat(user, span_warning("You begin reprogramming the electronics!"))
			do_sparks(1, TRUE, src)
			if(do_after(user, locker_hijack_time))
				hijack_access(locker, user)
		else
			hijack_access(locker, user)

	// APCs
	if(istype(O, /obj/machinery/power/apc))
		log_combat(user, O, "attempted to inscribe")
		var/obj/machinery/power/apc/apc = O
		if(charges < 1)
			to_chat(user, span_warning("[src] buzzes quietly. It needs to recharge!"))
			return

		else if(security_override < 1)
			if(apc.panel_open == FALSE)
				to_chat(user, span_warning("You need access to the electronics!"))
				return

		if(aux_hijack_time)
			to_chat(user, span_warning("You begin reprogramming the electronics!"))
			do_sparks(1, TRUE, src)
			if(do_after(user, aux_hijack_time))
				hijack_access(apc, user)
		else
			hijack_access(apc, user)

	// air alarms
	if(istype(O, /obj/machinery/airalarm))
		log_combat(user, O, "attempted to inscribe")
		var/obj/machinery/airalarm/alarm = O
		if(charges < 1)
			to_chat(user, span_warning("[src] buzzes quietly. It needs to recharge!"))
			return

		else if(security_override < 1)
			if(alarm.panel_open == FALSE)
				to_chat(user, span_warning("You need access to the electronics!"))
				return

		if(aux_hijack_time)
			to_chat(user, span_warning("You begin reprogramming the electronics!"))
			do_sparks(1, TRUE, src)
			if(do_after(user, aux_hijack_time))
				hijack_access(alarm, user)
		else
			hijack_access(alarm, user)

/obj/item/card/access_inscriber/proc/hijack_access(atom/target, mob/user)
	var/obj/O = target
	if(charges < 1)
		to_chat(user, span_warning("[src] buzzes quietly. It needs to recharge!"))
		return
	if(O.req_access == inscribed_access && O.req_one_access == inscribed_one_access)
		to_chat(user, span_warning("[src] buzzes quietly! The access is already matching."))
		return
	to_chat(user, span_warning("You swipe the inscriber in the reader!"))
	O.req_access = inscribed_access
	O.req_one_access = inscribed_one_access
	charges --
	addtimer(CALLBACK(src, PROC_REF(regain_charge)), recharge_time)
	do_sparks(1, TRUE, O)

/obj/item/card/access_inscriber/proc/regain_charge(mob/user)
	if(charges < max_charges)
		charges ++
		playsound(src,'sound/machines/twobeep.ogg',10,TRUE, extrarange = SILENCED_SOUND_EXTRARANGE, falloff_distance = 0)




// inscriber types
/obj/item/card/access_inscriber/syndicate
	inscribed_access = null
	inscribed_one_access = SYNDICATE_ACCESS // already a list
	hijack_time = null
	locker_hijack_time = 8 SECONDS
	aux_hijack_time = null
	security_override = 5 // just short of getting through plasteel plating
	access_string = "The programming chip is black and suspiciously unmarked."

/obj/item/card/access_inscriber/default
	name = "default access inscriber"
	inscribed_access = null
	inscribed_one_access = null
	access_string = "It's programmed to reset access to defaults."

/obj/item/card/access_inscriber/maintenance
	name = "maintenance access inscriber"
	inscribed_access = null
	inscribed_one_access = list(ACCESS_MAINT_TUNNELS)
	access_string = "It's programmed to add MAINTENANCE access requirements."

/obj/item/card/access_inscriber/command
	name = "command access inscriber"
	inscribed_access = null
	inscribed_one_access = list(ACCESS_COMMAND)
	access_string = "It's programmed to add COMMAND access requirements."

// choice inscriber
/obj/item/card/access_inscriber/choice
	desc = "A tool used to quickly inscribe access to airlocks and machinery. This one can be activated to choose from a selection of access types."
	inscribed_access = null
	inscribed_one_access = null
	access_string = "It's programmed to reset access to defaults."
	var/selection = 0

//i'm sure this could be done much better, i just don't know how
/obj/item/card/access_inscriber/choice/attack_self(mob/user, modifiers)
	. = ..()
	selection ++
	if(selection == 1)
		balloon_alert(user, "MAINTENANCE selected")
		inscribed_access = null
		inscribed_one_access = list(ACCESS_MAINT_TUNNELS)
		access_string = "It's programmed to set MAINTENANCE access requirements."
	else if(selection == 2)
		balloon_alert(user, "COMMAND selected")
		inscribed_access = null
		inscribed_one_access = list(ACCESS_COMMAND)
		access_string = "It's programmed to set COMMAND access requirements."
	else if(selection > 2)
		selection = 0
	if(selection == 0)
		balloon_alert(user, "DEFAULT selected")
		inscribed_access = null
		inscribed_one_access = null
		access_string = "It's programmed to reset access to defaults."
