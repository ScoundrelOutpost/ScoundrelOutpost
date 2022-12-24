/obj/structure/closet/wall
	wall_mounted = TRUE
	anchored = TRUE
	density = FALSE
	anchorable = FALSE
	icon = 'icons/obj/wallcloset.dmi'
	icon_state = "generic_wall"

/obj/structure/closet/wall/after_close(mob/living/user)
	density = FALSE
	return

/obj/structure/closet/wall/white
	icon_state = "med_wall"

/obj/structure/closet/wall/white/chem
	icon_door = "chemical_wall"

/obj/structure/closet/wall/white/med
	icon_door = "med_wall"

// pathed from pre-existing presets
/obj/structure/closet/firecloset/wall
	wall_mounted = TRUE
	anchored = TRUE
	density = FALSE
	anchorable = FALSE
	icon = 'icons/obj/wallcloset.dmi'
	icon_state = "fire_wall"
/obj/structure/closet/firecloset/wall/after_close(mob/living/user)
	density = FALSE
	return

/obj/structure/closet/emcloset/wall
	wall_mounted = TRUE
	anchored = TRUE
	density = FALSE
	anchorable = FALSE
	icon = 'icons/obj/wallcloset.dmi'
	icon_state = "emergency_wall"
/obj/structure/closet/emcloset/wall/after_close(mob/living/user)
	density = FALSE
	return

/obj/structure/closet/secure_closet/wall
	wall_mounted = TRUE
	anchored = TRUE
	density = FALSE
	anchorable = FALSE
	icon = 'icons/obj/wallcloset.dmi'
	icon_state = "secure_wall"
/obj/structure/closet/secure_closet/wall/after_close(mob/living/user)
	density = FALSE
	return

/obj/structure/closet/secure_closet/freezer/wall
	wall_mounted = TRUE
	anchored = TRUE
	density = FALSE
	anchorable = FALSE
	icon = 'icons/obj/wallcloset.dmi'
	icon_state = "freezer_wall"
/obj/structure/closet/secure_closet/freezer/wall/after_close(mob/living/user)
	density = FALSE
	return

/obj/structure/closet/secure_closet/freezer/kitchen/wall
	wall_mounted = TRUE
	anchored = TRUE
	density = FALSE
	anchorable = FALSE
	icon = 'icons/obj/wallcloset.dmi'
	icon_state = "freezer_wall"
/obj/structure/closet/secure_closet/freezer/kitchen/wall/after_close(mob/living/user)
	density = FALSE
	return

// scoundrel presets

/obj/structure/closet/secure_closet/chemical/wall
	wall_mounted = TRUE
	anchored = TRUE
	density = FALSE
	anchorable = FALSE
	icon = 'icons/obj/wallcloset.dmi'
	icon_state = "chemical_wall"
	icon_door = "chemical_wall"
/obj/structure/closet/secure_closet/chemical/wall/after_close(mob/living/user)
	density = FALSE
	return

/obj/structure/closet/secure_closet/personal/wall
	wall_mounted = TRUE
	anchored = TRUE
	density = FALSE
	anchorable = FALSE
	icon = 'icons/obj/wallcloset.dmi'
	icon_state = "secure_wall"
/obj/structure/closet/secure_closet/personal/wall/after_close(mob/living/user)
	density = FALSE
	return

/obj/structure/closet/secure_closet/medical3/wall
	wall_mounted = TRUE
	anchored = TRUE
	density = FALSE
	anchorable = FALSE
	icon = 'icons/obj/wallcloset.dmi'
	icon_state = "med_secure_wall"
/obj/structure/closet/secure_closet/medical3/wall/after_close(mob/living/user)
	density = FALSE
	return

/obj/structure/closet/secure_closet/detective_scoundrel/wall
	wall_mounted = TRUE
	anchored = TRUE
	density = FALSE
	anchorable = FALSE
	icon = 'icons/obj/wallcloset.dmi'
	icon_state = "secure_wall"
/obj/structure/closet/secure_closet/detective_scoundrel/wall/after_close(mob/living/user)
	density = FALSE
	return
