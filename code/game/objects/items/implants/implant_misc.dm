/obj/item/implant/weapons_auth
	name = "firearms authentication implant"
	desc = "Lets you shoot your guns."
	icon_state = "auth"
	actions_types = null

/obj/item/implant/weapons_auth/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Firearms Authentication Implant<BR>
				<b>Life:</b> 4 hours after death of host<BR>
				<b>Implant Details:</b> <BR>
				<b>Function:</b> Allows operation of implant-locked weaponry, preventing equipment from falling into enemy hands."}
	return dat

/obj/item/implant/adrenalin
	name = "adrenal implant"
	desc = "Removes all stuns."
	icon_state = "adrenal"
	uses = 3

/obj/item/implant/adrenalin/single
	uses = 1

/obj/item/implant/adrenalin/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Cybersun Industries Adrenaline Implant<BR>
				<b>Life:</b> Five days.<BR>
				<b>Important Notes:</b> <font color='red'>Illegal</font><BR>
				<HR>
				<b>Implant Details:</b> Subjects injected with implant can activate an injection of medical cocktails.<BR>
				<b>Function:</b> Removes stuns, increases speed, and has a mild healing effect.<BR>
				<b>Integrity:</b> Implant can only be used three times before reserves are depleted."}
	return dat

/obj/item/implant/adrenalin/activate()
	. = ..()
	uses--
	to_chat(imp_in, "<span class='notice'>You feel a sudden surge of energy!</span>")
	playsound(loc, 'sound/scoundrel/shield/beepbeep.ogg', 15, FALSE)
	imp_in.SetStun(0)
	imp_in.SetKnockdown(0)
	imp_in.SetUnconscious(0)
	imp_in.SetParalyzed(0)
	imp_in.SetImmobilized(0)

	imp_in.adjustStaminaLoss(-100)
	imp_in.adjustBruteLoss(-10)
	imp_in.adjustFireLoss(-10)
	imp_in.adjustToxLoss(-10)
	imp_in.adjustOxyLoss(-10)

	imp_in.set_resting(FALSE)

	imp_in.reagents.add_reagent(/datum/reagent/medicine/ephedrine, 5)
	imp_in.reagents.add_reagent(/datum/reagent/medicine/omnizine, 10)
	imp_in.reagents.add_reagent(/datum/reagent/consumable/coffee, 10)
	imp_in.reagents.add_reagent(/datum/reagent/pax, 1)
	if(!uses)
		to_chat(imp_in, "<span class='notice'>You feel a faint electrical buzz as you use up the last adrenal!</span>")
		qdel(src)

/obj/item/implanter/adrenalin
	name = "implanter (adrenalin)"
	imp_type = /obj/item/implant/adrenalin

/obj/item/implanter/adrenalin/single
	imp_type = /obj/item/implant/adrenalin/single

/obj/item/implant/emp
	name = "emp implant"
	desc = "Triggers an EMP."
	icon_state = "emp"
	uses = 3

/obj/item/implant/emp/activate()
	. = ..()
	uses--
	empulse(imp_in, 3, 5)
	if(!uses)
		qdel(src)

/obj/item/implanter/emp
	name = "implanter (EMP)"
	imp_type = /obj/item/implant/emp

/obj/item/implant/radio
	name = "internal radio implant"
	var/obj/item/radio/radio
	var/radio_key
	var/subspace_transmission = FALSE
	icon = 'icons/obj/radio.dmi'
	icon_state = "walkietalkie"

/obj/item/implant/radio/activate()
	. = ..()
	// needs to be GLOB.deep_inventory_state otherwise it won't open
	radio.ui_interact(usr, state = GLOB.deep_inventory_state)

/obj/item/implant/radio/Initialize(mapload)
	. = ..()

	radio = new(src)
	// almost like an internal headset, but without the
	// "must be in ears to hear" restriction.
	radio.name = "internal radio"
	radio.subspace_transmission = subspace_transmission
	radio.canhear_range = 0
	if(radio_key)
		radio.keyslot = new radio_key
	radio.recalculateChannels()

/obj/item/implant/radio/Destroy()
	QDEL_NULL(radio)
	return ..()

/obj/item/implant/radio/mining
	radio_key = /obj/item/encryptionkey/headset_cargo

/obj/item/implant/radio/syndicate
	desc = "Are you there God? It's me, Syndicate Comms Agent."
	radio_key = /obj/item/encryptionkey/syndicate
	subspace_transmission = TRUE

/obj/item/implant/radio/slime
	name = "slime radio"
	icon = 'icons/obj/medical/organs/organs.dmi'
	icon_state = "adamantine_resonator"
	radio_key = /obj/item/encryptionkey/headset_sci
	subspace_transmission = TRUE

/obj/item/implant/radio/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Internal Radio Implant<BR>
				<b>Life:</b> 24 hours<BR>
				<b>Implant Details:</b> Allows user to use an internal radio, useful if user expects equipment loss, or cannot equip conventional radios."}
	return dat

/obj/item/implanter/radio
	name = "implanter (internal radio)"
	imp_type = /obj/item/implant/radio

/obj/item/implanter/radio/syndicate
	name = "implanter (internal syndicate radio)"
	imp_type = /obj/item/implant/radio/syndicate


// scoundrel content

/*
Can't leave the ventcrawling implants readily accessible ingame in good conscience, there are too many exploits I have yet to figure out how to deal with.
As of writing this, exiting atmos pipes by any means other than leaving through a vent causes undesirable retention of TRAIT_MOVE_VENTCRAWLING
and any other temporary traits. - Jan 2023
*/

// ventcrawling implant
/obj/item/implant/ventcrawling
	name = "contortion implant"
	desc = "Exotic technology allows for unlikely contortion of the body."
	actions_types = null
	icon_state = "adrenal"

/obj/item/implant/ventcrawling/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(!.)
		return FALSE
	ADD_TRAIT(target, TRAIT_VENTCRAWLER_NUDE, IMPLANT_TRAIT)
	ADD_TRAIT(target, TRAIT_VENTCRAWLER_PRESSURE_IMMUNE, IMPLANT_TRAIT)
	return TRUE
/obj/item/implant/ventcrawling/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(!.)
		return FALSE
	if(isliving(target))
		var/mob/living/L = target
		REMOVE_TRAIT(L, TRAIT_VENTCRAWLER_NUDE, IMPLANT_TRAIT)
		REMOVE_TRAIT(L, TRAIT_VENTCRAWLER_PRESSURE_IMMUNE, IMPLANT_TRAIT)
	return TRUE

/obj/item/implanter/ventcrawling
	name = "implanter (contortion)"
	imp_type = /obj/item/implant/ventcrawling


// advanced ventcrawling implant
/obj/item/implant/ventcrawling/deluxe
	name = "bluespace contortion implant"
	desc = "Exotic technology allows for impossible contortion of the body."
	actions_types = null

/obj/item/implant/ventcrawling/deluxe/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(!.)
		return FALSE
	ADD_TRAIT(target, TRAIT_VENTCRAWLER_ALWAYS, IMPLANT_TRAIT)
	ADD_TRAIT(target, TRAIT_VENTCRAWLER_PRESSURE_IMMUNE, IMPLANT_TRAIT)
	return TRUE
/obj/item/implant/ventcrawling/deluxe/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(!.)
		return FALSE
	if(isliving(target))
		var/mob/living/L = target
		REMOVE_TRAIT(L, TRAIT_VENTCRAWLER_ALWAYS, IMPLANT_TRAIT)
		REMOVE_TRAIT(L, TRAIT_VENTCRAWLER_PRESSURE_IMMUNE, IMPLANT_TRAIT)
	return TRUE

/obj/item/implanter/ventcrawling/deluxe
	name = "implanter (bluespace contortion)"
	imp_type = /obj/item/implant/ventcrawling/deluxe

// The Killswitch Implant

/obj/item/implanter/killswitch
	name = "implanter (killswitch)"
	desc = "Who knows what'll happen if it's activated?"
	imp_type = /obj/item/implant/killswitch

/obj/item/implant/killswitch
	name = "killswitch implant"
	desc = "Why is it beeping like that?"
	actions_types = null

/obj/item/implant/killswitch/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	if(!.)
		return FALSE
	ADD_TRAIT(target, TRAIT_GAMER, IMPLANT_TRAIT)
	return TRUE

/obj/item/implant/killswitch/removed(mob/target, silent = FALSE, special = FALSE)
	. = ..()
	if(!.)
		return FALSE
	if(isliving(target))
		var/mob/living/L = target
		REMOVE_TRAIT(L, TRAIT_GAMER, IMPLANT_TRAIT)
	return TRUE

/obj/item/implantcase/killswitch
	name = "implant case - 'Killswitch'"
	desc = "A glass case containing a killswitch implant."
	imp_type = /obj/item/implant/killswitch
