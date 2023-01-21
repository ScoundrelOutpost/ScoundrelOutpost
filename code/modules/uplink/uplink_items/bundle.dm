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
	desc = "Picking this will purchase a random item. Useful if you have some TC to spare or if you haven't decided on a strategy yet."
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


// freedbies
/datum/uplink_category/freebies
	name = "Standard Equipment"
	weight = 10
/datum/uplink_item/freebies
	category = /datum/uplink_category/freebies
	surplus = 0
	cant_discount = TRUE

/datum/uplink_item/freebies/encryptionkey
	name = "Syndicate Encryption Key"
	desc = "A key that, when inserted into a radio headset, allows you to listen to all station department channels \
			as well as talk on an encrypted Syndicate channel with other agents that have the same key. In addition, this key also protects \
			your headset from radio jammers."
	item = /obj/item/encryptionkey/syndicate
	cost = 0
	restricted = TRUE
	limited_stock = 1
	illegal_tech = FALSE

/datum/uplink_item/freebies/agent_card
	name = "Agent Identification Card"
	desc = "Agent cards prevent artificial intelligences from tracking the wearer, and hold up to 5 wildcards \
			from other identification cards. In addition, they can be forged to display a new assignment, name and trim. \
			This can be done an unlimited amount of times. Some Syndicate areas and devices can only be accessed \
			with these cards."
	item = /obj/item/card/id/advanced/chameleon
	cost = 0
	limited_stock = 1
	illegal_tech = FALSE

/datum/uplink_item/freebies/codespeak_manual
	name = "Codespeak Manual"
	desc = "Syndicate agents can be trained to use a series of codewords to convey complex information, which sounds like random concepts and drinks to anyone listening. \
			This manual teaches you this Codespeak. You can also hit someone else with the manual in order to teach them. Can only be used once."
	item = /obj/item/language_manual/codespeak_manual
	cost = 0
	limited_stock = 1
	illegal_tech = FALSE

/datum/uplink_item/freebies/adv_firstaid
	name = "Advanced First-Aid"
	desc = "An advanced first-aid kit for handling injuries sustained on operations. You only get one, so use it wisely."
	item = /obj/item/storage/medkit/advanced
	cost = 0
	limited_stock = 1
	illegal_tech = FALSE

/datum/uplink_item/freebies/suppressor
	name = "Suppressor"
	desc = "A clandestine suppressor suited to a variety of weapons. Conveys intent to operate covertly -- good luck with that on a spacestation. Limited stock of two."
	item = /obj/item/suppressor
	cost = 0
	limited_stock = 2
	illegal_tech = FALSE
