//this should remove most of the regular antag items from the list
/datum/uplink_item/item/ammo
	antag_roles = list("Exclude", MODE_MISC_PMC)

/datum/uplink_item/item/visible_weapons
	antag_roles = list("Exclude", MODE_MISC_PMC)

/datum/uplink_item/item/structures_and_vehicles
	antag_roles = list("Exclude", MODE_MISC_PMC)

/datum/uplink_item/item/stealth_items
	antag_roles = list("Exclude", MODE_MISC_PMC)

/datum/uplink_item/item/stealthy_weapons
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
	item_cost = 30
	antag_roles = null

/datum/uplink_item/item/visible_weapons/broomstick
	item_cost = 35
	antag_roles = null

/datum/uplink_item/item/visible_weapons/machine_pistol
	item_cost = 35
	antag_roles = null

/datum/uplink_item/item/visible_weapons/wt302
	name = "Service Pistol, SCG, Full-Size"
	desc = "A Ward-Takahashi 302. A large pistol issued as an SCGDF service weapon. Can be modified for full-auto fire."
	item_cost = 35
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
	item_cost = 35
	antag_roles = null
	path = /obj/item/gun/projectile/pistol/sol_compact

/datum/uplink_item/item/visible_weapons/optimus
	item_cost = 35
	antag_roles = null

/datum/uplink_item/item/visible_weapons/bobcat
	item_cost = 30
	antag_roles = null

/datum/uplink_item/item/visible_weapons/deagle
	item_cost = 45
	antag_roles = null

/datum/uplink_item/item/visible_weapons/detective_revolver
	item_cost = 20
	antag_roles = null

/datum/uplink_item/item/visible_weapons/compact_smg
	name = "Compact SMG, PMC"
	desc = "A highly configurable 4mm SMG with an extendable stock for better accuracy. Shreds right through infantry armour with AP ammo!"
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 35
	path = /obj/item/gun/projectile/automatic/contempt

/datum/uplink_item/item/visible_weapons/molot
	name = "caseless rifle, ICCG"
	desc = "A MOLOT-pattern caseless bullpup rifle straight from ICCGN surplus. A regular infantry version of it."
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 35
	path = /obj/item/gun/projectile/automatic/molot

/datum/uplink_item/item/visible_weapons/molot_grenadier
	name = "caseless rifle, ICCG, grenadier"
	desc = "A MOLOT-pattern caseless bullpup rifle straight from ICCGN surplus. This one comes with an underbarrel grenade launcher."
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 45
	path = /obj/item/gun/projectile/automatic/molot/grenadier

/datum/uplink_item/item/visible_weapons/ocelot
	name = "caseless rifle, SCG"
	desc = "An H3 Ocelot caseless rifle, either captured as trophy or bought on black market. A regular infantry version of it."
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 35
	path = /obj/item/gun/projectile/automatic/caseless

/datum/uplink_item/item/visible_weapons/ocelot_grenadier
	name = "caseless rifle, SCG, grenadier"
	desc = "An H3 Ocelot caseless rifle, either captured as trophy or bought on black market. This one comes with an underbarrel grenade launcher."
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 45
	path = /obj/item/gun/projectile/automatic/caseless/grenadier

/datum/uplink_item/item/visible_weapons/ocelot_marksman
	name = "caseless rifle, SCG, marksman"
	desc = "An H3 Ocelot caseless rifle, either captured as trophy or bought on black market. This one is a semi-auto only marksman version with a scope."
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 50
	path = /obj/item/gun/projectile/sniper/caseless

/datum/uplink_item/item/visible_weapons/combat_shotgun
	item_cost = 40
	antag_roles = list(MODE_MISC_PMC)

/datum/uplink_item/item/visible_weapons/service_shotgun
	name = "combat shotgun, SCG, semi-auto"
	desc = "An MSS8 Rammer semi-auto shotgun, likely stolen from the local policemen. Finally, you don't have to rack the pump after each shot."
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 50
	path = /obj/item/gun/projectile/shotgun/pump/sol_service

//AMMO: tweaked prices
/datum/uplink_item/item/ammo/pistol
	antag_roles = null
	item_cost = 2

/datum/uplink_item/item/ammo/pistol_single
	antag_roles = null
	item_cost = 1

/datum/uplink_item/item/ammo/speedloader
	antag_roles = null
	item_cost = 1

/datum/uplink_item/item/ammo/holdout
	antag_roles = null
	item_cost = 2

/datum/uplink_item/item/ammo/holdout_speedloader
	antag_roles = null
	item_cost = 1

/datum/uplink_item/item/ammo/magnum
	antag_roles = null
	item_cost = 4

/datum/uplink_item/item/ammo/shotgun_shells
	antag_roles = null
	item_cost = 2

/datum/uplink_item/item/ammo/flechette_shells
	antag_roles = list(MODE_MERCENARY, MODE_MISC_PMC)
	item_cost = 4

/datum/uplink_item/item/ammo/shotgun_slugs
	antag_roles = null
	item_cost = 2

/datum/uplink_item/item/ammo/machine_pistol
	antag_roles = null
	item_cost = 4

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
	item_cost = 2
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
	item_cost = 8
	antag_roles = null

/datum/uplink_item/item/tools/night_goggles
	antag_roles = list(MODE_TRAITOR, MODE_MERCENARY, MODE_MISC_PMC)

/datum/uplink_item/item/tools/handcuffs
	antag_roles = null

//GRENADES: added explosive variants
/datum/uplink_item/item/grenades/fragshell
	name = "1x Fragmentation Shell"
	desc = "Weaker than standard fragmentation grenades, these devices can be fired from a grenade launcher."
	item_cost = 6
	antag_roles = list(MODE_MISC_PMC, MODE_MERCENARY)
	path = /obj/item/grenade/frag/shell

/datum/uplink_item/item/grenades/fragshells
	name = "5x Fragmentation Shells"
	desc = "Weaker than standard fragmentation grenades, these devices can be fired from a grenade launcher."
	item_cost = 18
	antag_roles = list(MODE_MISC_PMC, MODE_MERCENARY)
	path = /obj/item/storage/box/fragshells

/datum/uplink_item/item/grenades/frag
	item_cost = 2
	antag_roles = list(MODE_MISC_PMC, MODE_MERCENARY)

/datum/uplink_item/item/grenades/frags
	item_cost = 12
	antag_roles = list(MODE_MISC_PMC, MODE_MERCENARY)

//STEALTH ACCESSORIES: basic covert tools
/datum/uplink_item/item/stealth_items/tactical_sneaky_armor
	item_cost = 12
	antag_roles = null

/datum/uplink_item/item/stealth_items/balaclava
	antag_roles = null

/datum/uplink_item/item/stealth_items/caltrops
	item_cost = 4
	antag_roles = null

//MEDICAL: tweaked to prevent abuse
/datum/uplink_item/item/medical/healthyfood
	item_cost = 5

/datum/uplink_item/item/medical/combatstim
	item_cost = 10

/datum/uplink_item/item/medical/stabilisation
	item_cost = 10

/datum/uplink_item/item/medical/stasis
	item_cost = 10

/datum/uplink_item/item/medical/defib
	item_cost = 25

/datum/uplink_item/item/medical/advancedmedibag
	item_cost = 25

/datum/uplink_item/item/medical/combat
	item_cost = 60

//BADASSERY: hawaiian shirts
/datum/uplink_item/item/badassery/hawaii_shirt
	name = "Hawaii Shirt"
	desc = "Wanna impress those poor conscripts in boring uniforms? Get a flashy floral shirt! Tactical! Impressive!"
	antag_roles = list(MODE_MISC_PMC)
	item_cost = 5
	path = /obj/item/clothing/accessory/toggleable/hawaii/random
