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
	if(prob(75))
		var/datum/objective/steal/steal_objective = new
		steal_objective.owner = owner
		steal_objective.find_target()
		objectives += steal_objective

	if(prob(75))
		var/datum/objective/scoundrel_cash/money_objective = new
		money_objective.owner = owner
		money_objective.update_explanation_text()
		objectives += money_objective

	// if no objectives roll, just roll beatdown
	if(!objectives)
		var/datum/objective/scoundrel_beatdown/beatdown_objective = new
		beatdown_objective.owner = owner
		beatdown_objective.find_target()
		objectives += beatdown_objective
// objective datums

/datum/objective/scoundrel_beatdown
	name = "beatdown"
	explanation_text = "Beat someone down."
	martyr_compatible = FALSE

// fuck it dude
#define SCOUNDREL_RANDOM_OBJECTIVE_BEATDOWN list("Beat [target.name] down.", "Kick [target.name]'s ass.", "Serve [target.name] a knuckle sandwich.", "Knock [target.name]'s teeth out.", "Teach [target.name] a lesson in violence.",)

/datum/objective/scoundrel_beatdown/update_explanation_text()
	. = ..()
	if(target)
		explanation_text = pick(SCOUNDREL_RANDOM_OBJECTIVE_BEATDOWN)

/datum/objective/scoundrel_loyalty
	name = "Loyalty"
	explanation_text = "Find someone to build a bond with and keep them safe."
	martyr_compatible = FALSE

#define SCOUNDREL_RANDOM_OBJECTIVE_LOYALTY list("You're loyal to [target.name]. Protect them with your life.", "You've got a lot of respect for [target.name]. Help them out whenever they need it.", "Make sure [target.name] makes it out of whatever happens alive.", "See to it that no harm comes to [target.name].", "You'd do just about anything for [target.name].",)

/datum/objective/scoundrel_loyalty/update_explanation_text()
	. = ..()
	if(target)
		explanation_text = pick(SCOUNDREL_RANDOM_OBJECTIVE_LOYALTY)

/datum/objective/scoundrel_cash
	name = "Get Cash"
	explanation_text = "Acquire some credits before you leave."
	martyr_compatible = FALSE

/datum/objective/scoundrel_cash/update_explanation_text()
	. = ..()
	var/rand_objective = rand(8, 20) * 100
	explanation_text = "Get your hands on [rand_objective] credits before you leave the station."
