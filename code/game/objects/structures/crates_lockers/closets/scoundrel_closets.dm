/obj/structure/closet/secure_closet/medsci_spec
	name = "\proper medsci specialist's locker"
	req_access = list(ACCESS_CMO)
	icon_state = "cmo"

/obj/structure/closet/secure_closet/medsci_spec/PopulateContents()
	..()

	new /obj/item/storage/backpack/duffelbag(src)
	new /obj/item/clothing/suit/bio_suit/cmo(src)
	new /obj/item/clothing/head/bio_hood/cmo(src)
	new /obj/item/computer_disk/command/cmo(src)
	new /obj/item/radio/headset(src)
	new /obj/item/healthanalyzer/advanced(src)
	new /obj/item/autosurgeon/medical_hud(src)
	new /obj/item/clothing/neck/petcollar(src)
	new /obj/item/pet_carrier(src)
	new /obj/item/wallframe/defib_mount(src)
	new /obj/item/circuitboard/machine/techfab/department/medical(src)

/obj/structure/closet/secure_closet/medsci_spec/populate_contents_immediate()
	. = ..()

	// Traitor steal objective
	new /obj/item/reagent_containers/hypospray/cmo(src)



/obj/structure/closet/secure_closet/engi_spec
	name = "\proper engineering specialist's locker"
	req_access = list(ACCESS_CE)
	icon_state = "ce"

/obj/structure/closet/secure_closet/engi_spec/PopulateContents()
	..()

	new /obj/item/storage/backpack/duffelbag(src)
	new /obj/item/card/access_inscriber/choice(src)
	new /obj/item/computer_disk/command/ce(src)
	new /obj/item/radio/headset/(src)
	new /obj/item/holosign_creator/atmos(src)
	new /obj/item/pipe_dispenser(src)
	new /obj/item/circuitboard/machine/techfab/department/engineering(src)
	new /obj/item/extinguisher/advanced(src)
	new /obj/item/survivalcapsule/construction_pod(src)

/obj/structure/closet/secure_closet/engi_spec/populate_contents_immediate()
	. = ..()

	// Traitor steal objective
	new /obj/item/areaeditor/blueprints(src)
	new /obj/item/clothing/shoes/magboots/advance(src)



/obj/structure/closet/secure_closet/captain_scoundrel
	name = "\proper captain's locker"
	req_access = list(ACCESS_CAPTAIN)
	icon_state = "cap"

/obj/structure/closet/secure_closet/captain_scoundrel/PopulateContents()
	..()

	new /obj/item/storage/backpack/duffelbag(src)
	new /obj/item/card/access_inscriber/choice(src)
	new /obj/item/computer_disk/command/captain(src)
	new /obj/item/storage/box/silver_ids(src)
	new /obj/item/radio/headset/leader/bowman(src)
	new /obj/item/door_remote/captain(src)
	new /obj/item/storage/photo_album/captain(src)
	new /obj/item/sensor_device(src)
	new /obj/item/storage/box/bolas(src)
	new /obj/item/storage/pouch/cuffs/preloaded(src)

/obj/structure/closet/secure_closet/quartermaster_scoundrel
	name = "\proper quartermaster's locker"
	req_access = list(ACCESS_QM)
	icon_state = "qm"

/obj/structure/closet/secure_closet/quartermaster_scoundrel/PopulateContents()
	..()
	new /obj/item/storage/backpack/duffelbag(src)
	new /obj/item/card/access_inscriber/choice(src)
	new /obj/item/radio/headset/leader(src)
	new /obj/item/universal_scanner(src)
	new /obj/item/door_remote/captain(src)
	new /obj/item/circuitboard/machine/techfab/department/cargo(src)
	new /obj/item/storage/photo_album/qm(src)
	new /obj/item/circuitboard/machine/ore_silo(src)

/obj/structure/closet/secure_closet/quartermaster_scoundrel/populate_contents_immediate()
	. = ..()

	// Traitor steal objective
	new /obj/item/card/id/departmental_budget/car(src)



/obj/structure/closet/secure_closet/detective_scoundrel
	name = "\improper detective's cabinet"
	req_access = list(ACCESS_DETECTIVE)

/obj/structure/closet/secure_closet/detective_scoundrel/PopulateContents()
	..()
	new /obj/item/storage/backpack/duffelbag(src)
	new /obj/item/storage/box/evidence(src)
	new /obj/item/radio/headset/leader/bowman(src)
	new /obj/item/detective_scanner(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/holosign_creator/security(src)
	new /obj/item/pinpointer/crew(src)
	new /obj/item/binoculars(src)
	new /obj/item/storage/pouch/throwingstar/tracking(src)
	new /obj/item/storage/box/bolas(src)
	new /obj/item/storage/pouch/cuffs/preloaded(src)
