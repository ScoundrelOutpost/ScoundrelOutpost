/datum/smuggler_satchel_contents
	// used to determine the contents of smuggler satchels
	
	var/junk = list(
		//always spawns 1-2
		/obj/item/food/grown/cannabis,
		/obj/item/storage/box/fireworks/dangerous,
		/obj/item/storage/pill_bottle/happy,
		/obj/item/storage/pill_bottle/lsd,
		/obj/item/storage/pill_bottle/stimulant,
		/obj/item/toy/cards/deck/syndicate,
		/obj/item/reagent_containers/cup/glass/bottle/absinthe,
		/obj/item/clothing/under/syndicate,
		/obj/item/clothing/under/syndicate/bloodred,
		/obj/item/clothing/mask/gas/syndicate,
		/obj/item/storage/pouch/tactical,
		/obj/item/stack/spacecash/c200,
		/obj/item/clothing/gloves/color/yellow,
	)
	var/common = list(
		// 50% chance to spawn 1-2
		/obj/item/pen/edagger,
		/obj/item/pen/sleepy,
		/obj/item/storage/fancy/cigarettes/cigpack_syndicate,
		/obj/item/grenade/c4,
		/obj/item/grenade/c4/x4,
		/obj/item/storage/pouch/traitor/nanotrasen,
		/obj/item/storage/pouch/traitor,
		/obj/item/soap/syndie,
		/obj/item/storage/box/bolas,
		/obj/item/stack/spacecash/c500,
		/obj/item/storage/toolbox/mini/syndicate/loaded,
		/obj/item/pinpointer/crew,
		/obj/item/melee/tonfa,
		/obj/item/gun/energy/e_gun/defender,
	)
	var/medium = list(
		// 15% chance to spawn 1
		/obj/item/ammo_box/a357,
		/obj/item/storage/pouch/tactical/ammo_9mm,
		/obj/item/clothing/neck/heretic_focus,
		/obj/item/storage/pouch/tactical/xrayflash,
		/obj/item/camera_bug,
		/obj/item/toy/plush/carpplushie/dehy_carp,
		/obj/item/tank/jetpack/advanced/compact/syndicate,
		/obj/item/pinpointer/nuke,
		/obj/item/circuitboard/computer/communications/syndicate,
		/obj/item/stack/spacecash/c1000,
		/obj/item/gun/energy/e_gun/defender/mini,
	)
	var/rare = list(
		// 5% chance to spawn 1
		/obj/item/gun/ballistic/automatic/pistol,
		/obj/item/melee/energy/sword/saber,
		/obj/item/melee/powerfist,
		/obj/item/implanter/uplink/precharged,
		/obj/item/card/emag,
		/obj/item/card/emag/doorjack,
		/obj/item/organ/internal/cyberimp/arm/dualmodesword,
		/obj/item/organ/internal/cyberimp/arm/katana,
		/obj/item/clothing/suit/hooded/cultrobes/eldritch,
		/obj/item/clothing/suit/hooded/hardsuit/syndicate,
		/obj/item/clothing/gloves/toagloves,
	)
	var/ultra = list(
		// 1% chance to spawn 1
		/obj/item/dice/d20/fate,
		/obj/item/dice/d20,
	)
