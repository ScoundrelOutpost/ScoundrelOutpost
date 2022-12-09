// new storages used by scoundrel. it probably doesn't contain everything if you're reading this because it doesn't as of writing this

// pouches
/obj/item/storage/pouch
	name = "pouch"
	desc = "A generic pouch for holding tiny things."
	icon = 'icons/obj/toys/dice.dmi'
	icon_state = "dicebag"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/pouch/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_TINY

/obj/item/storage/pouch/cuffs
	name = "cuff pouch"
	desc = "A tactical pouch ergonomically designed for storing cuffs and not much else."

/obj/item/storage/pouch/cuffs/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 3
	atom_storage.set_holdable(list(
		/obj/item/restraints/handcuffs
		))

/obj/item/storage/pouch/cuffs/preloaded

/obj/item/storage/pouch/cuffs/preloaded/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/restraints/handcuffs/cable/zipties(src)
