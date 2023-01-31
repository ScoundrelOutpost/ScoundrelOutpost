// File organised based on progression

//All bundles and telecrystals
/datum/uplink_category/dangerous
	name = "Conspicuous Weapons"
	weight = 9

/datum/uplink_item/dangerous
	category = /datum/uplink_category/dangerous

/datum/uplink_item/dangerous/pistol
	name = "Agent Pistol"
	desc = "An easily concealed, clandestine handgun that uses 9mm auto rounds in 8-round magazines. Has a \
			threaded barrel for suppressors."
	item = /obj/item/gun/ballistic/automatic/pistol
	cost = 25
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/*/datum/uplink_item/dangerous/throwingweapons
	name = "Box of Throwing Weapons"
	desc = "A box of shurikens and reinforced bolas from ancient Earth martial arts. They are highly effective \
			throwing weapons. The bolas can knock a target down and the shurikens will embed into limbs."
	progression_minimum = 10 MINUTES
	item = /obj/item/storage/box/syndie_kit/throwing_weapons
	cost = 15
	illegal_tech = FALSE*/

/datum/uplink_item/dangerous/r_bolas
	name = "Box of Reinforced Bolas"
	desc = "A box of weighted bolas for tripping up opponents, in addition to being a debilitating leg restraint."
	progression_minimum = 10 MINUTES
	item = /obj/item/storage/box/r_bolas
	cost = 10
	illegal_tech = FALSE

/datum/uplink_item/dangerous/sword
	name = "Energy Sword"
	desc = "The energy sword is an edged weapon with a blade of pure energy. The sword is small enough to be \
			pocketed when inactive. Activating it produces a loud, distinctive noise."
	item = /obj/item/melee/tonfa/esword
	cost = 20
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/powerfist
	name = "Power Fist"
	desc = "The power-fist is a metal gauntlet with a built-in piston-ram powered by an external gas supply.\
			Upon hitting a target, the piston-ram will extend forward to make contact for some serious damage. \
			Using a wrench on the piston valve will allow you to tweak the amount of gas used per punch to \
			deal extra damage and hit targets further. Use a screwdriver to take out any attached tanks."
	progression_minimum = 20 MINUTES
	item = /obj/item/melee/powerfist
	cost = 30
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/*/datum/uplink_item/dangerous/rapid
	name = "Gloves of the North Star"
	desc = "These gloves let the user punch people very fast. Does not improve weapon attack speed or the meaty fists of a hulk."
	progression_minimum = 20 MINUTES
	item = /obj/item/clothing/gloves/rapid
	cost = 50*/


// Medium progression cost

/datum/uplink_item/dangerous/doublesword
	name = "Double-Bladed Energy Sword"
	desc = "The double-bladed energy sword does slightly more damage than a standard energy sword and will deflect \
			all energy projectiles, but requires two hands to wield."
	progression_minimum = 30 MINUTES
	item = /obj/item/dualsaber
	cost = 60
	cant_discount = TRUE // it combos hard
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/doublesword/get_discount()
	return pick(4;0.8,2;0.65,1;0.5)

/datum/uplink_item/dangerous/guardian
	name = "Holoparasites"
	desc = "Though capable of near sorcerous feats via use of hardlight holograms and nanomachines, they require an \
			organic host as a home base and source of fuel. Holoparasites come in various types and share damage with their host."
	progression_minimum = 30 MINUTES
	item = /obj/item/storage/box/syndie_kit/guardian
	cost = 60
	surplus = 0
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
	restricted = TRUE

/datum/uplink_item/dangerous/revolver
	name = ".357 Revolver"
	desc = "A brutally simple Syndicate revolver that fires .357 Magnum rounds and has 7 chambers."
	item = /obj/item/gun/ballistic/revolver
	progression_minimum = 30 MINUTES
	cost = 60
	surplus = 50
	purchasable_from = ~UPLINK_CLOWN_OPS

// scoundrel content
/datum/uplink_item/dangerous/personalshield
	name = "Experimental Shield-Emitter"
	desc = "A dynamic-field projector capable of deflecting both projectiles & melee, but not thrown weapons or unarmed strikes. \
	More powerful than any typical personal shield, but caution should be taken with the knowledge that the integrity shares \
	a pool between melee strikes and projectiles."
	item = /obj/item/personalshield/standard/traitor
	cost = 50

/datum/uplink_item/dangerous/energy_derringer
	name = "Executive Pistol"
	desc = "A neomodern take on the compact two-shot derringer, ejecting darkmatter-driven laser minislugs. Practically \
	undetectable to cursory examination even in the hand, and hits viciously. The ideal weapon of choice for underhanded hitmen or \
	merciless corporate climbers."
	item = /obj/item/storage/fancy/cigarettes/cigpack_carp/e_derringer
	cost = 25

/datum/uplink_item/dangerous/blastcannon
	name = "Blast Cannon"
	desc = "A highly specialized weapon, the Blast Cannon is actually relatively simple. It contains an attachment for a tank transfer valve mounted to an angled pipe specially constructed \
			withstand extreme pressure and temperatures, and has a mechanical trigger for triggering the transfer valve. Essentially, it turns the explosive force of a bomb into a narrow-angle \
			blast wave \"projectile\". Aspiring scientists may find this highly useful, as forcing the pressure shockwave into a narrow angle seems to be able to bypass whatever quirk of physics \
			disallows explosive ranges above a certain distance, allowing for the device to use the theoretical yield of a transfer valve bomb, instead of the factual yield. It's simple design makes it easy to conceal."
	progression_minimum = 45 MINUTES
	item = /obj/item/gun/blastcannon
	cost = 70 //High cost because of the potential for extreme damage in the hands of a skilled scientist.

/datum/uplink_item/dangerous/laser_arm
	name = "Laser Arm Implant"
	desc = "An implant that grants you a recharging laser gun inside your arm. Weak to EMPs. Comes with a syndicate autosurgeon for immediate self-application."
	progression_minimum = 30 MINUTES
	cost = 75
	item = /obj/item/autosurgeon/syndicate/laser_arm

/datum/uplink_item/dangerous/turretbox
	name = "Disposable Sentry Gun"
	desc = "A disposable sentry gun deployment system cleverly disguised as a toolbox, apply wrench for functionality."
	progression_minimum = 15 MINUTES
	item = /obj/item/storage/toolbox/emergency/turret
	cost = 10
	limited_stock = 1 // as of writing this, they can be deployed on top of each other. until fixed, this is a preventative measure
