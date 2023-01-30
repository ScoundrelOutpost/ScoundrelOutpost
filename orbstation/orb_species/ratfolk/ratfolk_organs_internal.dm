#define LIGHTING_PLANE_ALPHA_RAT 225 // lighting plane for ratfolk eyes (lower means darkness is less opaque)
#define CHEESE_RUSH_MODIFIER -0.30 // speed modifier while under the effects of cheese rush

// EARS

/obj/item/organ/internal/ears/ratfolk
	name = "rat ears"
	icon = 'orbstation/icons/mob/species/ratfolk/bodyparts.dmi'
	icon_state = "ears_item"
	visual = TRUE
	damage_multiplier = 2
	var/ears_pref = null

/obj/item/organ/internal/ears/ratfolk/Insert(mob/living/carbon/human/ear_owner, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(ear_owner))
		color = ear_owner.dna.features["mcolor"]
		if(ears_pref) // copy the ear shape from the old owner of the ears if there was one
			ear_owner.dna.features["rat_ears"] = ear_owner.dna.species.mutant_bodyparts["rat_ears"] = ears_pref
		else if(ear_owner.dna.features["rat_ears"]) // otherwise use their preference if there is one
			ear_owner.dna.species.mutant_bodyparts["rat_ears"] = ear_owner.dna.features["rat_ears"]
		else // otherwise default to round
			ear_owner.dna.features["rat_ears"] = ear_owner.dna.species.mutant_bodyparts["rat_ears"] = "Round"
		ear_owner.dna.update_uf_block(DNA_RAT_EARS_BLOCK)
		ear_owner.update_body()

/obj/item/organ/internal/ears/ratfolk/Remove(mob/living/carbon/human/ear_owner,  special = 0)
	..()
	if(istype(ear_owner))
		color = ear_owner.dna.features["mcolor"]
		ears_pref = ear_owner.dna.features["rat_ears"]
		ear_owner.dna.species.mutant_bodyparts -= "rat_ears"
		ear_owner.update_body()

// EYES - better darkvision, sensitive to flash, lower health

/obj/item/organ/internal/eyes/ratfolk
	name = "rat eyes"
	maxHealth = 0.7 * STANDARD_ORGAN_THRESHOLD // more fragile than normal eyes
	flash_protect = FLASH_PROTECTION_SENSITIVE
//	lighting_alpha = LIGHTING_PLANE_ALPHA_RAT
//	see_in_dark = NIGHTVISION_FOV_RANGE // free nightvision messes with stealth pretty bad

// STOMACH - increases movespeed temporarily when you consume cheese reagent (found in raw cheese)

/obj/item/organ/internal/stomach/ratfolk
	name = "rat stomach"

/obj/item/organ/internal/stomach/ratfolk/on_life(delta_time, times_fired)
	var/datum/reagent/consumable/cheese/cheese = locate(/datum/reagent/consumable/cheese) in owner.reagents.reagent_list
	if(cheese?.volume)
		cheese.volume = min(cheese.volume, 30) // let's cap the amount of cheese you can have in your stomach
		if(!owner.has_movespeed_modifier(/datum/movespeed_modifier/cheese_rush))
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				H.physiology.hunger_mod /= 0.25 // hunger increases faster in cheese rush mode
			owner.add_movespeed_modifier(/datum/movespeed_modifier/cheese_rush)
			to_chat(owner, span_notice("The cheese gives you a sudden burst of energy!"))
	else
		if(owner.has_movespeed_modifier(/datum/movespeed_modifier/cheese_rush))
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				H.physiology.hunger_mod *= 0.25 // hunger returns to normal
			owner.remove_movespeed_modifier(/datum/movespeed_modifier/cheese_rush)
			to_chat(owner, span_warning("You feel the effects of your cheese rush wear off."))
	return ..()

/obj/item/organ/internal/stomach/ratfolk/Remove(mob/living/carbon/carbon, special = 0)
	if(carbon.has_movespeed_modifier(/datum/movespeed_modifier/cheese_rush))
		to_chat(carbon, span_warning("You feel the effects of your cheese rush wear off."))
		carbon.remove_movespeed_modifier(/datum/movespeed_modifier/cheese_rush)
	return ..()

/datum/movespeed_modifier/cheese_rush
	multiplicative_slowdown = CHEESE_RUSH_MODIFIER

#undef LIGHTING_PLANE_ALPHA_RAT
#undef CHEESE_RUSH_MODIFIER
