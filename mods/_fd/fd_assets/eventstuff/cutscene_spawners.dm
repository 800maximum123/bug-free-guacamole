/obj/npc_ship_spawner
	name = "ТЫ НЕ ДОЛЖЕН ЭТОГО ВИДЕТЬ"
	desc = "Не, серьёзно, это баг!"
	icon = 'mods/_fd/event_tools/icons/landmarks_static.dmi'
	icon_state = "ai_spawn"
	var/ship = null
	var/ship_dir = SOUTH
	var/time_of_appearance = 20
	invisibility = 50

/obj/npc_ship_spawner/proc/appear()
	var/obj/overmap/simulated_ship/target = new ship(get_turf(src))
	target.alpha = 0
	target.mouse_opacity = FALSE
	target.dir = ship_dir
	time_of_appearance = rand(10, 50)
	animate(target, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
	spawn(time_of_appearance)
		var/sound/appearance_sound = 'sound/machines/BSD_interact.ogg'
		world << appearance_sound
		var/obj/bluespace_rift/rift = new /obj/bluespace_rift(get_turf(target))
		target.alpha = 255
		rift.pixel_x = -16
		rift.pixel_y = -16
		flick("orb_charge", rift)

		sleep(3 SECONDS)

		flick("crush_hard", rift)
		animate(target, transform = matrix(), time = 1 SECOND, easing = BOUNCE_EASING)
		sleep(4)

		target.mouse_opacity = TRUE
		qdel(rift)
		qdel(src)
