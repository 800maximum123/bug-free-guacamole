/obj/random/intel_console //Large objects to block things off in maintenance
	name = "intel terminal"
	desc = "This is a terminal spawn."
	icon = 'mods/_fd/junk_heaven/icons/landmarks.dmi'
	icon_state = "field"
	spawn_nothing_percentage = 50

/obj/random/intel_console/spawn_choices()
	return list(/obj/structure/intel_console)

/obj/random/relic
	name = "random relique"
	desc = "This is a random relique spawn."
	icon = 'mods/_fd/junk_heaven/icons/landmarks.dmi'
	icon_state = "relic"
	spawn_nothing_percentage = 80

/obj/random/relic/spawn_choices()
	return list(/obj/item/fd/ancient_items/psionic,
				/obj/item/fd/ancient_items/zippo,
				/obj/item/fd/ancient_items/corrupted_radio,
				/obj/item/fd/ancient_items/energy_container,
				/obj/item/fd/ancient_items/teddy_bear,
				/obj/item/fd/ancient_items/gold_necklace,
				/obj/item/fd/ancient_items/jap_neko,
				/obj/item/fd/ancient_items/starmap,
				/obj/item/fd/ancient_items/phone,
				/obj/item/fd/ancient_items/skull,
				/obj/item/fd/ancient_items/emerald,
				/obj/item/fd/ancient_items/corrupted_crowbar,
				/obj/item/fd/ancient_items/lighting_staff,
				/obj/item/fd/ancient_items/eye_of_the_maw
				)

/obj/random/junkyard/tool
	name = "random tool"
	desc = "This is a random tool."
	icon = 'icons/obj/tools/welder.dmi'
	icon_state = "welder"
	spawn_nothing_percentage = 50

/obj/random/junkyard/tool/spawn_choices()
	return list(/obj/item/screwdriver,
				/obj/item/wirecutters,
				/obj/item/weldingtool,
				/obj/item/weldingtool/largetank,
				/obj/item/crowbar,
				/obj/item/wrench,
				/obj/item/device/flashlight,
				/obj/item/device/flashlight/upgraded)

/obj/random/junkyard/tech_supply
	name = "random tech supply"
	desc = "This is a random piece of technology supplies."
	icon = 'icons/obj/modular_components.dmi'
	icon_state = "netcard_advanced"
	spawn_nothing_percentage = 80

/obj/random/junkyard/tech_supply/spawn_choices()
	return list(/obj/random/powercell = 3,
				/obj/random/technology_scanner = 2,
				/obj/item/stack/package_wrap = 1,
				/obj/item/hand_labeler = 1,
				/obj/random/bomb_supply = 2,
				/obj/item/extinguisher = 1,
				/obj/item/clothing/gloves/insulated/cheap = 1,
				/obj/item/stack/cable_coil = 2,
				/obj/random/toolbox = 2,
				/obj/item/storage/belt/utility = 2,
				/obj/item/storage/belt/utility/atmostech = 1,
				/obj/random/tool = 5,
				/obj/item/tape_roll = 2)

/obj/random/junkyard/smokes
	name = "random smokeable"
	desc = "This is a random smokeable item."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "Bpacket"
	spawn_nothing_percentage = 50

/obj/random/junkyard/smokes/spawn_choices()
	return list(/obj/item/storage/fancy/smokable/dromedaryco = 4,
				/obj/item/storage/fancy/smokable/killthroat = 1,
				/obj/item/storage/fancy/smokable/luckystars = 3,
				/obj/item/storage/fancy/smokable/jerichos = 3,
				/obj/item/storage/fancy/smokable/menthols = 2,
				/obj/item/storage/fancy/smokable/carcinomas = 3,
				/obj/item/storage/fancy/smokable/professionals = 2,
				/obj/item/storage/fancy/smokable/cigar = 1,
				/obj/item/clothing/mask/smokable/cigarette = 2,
				/obj/item/clothing/mask/smokable/cigarette/menthol = 2,
				/obj/item/clothing/mask/smokable/cigarette/cigar = 1,
				/obj/item/clothing/mask/smokable/cigarette/cigar/cohiba = 1,
				/obj/item/clothing/mask/smokable/cigarette/cigar/havana = 1)

/obj/random/junkyard/powercell
	name = "random powercell"
	desc = "This is a random powercell."
	icon = 'icons/obj/powercells.dmi'
	icon_state = "hcell"
	spawn_nothing_percentage = 80

/obj/random/junkyard/powercell/spawn_choices()
	return list(/obj/item/cell/crap = 1,
				/obj/item/cell/standard = 8,
				/obj/item/cell/high = 5,
				/obj/item/cell/super = 2,
				/obj/item/cell/hyper = 1,
				/obj/item/cell/device/standard = 7,
				/obj/item/cell/device/high = 5)

/obj/random/junkyard/bomb_supply
	name = "bomb supply"
	desc = "This is a random bomb supply."
	icon = 'icons/obj/assemblies/new_assemblies.dmi'
	icon_state = "signaller"
	spawn_nothing_percentage = 30

/obj/random/junkyard/bomb_supply/spawn_choices()
	return list(/obj/item/device/assembly/igniter,
				/obj/item/device/assembly/prox_sensor,
				/obj/item/device/assembly/signaler,
				/obj/item/device/assembly/timer,
				/obj/item/device/multitool)

/obj/random/junkyard/toolbox
	name = "random toolbox"
	desc = "This is a random toolbox."
	icon = 'icons/obj/tools/toolboxes.dmi'
	icon_state = "red"
	spawn_nothing_percentage = 30

/obj/random/junkyard/toolbox/spawn_choices()
	return list(/obj/item/storage/toolbox/mechanical = 30,
				/obj/item/storage/toolbox/electrical = 20,
				/obj/item/storage/toolbox/emergency = 20,
				/obj/item/storage/toolbox/syndicate = 1)

/obj/random/junkyard/medical
	name = "Random Medical equipment"
	desc = "This is a random medical item."
	icon = 'icons/obj/medical.dmi'
	icon_state = "fak-light"
	spawn_nothing_percentage = 50

/obj/random/junkyard/medical/spawn_choices()
	return list(/obj/random/medical/lite = 21,
				/obj/item/bodybag = 2,
				/obj/item/reagent_containers/glass/bottle/inaprovaline = 2,
				/obj/item/reagent_containers/glass/bottle/antitoxin = 2,
				/obj/item/storage/pill_bottle = 2,
				/obj/item/storage/pill_bottle/tramadol = 1,
				/obj/item/storage/pill_bottle/citalopram = 2,
				/obj/item/storage/pill_bottle/dexalin_plus = 1,
				/obj/item/storage/pill_bottle/dermaline = 1,
				/obj/item/storage/pill_bottle/bicaridine = 1,
				/obj/item/reagent_containers/syringe/antitoxin = 2,
				/obj/item/reagent_containers/syringe/antiviral = 1,
				/obj/item/reagent_containers/syringe/inaprovaline = 2,
				/obj/item/storage/box/freezer = 1,
				/obj/item/stack/nanopaste = 1)

/obj/random/junkyard/medical/lite
	name = "Random Medicine"
	desc = "This is a random simple medical item."
	icon = 'icons/obj/medical.dmi'
	icon_state = "gauze"
	spawn_nothing_percentage = 25

/obj/random/junkyard/medical/lite/spawn_choices()
	return list(/obj/item/stack/medical/bruise_pack = 4,
				/obj/item/stack/medical/ointment = 4,
				/obj/item/storage/pill_bottle/antidexafen = 2,
				/obj/item/storage/pill_bottle/paracetamol = 2,
				/obj/item/stack/medical/advanced/bruise_pack = 2,
				/obj/item/stack/medical/advanced/ointment = 2,
				/obj/item/stack/medical/splint = 1,
				/obj/item/reagent_containers/hypospray/autoinjector = 3,
				/obj/item/storage/pill_bottle/kelotane = 2,
				/obj/item/storage/pill_bottle/antitox = 2,
				/obj/item/storage/med_pouch/trauma = 2,
				/obj/item/storage/med_pouch/burn = 2,
				/obj/item/storage/med_pouch/toxin = 2,
				/obj/item/storage/med_pouch/radiation = 2,
				/obj/item/storage/med_pouch/oxyloss = 2)

/obj/random/junkyard/material //Random materials for building stuff
	name = "random material"
	desc = "This is a random material."
	icon = 'icons/obj/materials/materials.dmi'
	icon_state = "sheet"
	spawn_nothing_percentage = 60

/obj/random/junkyard/material/spawn_choices()
	return list(/obj/item/stack/material/steel/ten,
				/obj/item/stack/material/glass/ten,
				/obj/item/stack/material/glass/reinforced/ten,
				/obj/item/stack/material/plastic/ten,
				/obj/item/stack/material/wood/ten,
				/obj/item/stack/material/cardboard/ten,
				/obj/item/stack/material/rods/ten,
				/obj/item/stack/material/plasteel/ten,
				/obj/item/stack/material/steel/fifty,
				/obj/item/stack/material/glass/fifty,
				/obj/item/stack/material/glass/reinforced/fifty,
				/obj/item/stack/material/plastic/fifty,
				/obj/item/stack/material/wood/fifty,
				/obj/item/stack/material/cardboard/fifty,
				/obj/item/stack/material/rods/fifty,
				/obj/item/stack/material/plasteel/fifty)

/obj/random/junkyard/biggun
	name = "Random Heavy Weapon"
	desc = "This is a random rifle."
	icon = 'icons/obj/guns/assault_rifle.dmi'
	icon_state = "arifle"
	spawn_nothing_percentage = 50

/obj/random/junkyard/biggun/spawn_choices()
	return list(/obj/item/gun/energy/lasercannon,
				/obj/item/gun/energy/laser,
				/obj/item/gun/energy/captain,
				/obj/item/gun/energy/pulse_rifle,
				/obj/item/gun/energy/pulse_rifle/carbine,
				/obj/item/gun/energy/sniperrifle,
				/obj/item/gun/projectile/shotgun/doublebarrel,
				/obj/item/gun/energy/xray,
				/obj/item/gun/projectile/automatic/battlerifle,
				/obj/item/gun/projectile/sniper/semistrip,
				/obj/item/gun/projectile/sniper/garand,
				/obj/item/gun/projectile/automatic/assault_rifle,
				/obj/item/gun/projectile/automatic/sec_smg,
				/obj/item/gun/energy/crossbow/largecrossbow,
				/obj/item/gun/projectile/shotgun/pump/combat,
				/obj/item/gun/energy/ionrifle,
				/obj/item/gun/projectile/shotgun/pump
	)

/obj/random/junkyard/lilgun
	name = "Random Light Weapon"
	desc = "This is a random sidearm."
	icon = 'icons/obj/guns/pistol.dmi'
	icon_state = "secguncomp"
	spawn_nothing_percentage = 50

/obj/random/junkyard/lilgun/spawn_choices()
	return list(/obj/item/gun/projectile/pistol/sec,
				/obj/item/gun/energy/gun,
				/obj/item/gun/energy/stunrevolver,
				/obj/item/gun/projectile/shotgun/doublebarrel/sawn,
				/obj/item/gun/energy/xray/pistol,
				/obj/item/gun/energy/pulse_rifle/pistol,
				/obj/item/gun/energy/plasmacutter,
				/obj/item/gun/energy/incendiary_laser,
				/obj/item/gun/projectile/automatic/machine_pistol,
				/obj/item/gun/projectile/pistol/military,
				/obj/item/gun/projectile/pistol/holdout,
				/obj/item/gun/projectile/revolving/heavy,
				/obj/item/gun/projectile/revolving/medium,
				/obj/item/gun/energy/retro,
				/obj/item/gun/projectile/pistol/throwback,
				/obj/item/gun/energy/ionrifle/small
	)

/obj/random/junkyard/ammo
	name = "Random Ammunition"
	desc = "This is random ammunition."
	icon = 'icons/obj/weapons/ammo.dmi'
	icon_state = "magnum"
	spawn_nothing_percentage = 30

/obj/random/junkyard/ammo/spawn_choices()
	return list(/obj/item/storage/box/ammo/beanbags = 6,
				/obj/item/storage/box/ammo/shotgunammo = 2,
				/obj/item/storage/box/ammo/shotgunshells = 4,
				/obj/item/storage/box/ammo/flechetteshells = 2,
				/obj/item/storage/box/ammo/stunshells = 1,
				/obj/item/ammo_magazine/pistol = 2,
				/obj/item/ammo_magazine/smg_top = 2,
				/obj/item/ammo_magazine/smg_top/rubber = 6,
				/obj/item/ammo_magazine/pistol/throwback = 1)

/obj/random/junkyard/cash
	name = "random currency"
	desc = "LOADSAMONEY!"
	icon = 'icons/obj/money.dmi'
	icon_state = "spacecash1"
	spawn_nothing_percentage = 50

/obj/random/cash/junkyard/spawn_choices()
	return list(/obj/item/spacecash/bundle/c1 = 4,
				/obj/item/spacecash/bundle/c10 = 3,
				/obj/item/spacecash/bundle/c20 = 3,
				/obj/item/spacecash/bundle/c50 = 2,
				/obj/item/spacecash/bundle/c100 = 2,
				/obj/item/spacecash/bundle/c1000 = 1)

/obj/random/junkyard/advdevice
	name = "random advanced device"
	desc = "This is a random advanced device."
	icon = 'icons/obj/tools/drone_control.dmi'
	icon_state = "pad_designator"
	spawn_nothing_percentage = 30

/obj/random/junkyard/advdevice/spawn_choices()
	return list(/obj/item/device/flashlight/lantern,
				/obj/item/device/flashlight/flare,
				/obj/item/device/flashlight/pen,
				/obj/item/device/toner,
				/obj/item/device/paicard,
				/obj/item/device/destTagger,
				/obj/item/beartrap,
				/obj/item/handcuffs,
				/obj/item/camera_assembly,
				/obj/item/device/camera,
				/obj/item/modular_computer/pda,
				/obj/item/card/emag_broken,
				/obj/item/device/radio/headset,
				/obj/item/device/flashlight/flare/glowstick/yellow,
				/obj/item/device/flashlight/flare/glowstick/orange,
				/obj/item/grenade/light,
				/obj/item/device/oxycandle,
				/obj/item/device/flashlight/upgraded)

/obj/random/junkyard/handgun
	name = "Random Handgun"
	desc = "This is a random sidearm."
	icon = 'icons/obj/guns/pistol.dmi'
	icon_state = "secguncomp"
	spawn_nothing_percentage = 50

/obj/random/junkyard/handgun/spawn_choices()
	return list(/obj/item/gun/projectile/pistol/sec = 3,
				/obj/item/gun/energy/gun = 2,
				/obj/item/gun/projectile/pistol/military = 1,
				/obj/item/gun/projectile/pistol/holdout = 2,
				/obj/item/gun/energy/retro = 1,
				/obj/item/gun/projectile/pistol/throwback = 1,
				/obj/item/gun/projectile/boltloader/broomstick = 1)

/obj/random/junkyard/obstruction //Large objects to block things off in maintenance
	name = "random obstruction"
	desc = "This is a random obstruction."
	icon = 'icons/obj/cult.dmi'
	icon_state = "cultgirder"
	spawn_nothing_percentage = 30

/obj/random/junkyard/obstruction/spawn_choices()
	return list(/obj/structure/barricade,
				/obj/structure/girder,
				/obj/structure/girder/displaced,
				/obj/structure/grille,
				/obj/structure/grille/broken,
				/obj/structure/foamedmetal,
				/obj/item/caution,
				/obj/item/caution/cone,
				/obj/structure/inflatable/wall,
				/obj/structure/inflatable/door)

/obj/random/junkyard/pod
	name = "survivor pod"
	desc = "This is a random survivor pod."
	icon_state = "x3"
	spawn_nothing_percentage = 80

/obj/random/junkyard/pod/spawn_choices()
	return list(/obj/structure/abandoned_cryo)

/obj/random/junkyard/loot /*Better loot for away missions and salvage */
	name = "random loot"
	desc = "This is some random loot."
	icon = 'icons/obj/parcels.dmi'
	icon_state = "gift3"
	spawn_nothing_percentage = 30

/obj/random/junkyard/loot/spawn_choices()
	return list(/obj/random/junkyard/tool = 10,
				/obj/random/junkyard/ammo = 10,
				/obj/random/junkyard/biggun = 10,
				/obj/random/junkyard/lilgun = 10,
				/obj/random/junkyard/handgun = 10,
				/obj/random/junkyard/material = 10,
				/obj/random/junkyard/medical/lite = 10,
				/obj/random/junkyard/toolbox = 10,
				/obj/random/junkyard/cash = 10,
				/obj/random/junkyard/advdevice = 10,
				/obj/random/junkyard/tech_supply = 10,
				/obj/item/clothing/mask/muzzle = 7,
				/obj/item/clothing/mask/gas/vox = 8,
				/obj/item/clothing/mask/gas/syndicate = 10,
				/obj/item/clothing/glasses/night = 3,
				/obj/item/clothing/glasses/thermal = 1,
				/obj/item/clothing/glasses/welding/superior = 7,
				/obj/item/clothing/head/collectable/petehat = 4,
				/obj/item/clothing/suit/storage/vest/merc = 3,
				/obj/item/clothing/suit/straight_jacket = 6,
				/obj/item/clothing/head/helmet/merc = 3,
				/obj/item/stack/material/diamond/ten = 7,
				/obj/item/stack/material/glass/reinforced/ten = 7,
				/obj/item/stack/material/marble/ten = 8,
				/obj/item/stack/material/phoron/ten = 7,
				/obj/item/stack/material/gold/ten = 7,
				/obj/item/stack/material/silver/ten = 7,
				/obj/item/stack/material/osmium/ten = 7,
				/obj/item/stack/material/platinum/ten = 8,
				/obj/item/stack/material/tritium/ten = 7,
				/obj/item/stack/material/mhydrogen/ten = 6,
				/obj/item/stack/material/plasteel/ten = 9,
				/obj/item/storage/box/monkeycubes = 5,
				/obj/item/storage/box/monkeycubes/neaeracubes = 4,
				/obj/item/storage/box/monkeycubes/stokcubes = 4,
				/obj/item/storage/box/monkeycubes/farwacubes = 4,
				/obj/item/storage/firstaid/surgery = 4,
				/obj/item/archaeological_find = 2,
				/obj/item/device/multitool/hacktool = 2,
				/obj/item/surgicaldrill = 7,
				/obj/item/FixOVein = 7,
				/obj/item/retractor = 7,
				/obj/item/hemostat = 7,
				/obj/item/cautery = 7,
				/obj/item/bonesetter = 7,
				/obj/item/bonegel = 7,
				/obj/item/circular_saw = 7,
				/obj/item/scalpel = 7,
				/obj/item/melee/baton/stun/loaded = 9,
				/obj/item/device/radio/headset/syndicate = 6)

/obj/random/junkyard/hostile
	name = "Random Hostile Mob"
	desc = "This is a random hostile mob."
	icon = 'icons/mob/crow.dmi'
	icon_state = "crow"
	spawn_nothing_percentage = 50

/obj/random/junkyard/hostile/spawn_choices()
	return list(/mob/living/simple_animal/hostile/viscerator,
				/mob/living/simple_animal/hostile/carp,
				/mob/living/simple_animal/hostile/carp/pike,
				/mob/living/simple_animal/hostile/hivebot/range,
				/mob/living/simple_animal/hostile/hivebot/strong,
				/mob/living/simple_animal/hostile/hivebot/rapid)
