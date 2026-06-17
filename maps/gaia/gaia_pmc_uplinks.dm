//this should remove most of the regular antag items from the list
/datum/uplink_item/item/visible_weapons
	antag_roles = list("Exclude", MODE_MISC_PMC)

/datum/uplink_item/item/structures_and_vehicles
	antag_roles = list("Exclude", MODE_MISC_PMC)

/datum/uplink_item/item/stealth_items
	antag_roles = list("Exclude", MODE_MISC_PMC)

/datum/uplink_item/item/services
	antag_roles = list("Exclude", MODE_MISC_PMC)

/datum/uplink_item/item/implants
	antag_roles = list("Exclude", MODE_MISC_PMC)

/datum/uplink_item/item/hardsuit_modules
	antag_roles = list("Exclude", MODE_MISC_PMC)

/datum/uplink_item/item/tools
	antag_roles = list("Exclude", MODE_MISC_PMC)

//PMC-specific items - GUNS
/datum/uplink_item/item/visible_weapons/katana
	antag_roles = null

/datum/uplink_item/item/visible_weapons/energy_sword
	antag_roles = null

/datum/uplink_item/item/visible_weapons/silenced
	antag_roles = null

/datum/uplink_item/item/visible_weapons/broomstick
	antag_roles = null

/datum/uplink_item/item/visible_weapons/machine_pistol
	antag_roles = null

/datum/uplink_item/item/visible_weapons/wt302
	name = "Service Pistol, SCG, Full-Size"
	desc = "A Ward-Takahashi 302. A large pistol issued as an SCGDF service weapon. Can be modified for full-auto fire."
	item_cost = 40
	antag_roles = null
	path = /obj/item/gun/projectile/pistol/sol_service

/datum/uplink_item/item/visible_weapons/wt302_autosear
	name = "SCG Service Pistol Autosear"
	desc = "A small parts kit for a standard SCG WT302 pistol. Attaches to the back and makes it fully automatic."
	item_cost = 10
	antag_roles = null
	path = /obj/item/autosear

/datum/uplink_item/item/visible_weapons/m19c
	name = "Service Pistol, SCG, Compact"
	desc = "A Hephaestus Industries M19C. A small pistol issued as an SCGDF service weapon. Fits in a pocket."
	item_cost = 42
	antag_roles = null
	path = /obj/item/gun/projectile/pistol/sol_compact

/datum/uplink_item/item/visible_weapons/optimus
	antag_roles = null

/datum/uplink_item/item/visible_weapons/bobcat
	antag_roles = null

/datum/uplink_item/item/visible_weapons/compact_smg
	name = "Compact SMG"
	desc = "A highly configurable 4mm SMG with an extendable stock for better accuracy. Shreds right through infantry armour with AP ammo!"
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 40
	path = /obj/item/gun/projectile/automatic/contempt

/datum/uplink_item/item/visible_weapons/combat_shotgun
	item_cost = 60
	antag_roles = list(MODE_MISC_PMC)

/datum/uplink_item/item/visible_weapons/deagle
	antag_roles = null

/datum/uplink_item/item/visible_weapons/detective_revolver
	antag_roles = null

//AMMO
/datum/uplink_item/item/ammo/smg_piercer
	name = "Armour-Piercing SMG magazine"
	desc = "A 4mm mag of M190 AP rounds, designed for the Contempt compact SMG. Defeats body armour consistently. Contains 40 rounds."
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 6
	path = /obj/item/ammo_magazine/piercing_smg

/datum/uplink_item/item/ammo/smg_expander
	name = "Hollow Point SMG magazine"
	desc = "A 4mm mag of M195 JHP rounds, designed for the Contempt compact SMG. Increased raw damage output. Contains 40 rounds."
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 4
	path = /obj/item/ammo_magazine/piercing_smg/expander

/datum/uplink_item/item/ammo/caseless_mag
	name = "Standard Caseless Magazine"
	desc = "A standard-issue 6mm caseless magazine for ground assault rifles such as MOLOT and H3 Ocelot. Contains 24 rounds."
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 2
	path = /obj/item/ammo_magazine/caseless_rifle

//TOOLS: PMC-specific gear
/datum/uplink_item/item/tools/pmc_vest
	name = "PMC plate carrier"
	desc = "A fully assembled plate carrier vest with an impact-resistant yet lightweight plate. Helmet not included. Suit up!"
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 8
	path = /obj/item/clothing/suit/armor/pcarrier/pmc

/datum/uplink_item/item/tools/pmc_helmet
	name = "PMC combat helmet"
	desc = "A fully assembled impact-resistant helmet with a fabric cover. Body armour not included. Suit up!"
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 6
	path = /obj/item/clothing/head/helmet/pmc

//TOOLS: standard ones
/datum/uplink_item/item/tools/plastique
	antag_roles = null

/datum/uplink_item/item/tools/night_goggles
	antag_roles = list(MODE_TRAITOR, MODE_MERCENARY, MODE_MISC_PMC)

/datum/uplink_item/item/tools/handcuffs
	antag_roles = null

//BADASSERY: hawaiian shirts
/datum/uplink_item/item/badassery/hawaii_shirt
	name = "Hawaii Shirt"
	desc = "Wanna impress those poor conscripts in boring uniforms? Get a flashy floral shirt! Tactical! Impressive!"
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 8
	path = /obj/item/clothing/accessory/toggleable/hawaii/random
