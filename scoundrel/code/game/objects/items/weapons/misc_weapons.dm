// maybe soap is a weapon
/obj/item/soap/ants // move this to a new file
	desc = "A weird-looking bar of soap. Smells like ants."
	icon = 'scoundrel/icons/obj/weapons/misc_weapons.dmi'
	icon_state = "antsoap"
	inhand_icon_state = "soapgibs"
	worn_icon_state = "soapgibs"
	lefthand_file = 'icons/mob/inhands/equipment/custodial_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/custodial_righthand.dmi'
	grind_results = list(/datum/reagent/lye = 10, /datum/reagent/ants = 10,)
	cleanspeed = 0.5 SECONDS // very productive ants
	uses = 10

/obj/item/soap/ants/decreaseUses(datum/source, atom/target, mob/living/user)
	. = ..()
	if(isturf(target))
		new /obj/effect/decal/cleanable/ants/small(target)

/obj/effect/decal/cleanable/ants/small
	reagent_amount = 1

/datum/chemical_reaction/antsoapification
	required_reagents = list(/datum/reagent/ants = 10, /datum/reagent/lye = 10)
	required_temp = 374
	mob_react = FALSE
	reaction_flags = REACTION_INSTANT
	reaction_tags = REACTION_TAG_EASY | REACTION_TAG_UNIQUE | REACTION_TAG_OTHER

/datum/chemical_reaction/antsoapification/on_reaction(datum/reagents/holder, datum/equilibrium/reaction, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to created_volume)
		new /obj/item/soap/ants(location)
