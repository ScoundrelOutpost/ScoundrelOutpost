// new storages used by scoundrel. it probably doesn't contain everything if you're reading this because it doesn't as of writing this

// POUCHES // POUCHES // POUCHES
/obj/item/storage/pouch
	name = "pouch"
	desc = "A pouch for holding small things. It has a hook for resting on a belt."
	icon = 'icons/obj/storage/pouch.dmi'
	icon_state = "pouch"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/pouch/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 3
	atom_storage.max_total_storage = 3
	atom_storage.rustle_sound = FALSE

//cuffs
/obj/item/storage/pouch/cuffs
	name = "tactical cuff pouch"
	desc = "A tactical pouch ergonomically designed for storing cuffs and not much else."
	icon_state = "tactical"

/obj/item/storage/pouch/cuffs/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 3
	atom_storage.max_total_storage = 20
	atom_storage.set_holdable(list(
		/obj/item/restraints/handcuffs
		))

/obj/item/storage/pouch/cuffs/preloaded

/obj/item/storage/pouch/cuffs/preloaded/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/restraints/handcuffs/cable/zipties(src)

//chemistry
/obj/item/storage/pouch/chemistry
	name = "chemistry pouch"
	desc = "A pouch ergonomically designed for storing on-the-field chemistry supplies."
	icon_state = "chemical"

/obj/item/storage/pouch/chemistry/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 4
	atom_storage.max_total_storage = 5
	atom_storage.set_holdable(list(
		/obj/item/reagent_containers/cup,
		/obj/item/reagent_containers/syringe,
		/obj/item/pestle,
		/obj/item/reagent_containers/dropper,
		/obj/item/clothing/mask/surgical,
		))

/obj/item/storage/pouch/chemistry/preloaded

/obj/item/storage/pouch/chemistry/preloaded/PopulateContents()
	new /obj/item/pestle(src)
	new /obj/item/reagent_containers/cup/mortar(src)
	new /obj/item/reagent_containers/dropper(src)
	new /obj/item/reagent_containers/syringe(src)

/obj/item/storage/pouch/chemistry/medical
	name = "medical pouch"
	icon_state = "medical"
/obj/item/storage/pouch/chemistry/preloaded/medical
	name = "medical pouch"
	icon_state = "medical"

//forensic
/obj/item/storage/pouch/forensic
	name = "forensic pouch"
	desc = "A pouch ergonomically designed for storing forensic analysis and investigation tools."
	icon_state = "black"

/obj/item/storage/pouch/forensic/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 4
	atom_storage.max_total_storage = 20
	atom_storage.set_holdable(list(
		/obj/item/evidencebag,
		/obj/item/detective_scanner,
		/obj/item/camera,
		/obj/item/folder,
		/obj/item/photo,
		/obj/item/taperecorder,
		/obj/item/paper,
		/obj/item/tape,
		/obj/item/toy/crayon/white,
		))

/obj/item/storage/pouch/forensic/preloaded

/obj/item/storage/pouch/forensic/preloaded/PopulateContents()
	new /obj/item/detective_scanner(src)
	new /obj/item/camera(src)
	new /obj/item/evidencebag(src)
	new /obj/item/taperecorder(src)

//holding
/obj/item/storage/pouch/holding
	name = "pouch of holding"
	desc = "A low-power bluespace-pocket projector mounted to a device that looks vaguely like a pouch."
	icon_state = "holding"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF // it's a unique item

/obj/item/storage/pouch/holding/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 7
	atom_storage.max_total_storage = 20

//traitor
/obj/item/storage/pouch/traitor
	name = "pouch" //generic to make stealth easier
	desc = "A compact, ergonomically designed pouch for holding more things than usual. it's decorated with shameless Syndicate symbols."
	icon_state = "syndicate"

/obj/item/storage/pouch/traitor/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 6
	atom_storage.max_total_storage = 6

/obj/item/storage/pouch/traitor/nanotrasen
	desc = "A compact, ergonomically designed pouch for holding more things than usual. it's decorated with shameless Nanotrasen symbols."
	icon_state = "nanotrasen"

/obj/item/storage/pouch/traitor/sinister
	desc = "A compact, ergonomically designed pouch for holding more things than usual. It has a sinister look to it."
	icon_state = "sinister red"

// generic - keep this list at the bottom please
/obj/item/storage/pouch/orange
	icon_state = "orange"

/obj/item/storage/pouch/black
	icon_state = "black"


// BELTS // BELTS // BELTS
/obj/item/storage/belt/utility/small
	name = "belt"
	desc = "A trendy space-grade belt with an inbuilt digital clock. You can't really see it while you're wearing it though. It doesn't seem like it could hold anything sizeable."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "belt"
	inhand_icon_state = "security"
	worn_icon_state = "security"
	content_overlays = TRUE

	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/belt/utility/small/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL

/obj/item/storage/belt/utility/small/PopulateContents()
		new /obj/item/storage/pouch/black(src)
