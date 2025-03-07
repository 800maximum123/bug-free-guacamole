/mob/living/simple_animal/holo_npc/gyne
	name = "ascent gyne hologram"
	desc = ""
	icon = 'mods/_fd/fd_assets/icons/gyne.dmi'
	icon_state = "gyne"
	icon_living = "gyne"
	icon_dead = "gyne"
	color = "#c45fff"
	pixel_x = -5

/mob/living/simple_animal/holo_npc/gyne/Life()
	if(!seen)
		animate(src, 3 SECONDS, alpha = 150)
		seen = TRUE
		start_thinking()

	..()

/mob/living/simple_animal/holo_npc/gyne/start_thinking()
	alpha = 0
	invisibility = 50

	spawn(5 SECOND)
		invisibility = 0
		animate(src, 5 SECONDS, alpha = 150)

	spawn(10 SECONDS)
		ISay("||𝙹⚍ ⍑⚍ᒲᔑリᓭ ʖᒷᓵᔑᒲᒷ ᔑリ ᔑリリ𝙹||ᔑリᓵᒷ")
		playsound(src.loc, 'sound/voice/ascent1.ogg', 100, 1)
	spawn(15 SECONDS)
		ISay("||𝙹⚍ ⍑ᔑ⍊ᒷ ⊣𝙹リᒷ ⎓ᔑ∷ ᒷリ𝙹⚍⊣⍑ ⚍ᓭᒷꖎᒷᓭᓭ ᒲᒷᔑℸ ̣ ᓭ")
		playsound(src.loc, 'sound/voice/ascent2.ogg', 100, 1)
	spawn(20 SECONDS)
		ISay("ʖ⚍ℸ ̣  リ𝙹∴ ||𝙹⚍∷ ᒷリ↸ ╎ᓭ ╎ᒲᒲ╎リᒷリℸ ̣")
		playsound(src.loc, 'sound/voice/ascent3.ogg', 100, 1)
	spawn(25 SECONDS)
		playsound(src.loc, 'sound/voice/ascent4.ogg', 100, 1)
		ISay("||𝙹⚍ ∴╎ꖎꖎ ʖᒷ ⍑ᔑ∷⍊ᒷᓭℸ ̣ ᒷ↸ ⋮⚍ᓭℸ ̣  ꖎ╎ꖌᒷ ℸ ̣ ⍑ᒷ ∷ᒷᓭℸ ̣")
	spawn(30 SECONDS)
		ISay("∴ᒷ ᔑ∷ᒷ ᓵ𝙹ᒲ╎リ⊣")
		playsound(src.loc, 'sound/voice/ascent5.ogg', 100, 1)
		qdel(src)

/proc/event_phase_1()
	var/sound/explosion = 'sound/effects/explosionfar.ogg'
	var/sound/explosion2 = 'mods/_fd/fd_assets/sounds/explosion2.ogg'
	var/sound/chatter = 'mods/_fd/fd_assets/sounds/chatter.ogg'

	world << chatter

	var/message_ascent1 = "<span style='color:purple; font-size: 22px;'>/// ⎓𝙹∷ᓵᒷ↸ ᓵ𝙹ᒲᒲ⚍リ╎ᓵᔑℸ ̣ ╎𝙹リ ᓭᒷᓭᓭ╎𝙹リ ╎リ╎ℸ ̣ ╎ᔑℸ ̣ ᒷ↸ ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent1)

	sleep(30)

	var/message_ascent2 = "<span style='color:purple; font-size: 22px;'>/// ╎リℸ ̣ ᒷ∷リᔑꖎ ᓭ||ᓭℸ ̣ ᒷᒲᓭ ⍑ᔑᓭ ʖᒷᒷリ ᓵ𝙹ᒲ!¡∷𝙹ᒲ╎ᓭᒷ↸ ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent2)

	sleep(30)

	var/message_ascent3 = "<span style='color:purple; font-size: 22px;'>/// ⍊ᒷᓭᓭᒷꖎ ⎓╎∷ᒷ∴ᔑꖎꖎ ᓭ⍑⚍ℸ ̣ ℸ ̣ ╎リ⊣ ↸𝙹∴リ !¡∷𝙹ᓵᒷᒷᓭ ⍑ᔑᓭ ʖᒷ⊣⚍リ ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent3)

// Вот тут мы в теории должны открывать всем игрокам овермапу относительно текущего положения Факела

	var/list/map_turfs = block(locate(2,2,GLOB.using_map.overmap_z),locate(GLOB.using_map.overmap_size-2,GLOB.using_map.overmap_size-2,GLOB.using_map.overmap_z))
	for(var/turf/T in map_turfs)
		for(var/obj/npc_ship_spawneer/npc in T)
			if(npc)
				npc.appear()

	sleep(30)

	for(var/obj/holo_spawner/spawner in world)
		if (spawner.character_id == "gyne")
			spawner.start_scene()
			qdel(spawner)

	sleep(450)

	for(var/mob/living/C in GLOB.player_list)
		shake_camera(C, 100, 1)

	world << explosion
	sleep(8)
	world << explosion
	sleep(10)
	world << explosion
	sleep(5)
	world << explosion
	sleep(20)
	world << explosion
	sleep(10)
	world << explosion
	sleep(6)
	world << explosion
	sleep(6)
	world << explosion
	sleep(15)
	world << explosion2

	for(var/area/A in world)
		A.set_emergency_lighting(TRUE)

	var/message = "<span style='color:red; font-size: 20px;'>ATTENTION ALL CREW! IFF WARFARE HAS BEEN DEACTIVATED! BLUESPACE DRIVE STATUS: OFFLINE!</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message)

	sleep(30)

	var/sound/siren = 'sound/effects/siren.ogg'
	world << siren

/proc/event_phase_2()
	var/sound/sound_notice = 'sound/ambience/bsd_alarm.ogg'
	world << sound_notice

	sleep(20)

	var/message1_1 = "<span style='color:cyan; font-size: 20px;'>| TRANSMISSION SOURCE: TRK17 |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message1_1)
	sleep(10)
	var/message1_2 = "<span style='color:cyan; font-size: 20px;'>| TRANSMISSION TARGET: HUMAN AFFILIATED VESSEL 'SEV TORCH' |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message1_2)
	sleep(10)
	var/message1_3 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS: ONLINE |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message1_3)
	sleep(10)
	var/message1_4 = "<span style='color:cyan; font-size: 20px;'>| POWER-OFF PROCESS INITIATED |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message1_4)
	sleep(10)
	var/message1_5 = "<span style='color:blue; font-size: 22px;'> | OFFLINE STATUS ETA: 20 MINUTES |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message1_5)

	sleep(9000)
	world << sound_notice

	var/message2_1 = "<span style='color:cyan; font-size: 20px;'>| TRANSMISSION SOURCE: TRK17 |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message2_1)
	sleep(10)
	var/message2_2 = "<span style='color:cyan; font-size: 20px;'>| TRANSMISSION TARGET: HUMAN AFFILIATED VESSEL 'SEV TORCH' |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message2_2)
	sleep(10)
	var/message2_3 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS: OFFLINE |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message2_3)
	sleep(10)
	var/message2_4 = "<span style='color:cyan; font-size: 20px;'>| REBOOT PROCESS INITIATED |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message2_4)
	sleep(10)
	var/message2_5 = "<span style='color:blue; font-size: 22px;'> | ONLINE STATUS ETA: 5 MINUTES |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message2_5)

/obj/effect/pebbles_particles
	name = "particles"
	desc = "particles"
	icon = 'mods/_fd/fd_assets/eventstuff/pebbles.dmi'
	icon_state = "pebbles_1"
	alpha = 100
	layer = ABOVE_HUMAN_LAYER
	light_color = "#4ff32e"
	light_range = 1
	light_power = 0.3
	plane = 4

/turf/simulated/floor
	var/pebbles_affected = FALSE

/proc/event_phase_3()
	var/sound/sound_field = 'mods/_fd/fd_assets/sounds/field_siren.ogg'
	var/sound/boom = 'mods/_fd/fd_assets/sounds/boom.ogg'
	world << sound_field

	for(var/obj/machinery/bluespacedrive/drive in world)
		drive.icon_state = "bsd_core_broken"
		drive.ClearOverlays()
		drive.particles = null
		empulse(get_turf(drive), 3, 6)

	for(var/area/A in world)
		for(var/turf/simulated/floor/spawn_here in A)
			if(prob(30) && spawn_here.pebbles_affected == FALSE)
				var/obj/effect/pebbles_particles/pebbles = new /obj/effect/pebbles_particles(get_turf(spawn_here))
				var/obj/effect/pebbles_particles/pebbles_another = new /obj/effect/pebbles_particles(get_turf(spawn_here))
				var/obj/effect/pebbles_particles/pebbles_third = new /obj/effect/pebbles_particles(get_turf(spawn_here))
				var/obj/effect/pebbles_particles/pebbles_fourth = new /obj/effect/pebbles_particles(get_turf(spawn_here))
				var/random_number = pick(1,2,3,4)

				pebbles.icon_state = "pebbles_[random_number]"
				pebbles_another.icon_state = "pebbles_[random_number]"
				pebbles_third.icon_state = "pebbles_[random_number]"
				pebbles_fourth.icon_state = "pebbles_[random_number]"

				pebbles.SetTransform(0.1)
				pebbles_another.SetTransform(0.3)
				pebbles_third.SetTransform(0.5)
				pebbles_fourth.SetTransform(0.3)

				pebbles.pixel_x = rand(5,20)
				pebbles_another.pixel_x = rand(5,20)
				pebbles_third.pixel_x = rand(5,20)
				pebbles_fourth.pixel_x = rand(5,20)

				pebbles.pixel_y = rand(5,20)
				pebbles_another.pixel_y = rand(5,20)
				pebbles_third.pixel_y = rand(5,20)
				pebbles_fourth.pixel_y = rand(5,20)

				spawn_here.pebbles_affected = TRUE

		for(var/obj/machinery/sparks_on in A)
			if(prob(40))
				var/datum/effect/spark_spread/sparks = new /datum/effect/spark_spread()
				sparks.set_up(1, 1, sparks_on.loc)
				sparks.start()

	for(var/mob/living/C in GLOB.player_list)
		shake_camera(C, 520, 1)

	spawn(20)
		var/message1_1 = "<span style='color:cyan; font-size: 20px;'> | TRANSMISSION SOURCE: TRK17 |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_1)

	spawn(40)
		var/message1_2 = "<span style='color:cyan; font-size: 20px;'>| TRANSMISSION TARGET: HUMAN AFFILIATED VESSEL 'SEV TORCH' |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_2)

	spawn(60)
		var/message1_3 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS ONLINE PROGRESS: 50% | WARNING! EM-PULSE IMMINENT! |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_3)

	spawn(160)
		var/message1_4 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS ONLINE PROGRESS: 67% | WARNING! EM-PULSE IMMINENT! |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_4)

	spawn(240)
		var/message1_5 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS ONLINE PROGRESS: 79% | WARNING! EM-PULSE IMMINENT! |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_5)

	spawn(430)
		var/message1_6 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS ONLINE PROGRESS: 95% | WARNING! EM-PULSE IMMINENT! |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_6)

	sleep(470)

	world << boom

	for(var/mob/living/M in GLOB.player_list)
		M.Weaken(15)

	spawn(50)
		for(var/mob/living/M in GLOB.player_list)
			M.Sleeping(3000)

	sleep(50)

	var/sound/sound_field2 = 'mods/_fd/fd_assets/sounds/field_siren_titles.ogg'
	world << sound_field2
