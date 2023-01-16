/datum/antagonist/scoundrel
	name = "\improper Scoundrel"
	antagpanel_category = "Mild"
	job_rank = ROLE_SCOUNDREL
	antag_hud_name = "scoundrel"
	show_in_antagpanel = TRUE
	show_name_in_check_antagonists = TRUE
	show_to_ghosts = FALSE
	suicide_cry = "BURN BRIGHT!!"
	preview_outfit = /datum/outfit/job/scoundrel_preview

// preview outfit
/datum/outfit/job/scoundrel_preview
	name = "Scoundrel (Preview Only)"
	belt = /obj/item/storage/belt/utility/small
	uniform = /obj/item/clothing/under/color/grey
	suit = /obj/item/clothing/suit/jacket/spacer
	mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/utility/hardhat/red
	gloves = /obj/item/clothing/gloves/fingerless
	ears = /obj/item/radio/headset
	shoes = /obj/item/clothing/shoes/sneakers/black
	suit_store = /obj/item/personalshield/standard

/datum/antagonist/scoundrel/on_gain()
	create_objectives()
	. = ..()

/datum/antagonist/scoundrel/greet()
	. = ..()
	owner.current.playsound_local(get_turf(owner.current), 'sound/scoundrel/rattle_stinger.ogg',100,0, use_reverb = FALSE)
	to_chat(owner, span_boldannounce("greeting text test"))

/datum/antagonist/scoundrel/proc/create_objectives()
	if(prob(75))
		var/datum/objective/scoundrel_beatdown/beatdown_objective = new
		beatdown_objective.owner = owner
		beatdown_objective.find_target()
		objectives += beatdown_objective
	if(prob(75))
		var/datum/objective/scoundrel_loyalty/loyalty_objective = new
		loyalty_objective.owner = owner
		loyalty_objective.find_target()
		objectives += loyalty_objective

	// this should be converted to petty theft rather than primary traitor steals
	if(prob(100))
		var/datum/objective/steal/steal_objective = new
		steal_objective.owner = owner
		steal_objective.find_target()
		objectives += steal_objective

	if(prob(75))
		var/datum/objective/scoundrel_cash/money_objective = new
		money_objective.owner = owner
		money_objective.update_explanation_text()
		objectives += money_objective

// objective datums

/datum/objective/scoundrel_beatdown
	name = "beatdown"
	explanation_text = "Beat someone down."
	martyr_compatible = FALSE

/datum/objective/scoundrel_beatdown/update_explanation_text()
	var/rand_objective = rand(1, 5)
	if(target?.current)
		if(rand_objective == 1)
			explanation_text = "Beat [target.name] down."
		if(rand_objective == 2)
			explanation_text = "Kick [target.name]'s ass."
		if(rand_objective == 3)
			explanation_text = "Serve [target.name] a knuckle sandwich."
		if(rand_objective == 4)
			explanation_text = "Knock [target.name]'s teeth out."
		if(rand_objective == 5)
			explanation_text = "Teach [target.name] a lesson in violence."
	else
		explanation_text = "Beat someone down."


/datum/objective/scoundrel_loyalty
	name = "Loyalty"
	explanation_text = "You're loyal to someone."
	martyr_compatible = FALSE

/datum/objective/scoundrel_loyalty/update_explanation_text()
	var/rand_objective = rand(1, 5)
	if(target?.current)
		if(rand_objective == 1)
			explanation_text = "You're loyal to [target.name]. Protect them with your life."
		if(rand_objective == 2)
			explanation_text = "You've got a lot of respect for [target.name]. Help them out whenever they need it."
		if(rand_objective == 3)
			explanation_text = "Make sure [target.name] makes it out of whatever happens alive."
		if(rand_objective == 4)
			explanation_text = "See to it that no harm comes to [target.name]."
		if(rand_objective == 5)
			explanation_text = "You'd do just about anything for [target.name]."
	else
		explanation_text = "Find someone to build a bond with and keep them safe."


/datum/objective/scoundrel_cash
	name = "Get Cash"
	explanation_text = "Acquire some credits before you leave."
	martyr_compatible = FALSE

/datum/objective/scoundrel_cash/update_explanation_text()
	var/rand_objective = rand(8, 20) * 100
	explanation_text = "Get your hands on [rand_objective] credits before you leave the station."
