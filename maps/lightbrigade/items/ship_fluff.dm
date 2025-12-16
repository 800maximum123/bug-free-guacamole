/mob/living/simple_animal/passive/cat/fluff/beauclair
	name = "Beauclair"
	desc = "A prideful little creature with an unsatiable interest towards Captain's headwear. Don't let her into the engine rooms!"
	gender = FEMALE
	icon_state = "cat"
	item_state = "cat"
	icon_living = "cat"
	icon_dead = "cat_dead"
	skin_material = MATERIAL_SKIN_FUR_BLACK

/obj/random_multi/single_item/beauclair
	name = "Multi Point - Beauclair"
	id = "Beauclair"
	item_path = /mob/living/simple_animal/passive/cat/fluff/beauclair

/obj/structure/sign/lbrigplaque
	name = "\improper SFV Light Brigade dedication plaque"
	icon_state = "lightplaque"

/obj/structure/sign/lbrigplaque/Initialize()
	. = ..()
	desc = "SFV Light Brigade - Rockfish Class - SCGF Registry 27623 - Shiva Fleet Yards, Mars - Second Vessel To Bear The Name - Launched 2305 - Sol Central Government - 'In or out, they will never catch us.'"

//will need to relocate ALL OF THESE elsewhere
/obj/item/rig/ert/fleet/armsman
	name = "fleet armsman hardsuit control module"
	suit_type = "fleet armsman"
	req_access = list(access_explorer)
	initial_modules = list(
		/obj/item/rig_module/vision,
		/obj/item/rig_module/chem_dispenser/combat,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/mounted/energy/egun,
		/obj/item/rig_module/cooling_unit
		)

/obj/item/device/encryptionkey/armsman
	name = "armsman's encryption key"
	icon_state = "com_cypherkey"
	channels = list("Exploration" = 1, "Supply" = 1, "Hailing" = 1)

/obj/item/device/radio/headset/armsman
	name = "armsman headset"
	desc = "A headset of a badass space gunfighter."
	icon_state = "nt_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/armsman

/obj/item/device/encryptionkey/armsman_lead
	name = "armsman leader's encryption key"
	icon_state = "com_cypherkey"
	channels = list("Command" = 1, "Exploration" = 1, "Supply" = 1, "Hailing" = 1)

/obj/item/device/radio/headset/armsman/lead
	name = "armsman headset"
	desc = "A headset of the leader of a badass space gunfighters cabal."
	icon_state = "nt_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/armsman_lead