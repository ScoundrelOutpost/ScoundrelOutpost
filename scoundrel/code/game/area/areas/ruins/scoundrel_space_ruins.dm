/*Space Ruin Parents

/area/ruin/space
	has_gravity = FALSE
	area_flags = UNIQUE_AREA

/area/ruin/space/has_grav
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/has_grav/powered
	requires_power = FALSE
*/


// waypost
/area/ruin/space/waypost
	name = "Waypost"
	ambience_index = AMBIENCE_SPACE
	min_ambience_cooldown = 60 SECONDS
	max_ambience_cooldown = 120 SECONDS

/area/ruin/space/waypost/has_grav
	has_gravity = STANDARD_GRAVITY

/*/area/ruin/space/waypost/solars
	name = "Waypost Solars"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "panels"*/

/area/ruin/space/waypost/has_grav/starlight
	icon = 'icons/area/areas_misc.dmi'
	icon_state = "space_near"
	area_flags = UNIQUE_AREA | AREA_USES_STARLIGHT
	has_gravity = STANDARD_GRAVITY


// generic
/area/space/nearstation/has_grav
	icon_state = "space_near"
	area_flags = UNIQUE_AREA | AREA_USES_STARLIGHT
	has_gravity = STANDARD_GRAVITY
