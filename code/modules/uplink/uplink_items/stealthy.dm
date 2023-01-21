/datum/uplink_category/stealthy
	name = "Stealthy Weapons"
	weight = 8

/datum/uplink_item/stealthy_weapons
	category = /datum/uplink_category/stealthy

/datum/uplink_item/stealthy_weapons/dart_pistol
	name = "Dart Pistol"
	desc = "A miniaturized version of a normal syringe gun. It is very quiet when fired and can fit into any \
			space a small item can."
	item = /obj/item/gun/syringe/syndicate
	cost = 25

/datum/uplink_item/stealthy_weapons/foampistol
	name = "Toy Pistol with Riot Darts"
	desc = "An innocent-looking toy pistol designed to fire foam darts. Comes loaded with riot-grade \
			darts effective at incapacitating a target."
	item = /obj/item/gun/ballistic/automatic/pistol/toy/riot
	cost = 5
	surplus = 10
	purchasable_from = ~UPLINK_NUKE_OPS

/datum/uplink_item/stealthy_weapons/dehy_carp
	name = "Dehydrated Space Carp"
	desc = "Looks like a plush toy carp, but just add water and it becomes a real-life space carp! Activate in \
			your hand before use so it knows not to kill you."
	item = /obj/item/toy/plush/carpplushie/dehy_carp
	cost = 5

/datum/uplink_item/stealthy_weapons/edagger
	name = "Energy Dagger"
	desc = "A dagger made of energy that looks and functions as a pen when off."
	item = /obj/item/pen/edagger
	cost = 10

/datum/uplink_item/stealthy_weapons/traitor_chem_bottle
	name = "Poison Kit"
	desc = "An assortment of deadly chemicals packed into a compact box. Comes with a syringe for more precise application."
	item = /obj/item/storage/box/syndie_kit/chemical
	cost = 10

/*/datum/uplink_item/stealthy_weapons/holster
	name = "Syndicate Holster"
	desc = "A useful little device that allows for inconspicuous carrying of guns using chameleon technology. It also allows for badass gun-spinning."
	item = /obj/item/storage/belt/holster/chameleon
	cost = 1*/

/datum/uplink_item/stealthy_weapons/sleepy_pen
	name = "Sleepy Pen"
	desc = "A syringe disguised as a functional pen, filled with a potent mix of drugs, including a \
			strong anesthetic and a chemical that prevents the target from speaking. \
			The pen holds one dose of the mixture, and can be refilled with any chemicals. Note that before the target \
			falls asleep, they will be able to move and act."
	item = /obj/item/pen/sleepy
	cost = 20
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/stealthy_weapons/origami_kit
	name = "Origami Guide"
	desc = "A guide on how to craft masterful works of origami, allowing you to transform normal pieces of paper into \
			perfectly aerodynamic (and potentially lethal) paper airplanes."
	item = /obj/item/book/granter/action/origami
	cost = 25

/datum/uplink_item/stealthy_weapons/martialarts
	name = "Martial Arts Scroll"
	desc = "This scroll contains the secrets of an ancient martial arts technique. You will master unarmed combat \
			and gain the ability to swat bullets from the air, but you will also refuse to use dishonorable ranged weaponry."
	item = /obj/item/book/granter/martial/carp
	cost = 70
	surplus = 0
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/stealthy_weapons/crossbow
	name = "Miniature Energy Crossbow"
	desc = "A short bow mounted across a tiller in miniature. \
	Small enough to fit into a pocket or slip into a bag unnoticed. \
	It will synthesize and fire bolts tipped with a debilitating \
	toxin that will damage and disorient targets, causing them to \
	slur as if inebriated. It can produce an infinite number \
	of bolts, but takes time to automatically recharge after each shot."
	item = /obj/item/gun/energy/recharge/ebow
	cost = 25

// Scoundrel content
/datum/uplink_item/stealthy_weapons/xrayflash
	name = "X-Ray Flashes"
	desc = "A pouch containing three powerful x-ray flashes. Highly effective at blinding victims \
	and ignores most forms of eye protection. Exposure to multiple flashes is known to cause lasting eye damage. \
	Each one only has one charge. Useful for getaways or ambushes."
	item = /obj/item/storage/pouch/tactical/xrayflash
	cost = 10
	limited_stock = 2

/datum/uplink_item/stealthy_weapons/concealed_weapon_bay
	name = "Concealed Weapon Bay"
	desc = "A modification for non-combat exosuits that allows them to equip one piece of equipment designed for combat units. \
			Attach to an exosuit with an existing equipment to disguise the bay as that equipment. The sacrificed equipment will be lost.\
			Alternatively, you can attach the bay to an empty equipment slot, but the bay will not be concealed. Once the bay is \
			attached, an exosuit weapon can be fitted inside."
	item = /obj/item/mecha_parts/mecha_equipment/concealed_weapon_bay
	cost = 15
