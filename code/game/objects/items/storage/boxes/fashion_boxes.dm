// Boxes of clothes for the fashionable quirk

/obj/item/storage/box/fashion
	name = "Courageous Tomb Raider - 1940's."
	desc = "This legendary figure of still dubious historical accuracy is thought to have been a world-famous archeologist who embarked on countless adventures in far away lands, along with his trademark whip and fedora hat."

/obj/item/storage/box/hero/PopulateContents()
	new /obj/item/clothing/head/fedora/curator(src)
	new /obj/item/clothing/shoes/workboots/mining(src)
	new /obj/item/clothing/suit/jacket/curator(src)
	new /obj/item/clothing/under/rank/civilian/curator/treasure_hunter(src)
	new /obj/item/melee/curator_whip(src)
