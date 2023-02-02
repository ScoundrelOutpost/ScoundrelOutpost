/// Trim for admins and debug cards. Has every single access in the game.
/datum/id_trim/admin
	assignment = "PsiNet Administrator"
	trim_state = "trim_scientist"
	department_color = COLOR_PURPLE
	subdepartment_color = COLOR_PURPLE
/datum/id_trim/admin/New()
	. = ..()
	// Every single access in the game, all on one handy trim.
	access = SSid_access.get_region_access_list(list(REGION_ALL_GLOBAL))

/// Trim for highlander cards, used during the highlander adminbus event.
/datum/id_trim/highlander
	assignment = "Highlander"
	trim_state = "trim_ert_deathcommando"
	department_color = COLOR_CENTCOM_BLUE
	subdepartment_color = COLOR_SERVICE_LIME

/datum/id_trim/highlander/New()
	. = ..()
	access = SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_ALL_STATION))
