// scoundrel id trims

/datum/id_trim/job/deckhand
	assignment = "Deckhand"
	trim_state = "trim_cargotechnician"
	orbit_icon = "toolbox"
	department_color = COLOR_BEIGE
	subdepartment_color = COLOR_BEIGE
	sechud_icon_state = SECHUD_CARGO_TECHNICIAN
	minimal_access = list(
		ACCESS_MAINT_TUNNELS,
		ACCESS_CARGO,
		ACCESS_ATMOSPHERICS,
		ACCESS_KITCHEN,
		ACCESS_PHARMACY,
		ACCESS_SURGERY,
		ACCESS_KEYCARD_AUTH,
		ACCESS_MINING,
		ACCESS_MINING_STATION,
		ACCESS_ROBOTICS,
		ACCESS_HYDROPONICS
		)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS
		)
	job = /datum/job/deckhand

/datum/id_trim/job/deckhand/greenhand
	assignment = "Greenhand"
	trim_state = "trim_cargotechnician"
	orbit_icon = "toolbox"
	department_color = COLOR_DARK_MODERATE_LIME_GREEN
	subdepartment_color = COLOR_DARK_MODERATE_LIME_GREEN
	sechud_icon_state = SECHUD_CARGO_TECHNICIAN
	job = /datum/job/deckhand/greenhand

/datum/id_trim/job/deckhand/medsci_spec
	assignment = "Medsci Specialist"
	trim_state = "trim_geneticist"
	orbit_icon = "user-graduate"
	department_color = COLOR_AMETHYST
	subdepartment_color = COLOR_AMETHYST
	sechud_icon_state = SECHUD_GENETICIST
	minimal_access = list(
		ACCESS_MAINT_TUNNELS,
		ACCESS_CARGO,
		ACCESS_ATMOSPHERICS,
		ACCESS_KITCHEN,
		ACCESS_PHARMACY,
		ACCESS_SURGERY,
		ACCESS_KEYCARD_AUTH,
		ACCESS_MINING,
		ACCESS_MINING_STATION,
		ACCESS_ROBOTICS,
		ACCESS_HYDROPONICS,
		//basic access end
		ACCESS_CMO,
		ACCESS_RD
		)
	job = /datum/job/medsci_spec

/datum/id_trim/job/deckhand/engi_spec
	assignment = "Engineering Specialist"
	trim_state = "trim_stationengineer"
	orbit_icon = "user-astronaut"
	department_color = COLOR_ENGINEERING_ORANGE
	subdepartment_color = COLOR_ENGINEERING_ORANGE
	sechud_icon_state = SECHUD_CHIEF_ENGINEER
	minimal_access = list(
		ACCESS_MAINT_TUNNELS,
		ACCESS_CARGO,
		ACCESS_ATMOSPHERICS,
		ACCESS_KITCHEN,
		ACCESS_PHARMACY,
		ACCESS_SURGERY,
		ACCESS_KEYCARD_AUTH,
		ACCESS_MINING,
		ACCESS_MINING_STATION,
		ACCESS_ROBOTICS,
		ACCESS_HYDROPONICS,
		//basic access end
		ACCESS_ENGINE_EQUIP,
		ACCESS_CE,
		)
	job = /datum/job/engi_spec

/datum/id_trim/job/deckhand/mining_spec
	assignment = "Mining Specialist"
	trim_state = "trim_shaftminer"
	orbit_icon = "user-astronaut"
	department_color = COLOR_CARGO_BROWN
	subdepartment_color = COLOR_SCIENCE_PINK
	sechud_icon_state = SECHUD_SHAFT_MINER
	job = /datum/job/mining_spec

/datum/id_trim/job/deckhand/captain_scoundrel
	assignment = "Captain"
	trim_state = "trim_captain"
	orbit_icon = "crown"
	department_color = COLOR_FULL_TONER_BLACK
	subdepartment_color = COLOR_FULL_TONER_BLACK
	sechud_icon_state = SECHUD_CAPTAIN
	minimal_access = list(
		ACCESS_MAINT_TUNNELS,
		ACCESS_CARGO,
		ACCESS_ATMOSPHERICS,
		ACCESS_KITCHEN,
		ACCESS_PHARMACY,
		ACCESS_SURGERY,
		ACCESS_KEYCARD_AUTH,
		ACCESS_MINING,
		ACCESS_MINING_STATION,
		ACCESS_ROBOTICS,
		ACCESS_HYDROPONICS,
		//basic access end
		ACCESS_DETECTIVE,
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_COMMAND,
		ACCESS_ENGINE_EQUIP
		)
	job = /datum/job/captain_scoundrel

/datum/id_trim/job/deckhand/quartermaster_scoundrel
	assignment = "Quartermaster"
	trim_state = "trim_headofpersonnel"
	orbit_icon = "sack-dollar"
	department_color = COLOR_GREEN
	subdepartment_color = COLOR_GREEN
	sechud_icon_state = SECHUD_HEAD_OF_PERSONNEL
	minimal_access = list(
		ACCESS_MAINT_TUNNELS,
		ACCESS_CARGO,
		ACCESS_ATMOSPHERICS,
		ACCESS_KITCHEN,
		ACCESS_PHARMACY,
		ACCESS_SURGERY,
		ACCESS_KEYCARD_AUTH,
		ACCESS_MINING,
		ACCESS_MINING_STATION,
		ACCESS_ROBOTICS,
		ACCESS_HYDROPONICS,
		//basic access end
		ACCESS_DETECTIVE,
		ACCESS_QM,
		ACCESS_CHANGE_IDS,
		ACCESS_COMMAND,
		ACCESS_ENGINE_EQUIP
		)
	job = /datum/job/quartermaster_scoundrel

/datum/id_trim/job/deckhand/detective_scoundrel
	assignment = "Detective"
	trim_state = "trim_detective"
	orbit_icon = "toolbox"
	department_color = COLOR_BLACK
	subdepartment_color = COLOR_LIME
	sechud_icon_state = SECHUD_DETECTIVE
	minimal_access = list(
		ACCESS_MAINT_TUNNELS,
		ACCESS_CARGO,
		ACCESS_ATMOSPHERICS,
		ACCESS_KITCHEN,
		ACCESS_PHARMACY,
		ACCESS_SURGERY,
		ACCESS_KEYCARD_AUTH,
		ACCESS_MINING,
		ACCESS_MINING_STATION,
		ACCESS_ROBOTICS,
		ACCESS_HYDROPONICS,
		//basic access end
		ACCESS_DETECTIVE,
		ACCESS_COMMAND
		)
	job = /datum/job/detective_scoundrel

/datum/id_trim/job/deckhand/leader
	assignment = "Leader"
	trim_state = "trim_headofpersonnel"
	orbit_icon = "toolbox"
	department_color = COLOR_MAROON
	subdepartment_color = COLOR_MAROON
	sechud_icon_state = SECHUD_HEAD_OF_PERSONNEL
	minimal_access = list(
		ACCESS_MAINT_TUNNELS,
		ACCESS_CARGO,
		ACCESS_ATMOSPHERICS,
		ACCESS_KITCHEN,
		ACCESS_PHARMACY,
		ACCESS_SURGERY,
		ACCESS_KEYCARD_AUTH,
		ACCESS_MINING,
		ACCESS_MINING_STATION,
		ACCESS_ROBOTICS,
		ACCESS_HYDROPONICS,
		//basic access end
		ACCESS_DETECTIVE,
		ACCESS_COMMAND,
		ACCESS_ENGINE_EQUIP,
		)
	job = null

/datum/id_trim/job/master
	assignment = "Leader"
	trim_state = "trim_captain"
	orbit_icon = "crown"
	department_color = COLOR_MAROON
	subdepartment_color = COLOR_MAROON
	sechud_icon_state = SECHUD_CAPTAIN
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		)
/datum/id_trim/job/master/New()
	extra_access |= (SSid_access.get_flag_access_list(ACCESS_FLAG_COMMON) + SSid_access.get_flag_access_list(ACCESS_FLAG_COMMAND))
	extra_wildcard_access |= (SSid_access.get_flag_access_list(ACCESS_FLAG_PRV_COMMAND) + SSid_access.get_flag_access_list(ACCESS_FLAG_CAPTAIN))
	minimal_access |= (SSid_access.get_flag_access_list(ACCESS_FLAG_COMMON) + SSid_access.get_flag_access_list(ACCESS_FLAG_COMMAND))
	minimal_wildcard_access |= (SSid_access.get_flag_access_list(ACCESS_FLAG_PRV_COMMAND) + SSid_access.get_flag_access_list(ACCESS_FLAG_CAPTAIN))

	return ..()
