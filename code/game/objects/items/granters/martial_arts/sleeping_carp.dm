/obj/item/book/granter/martial/carp
	martial = /datum/martial_art/the_sleeping_carp
	name = "mysterious scroll"
	w_class = WEIGHT_CLASS_SMALL
	martial_name = "sleeping carp"
	desc = "A scroll filled with markings from an ancient language. It seems to describe some sort of martial art."
	greet = "<span class='sciradio'>You have learned the ancient martial art of the Sleeping Carp!</span>\
		\n<span class='cultitalic'>You can now able to deflect high-speed projectiles shot at you while in Throw Mode! \
		\nYou can now snatch guns out of the hands of your opponents by shoving them! \
		\nYour rigour has also hardened you against wounding; your body is less likely to break and bleed! \
		\nAdditionally, the strict mental training has left you unable to partake in the use of guns or similar ranged weapons!</span>"
	icon = 'scoundrel/icons/obj/misc/books.dmi'
	icon_state = "carpscroll"
	worn_icon_state = "scroll"
	remarks = list(
		"Wait, a high protein diet is really all it takes to become stabproof...?",
		"Overwhelming force, immovable object...",
		"Focus... And you'll be able to incapacitate any foe in seconds...",
		"I must pierce armor for maximum damage...",
		"I don't think this would combine with other martial arts...",
		"Become one with the carp...",
		"Glub...",
	)

/obj/item/book/granter/martial/carp/on_reading_finished(mob/living/carbon/user)
	. = ..()
	update_appearance()

/obj/item/book/granter/martial/carp/update_appearance(updates)
	. = ..()
	if(uses <= 0)
		name = "empty scroll"
		desc = "A mysteriously blank scroll."
		icon_state = "carpscroll_blank"
	else
		name = initial(name)
		desc = initial(desc)
		icon_state = initial(icon_state)
