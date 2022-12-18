//extendible gloves for undersuits

/obj/item/clothing/under/gloved
	actions_types = list(/datum/action/item_action/toggle_gloves)
	var/obj/item/clothing/gloves/extended/glove
	var/glovetype = /obj/item/clothing/gloves/extended/space // specify the type of gloves here
	///Alternative mode for hiding the gloves, instead of storing the gloves in the suit it qdels it
	var/alternative_mode = FALSE
	///Whether the gloves are active
	var/glove_up = FALSE
	//clothing flags added when gloves are worn
	var/variable_clothing_flags = null

/obj/item/clothing/under/gloved/Initialize(mapload)
	. = ..()
	if(!alternative_mode)
		Makeglove()

/obj/item/clothing/under/gloved/Destroy()
	. = ..()
	QDEL_NULL(glove)

/obj/item/clothing/under/gloved/proc/Makeglove()
	if(!glove)
		var/obj/item/clothing/gloves/extended/W = new glovetype(src)
		W.suit = src
		glove = W

/obj/item/clothing/under/gloved/ui_action_click()
	Toggleglove()

/obj/item/clothing/under/gloved/item_action_slot_check(slot, mob/user)
	if(slot & ITEM_SLOT_ICLOTHING)
		return TRUE

/obj/item/clothing/under/gloved/equipped(mob/user, slot)
	if(!(slot & ITEM_SLOT_ICLOTHING))
		Removeglove()

	Toggleglove()
	return ..()

/obj/item/clothing/under/gloved/proc/Removeglove()
	src.icon_state = "[initial(icon_state)]"
	glove_up = FALSE

	if(glove)
		if(ishuman(glove.loc))
			var/mob/living/carbon/human/H = glove.loc
			H.transferItemToLoc(glove, src, TRUE)
			H.update_worn_undersuit()
		else
			glove.forceMove(src)

		if(alternative_mode)
			QDEL_NULL(glove)

	update_action_buttons()

/obj/item/clothing/under/gloved/dropped()
	..()
	Removeglove()

/obj/item/clothing/under/gloved/proc/Toggleglove()
	if(!glove_up)
		if(!ishuman(loc))
			return
		var/mob/living/carbon/human/H = loc
		if(H.w_uniform != src)
			to_chat(H, span_warning("You must be wearing [src] to wear the gloves!"))
			return
		if(H.gloves)
			to_chat(H, span_warning("You're already wearing gloves!"))
			return
		else
			if(alternative_mode)
				Makeglove()
			if(!H.equip_to_slot_if_possible(glove,ITEM_SLOT_GLOVES,0,0,1))
				if(alternative_mode)
					Removeglove()
				return
			glove_up = TRUE
			icon_state = "[initial(icon_state)]_t"
			H.update_worn_undersuit()
			update_action_buttons()
	else
		Removeglove()

/obj/item/clothing/gloves/extended
	var/obj/item/clothing/under/gloved/suit


/obj/item/clothing/gloves/extended/Destroy()
	suit = null
	return ..()

/obj/item/clothing/gloves/extended/dropped()
	..()
	suit.clothing_flags -= suit.variable_clothing_flags
	if(suit)
		suit.Removeglove()

/obj/item/clothing/gloves/extended/equipped(mob/user, slot)
	..()
	if(!(slot & ITEM_SLOT_GLOVES))
		if(suit)
			suit.Removeglove()
		else
			qdel(src)

	if(slot & ITEM_SLOT_GLOVES)	
		suit.clothing_flags += suit.variable_clothing_flags

// Toggle exosuits for different aesthetic styles (gloveies, suit jacket buttons, etc)
// Pretty much just a holder for `/datum/component/toggle_icon`.

/obj/item/clothing/under/gloved/toggle
	/// The noun that is displayed to the user on toggle. EX: "Toggles the suit's [buttons]".
	var/toggle_noun = "buttons"

/obj/item/clothing/under/gloved/toggle/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/toggle_icon, toggle_noun)

// space jumpsuit
/obj/item/clothing/under/gloved/spacejumpsuit

	name = "jumpsuit"
	desc = "A standard issue colored jumpsuit. Variety is the spice of life!"
	icon = 'icons/obj/clothing/under/color.dmi'
	icon_state = "jumpsuit"
	inhand_icon_state = "jumpsuit"
	worn_icon_state = "jumpsuit"
	worn_icon = 'icons/mob/clothing/under/color.dmi'
	variable_clothing_flags = STOPSPRESSUREDAMAGE

	glovetype = /obj/item/clothing/gloves/extended/space

/obj/item/clothing/gloves/extended/space
	desc = "These gloves provide protection against electric shock. The thickness of the rubber makes your fingers seem bigger."
	name = "insulated gloves"
	icon_state = "yellow"
	inhand_icon_state = "ygloves"
	siemens_coefficient = 0
	resistance_flags = NONE
