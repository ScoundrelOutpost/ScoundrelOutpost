//All bundles and telecrystals
/datum/uplink_category/bundle
	name = "Bundles"
	weight = 10

/datum/uplink_item/bundles_tc
	category = /datum/uplink_category/bundle
	surplus = 0
	cant_discount = TRUE

/datum/uplink_item/bundles_tc/random
	name = "Random Item"
	desc = "Picking this will purchase a random item you can afford. Not recommended for beginners."
	item = /obj/effect/gibspawner/generic // non-tangible item because techwebs use this path to determine illegal tech
	cost = 0
	cost_override_string = "Varies"

/datum/uplink_item/bundles_tc/random/purchase(mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/list/possible_items = list()
	for(var/datum/uplink_item/item_path as anything in SStraitor.uplink_items_by_type)
		var/datum/uplink_item/uplink_item = SStraitor.uplink_items_by_type[item_path]
		if(src == uplink_item || !uplink_item.item)
			continue
		if(!handler.can_purchase_item(user, uplink_item))
			continue
		possible_items += uplink_item

	if(possible_items.len)
		var/datum/uplink_item/uplink_item = pick(possible_items)
		log_uplink("[key_name(user)] purchased a random uplink item from [handler.owner]'s uplink with [handler.telecrystals] telecrystals remaining")
		SSblackbox.record_feedback("tally", "traitor_random_uplink_items_gotten", 1, initial(uplink_item.name))
		handler.purchase_item(user, uplink_item)

/datum/uplink_item/bundles_tc/telecrystal
	name = "1 Raw Telecrystal"
	desc = "A telecrystal in its rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal
	cost = 1
	// Don't add telecrystals to the purchase_log since
	// it's just used to buy more items (including itself!)
	purchase_log_vis = FALSE

/datum/uplink_item/bundles_tc/telecrystal/five
	name = "5 Raw Telecrystals"
	desc = "Five telecrystals in their rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal/five
	cost = 5

/datum/uplink_item/bundles_tc/telecrystal/twentyfive
	name = "25 Raw Telecrystals"
	desc = "Twenty-five telecrystals in their rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal/twentyfive
	cost = 25

/datum/uplink_item/bundles_tc/telecrystal/fifty
	name = "50 Raw Telecrystals"
	desc = "Fifty telecrystals in their rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal/fifty
	cost = 50

/datum/uplink_item/bundles_tc/telecrystal/onehundred
	name = "100 Raw Telecrystals"
	desc = "One-hundred telecrystals in their rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal/onehundred
	cost = 100


// bundles
/datum/uplink_category/loadout
	name = "Loadouts"
	weight = 0

/datum/uplink_item/loadout
	category = /datum/uplink_category/loadout
	surplus = 0
	cant_discount = TRUE
	restricted = TRUE
	limited_stock = 1
	illegal_tech = FALSE
	cost = TELECRYSTALS_DEFAULT // all of em

/datum/uplink_item/loadout/skirmisher
	name = "Skirmisher Kit"
	desc = "A ready-assembled loadout suited to evasive, skirmish-focused combat methods. Not recommended for beginners. Comes loaded with: \
	Agent pistol, 9mm ammo, a single adrenal, no-slip shoes, a brick of c4, a mini energy crossbow and an advanced personal shield. \
	Not recommended for beginners."
	item = /obj/item/storage/toolbox/loadout/skirmisher

/datum/uplink_item/loadout/saboteur
	name = "Saboteur Kit"
	desc = "A ready-assembled loadout suited to sabotage and indirect harassment. Comes loaded with: \
	A sleepy pen, an energy dagger, an EMP kit, a storage implant, two dehydrated carp, two bricks of c4, and a stealthy pouch."
	item = /obj/item/storage/toolbox/loadout/saboteur

/datum/uplink_item/loadout/sleepingcarp
	name = "Gnashing Shark Kit"
	desc = "A ready-assembled loadout suited to a fearless approach to combat. Comes loaded with: \
	A Sleeping Carp martial arts scroll, an experimental personal shield, a dehydrated carp, and a highly mobile, spaceproof carp suit. \
	Not recommended for beginners."
	item = /obj/item/storage/toolbox/loadout/sleepingcarp

/datum/uplink_item/loadout/bomber
	name = "Bomber Kit"
	desc = "A ready-assembled loadout that doesn't overcomplicate things. Comes loaded with: \
	A compact x4 duffelbag, a stealthy pouch, two minibombs, four bricks of c4, and a full-sized bomb."
	item = /obj/item/storage/toolbox/loadout/bomber

/datum/uplink_item/loadout/stealth
	name = "Stealth Kit"
	desc = "A ready-assembled loadout that prioritizes disguise and evasion. Comes loaded with: \
	An experimental hand-teleporter, a stealth implant, an infiltrator suit, a mini-toolbox with stealth tools, some syndicate soap, \
	a doorjack, and a pouch of x-ray flashes."
	item = /obj/item/storage/toolbox/loadout/stealth

/datum/uplink_item/loadout/executive
	name = "Executive Kit"
	desc = "A ready-assembled loadout with the means to buy anything with a pricetag. Comes loaded with: \
	A storage implant, an executive pistol, two laser-minislug pouches, a briefcase launchpad, a flashy executive starsuit, \
	and fifteen-thousand credits in unmarked bills."
	item = /obj/item/storage/toolbox/loadout/executive

/datum/uplink_item/loadout/brutal
	name = "Brutal Kit"
	desc = "A ready-assembled loadout suited to a viciously straightforward approach. Comes loaded with: \
	A plasma blade, a 357 revolver, a 357 speedloader and ammo-pouch, a box of reinforced bolas, and an EMP flashlight."
	item = /obj/item/storage/toolbox/loadout/brutal

/datum/uplink_item/loadout/hitman
	name = "Hitman Kit"
	desc = "A ready-assembled loadout suited to well-timed strikes. Comes loaded with: \
	An agent pistol, a pair of thermal glasses, an adrenal implant, a 9mm ammo-pouch, and a 9mm incendiary ammo-pouch. \
	Not recommended for beginners."
	item = /obj/item/storage/toolbox/loadout/hitman

/datum/uplink_item/loadout/slippery
	name = "Slippery Kit"
	desc = "A ready-assembled loadout for raising slippery hell. Comes loaded with: \
	A toy SMG loaded with riot darts, two extra boxes of riot darts, an energy dagger, some no-slip shoes, three soap clusterbangs, \
	and a disposable sentry gun."
	item = /obj/item/storage/toolbox/loadout/slippery

/datum/uplink_item/loadout/operative
	name = "Operative Kit"
	desc = "A ready-assembled loadout suited to aggressive space combat. Comes loaded with: \
	A syndicate hardsuit & jetpack, a bulldog shotgun, a bandolier loaded with lethal shells, \
	a doorjack, a brick of c4, and a microbomb implant."
	item = /obj/item/storage/toolbox/loadout/operative

/datum/uplink_item/loadout/shadow
	name = "Shadow Kit"
	desc = "A ready-assembled loadout for stalking the shadows. Comes loaded with: \
	A book on shadow-walking, granting the ability to disappear into darkness and recover health, a smoke spellbook, \
	a pair of nightvision goggles, a box of reinforced bolas, and a Syndicate access inscriber. \
	Not recommended for beginners."
	item = /obj/item/storage/toolbox/loadout/shadow

/datum/uplink_item/loadout/surgeon
	name = "Night Surgeon Kit"
	desc = "A ready-assembled loadout suited to kidnapping and medical crimes. Comes loaded with: \
	A Syndicate surgery bag, a Syndicate shelter capsule, a dart pistol, a poison kit, a brainwashing surgery disk, a sleepy pen, and \
	a Syndicate access inscriber. \
	Not recommended for beginners."
	item = /obj/item/storage/toolbox/loadout/surgeon

/datum/uplink_item/loadout/bigboss
	name = "Infiltration Specialist Kit"
	desc = "A ready-assembled loadout suited to advanced infiltration and close-quarters combat. Comes loaded with: \
	A CQC Manual, a stealth implant, an adrenal implant, a set of syndicate tools, and some old infiltrator clothes we found in the back. \
	Not recommended for beginners."
	item = /obj/item/storage/toolbox/loadout/bigboss

// freedbies
/datum/uplink_category/freebies
	name = "Standard Equipment"
	weight = 2
/datum/uplink_item/freebies
	category = /datum/uplink_category/freebies
	surplus = 0
	cant_discount = TRUE
	illegal_tech = FALSE
	cost = 0
	cost_override_string = "Free"

/datum/uplink_item/freebies/encryptionkey
	name = "Syndicate Encryption Key"
	desc = "A key that, when inserted into a radio headset, allows you to listen to all station department channels \
			as well as talk on an encrypted Syndicate channel with other agents that have the same key. In addition, this key also protects \
			your headset from radio jammers."
	item = /obj/item/encryptionkey/syndicate
	restricted = TRUE
	limited_stock = 1
	illegal_tech = FALSE

/datum/uplink_item/freebies/agent_card
	name = "Agent Identification Card"
	desc = "Agent cards prevent artificial intelligences from tracking the wearer, and can copy access \
			when swiped over other ID cards. In addition, they can be forged to display a new assignment, name and trim. \
			This can be done an unlimited amount of times. Some Syndicate areas and devices can only be accessed \
			with these cards."
	item = /obj/item/card/id/advanced/chameleon
	limited_stock = 1
	illegal_tech = FALSE

/datum/uplink_item/freebies/codespeak_manual
	name = "Codespeak Manual"
	desc = "Syndicate agents can be trained to use a series of codewords to convey complex information, which sounds like random concepts and drinks to anyone listening. \
			This manual teaches you this Codespeak. You can also hit someone else with the manual in order to teach them. Can only be used once."
	item = /obj/item/language_manual/codespeak_manual
	limited_stock = 1
	illegal_tech = FALSE

/datum/uplink_item/freebies/adv_firstaid
	name = "Combat First-Aid"
	desc = "An advanced first-aid kit for handling injuries sustained on operations. You only get one, so use it wisely."
	item = /obj/item/storage/medkit/traitorkit
	limited_stock = 1
	illegal_tech = FALSE

/datum/uplink_item/freebies/suppressor
	name = "Suppressor"
	desc = "A clandestine suppressor suited to a variety of weapons. Conveys intent to operate covertly -- good luck with that on a spacestation. Limited stock of two."
	item = /obj/item/suppressor
	limited_stock = 2
	illegal_tech = FALSE

/datum/uplink_item/freebies/camera_bug
	name = "Camera Bug"
	desc = "Enables you to view all cameras on the main network, set up motion alerts and track a target. \
			Bugging cameras allows you to disable them remotely."
	item = /obj/item/camera_bug
	limited_stock = 1
	illegal_tech = FALSE
	surplus = 25

/datum/uplink_item/freebies/traitor_pda
	name = "Hacked PDA"
	desc = "A hacked PDA with a silent presence on the network and a preset account, for anonymity or impersonation. \
	Any ID, including an agent card, can be used to change the name."
	item = /obj/item/modular_computer/tablet/pda/syndicate/traitor
	limited_stock = 1
	illegal_tech = FALSE
