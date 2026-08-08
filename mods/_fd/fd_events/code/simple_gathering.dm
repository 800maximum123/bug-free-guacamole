/obj/structure/flora
	var/react_to_movement = FALSE
	var/do_the_sound = FALSE

	var/rand_steps = FALSE
	var/lower_steps = 1
	var/top_steps = 4

	var/multiple_steps
	var/multiple_icons = FALSE
	var/base_icon_name = "bleh"

	var/has_drop = FALSE
	var/regrowth_after_harvesting = FALSE
	var/regrowing = FALSE
	var/obj/item/item_to_drop = null

	var/list/allowed_harvest_tools = list(/obj/item/material/hatchet,
										/obj/item/material/hatchet/unbreakable,
										/obj/item/material/hatchet/machete,
										/obj/item/material/hatchet/machete/deluxe,
										/obj/item/material/hatchet/machete/facility,
										/obj/item/material/hatchet/machete/mech,
										/obj/item/material/hatchet/machete/plasteel,
										/obj/item/material/hatchet/machete/steel,
										/obj/item/material/hatchet/machete/uranium,
										/obj/item/material/hatchet/machete/unbreakable,
										/obj/item/material/twohanded/fireaxe,
										/obj/item/material/scythe)

/obj/structure/flora/Initialize()
	. = ..()
	if(multiple_icons && rand_steps)
		multiple_steps = rand(lower_steps,top_steps)

		icon_state = "[base_icon_name]_[multiple_steps]"

/obj/structure/flora/proc/regrowth()
	animate(src, transform = matrix(1, MATRIX_SCALE), time = 0.5 SECONDS, easing = BOUNCE_EASING|EASE_OUT)
	mouse_opacity = 1

	regrowing = FALSE

/obj/structure/flora/use_weapon(obj/item/weapon, mob/living/user, list/click_params)
	. = ..()

	if(multiple_steps > 0 && !regrowing)
		if(weapon.type in allowed_harvest_tools)
			user.cool_attack_on(src)
			multiple_steps -= 1

			animate(src, pixel_x = pixel_x - 1, pixel_y = pixel_y, time = 0.5, easing = EASE_IN)
			animate(pixel_x = pixel_x + 1, pixel_y = pixel_y, time = 1)
			animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 0.3, easing = EASE_OUT)

			if(multiple_icons)
				icon_state = "[base_icon_name]_[multiple_steps]"

			if(multiple_steps <= 0)
				if(has_drop)
					new item_to_drop(get_turf(src))

				if(regrowth_after_harvesting)
					var/obj/structure/flora/F = new type(get_turf(src))
					F.SetTransform(0.01)
					F.mouse_opacity = 0
					F.regrowing = TRUE
					addtimer(new Callback(F, TYPE_PROC_REF(/obj/structure/flora, regrowth)), 5 MINUTE)
				qdel(src)

/obj/structure/flora/Crossed(mob/living/M)
	. = ..()

	if(react_to_movement && isliving(M) && !regrowing)
		if(MOVING_QUICKLY(M) && do_the_sound && ishuman(M))
			balloon_alert_to_viewers("|ШОРХ!|", null, COLOR_WHITE)

		animate(src, pixel_x = pixel_x - 1, pixel_y = pixel_y, time = 0.5, easing = EASE_IN)
		animate(pixel_x = pixel_x + 1, pixel_y = pixel_y, time = 1)
		animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 0.3, easing = EASE_OUT)

/obj/structure/flora/tree

	multiple_steps = 10
	has_drop = TRUE
	item_to_drop = /obj/item/stack/material/wood/ten

/obj/structure/vines
	var/react_to_movement = TRUE
	var/do_the_sound = TRUE

/obj/structure/vines/Crossed(mob/living/M)
	. = ..()

	if(react_to_movement && isliving(M))
		if(MOVING_QUICKLY(M) && do_the_sound)
			balloon_alert_to_viewers("|ШОРХ!|", null, COLOR_WHITE)

		animate(src, pixel_x = pixel_x - 1, pixel_y = pixel_y, time = 0.5, easing = EASE_IN)
		animate(pixel_x = pixel_x + 1, pixel_y = pixel_y, time = 1)
		animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 0.3, easing = EASE_OUT)

/obj/structure/flora/jungle/bush
	react_to_movement = TRUE
	do_the_sound = TRUE

/obj/structure/flora/ausbushes
	react_to_movement = TRUE

/obj/structure/flora/seaweed
	react_to_movement = TRUE

/obj/structure/flora/seaweed/fd
	icon = 'mods/_fd/fd_assets/icons/goons/sealab_objects.dmi'
	icon_state = "kelp"

/obj/structure/flora/tall
	name = "plant"
	icon = 'mods/_fd/fd_assets/icons/vampires/flora32x48.dmi'
	icon_state = "tallgrass_4"
	layer = 4.07
	anchored = TRUE

	rand_steps = TRUE

	react_to_movement = TRUE
	do_the_sound = TRUE

	multiple_icons = TRUE
	base_icon_name = "tallgrass"
	has_drop = TRUE
	item_to_drop = /obj/item/stack/material/fiber

/obj/structure/flora/tall/second
	icon_state = "drytallgrass_4"
	base_icon_name = "drytallgrass"

/obj/structure/flora/tall/third
	icon_state = "redplant_4"
	base_icon_name = "redplant"

	regrowth_after_harvesting = TRUE
	rand_steps = FALSE

	multiple_steps = 4
	has_drop = TRUE
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/tastycactus

/obj/structure/flora/tall/fourth
	icon_state = "grass_4"
	base_icon_name = "grass"

	regrowth_after_harvesting = TRUE
	rand_steps = FALSE

	multiple_steps = 4
	has_drop = TRUE
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/corn

/obj/structure/flora/trk17_simple
	anchored = TRUE

	name = "plant"
	react_to_movement = TRUE
	icon = 'mods/_fd/fd_assets/icons/vampires/flowers.dmi'
	icon_state = "velvet_turtleback"

/obj/structure/flora/trk17_simple/alt
	icon_state = "wooly_bluestar"

/obj/structure/flora/trk17_regrowing
	name = "plant"
	icon = 'mods/_fd/fd_assets/icons/vampires/flowers.dmi'
	icon_state = "marigold"
	regrowth_after_harvesting = TRUE

	anchored = TRUE

	react_to_movement = TRUE

	multiple_steps = 1
	has_drop = TRUE
	item_to_drop = null

/obj/structure/flora/trk17_regrowing/cucumber
	icon_state = "evening_primrose"
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/saltygreen

/obj/structure/flora/trk17_regrowing/sugar
	icon_state = "yerba_mansa"
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/sugarcrop

/obj/structure/flora/trk17_regrowing/ice_tricord
	icon_state = "prairie_flax"
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/coldcrop

/obj/structure/flora/trk17_regrowing/hot_dylov
	icon_state = "indian_paintbrush"
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/firecrop

/obj/structure/flora/trk17_regrowing/coffee
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/coffecrop

//// rubble

/obj/structure/rubble/chaos
	loot = list(
					/obj/item/material/twohanded/spear,
					/obj/item/fd/fishing/worm_can,
					/obj/item/fd/fishing/worm/eldritch,
					/obj/item/fd/fishing/lure/buzz,
					/obj/item/fd/fishing/lure/algae,
					/obj/item/fd/fishing/lure/lucky,
					/obj/item/fd/fishing/lure/led,
					/obj/item/fd/fishing/reel,
					/obj/item/fishing_rod,
//REAGENT CONTAINERS,
					/obj/item/reagent_containers/hypospray/autoinjector/pain,
					/obj/item/reagent_containers/hypospray/autoinjector/antirad,
					/obj/item/reagent_containers/hypospray/autoinjector/mindbreaker,
					/obj/item/reagent_containers/hypospray/autoinjector/inaprovaline,
					/obj/item/reagent_containers/spray/cleaner,
					/obj/item/reagent_containers/spray/pepper,
					/obj/item/reagent_containers/food/snacks/slice/meatbread,
					/obj/item/reagent_containers/food/snacks/slice/bananabread,
					/obj/item/reagent_containers/food/snacks/slice/braincake,
					/obj/item/reagent_containers/food/snacks/slice/chocolatecake,
					/obj/item/reagent_containers/food/snacks/slice/bread,
					/obj/item/reagent_containers/food/snacks/slice/meatpizza,
					/obj/item/reagent_containers/food/drinks/bottle/whiskey,
					/obj/item/reagent_containers/food/drinks/bottle/vodka,
					/obj/item/reagent_containers/food/drinks/bottle/rum,
					/obj/item/reagent_containers/food/drinks/bottle/wine,
					/obj/item/reagent_containers/food/drinks/bottle/champagne,
					/obj/item/reagent_containers/food/drinks/bottle/small/beer,
					/obj/item/reagent_containers/food/drinks/bottle/small/beer/fake,
					/obj/item/reagent_containers/food/drinks/bottle/small/space_up,
					/obj/item/reagent_containers/food/drinks/bottle/oiljug,
					/obj/item/broken_bottle,
					/obj/item/reagent_containers/food/drinks/milk,
					/obj/item/reagent_containers/food/drinks/golden_cup,
					/obj/item/reagent_containers/food/drinks/dry_ramen,
					/obj/item/reagent_containers/food/drinks/sillycup,
					/obj/item/reagent_containers/food/drinks/teapot,
					/obj/item/reagent_containers/food/drinks/flask,
					/obj/item/reagent_containers/food/drinks/flask/vacuumflask,
					/obj/item/reagent_containers/glass/rag,
					/obj/item/reagent_containers/glass/beaker/large,
					/obj/item/reagent_containers/glass/beaker/bowl,
					/obj/item/reagent_containers/glass/beaker/bluespace,
					/obj/item/reagent_containers/glass/beaker,
					/obj/item/reagent_containers/glass/bucket,
					/obj/item/reagent_containers/glass/bucket/wood,
					/obj/item/reagent_containers/food/drinks/shaker,
					/obj/item/reagent_containers/food/drinks/glass2/coffeecup/black,
					/obj/item/reagent_containers/food/drinks/glass2/coffeecup/metal,
					/obj/item/reagent_containers/ivbag/blood/human/oneg,
					/obj/item/reagent_containers/ivbag/blood/human/opos,
					/obj/item/reagent_containers/ivbag/blood/human/aneg,
					/obj/item/reagent_containers/ivbag/blood/human/apos,
					/obj/item/reagent_containers/ivbag/blood/human/bneg,
					/obj/item/reagent_containers/ivbag/blood/human/bpos,
					/obj/item/reagent_containers/ivbag/blood/human/abneg,
//GUNS,
					/obj/item/gun/energy/laser/practice,
					/obj/item/gun/energy/laser/dogan,
					/obj/item/gun/energy/laser,
					/obj/item/gun/energy/retro,
					/obj/item/gun/energy/captain,
					/obj/item/gun/energy/lasercannon,
					/obj/item/gun/energy/xray,
					/obj/item/gun/energy/sniperrifle,
					/obj/item/gun/energy/lasertag,
					/obj/item/gun/energy/pulse_rifle,
					/obj/item/gun/energy/taser,
					/obj/item/gun/energy/crossbow/largecrossbow,
					/obj/item/gun/energy/crossbow,
//LAUNCHERS,
					/obj/item/gun/launcher/crossbow,
					/obj/item/gun/launcher/pneumatic/small,
					/obj/item/gun/launcher/pneumatic,
					/obj/item/gun/launcher/syringe,
//AUTOMATICS,
					/obj/item/gun/projectile/automatic/merc_smg,
					/obj/item/gun/projectile/automatic/assault_rifle,
					/obj/item/gun/projectile/automatic/bullpup_rifle,
					/obj/item/gun/projectile/automatic/battlerifle,
					/obj/item/gun/projectile/automatic/l6_saw,
					/obj/item/gun/projectile/automatic/machine_pistol/usi,
//PROJECTILE,
					/obj/item/gun/projectile/pistol/sec/MK,
					/obj/item/gun/projectile/pistol/sec,
					/obj/item/gun/projectile/pistol/magnum_pistol,
					/obj/item/gun/projectile/heavysniper/boltaction,
					/obj/item/gun/projectile/sniper/garand,
//MATERIAL STACKS,
					/obj/item/stack/material/marble/ten,
					/obj/item/stack/material/diamond/ten,
					/obj/item/stack/material/uranium/ten,
					/obj/item/stack/material/plastic/ten,
					/obj/item/stack/material/gold/ten,
					/obj/item/stack/material/silver/ten,
					/obj/item/stack/material/platinum/ten,
					/obj/item/stack/material/mhydrogen/ten,
					/obj/item/stack/material/tritium/ten,
					/obj/item/stack/material/osmium/ten,
					/obj/item/stack/material/plasteel/ten,
					/obj/item/stack/material/wood/ten,
					/obj/item/stack/material/cloth,
					/obj/item/stack/material/cardboard/ten,
					/obj/item/stack/material/glass/reinforced/ten,
					/obj/item/stack/material/glass/boron,
					/obj/item/stack/material/glass/boron_reinforced/ten,
					/obj/item/stack/material/steel/ten,
//STACKS,
					/obj/item/stack/medical/advanced/bruise_pack,
					/obj/item/stack/medical/bruise_pack,
					/obj/item/stack/medical/ointment,
					/obj/item/stack/medical/splint,
					/obj/item/bonegel,
					/obj/item/stack/nanopaste,
					/obj/item/fd/simple_combat/revive,
					/obj/item/fd/simple_combat/adrenaline,
					/obj/item/fd/simple_combat/bloodbag,
					/obj/item/stack/material/rods/ten,
					/obj/item/stack/telecrystal,
					/obj/item/stack/wax,
//STORAGE,
					/obj/item/storage/secure/briefcase,
					/obj/item/storage/briefcase,
					/obj/item/storage/briefcase/inflatable,
					/obj/item/storage/backpack,
					/obj/item/storage/backpack/satchel,
					/obj/item/storage/backpack/dufflebag,
					/obj/item/storage/firstaid/regular,
					/obj/item/storage/firstaid/combat,
					/obj/item/storage/firstaid/trauma,
					/obj/item/storage/firstaid/fire,
					/obj/item/storage/firstaid/toxin,
					/obj/item/storage/firstaid/combat,
					/obj/item/storage/firstaid/o2,
					/obj/item/storage/firstaid/adv,
					/obj/item/storage/firstaid/stab,
					/obj/item/storage/firstaid/combat,
					/obj/item/storage/box,
					/obj/item/storage/box/donkpocket_mixed,
					/obj/item/storage/box/donkpocket_protein,
					/obj/item/storage/box/donkpocket_vegetable,
					/obj/item/storage/box/donkpocket_fruit,
					/obj/item/storage/box/donkpocket_dessert,
					/obj/item/storage/box/donkpocket_premium,
					/obj/item/storage/box/donut,
					/obj/item/storage/box/cups,
					/obj/item/storage/box/mousetraps,
					/obj/item/storage/box/engineer,
					/obj/item/storage/box/autoinjectors,
					/obj/item/storage/box/beakers,
					/obj/item/storage/box/syringes,
					/obj/item/storage/box/latexgloves,
					/obj/item/storage/box/large,
					/obj/item/storage/box/glowsticks,
					/obj/item/storage/belt/utility/full,
					/obj/item/storage/belt/medical/emt,
					/obj/item/storage/belt/medical,
					/obj/item/storage/belt/holster/security,
					/obj/item/storage/belt/holster/security/tactical,
					/obj/item/storage/box/condimentbottles,
					/obj/item/storage/box/handcuffs,
					/obj/item/storage/box/pillbottles,
					/obj/item/storage/box/lights/bulbs,
					/obj/item/storage/box/lights/tubes,
					/obj/item/storage/box/lights/tubes/random,
					/obj/item/storage/box/lights/mixed,
					/obj/item/storage/box/cola/beastenergy,
					/obj/item/storage/box/water,
					/obj/item/storage/box/snack/jerky,
					/obj/item/storage/box/snack/chips,
					/obj/item/storage/box/canned_beef,
					/obj/item/storage/box/canned_beans,
					/obj/item/storage/box/canned_tomato,
					/obj/item/storage/toolbox/mechanical,
					/obj/item/storage/toolbox/electrical,
					/obj/item/storage/toolbox/syndicate,
//CASH,
					/obj/item/spacecash/bundle/c10,
					/obj/item/spacecash/bundle/c50,
					/obj/item/spacecash/bundle/c100,
					/obj/item/spacecash/bundle/c500,
					/obj/item/spacecash/bundle/c1000,
					/obj/item/spacecash/bundle/c5000,
//PICK AXES,
					/obj/item/pickaxe/hand/silver,
					/obj/item/pickaxe/drill,
					/obj/item/pickaxe/jackhammer,
					/obj/item/pickaxe/hand/gold,
					/obj/item/gun/energy/plasmacutter,
					/obj/item/pickaxe/hand/diamond,
					/obj/item/pickaxe/diamonddrill,
					/obj/item/pickaxe,
					/obj/item/shovel/spade,
					/obj/item/portable_destructive_analyzer,
					/obj/item/inflatable_dispenser,
					/obj/item/matter_decompiler,
//COMPUTER HARDWARE,
					/obj/item/stock_parts/computer/battery_module/advanced,
					/obj/item/stock_parts/computer/battery_module/super,
					/obj/item/stock_parts/computer/battery_module/ultra,
					/obj/item/stock_parts/computer/battery_module/micro,
					/obj/item/stock_parts/computer/battery_module/nano,
					/obj/item/stock_parts/computer/battery_module/lambda,
					/obj/item/stock_parts/computer/hard_drive/advanced,
					/obj/item/stock_parts/computer/hard_drive/super,
					/obj/item/stock_parts/computer/hard_drive/cluster,
					/obj/item/stock_parts/computer/hard_drive/small,
					/obj/item/stock_parts/computer/hard_drive/micro,
					/obj/item/stock_parts/computer/hard_drive/portable,
					/obj/item/stock_parts/computer/hard_drive/portable/advanced,
					/obj/item/stock_parts/computer/hard_drive/portable/super,
					/obj/item/stock_parts/computer/network_card/advanced,
					/obj/item/stock_parts/computer/network_card/wired,
					/obj/item/stock_parts/computer/processor_unit/small,
					/obj/item/stock_parts/computer/processor_unit/photonic,
					/obj/item/stock_parts/computer/processor_unit/photonic/small,
					/obj/item/stock_parts/computer/processor_unit,
					/obj/item/stock_parts/computer/tesla_link,
					/obj/item/stock_parts/computer/hard_drive,
					/obj/item/stock_parts/console_screen,
					/obj/item/stock_parts/keyboard,
					/obj/item/stock_parts/power/apc/buildable,
					/obj/item/material/clipboard,
//POWER CELLS,
					/obj/item/cell/device,
					/obj/item/cell/crap,
					/obj/item/cell/standard,
					/obj/item/cell/high,
					/obj/item/cell/super,
					/obj/item/cell/hyper,
					/obj/item/cell/infinite,
					/obj/item/cell/potato,
					/obj/item/cell/slime,
					/obj/item/drone_cell,
//SMES COILS,
					/obj/item/stock_parts/smes_coil/weak,
					/obj/item/stock_parts/smes_coil/super_capacity,
					/obj/item/stock_parts/smes_coil/super_io,
					/obj/item/stock_parts/smes_coil,
					/obj/item/tracker_electronics,
					/obj/item/syringe_cartridge,
					/obj/item/silencer,
					/obj/item/fossil,
					/obj/item/anobattery,
					/obj/item/anodevice,
					/obj/item/cane/concealed,
					/obj/item/cane,
					/obj/item/caution,
					/obj/item/module/power_control,
//STOCK PARTS,
					/obj/item/stock_parts/capacitor/adv,
					/obj/item/stock_parts/scanning_module/adv,
					/obj/item/stock_parts/manipulator/nano,
					/obj/item/stock_parts/micro_laser/high,
					/obj/item/stock_parts/matter_bin/adv,
					/obj/item/stock_parts/capacitor/super,
					/obj/item/stock_parts/scanning_module/phasic,
					/obj/item/stock_parts/manipulator/pico,
					/obj/item/stock_parts/micro_laser/ultra,
					/obj/item/stock_parts/matter_bin/super,
					/obj/item/stock_parts/subspace/ansible,
					/obj/item/stock_parts/subspace/filter,
					/obj/item/stock_parts/subspace/amplifier,
					/obj/item/stock_parts/subspace/treatment,
					/obj/item/stock_parts/subspace/analyzer,
					/obj/item/stock_parts/subspace/crystal,
					/obj/item/stock_parts/subspace/transmitter,
					/obj/item/airalarm_electronics,
					/obj/item/firealarm_electronics,
					/obj/item/intercom_electronics,
					/obj/item/airlock_electronics/secure,
					/obj/item/airlock_electronics,
//CARDS,
					/obj/item/card/emag,
					/obj/item/card/id/gold,
					/obj/item/flame/match,
					/obj/item/flame/lighter/zippo,
					/obj/item/extinguisher/mini,
					/obj/item/extinguisher,
					/obj/item/flamethrower/full,
					/obj/item/handcuffs/cable,
					/obj/item/handcuffs,
					/obj/item/rcd,
					/obj/item/rcd_ammo,
					/obj/item/rsf,
					/obj/item/shield/buckler,
					/obj/item/shield/riot,
					/obj/item/shield/energy,
//SURGERY,
					/obj/item/retractor,
					/obj/item/hemostat,
					/obj/item/cautery,
					/obj/item/surgicaldrill,
					/obj/item/scalpel/laser,
					/obj/item/scalpel/ims,
					/obj/item/scalpel,
					/obj/item/circular_saw,
					/obj/item/bonegel,
					/obj/item/FixOVein,
					/obj/item/bonesetter,
					/obj/item/locator,
					/obj/item/wrench,
					/obj/item/screwdriver,
					/obj/item/wirecutters,
//WELDINGTOOLS,
					/obj/item/weldingtool/largetank,
					/obj/item/weldingtool/hugetank,
					/obj/item/weldingtool/experimental,
					/obj/item/weldingtool,
					/obj/item/crowbar,
					/obj/item/beartrap,
					/obj/item/storage/backpack/weldpack,
					/obj/item/stock_parts/circuitboard/biogenerator,
					/obj/item/stock_parts/circuitboard/reagent_temp,
					/obj/item/stock_parts/circuitboard/sublimator,
					/obj/item/stock_parts/circuitboard/reagentgrinder,
					/obj/item/stock_parts/circuitboard/juicer,
					/obj/item/stock_parts/circuitboard/bioprinter,
					/obj/item/stock_parts/circuitboard/roboprinter,
					/obj/item/stock_parts/circuitboard/bluespacerelay,
					/obj/item/stock_parts/circuitboard/microwave,
					/obj/item/stock_parts/circuitboard/gibber,
					/obj/item/stock_parts/circuitboard/cooker,
					/obj/item/stock_parts/circuitboard/honey,
					/obj/item/stock_parts/circuitboard/washer,
					/obj/item/stock_parts/circuitboard/optable,
					/obj/item/stock_parts/circuitboard/bodyscanner,
					/obj/item/stock_parts/circuitboard/body_scanconsole,
					/obj/item/stock_parts/circuitboard/body_scanconsole/display,
					/obj/item/stock_parts/circuitboard/sleeper,
					/obj/item/stock_parts/circuitboard/pacman,
					/obj/item/stock_parts/circuitboard/pacman/super/potato,
					/obj/item/stock_parts/circuitboard/pacman/mrs,
					/obj/item/stock_parts/circuitboard/smes,
					/obj/item/stock_parts/circuitboard/batteryrack,
					/obj/item/stock_parts/circuitboard/recharge_station,
					/obj/item/stock_parts/circuitboard/telecomms,
					/obj/item/stock_parts/circuitboard/telecomms/receiver,
					/obj/item/stock_parts/circuitboard/telecomms/hub,
					/obj/item/stock_parts/circuitboard/telecomms/bus,
					/obj/item/stock_parts/circuitboard/telecomms/processor,
					/obj/item/stock_parts/circuitboard/telecomms/server,
					/obj/item/stock_parts/circuitboard/telecomms/broadcaster,
					/obj/item/stock_parts/circuitboard/broken,
					/obj/item/stock_parts/circuitboard/operating,
					/obj/item/stock_parts/circuitboard/solar_control,
					/obj/item/stock_parts/circuitboard/message_monitor,
					/obj/item/stock_parts/circuitboard/comm_monitor,
					/obj/item/stock_parts/circuitboard/comm_server,
//MELEE,
					/obj/item/melee/energy/axe,
					/obj/item/melee/whip,
					/obj/item/melee/baton/cattleprod,
					/obj/item/melee/baton,
					/obj/item/melee/classic_baton,
					/obj/item/melee/telebaton,
					/obj/item/tank/oxygen,
					/obj/item/tank/oxygen_yellow,
					/obj/item/tank/anesthetic,
					/obj/item/tank/oxygen_emergency,
					/obj/item/tank/oxygen_emergency_extended,
					/obj/item/tank/oxygen_emergency_double,
					/obj/item/tank/oxygen_scba,
					/obj/item/contraband/poster,
//MATERIAL,
					/obj/item/material/sword/katana,
					/obj/item/material/sword,
					/obj/item/material/scythe,
					/obj/item/material/twohanded/fireaxe,
					/obj/item/material/harpoon,
					/obj/item/material/knife/combat,
					/obj/item/material/knife/kitchen,
					/obj/item/material/knife/utility,
					/obj/item/material/knife/hook,
//RIGS,
					/obj/item/rig/unathi/fancy,
					/obj/item/rig/unathi,
					/obj/item/rig/combat,
					/obj/item/rig/ert,
					/obj/item/rig/light/hacker,
					/obj/item/rig/light/ninja,
					/obj/item/rig/light/stealth,
					/obj/item/rig/light,
					/obj/item/rig/merc,
					/obj/item/deck/holder,
					/obj/item/beach_ball/holoball,
					/obj/item/book/manual/detective,
					/obj/item/book/manual/chef_recipes,
					/obj/item/book/manual/engineering_hacking,
					/obj/item/book/manual/materials_chemistry_analysis,
					/obj/item/book/manual/solgov_law,
//CLOTHING,
//GLASSES,
					/obj/item/clothing/glasses/meson/prescription,
					/obj/item/clothing/glasses/meson,
					/obj/item/clothing/glasses/science,
					/obj/item/clothing/glasses/night,
					/obj/item/clothing/glasses/hipster,
					/obj/item/clothing/glasses/prescription,
					/obj/item/clothing/glasses/welding/superior,
					/obj/item/clothing/glasses/welding,
					/obj/item/clothing/glasses/sunglasses/prescription,
					/obj/item/clothing/glasses/hud/security/prot,
					/obj/item/clothing/glasses/hud/security/prot/sunglasses,
					/obj/item/clothing/glasses/thermal,
					/obj/item/clothing/glasses/tacgoggles,
//GLOVES,
					/obj/item/clothing/gloves/color/white,
					/obj/item/clothing/gloves/insulated,
					/obj/item/clothing/gloves/insulated/cheap,
					/obj/item/clothing/gloves/thick,
					/obj/item/clothing/gloves/thick/combat,
					/obj/item/clothing/gloves/latex,
					/obj/item/clothing/gloves/thick/botany,
//MASKS,
					/obj/item/clothing/mask/breath/medical,
					/obj/item/clothing/mask/breath,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/surgical,
					/obj/item/clothing/mask/smokable/cigarette/luckystars,
					/obj/item/clothing/shoes/combat,
//SUITS,
					/obj/item/clothing/suit/space/void/merc,
					/obj/item/clothing/suit/space/void/security,
					/obj/item/clothing/suit/space/syndicate,
					/obj/item/clothing/suit/unathi/mantle,
					/obj/item/clothing/suit/xeno/furs,
					/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/suit/armor/reactive,
					/obj/item/clothing/suit/armor/heavy,
					/obj/item/clothing/suit/bio_suit,
					/obj/item/clothing/suit/security/navyhos,
					/obj/item/clothing/suit/storage/hazardvest,
					/obj/item/clothing/suit/storage/toggle/labcoat,
					/obj/item/clothing/suit/fire/heavy,
					/obj/item/clothing/suit/fire,
					/obj/item/clothing/suit/radiation,
					/obj/item/clothing/suit/bomb_suit,
					/obj/item/clothing/suit/infilsuit,
//HEADS,
					/obj/item/clothing/head/hardhat,
					/obj/item/clothing/head/caphat,
					/obj/item/clothing/head/hairflower,
					/obj/item/clothing/head/welding,
					/obj/item/clothing/head/bomb_hood,
					/obj/item/clothing/head/radiation,
					/obj/item/clothing/head/bio_hood,
					/obj/item/clothing/head/helmet/space/void/merc,
					/obj/item/clothing/head/helmet/space/void/security,
					/obj/item/clothing/head/helmet/space/void,
					/obj/item/clothing/head/helmet/space/syndicate,
					/obj/item/clothing/head/infilhat,
//ACCESSORIES,
					/obj/item/clothing/accessory/stethoscope,
					/obj/item/clothing/accessory/medal/gold,
					/obj/item/clothing/accessory/medal/iron,
					/obj/item/clothing/accessory/medal/silver,
					/obj/item/clothing/accessory/medal/solgov/mil/medal_of_honor,
					/obj/item/clothing/accessory/armband,
					/obj/item/clothing/accessory/toggleable/suit_vest,
					/obj/item/clothing/accessory/toggleable/tan_jacket,
					/obj/item/clothing/accessory/toggleable/charcoal_jacket,
					/obj/item/clothing/accessory/toggleable/navy_jacket,
					/obj/item/clothing/accessory/toggleable/burgundy_jacket,
					/obj/item/clothing/accessory/toggleable/checkered_jacket,
//DEVICES,
					/obj/item/device/personal_shield,
					/obj/item/device/cable_painter,
					/obj/item/device/mmi,
					/obj/item/device/kit/mech,
					/obj/item/device/paicard,
					/obj/item/device/powersink,
					/obj/item/device/scanner/spectrometer/adv,
					/obj/item/device/scanner/spectrometer,
					/obj/item/device/scanner/reagent/adv,
					/obj/item/device/scanner/reagent,
					/obj/item/device/scanner/xenobio,
					/obj/item/device/synthesized_instrument/violin,
					/obj/item/device/radio,
					/obj/item/device/assembly/igniter,
					/obj/item/device/assembly/infra,
					/obj/item/device/assembly/mousetrap,
					/obj/item/device/assembly/signaler,
					/obj/item/device/eftpos,
					/obj/item/device/camera,
					/obj/item/device/camera_film,
					/obj/item/device/geiger,
					/obj/item/device/binoculars,
					/obj/item/device/multitool,
					/obj/item/device/oxycandle,
					/obj/item/device/taperecorder,
					/obj/item/device/tape,
					/obj/item/device/gps,
//ORGANS,
					/obj/item/organ/internal/heart,
					/obj/item/organ/internal/brain,
					/obj/item/organ/internal/lungs,
					/obj/item/organ/internal/liver,
					/obj/item/organ/internal/eyes,
//ITEMS,
					/obj/item/modular_computer/tablet,
					/obj/item/modular_computer/laptop,
					/obj/item/solar_assembly,
					/obj/item/bodybag/cryobag,
					/obj/item/bodybag,
					/obj/item/roller_bed,
					/obj/item/rig_module/mounted/energy/egun,
					/obj/item/rig_module/mounted/energy/energy_blade,
					/obj/item/rig_module/mounted/energy/lcannon,
					/obj/item/rig_module/stealth_field,
					/obj/item/rig_module/fabricator/energy_net,
					/obj/item/rig_module/fabricator,
	)
	emptyprob = 10

/obj/structure/rubble/chaos/New()
	lootleft = rand(5,15)
	. = ..()
