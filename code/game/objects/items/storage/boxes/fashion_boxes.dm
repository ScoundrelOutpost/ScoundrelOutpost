// Boxes of clothes for the fashionable quirk

/obj/item/storage/box/fashion
	name = "engineering outfit"
	desc = "A high-visibility outfit suited to industrial maintenance & engineering."
/obj/item/storage/box/fashion/PopulateContents()
	new /obj/item/clothing/under/rank/engineering/engineer/hazard(src)
	new /obj/item/clothing/head/utility/hardhat(src)
	new /obj/item/clothing/shoes/workboots(src)
	new /obj/item/clothing/suit/hazardvest(src)
	new /obj/item/clothing/mask/bandana/striped/engineering(src)


/obj/item/storage/box/fashion/assistant
	name = "maintenance outfit"
	desc = "Some comfortable, utilitarian attire suited to all kinds of work. Commands respect among the corporate warrior-underclass."
/obj/item/storage/box/fashion/assistant/PopulateContents()
	new /obj/item/clothing/under/color/grey(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/clothing/gloves/color/fyellow/old(src)
	new /obj/item/clothing/head/soft/black(src)

/obj/item/storage/box/fashion/janitor
	name = "janitor outfit"
	desc = "Some durable, moisture-resistant cleaning apparel."
/obj/item/storage/box/fashion/janitor/PopulateContents()
	new /obj/item/clothing/under/rank/civilian/janitor(src)
	new /obj/item/clothing/mask/bandana/purple(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/head/soft/purple(src)


/obj/item/storage/box/fashion/robotics
	name = "roboticist outfit"
	desc = "A sleek, clinical outfit for the cybernetic engineer."
/obj/item/storage/box/fashion/robotics/PopulateContents()
	new /obj/item/clothing/under/rank/rnd/roboticist(src)
	new /obj/item/clothing/suit/toggle/labcoat/roboticist(src)
	new /obj/item/clothing/shoes/laceup(src)


/obj/item/storage/box/fashion/surgeon
	name = "surgeon outfit"
	desc = "A sterile outfit for surgeons."
/obj/item/storage/box/fashion/surgeon/PopulateContents()
	new /obj/item/clothing/under/rank/medical/chief_medical_officer/scrubs(src)
	new /obj/item/clothing/suit/toggle/labcoat/cmo(src)
	new /obj/item/clothing/mask/surgical(src)
	new /obj/item/clothing/gloves/color/latex(src)
	new /obj/item/clothing/shoes/laceup(src)


/obj/item/storage/box/fashion/miner
	name = "mining outfit"
	desc = "A rugged spelunking look with durability and padding suited to hard labor in rough environments."
/obj/item/storage/box/fashion/miner/PopulateContents()
	new /obj/item/clothing/under/rank/cargo/miner/lavaland(src)
	new /obj/item/clothing/glasses/eyepatch(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/shoes/workboots/mining(src)


/obj/item/storage/box/fashion/bartender
	name = "bartender outfit"
	desc = "A formal, old-fashioned bartender's outfit."
/obj/item/storage/box/fashion/bartender/PopulateContents()
	new /obj/item/clothing/under/rank/civilian/bartender(src)
	new /obj/item/clothing/accessory/waistcoat(src)
	new /obj/item/clothing/shoes/laceup(src)


/obj/item/storage/box/fashion/chef
	name = "chef outfit"
	desc = "A clean outfit demonstrating how serious you are about cooking, including an eccentrically anachronistic hat."
/obj/item/storage/box/fashion/chef/PopulateContents()
	new /obj/item/clothing/under/rank/civilian/chef(src)
	new /obj/item/clothing/head/utility/chefhat(src)
	new /obj/item/clothing/suit/apron/chef(src)
	new /obj/item/clothing/shoes/laceup(src)


/obj/item/storage/box/fashion/executive
	name = "executive outfit"
	desc = "A sleek, expensive suit, for that refined & punchable look."
/obj/item/storage/box/fashion/executive/PopulateContents()
	new /obj/item/clothing/under/suit/black(src)
	new /obj/item/clothing/suit/toggle/lawyer/black(src)
	new /obj/item/clothing/neck/tie/red(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/shoes/laceup(src)


/obj/item/storage/box/fashion/operative
	name = "operative outfit"
	desc = "A dark, militant & tactical look, for people who take their work very seriously."
/obj/item/storage/box/fashion/operative/PopulateContents()
	new /obj/item/clothing/under/syndicate(src)
	new /obj/item/clothing/glasses/eyepatch(src)
	new /obj/item/clothing/neck/scarf/black(src)
	new /obj/item/clothing/suit/toggle/jacket/sweater(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/shoes/jackboots(src)


/obj/item/storage/box/fashion/clown
	name = "clown outfit"
	desc = "Let's get down to funny business."
	illustration = "clown"
/obj/item/storage/box/fashion/clown/PopulateContents()
	new /obj/item/clothing/under/rank/civilian/clown(src)
	new /obj/item/clothing/mask/gas/clown_hat(src)
	new /obj/item/clothing/shoes/clown_shoes(src)
	new /obj/item/stamp/clown(src)
	new /obj/item/bikehorn(src)

/obj/item/storage/box/fashion/mime
	name = "mime outfit"
	desc = "Michelangelo -- Leonaro -- Da Vinci. They're all dead. You remain, as a performance artist."
	icon_state = "hugbox_black"
/obj/item/storage/box/fashion/mime/PopulateContents()
	new /obj/item/clothing/under/rank/civilian/mime(src)
	new /obj/item/clothing/suit/toggle/suspenders(src)
	new /obj/item/clothing/mask/gas/mime(src)
	new /obj/item/clothing/head/frenchberet(src)
	new /obj/item/clothing/gloves/color/white(src)
	new /obj/item/clothing/shoes/laceup(src)


/obj/item/storage/box/fashion/chaplain
	name = "spiritual outfit"
	desc = "An ominous black robe with gold trim. Perfect for setting the mood in your local tabletop game. Comes with an extra, \
	for the party wizard."
/obj/item/storage/box/fashion/chaplain/PopulateContents()
	new /obj/item/clothing/under/rank/civilian/chaplain(src)
	new /obj/item/clothing/suit/hooded/chaplain_hoodie/leader(src)
	new /obj/item/clothing/suit/hooded/chaplain_hoodie(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/reagent_containers/cup/glass/bottle/holywater(src)


/obj/item/storage/box/fashion/hotline
	name = "hotline agent outfit"
	desc = "A fearless and anachronistic look resembling a bygone age of when cocaine was considered a substitute for body armor."
/obj/item/storage/box/fashion/hotline/PopulateContents()
	new /obj/item/clothing/suit/jacket/letterman_red(src)
	new /obj/item/clothing/under/pants/jeans(src)
	new /obj/item/clothing/shoes/sneakers/black(src)
	if(prob(50))
		new /obj/item/clothing/mask/animal/small/bee(src)


/obj/item/storage/box/fashion/security
	name = "private security outfit"
	desc = "An authoritative private security uniform in red, for the domesticated mercenary."
/obj/item/storage/box/fashion/security/PopulateContents()
	new /obj/item/clothing/under/rank/security/warden(src)
	new /obj/item/clothing/head/hats/warden/red/fake(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/shoes/jackboots/sec(src)


/obj/item/storage/box/fashion/hacker
	name = "hacker outfit"
	desc = "A gloomy look expressing a neo-modern cultural angst, a fashion sentiment built by the Cyberstar underclass."
/obj/item/storage/box/fashion/hacker/PopulateContents()
	new /obj/item/clothing/under/color/black(src)
	new /obj/item/clothing/suit/costume/gothcoat(src)
	new /obj/item/clothing/gloves/fingerless(src)
	new /obj/item/clothing/shoes/laceup(src)
