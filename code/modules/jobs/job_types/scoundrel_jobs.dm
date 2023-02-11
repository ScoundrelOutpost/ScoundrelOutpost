// Start scoundrel jobs

// Start job

/datum/job/deckhand
	title = JOB_DECKHAND
	description = "Maintain and attend the needs of the station generally. Fight off threats in times of crisis."
	department_head = list(JOB_QUARTERMASTER_SCOUNDREL)
	faction = FACTION_STATION
	total_positions = 10
	spawn_positions = 10
	minimal_player_age = 18
	supervisors = SUPERVISOR_CAPTAIN
	selection_color = "#d7b088"
	exp_required_type_department = EXP_TYPE_SUPPLY
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "DECKHAND"

	outfit = /datum/outfit/job/deckhand
	plasmaman_outfit = /datum/outfit/plasmaman/gloves

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_DECKHAND
	department_for_prefs = /datum/job_department/assistant
	bounty_types = CIV_JOB_RANDOM
	family_heirlooms = list(/obj/item/clothing/mask/gas, /obj/item/clothing/gloves/color/yellow)
	rpg_title = "Deckhand"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_ASSIGN_QUIRKS

/datum/outfit/job/deckhand
	name = "Deckhand"
	jobtype = /datum/job/deckhand
	backpack_contents = list(
		/obj/item/switchblade,
		/obj/item/gun/energy/e_gun/defender,
		/obj/item/storage/toolbox/mini/mechanical/loaded,
	)
	id_trim = /datum/id_trim/job/deckhand
	id = /obj/item/card/id/advanced
	belt = /obj/item/storage/belt/utility/small
	uniform = /obj/item/clothing/under/color/grey
	suit = /obj/item/clothing/suit/jacket/spacer
	gloves = /obj/item/clothing/gloves/fingerless
	ears = /obj/item/radio/headset
	shoes = /obj/item/clothing/shoes/sneakers/black

	suit_store = /obj/item/personalshield/standard

	l_pocket = /obj/item/modular_computer/tablet/pda/deckhand
//	r_pocket = 

	pda_slot = ITEM_SLOT_LPOCKET

// End job
// Start job

/datum/job/deckhand/greenhand
	title = JOB_GREENHAND
	description = "Learn the ropes, recover from motor trauma and get obliterated by space debris."
	department_head = list(JOB_QUARTERMASTER_SCOUNDREL)
	faction = FACTION_STATION
	total_positions = 10
	spawn_positions = 10
	minimal_player_age = 0
	supervisors = SUPERVISOR_CAPTAIN
	selection_color = "#d7b088"
	exp_required_type_department = EXP_TYPE_SUPPLY
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "GREENHAND"

	outfit = /datum/outfit/job/greenhand
	plasmaman_outfit = /datum/outfit/plasmaman/gloves

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_GREENHAND

/datum/outfit/job/greenhand
	name = "Greenhand"
	jobtype = /datum/job/deckhand/greenhand
	backpack_contents = list(
		/obj/item/switchblade,
		/obj/item/storage/toolbox/mini/mechanical/loaded,
	)
	id_trim = /datum/id_trim/job/deckhand/greenhand
	id = /obj/item/card/id/advanced
	belt = /obj/item/storage/belt/utility/small
	suit = /obj/item/clothing/suit/hazardvest
	uniform = /obj/item/clothing/under/color/darkgreen
	gloves = /obj/item/clothing/gloves/fingerless
	ears = /obj/item/radio/headset
	shoes = /obj/item/clothing/shoes/sneakers/black
	l_hand = /obj/item/clipboard

	suit_store = /obj/item/personalshield/standard

	l_pocket = /obj/item/modular_computer/tablet/pda/deckhand/greenhand
//	r_pocket = 

	pda_slot = ITEM_SLOT_LPOCKET

// End job
// Start job

/datum/job/medsci_spec
	title = JOB_MEDSCI_SPECIALIST
	description = "An experienced specialist in biotech, research and medical science. \
		Ensure the crew remains healthy and provide technological advancements for the crew."
	department_head = list(JOB_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	supervisors = SUPERVISOR_CAPTAIN
	selection_color = "#8857D6"
	exp_required_type_department = EXP_TYPE_SCIENCE
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "MEDSCI_SPEC"

	outfit = /datum/outfit/job/medsci_spec
	plasmaman_outfit = /datum/outfit/plasmaman/genetics

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_MEDSCI_SPEC
	department_for_prefs = /datum/job_department/assistant
	bounty_types = CIV_JOB_RANDOM

	family_heirlooms = list(/obj/item/toy/plush/slimeplushie, /obj/item/organ/internal/heart, /obj/item/storage/medkit/ancient/heirloom)
	rpg_title = "Mystic Theurge"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS
	ignore_human_authority = TRUE

/datum/outfit/job/medsci_spec
	name = "Medsci Specialist"
	jobtype = /datum/job/medsci_spec
	backpack_contents = list(
		/obj/item/defibrillator/compact/loaded = 1,
		/obj/item/clothing/mask/bandana/striped/medical,
		/obj/item/gun/energy/e_gun/defender,
	)
	id_trim = /datum/id_trim/job/deckhand/medsci_spec
	id = /obj/item/card/id/advanced
	uniform = /obj/item/clothing/under/turtleneck/purple
	suit = /obj/item/clothing/suit/jacket/purple_labcoat
	belt = /obj/item/storage/belt/utility/small
	neck = /obj/item/clothing/neck/stethoscope
	ears = /obj/item/radio/headset
	glasses = /obj/item/clothing/glasses/hud/health
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	shoes = /obj/item/clothing/shoes/jackboots
	accessory = /obj/item/clothing/accessory/armband/medblue
	l_hand = /obj/item/storage/medkit/surgery
	mask = /obj/item/clothing/mask/surgical
	l_pocket = /obj/item/modular_computer/tablet/pda/deckhand/medsci
	r_pocket = /obj/item/storage/pouch/medical/preloaded/advanced

	suit_store = /obj/item/personalshield/standard

	pda_slot = ITEM_SLOT_LPOCKET

/datum/outfit/job/medsci_spec/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	.=..()
	var/obj/item/organ/new_organ = new /obj/item/organ/internal/cyberimp/arm/surgery(src)
	new_organ.Insert(H)

// End job
// Start job

/datum/job/engi_spec
	title = JOB_ENGINEERING_SPECIALIST
	description = "An experienced specialist in mechanical & electrical engineering. \
		Keep the lights on, seal hull breaches and keep the station in best repair."
	department_head = list(JOB_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	supervisors = SUPERVISOR_CAPTAIN
	selection_color = "#8857D6"
	exp_required_type_department = EXP_TYPE_SCIENCE
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "ENGI_SPEC"

	outfit = /datum/outfit/job/engi_spec
	plasmaman_outfit = /datum/outfit/plasmaman/engineering

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_ENGI_SPEC
	department_for_prefs = /datum/job_department/assistant
	bounty_types = CIV_JOB_RANDOM
	
	family_heirlooms = list(/obj/item/screwdriver/caravan, /obj/item/wrench/caravan, /obj/item/crowbar/red/caravan, /obj/item/wirecutters/caravan)

	rpg_title = "Artificer"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS
	ignore_human_authority = TRUE

/datum/outfit/job/engi_spec
	name = "Engineering Specialist"
	jobtype = /datum/job/engi_spec
	backpack_contents = list(
		/obj/item/analyzer/ranged = 1,
		/obj/item/clothing/mask/bandana/striped/engineering = 1,
		/obj/item/gun/energy/e_gun/defender,
		/obj/item/storage/toolbox/mini/engineer/loaded,
	)
	id_trim = /datum/id_trim/job/deckhand/engi_spec
	id = /obj/item/card/id/advanced
	head = /obj/item/clothing/head/utility/hardhat/weldhat/white
	uniform = /obj/item/clothing/under/color/grey
	suit = /obj/item/clothing/suit/hazardvest
	belt = /obj/item/storage/belt/utility/small
	ears = /obj/item/radio/headset
	glasses = /obj/item/clothing/glasses/meson/engine
	gloves = /obj/item/clothing/gloves/color/chief_engineer
	shoes = /obj/item/clothing/shoes/laceup
	accessory = /obj/item/clothing/accessory/armband/engine
	box = /obj/item/storage/box/survival/engineer
	l_pocket = /obj/item/modular_computer/tablet/pda/deckhand/engineer
//	r_pocket = 

	suit_store = /obj/item/personalshield/standard

	pda_slot = ITEM_SLOT_LPOCKET

// End job
// Start job

/datum/job/captain_scoundrel
	title = JOB_CAPTAIN_SCOUNDREL
	description = "In times of peace, maintain morale and good faith between the crew. In times of crisis, rally your comrades and lead by example."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("CentCom")
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Quartermaster"
	selection_color = "#ccccff"
	req_admin_notify = 1
	minimal_player_age = 18
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "CAPTAIN_SCOUNDREL"

	outfit = /datum/outfit/job/captain_scoundrel
	plasmaman_outfit = /datum/outfit/plasmaman/warden

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_CAPTAIN_SCOUNDREL
	department_for_prefs = /datum/job_department/captain
	departments_list = list(
		/datum/job_department/command,
	)

	family_heirlooms = list(/obj/item/stack/telecrystal, /obj/item/flamethrower/full, /obj/item/ammo_box/magazine/m9mm/surplus)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS
	rpg_title = "Shipmaster"

/datum/job/captain_scoundrel/get_captaincy_announcement(mob/living/captain)
	return

/datum/outfit/job/captain_scoundrel
	name = "Captain"
	jobtype = /datum/job/captain_scoundrel

	id = /obj/item/card/id/advanced/silver
	id_trim = /datum/id_trim/job/deckhand/captain_scoundrel
//	head = /obj/item/clothing/head/helmet/scoundrel
	mask = /obj/item/clothing/mask/bandana/striped/black
	uniform = /obj/item/clothing/under/syndicate/tracking_on
	suit = /obj/item/clothing/suit/armor/furcoat
	backpack_contents = list(
		/obj/item/melee/tonfa/shock_tonfa = 1,
		/obj/item/gun/energy/e_gun/defender,
		)
	belt = /obj/item/storage/belt/utility/small
	ears = /obj/item/radio/headset/leader/bowman
	glasses = /obj/item/clothing/glasses/eyepatch
	gloves = /obj/item/clothing/gloves/combat
	shoes = /obj/item/clothing/shoes/jackboots

	suit_store = /obj/item/personalshield/standard/advanced

	l_pocket = /obj/item/modular_computer/tablet/pda/deckhand/leader/captain
//	r_pocket = 

	pda_slot = ITEM_SLOT_LPOCKET

	box = /obj/item/storage/box/survival/engineer

	accessory = /obj/item/clothing/accessory/medal/gold/captain
	chameleon_extras = list(
		/obj/item/gun/energy/e_gun,
		/obj/item/stamp/captain,
		)
	implants = list(/obj/item/implant/mindshield)
	skillchips = list(/obj/item/skillchip/disk_verifier)

/datum/outfit/job/captain_scoundrel/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	.=..()
	var/obj/item/organ/new_organ = new /obj/item/organ/internal/cyberimp/arm/dualmodesword/captain(src)
	new_organ.Insert(H)

// End job
// Start job

/datum/job/quartermaster_scoundrel
	title = JOB_QUARTERMASTER_SCOUNDREL
	description = "Allocate resources, manage cargo, coordinate the crew and ensure everyone has what they need to do their jobs."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list(JOB_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 18
	supervisors = SUPERVISOR_CAPTAIN
	selection_color = "#d7b088"
	exp_required_type_department = EXP_TYPE_SUPPLY
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "QUARTERMASTER_SCOUNDREL"

	outfit = /datum/outfit/job/quartermaster_scoundrel
	plasmaman_outfit = /datum/outfit/plasmaman/botany

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_QUARTERMASTER_SCOUNDREL
	department_for_prefs = /datum/job_department/captain
	bounty_types = CIV_JOB_RANDOM
	departments_list = list(
		/datum/job_department/command,
		)
	family_heirlooms = list(/obj/item/storage/pouch)
	rpg_title = "Steward"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS
	ignore_human_authority = TRUE

/datum/job/quartermaster_scoundrel/get_captaincy_announcement(mob/living/captain)
	return

/datum/outfit/job/quartermaster_scoundrel
	name = "Quartermaster"
	jobtype = /datum/job/quartermaster_scoundrel
	backpack_contents = list(
		/obj/item/melee/tonfa/shock_tonfa = 1,
		/obj/item/gun/energy/e_gun/defender,
		/obj/item/station_charter = 1,
		/obj/item/clothing/mask/bandana/striped/botany
	)
	id_trim = /datum/id_trim/job/deckhand/quartermaster_scoundrel
	id = /obj/item/card/id/advanced/silver
	uniform = /obj/item/clothing/under/suit/green
	suit = /obj/item/clothing/suit/armor/vest
	gloves = /obj/item/clothing/gloves/color/black
	accessory = /obj/item/clothing/accessory/medal/silver
	belt = /obj/item/storage/belt/utility/small
	ears = /obj/item/radio/headset/leader
	glasses = /obj/item/clothing/glasses/sunglasses/big
	shoes = /obj/item/clothing/shoes/laceup
	l_hand = /obj/item/clipboard

	suit_store = /obj/item/personalshield/standard/advanced

	l_pocket = /obj/item/modular_computer/tablet/pda/deckhand/leader/quartermaster
//	r_pocket = /obj/item/storage/pouch/holding // moved to acting captain system

	pda_slot = ITEM_SLOT_LPOCKET

	implants = list(/obj/item/implant/mindshield)

// End job
// Start job

/datum/job/detective_scoundrel
	title = JOB_DETECTIVE_SCOUNDREL
	description = "Watch out for the crew, seek clues and neutralize threats to the station and its' people."
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = "the Captain and Quartermaster"
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain and Quartermaster"
	selection_color = "#ccccff"
	req_admin_notify = 1
	minimal_player_age = 18
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "DETECTIVE_SCOUNDREL"

	outfit = /datum/outfit/job/detective_scoundrel
	plasmaman_outfit = /datum/outfit/plasmaman/chaplain

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_DETECTIVE_SCOUNDREL
	department_for_prefs = /datum/job_department/security
	departments_list = list(
		/datum/job_department/command,
	)

	family_heirlooms = list(/obj/item/throwing_star, /obj/item/clothing/mask/gas/ninja)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS
	rpg_title = "Sellsword"

/datum/outfit/job/detective_scoundrel
	name = "Detective"
	jobtype = /datum/job/detective_scoundrel

	id = /obj/item/card/id/advanced/black
	id_trim = /datum/id_trim/job/deckhand/detective_scoundrel
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/jacket/det_suit/dark
	backpack_contents = list(
		/obj/item/melee/tonfa/shock_tonfa = 1,
		/obj/item/gun/energy/e_gun/defender = 1,
		/obj/item/pinpointer/crew = 1
		)
	belt = /obj/item/storage/belt/utility/small
	head = /obj/item/clothing/head/helmet/scoundrel
//	mask = /obj/item/clothing/mask/russian_balaclava
	ears = /obj/item/radio/headset/leader/bowman
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	gloves = /obj/item/clothing/gloves/toagloves
	shoes = /obj/item/clothing/shoes/jackboots

	accessory = /obj/item/clothing/accessory/medal/silver

	suit_store = /obj/item/personalshield/standard/advanced

	l_pocket = /obj/item/modular_computer/tablet/pda/deckhand/leader/detective
	r_pocket = /obj/item/storage/pouch/forensic/preloaded
	
	implants = list(/obj/item/implant/mindshield)

	pda_slot = ITEM_SLOT_LPOCKET
// End job
// Start job

/datum/job/mining_spec
	title = JOB_MINING_SPEC
	description = "An experienced specialist in EVA, exploring and prospecting. \
		Recover artifacts, exotics and raw materials for the crew. Discover treasure."
	department_head = list(JOB_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 18
	supervisors = SUPERVISOR_CAPTAIN
	selection_color = "#8857D6"
	exp_required_type_department = EXP_TYPE_SCIENCE
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "MINING_SPEC"

	outfit = /datum/outfit/job/mining_spec
	plasmaman_outfit = /datum/outfit/plasmaman/mining

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_MINING_SPEC
	department_for_prefs = /datum/job_department/assistant
	bounty_types = CIV_JOB_RANDOM

	family_heirlooms = list(/obj/item/survivalcapsule/luxury)
	rpg_title = "Spelunker"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_BOLD_SELECT_TEXT | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS
	ignore_human_authority = TRUE

/datum/outfit/job/mining_spec
	name = "Mining Specialist"
	jobtype = /datum/job/mining_spec
	backpack_contents = list(
		/obj/item/knife/combat/survival = 1,
		/obj/item/stack/marker_beacon/ten = 3,
		/obj/item/mining_voucher,
		/obj/item/flashlight/seclite,
		/obj/item/gun/energy/e_gun/defender,
		/obj/item/reagent_containers/hypospray/medipen/survival,
	)
	id_trim = /datum/id_trim/job/deckhand/mining_spec
	id = /obj/item/card/id/advanced
	uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland
	suit = /obj/item/clothing/suit/jacket/spacer
	belt = /obj/item/storage/belt/utility/small
	ears = /obj/item/radio/headset
	glasses = /obj/item/clothing/glasses/meson
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/workboots/mining
	accessory = /obj/item/clothing/accessory/talisman
	l_pocket = /obj/item/modular_computer/tablet/pda/deckhand/mining
	r_pocket = /obj/item/storage/bag/ore

	suit_store = /obj/item/personalshield/standard

	pda_slot = ITEM_SLOT_LPOCKET
	box = /obj/item/storage/box/survival/mining
// End job

// apply to all
/datum/outfit/job/post_equip(mob/living/carbon/human/equipped, visualsOnly)
	. = ..()
	var/list/potential_item = list(/obj/item/stack/spacecash/c1000, /obj/item/storage/backpack/satchel/flat)
	if(prob(13))
		var/obj/item/picked_item = pick(potential_item)
		equipped.put_in_backpack(new picked_item, TRUE)
