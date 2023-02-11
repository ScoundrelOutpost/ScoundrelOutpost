// new storages used by scoundrel. it probably doesn't contain everything if you're reading this because it doesn't as of writing this

// POUCHES // POUCHES // POUCHES
// POUCHES // POUCHES // POUCHES
// POUCHES // POUCHES // POUCHES
/obj/item/storage/pouch
	name = "pouch"
	desc = "A pouch for holding small things. It has a hook for resting on a belt."
	icon = 'scoundrel/icons/obj/storage/pouch.dmi'
	icon_state = "pouch"
	worn_icon = 'icons/mob/clothing/belt.dmi'
	worn_icon_state = "empty"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT

/obj/item/storage/pouch/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 5
	atom_storage.max_total_storage = 5
	atom_storage.rustle_sound = FALSE

//cuffs
/obj/item/storage/pouch/cuffs
	name = "tactical cuff pouch"
	desc = "A tactical pouch ergonomically designed for storing cuffs and not much else."
	icon_state = "cuffs"

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

//medical
/obj/item/storage/pouch/medical
	name = "medical pouch"
	icon_state = "medical"

/obj/item/storage/pouch/medical/preloaded

/obj/item/storage/pouch/medical/preloaded/PopulateContents()
	new /obj/item/stack/medical/suture(src)
	new /obj/item/stack/medical/mesh(src)
	new /obj/item/reagent_containers/hypospray/medipen(src)

/obj/item/storage/pouch/medical/preloaded/advanced/PopulateContents()
	new /obj/item/reagent_containers/pill/patch/synthflesh(src)
	new /obj/item/reagent_containers/hypospray/medipen/penacid(src)
	new /obj/item/reagent_containers/hypospray/medipen/atropine(src)

//forensic
/obj/item/storage/pouch/forensic
	name = "forensic pouch"
	desc = "A pouch ergonomically designed for storing forensic analysis and investigation tools."
	icon_state = "forensic"

/obj/item/storage/pouch/forensic/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 4
	atom_storage.max_total_storage = 8
	atom_storage.set_holdable(list(
		/obj/item/evidencebag,
		/obj/item/detective_scanner,
		/obj/item/camera,
		/obj/item/folder,
		/obj/item/photo,
		/obj/item/taperecorder,
		/obj/item/paper,
		/obj/item/tape,
		/obj/item/hand_labeler,
		/obj/item/toy/crayon/white,
		))

/obj/item/storage/pouch/forensic/preloaded

/obj/item/storage/pouch/forensic/preloaded/PopulateContents()
	new /obj/item/detective_scanner(src)
	new /obj/item/camera(src)
	new /obj/item/evidencebag(src)
	new /obj/item/taperecorder(src)

/obj/item/storage/pouch/forensic/alibi
	name = "alibi kit"
	desc = "A pouch ergonomically designed for storing political self-defense tools."
	icon_state = "alibi"
/obj/item/storage/pouch/forensic/alibi/preloaded/PopulateContents()
	new /obj/item/camera(src)
	new /obj/item/taperecorder(src)
	new /obj/item/hand_labeler(src)
	new /obj/item/folder/alibipouch(src)


//engineering
/obj/item/storage/pouch/engineer
	name = "cable pouch"
	desc = "A pouch for storing extra cables."
	icon_state = "engineer"

/obj/item/storage/pouch/engineer/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 3
	atom_storage.max_total_storage = 20
	atom_storage.set_holdable(list(
		/obj/item/stack/cable_coil,
		))

/obj/item/storage/pouch/engineer/preloaded

/obj/item/storage/pouch/engineer/preloaded/PopulateContents()
	new /obj/item/stack/cable_coil(src)
	new /obj/item/stack/cable_coil(src)
	new /obj/item/stack/cable_coil(src)

/obj/item/storage/pouch/engineer/drone
	desc = "A techy-looking pouch for storing extra cables."
	icon_state = "drone"

/obj/item/storage/pouch/engineer/preloaded/drone
	desc = "A techy-looking pouch for storing extra cables."
	icon_state = "drone"

//internals
/obj/item/storage/pouch/internals
	name = "internals pouch"
	desc = "A pouch with protective lining for sensitive emergency equipment. The shape doesn't leave room for much else."
	icon_state = "o2"

/obj/item/storage/pouch/internals/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 3
	atom_storage.max_total_storage = 20
	atom_storage.set_holdable(list(
		/obj/item/clothing/mask/breath,
		/obj/item/tank/internals/emergency_oxygen,
		/obj/item/reagent_containers/hypospray/medipen,
		))

/obj/item/storage/pouch/internals/preloaded

/obj/item/storage/pouch/internals/preloaded/PopulateContents()
	new /obj/item/clothing/mask/breath(src)
	new /obj/item/tank/internals/emergency_oxygen(src)
	new /obj/item/reagent_containers/hypospray/medipen(src)

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

/obj/item/storage/pouch/holding/leadership/PopulateContents()
	new /obj/item/card/id/advanced/silver/leader_spare(src)
	new /obj/item/card/access_inscriber/choice(src)
	new /obj/item/clothing/neck/stethoscope(src)
	new /obj/item/door_remote/captain(src)
	new /obj/item/paper/fluff/leadership_assignment(src)

//traitor
/obj/item/storage/pouch/traitor
	name = "suspicious pouch"
	desc = "A compact, ergonomically designed pouch for holding more things than usual. it's decorated with shameless Syndicate symbols."
	icon_state = "syndicate"
	item_flags = EXAMINE_SKIP

/obj/item/storage/pouch/traitor/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 8
	atom_storage.max_total_storage = 8
	atom_storage.silent = TRUE

/obj/item/storage/pouch/traitor/nanotrasen
	desc = "A compact, ergonomically designed pouch for holding more things than usual. it's decorated with shameless Nanotrasen symbols."
	icon_state = "nanotrasen"

/obj/item/storage/pouch/traitor/sinister
	desc = "A compact, ergonomically designed pouch for holding more things than usual. It has a sinister look to it."
	icon_state = "sinister red"

//flares
/obj/item/storage/pouch/flares
	name = "flare pouch"
	desc = "A pouch with narrow slots for storing a few flares. The shape doesn't leave room for much else."
	icon_state = "flare"
/obj/item/storage/pouch/flares/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 6
	atom_storage.max_total_storage = 12
	atom_storage.set_holdable(list(
		/obj/item/flashlight/flare,
		))
/obj/item/storage/pouch/flares/preloaded/PopulateContents()
	new /obj/item/flashlight/flare(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/flashlight/flare(src) // lmao

// bullet pouches
/obj/item/storage/pouch/bullet
	name = "ammo pouch"
	desc = "A pouch for storing considerable amounts of loose ammo."
	icon_state = "ammo"
/obj/item/storage/pouch/bullet/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_TINY
	atom_storage.max_slots = 14
	atom_storage.max_total_storage = 14
	atom_storage.allow_quick_gather = TRUE
	atom_storage.numerical_stacking = TRUE
	atom_storage.set_holdable(list(
		/obj/item/ammo_casing,
		))

/obj/item/storage/pouch/bullet/ammo_357/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/a357(src)
/obj/item/storage/pouch/bullet/ammo_357/traitor
	icon_state = "ammo_syndicate"
	item_flags = EXAMINE_SKIP

/obj/item/storage/pouch/bullet/ammo_minislug/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/minislug(src)
/obj/item/storage/pouch/bullet/ammo_minislug/traitor
	icon_state = "ammo_syndicate"
	item_flags = EXAMINE_SKIP

/obj/item/storage/pouch/bullet/ammo_minislug_surplus/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/minislug/surplus(src)
/obj/item/storage/pouch/bullet/ammo_minislug_surplus/traitor
	icon_state = "ammo_syndicate"
	item_flags = EXAMINE_SKIP

// shuriken pouch
/obj/item/storage/pouch/throwingstar
	name = "shuriken pouch"
	desc = "A pouch for holding shurikens."
	icon_state = "softpouch_black"
	item_flags = EXAMINE_SKIP

/obj/item/storage/pouch/throwingstar/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 7
	atom_storage.max_total_storage = 14
	atom_storage.allow_quick_gather = TRUE
	atom_storage.numerical_stacking = TRUE
	atom_storage.set_holdable(list(
		/obj/item/throwing_star,
		/obj/item/gps/off, // replace this with a pinpointer some day
		))
	atom_storage.silent = TRUE

/obj/item/storage/pouch/throwingstar/loaded/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/throwing_star(src)
/obj/item/storage/pouch/throwingstar/tracking/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/throwing_star/tracking(src)
	new /obj/item/gps/off(src)
/obj/item/storage/pouch/throwingstar/hunting/PopulateContents()
	for(var/i in 1 to 6)
		new /obj/item/throwing_star/tracking/traitor(src)
	new /obj/item/gps/off(src)

// generic - keep this list at the bottom please
/obj/item/storage/pouch/grey
	icon_state = "grey"

/obj/item/storage/pouch/black
	icon_state = "black"

/obj/item/storage/pouch/tactical
	icon_state = "tactical"

// generic loaded
/obj/item/storage/pouch/tactical/ammo_9mm/PopulateContents() // god have mercy on me for wasting 1kb
	new /obj/item/ammo_box/magazine/m9mm(src)
	new /obj/item/ammo_box/magazine/m9mm(src)
	new /obj/item/ammo_box/magazine/m9mm(src)

/obj/item/storage/pouch/tactical/ammo_9mm_fire/PopulateContents()
	new /obj/item/ammo_box/magazine/m9mm/fire(src)
	new /obj/item/ammo_box/magazine/m9mm/fire(src)
	new /obj/item/ammo_box/magazine/m9mm/fire(src)

/obj/item/storage/pouch/tactical/xrayflash/PopulateContents()
	new /obj/item/assembly/flash/handheld/xray(src)
	new /obj/item/assembly/flash/handheld/xray(src)
	new /obj/item/assembly/flash/handheld/xray(src)

// BELTS // BELTS // BELTS
// BELTS // BELTS // BELTS
// BELTS // BELTS // BELTS
/obj/item/storage/belt/utility/small
	name = "belt"
	desc = "A trendy space-grade belt with an inbuilt digital clock. You can't really see it while you're wearing it, though."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "belt"
	inhand_icon_state = "security"
	worn_icon_state = "spacer"
	content_overlays = TRUE
	alternate_worn_layer = EARS_LAYER
	pickup_sound = 'sound/items/handling/cloth_pickup.ogg'
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/belt/utility/small/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL

/obj/item/storage/belt/utility/small/PopulateContents()
		new /obj/item/storage/pouch/grey(src)

// TOOLBOX // TOOLBOX // TOOLBOX

// uplink toolboxes
/obj/item/storage/toolbox/syndicatehardsuit
	name = "suspicious arms case"
	desc = "A hefty arms case that could probably do some serious damage. It has a red serpent silhouette painted on it."
	icon = 'scoundrel/icons/obj/storage/weaponcase.dmi'
	icon_state = "syndicate"
	inhand_icon_state = "weaponcase_syndicate"
	lefthand_file = 'scoundrel/icons/mob/inhands/scoundrel_lefthand.dmi'
	righthand_file = 'scoundrel/icons/mob/inhands/scoundrel_righthand.dmi'
	force = 15
	throwforce = 18
	material_flags = NONE

/obj/item/storage/toolbox/syndicatehardsuit/PopulateContents()
	new /obj/item/clothing/suit/hooded/hardsuit/syndicate(src)
	new /obj/item/tank/jetpack/advanced/compact/syndicate(src)

/obj/item/storage/toolbox/loadout
	name = "arms case"
	desc = "A hefty arms case."
	icon = 'scoundrel/icons/obj/storage/weaponcase.dmi'
	icon_state = "black"
	inhand_icon_state = "weaponcase_syndicate"
	lefthand_file = 'scoundrel/icons/mob/inhands/scoundrel_lefthand.dmi'
	righthand_file = 'scoundrel/icons/mob/inhands/scoundrel_righthand.dmi'
	force = 12
	throwforce = 12
	material_flags = NONE
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/toolbox/loadout/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL

// skirmisher kit
/obj/item/storage/toolbox/loadout/skirmisher/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol(src)
	new /obj/item/storage/pouch/tactical/ammo_9mm(src)
	new /obj/item/storage/box/syndie_kit/imp_adrenal/single(src)
	new /obj/item/clothing/shoes/chameleon/noslip(src)
	new /obj/item/grenade/c4(src)
	new /obj/item/gun/energy/recharge/ebow(src)
	new /obj/item/personalshield/standard/advanced(src) // freebie
	new /obj/item/storage/pouch/traitor(src) // freebie

// saboteur kit
/obj/item/storage/toolbox/loadout/saboteur/PopulateContents()
	new /obj/item/pen/sleepy(src)
	new /obj/item/pen/edagger(src)
	new /obj/item/toy/plush/carpplushie/dehy_carp(src)
	new /obj/item/toy/plush/carpplushie/dehy_carp(src)
	new /obj/item/storage/box/syndie_kit/emp(src)
	new /obj/item/storage/box/syndie_kit/imp_storage(src)
	new /obj/item/grenade/c4(src)
	new /obj/item/grenade/c4(src)
	new /obj/item/storage/pouch/traitor(src) // freebie

// sleepingcarp kit
/obj/item/storage/toolbox/loadout/sleepingcarp/PopulateContents()
	new /obj/item/book/granter/martial/carp(src)
	new /obj/item/personalshield/standard/traitor(src)
	new /obj/item/clothing/suit/hooded/carp_costume/spaceproof(src)
	new /obj/item/clothing/mask/gas/carp(src)
	new /obj/item/toy/plush/carpplushie/dehy_carp(src)

// bomber kit
/obj/item/storage/toolbox/loadout/bomber/PopulateContents()
	new /obj/item/storage/backpack/duffelbag/syndie/x4(src)
	new /obj/item/storage/pouch/traitor(src)
	new /obj/item/grenade/syndieminibomb(src)
	new /obj/item/grenade/syndieminibomb(src)
	new /obj/item/grenade/c4(src)
	new /obj/item/grenade/c4(src)
	new /obj/item/grenade/c4(src)
	new /obj/item/grenade/c4(src)
	new /obj/item/sbeacondrop/bomb(src)

// stealth kit
/obj/item/storage/toolbox/loadout/stealth/PopulateContents()
	new /obj/item/syndicate_teleporter(src)
	new /obj/item/storage/box/syndie_kit/imp_stealth(src)
	new /obj/item/mod/control/pre_equipped/infiltrator(src)
	new /obj/item/storage/toolbox/mini/syndicate/loaded(src)
	new /obj/item/soap/syndie(src)
	new /obj/item/card/emag/doorjack(src)
	new /obj/item/storage/pouch/tactical/xrayflash(src)

// executive kit
/obj/item/storage/toolbox/loadout/executive/PopulateContents()
	new /obj/item/storage/box/syndie_kit/imp_storage(src)
	new /obj/item/storage/fancy/cigarettes/cigpack_carp/e_derringer(src)
	new /obj/item/storage/pouch/bullet/ammo_minislug(src)
	new /obj/item/storage/pouch/bullet/ammo_minislug(src)
	new /obj/item/storage/briefcase/launchpad(src)
	new /obj/item/clothing/under/starsuit/executive(src)
	new /obj/item/clothing/head/helmet/space/starsuit(src)
	new /obj/item/clothing/shoes/laceup(src)
	for(var/i in 1 to 15)
		new /obj/item/stack/spacecash/c1000(src)

// brutal kit
/obj/item/storage/toolbox/loadout/brutal/PopulateContents()
	new /obj/item/melee/tonfa/esword(src)
	new /obj/item/gun/ballistic/revolver(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/storage/pouch/bullet/ammo_357(src)
	new /obj/item/flashlight/emp(src)
	new /obj/item/storage/box/r_bolas(src)
	new /obj/item/storage/fancy/cigarettes/cigpack_syndicate(src)

// hitman kit
/obj/item/storage/toolbox/loadout/hitman/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol(src)
	new /obj/item/clothing/glasses/thermal/syndi(src)
	new /obj/item/storage/box/syndie_kit/imp_adrenal(src)
	new /obj/item/storage/pouch/tactical/ammo_9mm(src)
	new /obj/item/storage/pouch/tactical/ammo_9mm_fire(src)

// slippery kit
/obj/item/storage/toolbox/loadout/slippery/PopulateContents()
	new /obj/item/gun/ballistic/automatic/c20r/toy/unrestricted/riot(src)
	new /obj/item/pen/edagger(src)
	new /obj/item/ammo_box/foambox/riot(src)
	new /obj/item/ammo_box/foambox/riot(src)
	new /obj/item/clothing/shoes/chameleon/noslip(src)
	new /obj/item/grenade/clusterbuster/soap(src)
	new /obj/item/grenade/clusterbuster/soap(src)
	new /obj/item/grenade/clusterbuster/soap(src)
	new /obj/item/storage/toolbox/emergency/turret(src)

// operative kit
/obj/item/storage/toolbox/loadout/operative/PopulateContents()
	new /obj/item/storage/toolbox/syndicatehardsuit(src)
	new /obj/item/clothing/mask/gas/syndicate(src)
	new /obj/item/gun/ballistic/shotgun/bulldog/unrestricted(src)
	new /obj/item/storage/belt/bandolier/lethal(src)
	new /obj/item/card/emag/doorjack(src)
	new /obj/item/grenade/c4(src)
	new /obj/item/implanter/explosive(src)

// shadow kit
/obj/item/storage/toolbox/loadout/shadow/PopulateContents()
	new /obj/item/book/granter/action/spell/shadow_walk(src)
	new /obj/item/book/granter/action/spell/smoke/robeless/shadowkit(src)
	new /obj/item/clothing/glasses/night(src)
	new /obj/item/storage/box/r_bolas(src)
	new /obj/item/card/access_inscriber/syndicate(src)
//	new /obj/item/implanter/ventcrawling/deluxe(src) // add this back in when the exploits are fixed

// surgeon kit
/obj/item/storage/toolbox/loadout/surgeon/PopulateContents()
	new /obj/item/storage/backpack/duffelbag/syndie/surgery(src)
	new /obj/item/survivalcapsule/traitor(src)
	new /obj/item/gun/syringe/syndicate(src)
	new /obj/item/storage/box/syndie_kit/chemical(src)
	new /obj/item/disk/surgery/brainwashing(src)
	new /obj/item/pen/sleepy(src)
	new /obj/item/card/access_inscriber/syndicate(src)
	new /obj/item/paper/fluff/poison_kit_guide(src)

// infiltration specialist kit
/obj/item/storage/toolbox/loadout/bigboss/PopulateContents()
	new /obj/item/book/granter/martial/cqc(src)
	new /obj/item/implanter/stealth(src)
	new /obj/item/implanter/adrenalin(src)
	new /obj/item/storage/toolbox/mini/syndicate/loaded(src)
	new /obj/item/clothing/under/syndicate(src)
	new /obj/item/clothing/head/costume/bandana(src)

// mini toolboxes

/obj/item/storage/toolbox/mini
	name = "mini toolbox"
	desc = "Caution. Slightly robust."
	icon = 'scoundrel/icons/obj/storage/mini-toolbox.dmi'
	icon_state = "blue"
	force = 8
	throwforce = 8
	w_class = WEIGHT_CLASS_NORMAL
	has_latches = FALSE
	material_flags = NONE
	inhand_icon_state = "toolbox_blue"
	
/obj/item/storage/toolbox/mini/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL

/obj/item/storage/toolbox/mini/mechanical/loaded/PopulateContents()
	new /obj/item/screwdriver(src)
	new /obj/item/wrench(src)
	new /obj/item/weldingtool(src)
	new /obj/item/crowbar(src)
	new /obj/item/analyzer(src)
	new /obj/item/wirecutters(src)

/obj/item/storage/toolbox/mini/emergency
	icon_state = "red"
	inhand_icon_state = "toolbox_red"

/obj/item/storage/toolbox/mini/emergency/loaded/PopulateContents()
	new /obj/item/crowbar/red(src)
	new /obj/item/weldingtool/mini(src)
	new /obj/item/extinguisher/mini(src)
	switch(rand(1,3))
		if(1)
			new /obj/item/flashlight(src)
		if(2)
			new /obj/item/flashlight/glowstick(src)
		if(3)
			new /obj/item/flashlight/flare(src)
	new /obj/item/radio/off(src)

/obj/item/storage/toolbox/mini/electrical
	icon_state = "yellow"
	inhand_icon_state = "toolbox_yellow"

/obj/item/storage/toolbox/mini/electrical/loaded/PopulateContents()
	var/pickedcolor = pick(GLOB.cable_colors)
	new /obj/item/screwdriver(src)
	new /obj/item/wirecutters(src)
	new /obj/item/t_scanner(src)
	new /obj/item/crowbar(src)
	var/obj/item/stack/cable_coil/new_cable_one = new(src, MAXCOIL)
	new_cable_one.set_cable_color(pickedcolor)
	var/obj/item/stack/cable_coil/new_cable_two = new(src, MAXCOIL)
	new_cable_two.set_cable_color(pickedcolor)
	if(prob(5))
		new /obj/item/clothing/gloves/color/yellow(src)
	else
		var/obj/item/stack/cable_coil/new_cable_three = new(src, MAXCOIL)
		new_cable_three.set_cable_color(pickedcolor)

/obj/item/storage/toolbox/mini/engineer
	icon_state = "yellow"
	inhand_icon_state = "toolbox_yellow"

/obj/item/storage/toolbox/mini/engineer/loaded/PopulateContents()
	new /obj/item/screwdriver(src)
	new /obj/item/wrench(src)
	new /obj/item/weldingtool(src)
	new /obj/item/crowbar(src)
	new /obj/item/wirecutters(src)
	new /obj/item/multitool(src)
	new /obj/item/storage/pouch/engineer/preloaded(src)

/obj/item/storage/toolbox/mini/syndicate
	desc = "Caution. Slightly suspicious."
	icon_state = "sus"
	inhand_icon_state = "toolbox_syndi"
	force = 12
	throwforce = 15

/obj/item/storage/toolbox/mini/syndicate/loaded/PopulateContents()
	new /obj/item/screwdriver/nuke/stealth(src)
	new /obj/item/wrench(src)
	new /obj/item/weldingtool/largetank(src)
	new /obj/item/crowbar/red(src)
	new /obj/item/wirecutters(src, "red")
	new /obj/item/multitool/stealth(src)
	new /obj/item/clothing/gloves/combat(src)

// spawners - move this to a spawners file
/obj/effect/spawner/random/mini_toolbox
	name = "empty mini toolbox spawner"
	icon = 'scoundrel/icons/obj/storage/mini-toolbox.dmi'
	icon_state = "loot"
	loot = list(
		/obj/item/storage/toolbox/mini/mechanical = 1,
		/obj/item/storage/toolbox/mini/emergency = 1,
		/obj/item/storage/toolbox/mini/electrical = 1,
	)
/obj/effect/spawner/random/mini_toolbox_loaded
	name = "mini toolbox spawner"
	icon = 'scoundrel/icons/obj/storage/mini-toolbox.dmi'
	icon_state = "loot"
	loot = list(
		/obj/item/storage/toolbox/mini/mechanical/loaded = 1,
		/obj/item/storage/toolbox/mini/emergency/loaded = 1,
		/obj/item/storage/toolbox/mini/electrical/loaded = 1,
	)

// SUITSTORAGE // SUITSTORAGE // SUITSTORAGE
// SUITSTORAGE // SUITSTORAGE // SUITSTORAGE
// SUITSTORAGE // SUITSTORAGE // SUITSTORAGE

// suit storage needs code work to accommodate to space undersuits. i dont want to do it
/obj/machinery/suit_storage_unit/starsuit
	storage_type = /obj/item/clothing/under/starsuit
	mask_type = /obj/item/clothing/mask/gas
	helmet_type = /obj/item/clothing/head/helmet/space/starsuit

/obj/machinery/suit_storage_unit/starsuit/engineering
	helmet_type = /obj/item/clothing/head/helmet/space/starsuit/engineer

/obj/machinery/suit_storage_unit/syndicate_hardsuit
	storage_type = /obj/item/tank/jetpack/advanced/compact/syndicate
	mask_type = /obj/item/clothing/mask/gas/syndicate
	suit_type = /obj/item/clothing/suit/hooded/hardsuit/syndicate
