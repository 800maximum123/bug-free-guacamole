#define CALL(target, proc, args...) new Callback(target, PROC_REF(proc), ##args)
#define CALL_TYPE(target, type, proc, args...) new Callback(target, TYPE_PROC_REF(type, proc), ##args)
#define CALL_GLOB(proc, args...) new Callback(GLOBAL_PROC, GLOBAL_PROC_REF(proc), ##args)

#define START_CUTSCENE(type) CALL_GLOB(start_cutscene, type, ckey2body)
/proc/start_cutscene(cutscene_type, list/old_viewers, ...)
	var/datum/modular_cutscene/scene = new cutscene_type(arglist(args.Copy(2)))
	scene.play(arglist(args.Copy(3)))

#define DO_NOTHING CALL_GLOB(src, do_nothing)
/proc/do_nothing()
	return

		///////////////////////
		// Катсцены дани 101 //
		///////////////////////
///
//	Каждый элемент списка, а так же приписанное к нему число несут свой смысл:
//	Элемент списка, или же ДЕЙСТВИЕ - отвечает за то, что произойдёт на этом этапе катсцены.
//	Приписанное к элементу число, или же ЗАДЕРЖКА - отвечает за время, через которое произойдёт следующее ДЕЙСТВИЕ из списка.

///	ДЕЙСТВИЕ может быть:
//	 - CALL() | CALL_GLOB() | CALL_TYPE()
//	 * Вызывает прок соответствующего типа, с соответствующим названием (см. в начало файла для обзора аргументов).
//
//	 - DO_NOTHING
//	 * Не делает ничего, но всё ещё применяет ЗАДЕРЖКУ, назначенную этому элементу.

///	ЗАДЕРЖКА может быть:
//	 - 123456789 | Любым числом
//	 * По истечению этого количества тиков произойдёт следующее по списку ДЕЙСТВИЕ.
//
//	 - null | Ничего
//	 * Катсцена МОМЕНТАЛЬНО совершит следующее по счёту ДЕЙСТВИЕ.
//
//	 - 0
//	 * Результатом будет последнее число ЗАДЕРЖКИ, которое было определено ранее по списку.

///	Типичным примером списка действий будет что-то типа:
/*
/datum/modular_cutscene/s2ep1/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 1"),
		CALL_TYPE(actor("Нубик"), /mob, set_dir, NORTH) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2),
	)
*/
//	В данном примере мы перемещаем камеру нашей сцены на лендмарку с тэгом "Сцена 1"
//	А потом СРАЗУ же вызываем прок set_dir() у актёра с тэгом "Нубик", после которого ждём 2 секунды.
//	В конце, мы активируем новую катсцену, в которую для удобства перенесли часть этой.

/datum/modular_cutscene
	/// Список сикеев участников, и их оригинальных персонажей.
	var/list/ckey2body = list(
		/* "ckey" = /mob, */
	)
	/// Список текущих скибиди камерамэнов, участвующих в сцене.
	var/list/camera_mobs = list(
		/* /mob/living, */
	)
	/// Список действий, которые должна произвести катсцена. !Необходимо заполнять его внутри прока /setup_actions()!
	var/list/actions
	/// Должны ли мы ждать, пока эта катсцена проиграется до конца. !Полезно, когда одна катсцена вызывает другую!
	var/wait_for = TRUE

/datum/modular_cutscene/proc/setup_actions(...)
	actions = list(
		/* CALL = DURATION, */
	)

/datum/modular_cutscene/New(list/old_viewers, ...)
	. = ..()
	if(actions)
		message_admins("Список actions должен быть заполнен через функцию setup_actions(), а не прописан в сабтайпе катсцены!")

	if(old_viewers)
		ckey2body = old_viewers.Copy()
	else
		for(var/client/viewer in GLOB.clients)
			ckey2body[viewer.ckey] = viewer.mob
			viewer.mob.no_ssd = TRUE

	for(var/ckey in ckey2body)
		camera_mobs += ckey2body[ckey]

	setup_actions(arglist(args.Copy(2)))

/datum/modular_cutscene/Destroy()
	for(var/camera in camera_mobs)
		if(!istype(camera, /mob/living/cutscene_pov))
			continue // Мы НЕ хотим удалять наших изначальных мобов
		qdel(camera)

	. = ..()

/datum/modular_cutscene/proc/play(...)
	if(!actions)
		message_admins("Катсцена должна иметь у себя заполненный список actions, установленный в setup_actions()")
		CRASH("Катсцена должна иметь у себя заполненный список actions, установленный в setup_actions()")

	if(!wait_for)
		set waitfor = FALSE

	var/next_sleep_delay = 0
	for(var/cutscene_data in actions)
		if(!isnull(cutscene_data))
			invoke(cutscene_data)

		if(actions[cutscene_data] != 0)
			if(actions[cutscene_data])
				next_sleep_delay = actions[cutscene_data]
			else
				next_sleep_delay = 0

		if(next_sleep_delay)
			sleep(next_sleep_delay)

	invoke_async(CALL_GLOB(qdel, src))

GLOBAL_LIST_EMPTY(cutscene_actors)

/mob/living/simple_animal/cutscene_character/Initialize()
	. = ..()
	GLOB.cutscene_actors[cutscene_id] = src

GLOBAL_LIST_EMPTY(cutscene_cameras)

/obj/effect/cutscene_camera
	icon = 'icons/effects/effects.dmi'
	icon_state = "repel_missiles"
	anchored = TRUE
	var/camera_id = ""

/obj/effect/cutscene_camera/Initialize()
	. = ..()
	alpha = 0
	GLOB.cutscene_cameras[camera_id] = src

/mob
	var/can_speak = TRUE
	var/do_speech_bubble = TRUE

/mob/living/cutscene_pov
	stunned = INFINITY
	anchored = TRUE
	density = FALSE
	status_flags = GODMODE
	mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
	can_speak = FALSE
	do_speech_bubble = FALSE

/datum/modular_cutscene/proc/actor(id)
	if(!GLOB.cutscene_actors.Find(id))
		message_admins("АКТЁР \"[id]\" В [type] ОТСУТСТВУЕТ, ПРОПУСКАЮ")
		return pick(GLOB.alive_mobs)
	return GLOB.cutscene_actors[id]

#define TP_CAMERA(id) CALL(src, teleport_camera, id)
/datum/modular_cutscene/proc/teleport_camera(camera_id)
	if(!GLOB.cutscene_cameras.Find(camera_id))
		message_admins("КАМЕРА \"[camera_id]\" В [type] ОТСУТСТВУЕТ, ПРОПУСКАЮ")
		return

	for(var/camera in camera_mobs)
		if(!istype(camera, /mob/living/cutscene_pov))
			continue // Мы НЕ хотим удалять наших изначальных мобов
		qdel(camera)

	camera_mobs.Cut()

	var/turf/target_turf = get_turf(GLOB.cutscene_cameras[camera_id])
	for(var/ckey in ckey2body)
		var/mob/new_camera = new /mob/living/cutscene_pov(target_turf)
		new_camera.ckey = ckey
		camera_mobs += new_camera

#define MOVE_CAMERA(move_x, move_y, duration, easing) CALL(src, move_camera, move_x, move_y, duration, easing)
/datum/modular_cutscene/proc/move_camera(move_x, move_y, duration, easing)
	move_x *= 32
	move_y *= 32

	for(var/mob/viewer as() in camera_mobs)
		if(viewer.client)
			animate(viewer.client, pixel_y = move_y, pixel_x = move_x, time = duration, easing = easing)

#define SHAKE_SCENE(time, force) CALL(src, shake_scene, time, force)
/datum/modular_cutscene/proc/shake_scene(time, force)

	for(var/mob/viewer as() in camera_mobs)
		shake_camera(viewer, duration = time, strength = force)

#define SHIFT_ACTOR(actor, shift_x, shift_y, duration, easing, flags) CALL(src, shift_actor, actor, shift_x, shift_y, duration, easing, flags)
/datum/modular_cutscene/proc/shift_actor(mob/living/actor, shift_x, shift_y, duration, easing, flags)
	animate(actor, pixel_y = shift_y, pixel_x = shift_x, time = duration, easing = easing, flags = flags)

#define CHANGE_ACTOR_VISIBILITY(actor, alpha_change, duration, easing, flags) CALL(src, change_actor_alpha, actor, alpha_change, duration, easing, flags)
/datum/modular_cutscene/proc/change_actor_alpha(mob/living/actor, alpha_change, duration, easing, flags)
	animate(actor, alpha = alpha_change, time = duration, easing = easing, flags = flags)

#define CHANGE_ACTOR_COLOR(actor, color_change, duration, easing, flags) CALL(src, change_actor_color, actor, color_change, duration, easing, flags)
/datum/modular_cutscene/proc/change_actor_color(mob/living/actor, color_change, duration, easing, flags)
	animate(actor, color = color_change, time = duration, easing = easing, flags = flags)

#define CHANGE_ACTOR_MATRIX(actor, rotation, duration, easing, flags) CALL(src, change_actor_matrix, actor, rotation, duration, easing, flags)
/datum/modular_cutscene/proc/change_actor_matrix(mob/living/actor, rotation, duration, easing, flags)
	animate(actor, transform = matrix(rotation, MATRIX_ROTATE), time = duration, easing = easing, flags = flags)

#define EASY_TRANSFORM_ACTOR(actor, size, new_angle) CALL(src, easy_transform_actor, actor, size, new_angle)
/datum/modular_cutscene/proc/easy_transform_actor(mob/living/actor, size, new_angle)
	return actor.SetTransform(scale = size, rotation = new_angle)

#define CHANGE_ACTOR_LAYER(actor, new_layer) CALL(src, change_actor_layer, actor, new_layer)
/datum/modular_cutscene/proc/change_actor_layer(mob/living/actor, new_layer)
	return actor.forced_layer = new_layer

#define MOVE_ACTOR(actor, direction) CALL(src, move_actor, actor, direction)
/datum/modular_cutscene/proc/move_actor(mob/living/actor, direction)
	return actor.forceMove(get_step(get_turf(actor), direction))

#define TALK_ACTOR(actor, text) CALL(src, make_actor_talk, actor, text)
/datum/modular_cutscene/proc/make_actor_talk(mob/living/actor, text = "anything")
	return actor.ISay(text)

#define TURN_ACTOR(actor, direction) CALL(src, turn_actor, actor, direction)
/datum/modular_cutscene/proc/turn_actor(mob/living/actor, direction)
	return actor.set_dir(direction)

#define CHANGE_ACTOR_VISUALS(actor, new_state) CALL(src, change_actor_visuals, actor, new_state)
/datum/modular_cutscene/proc/change_actor_visuals(mob/living/actor, new_state = "anything")
	return actor.icon_state = new_state

#define CHANGE_VISION CALL(src, change_vision)
/datum/modular_cutscene/proc/change_vision()
	for(var/mob/viewer as() in camera_mobs)
		if (viewer.has_client_color(/datum/client_color/noir))
			viewer.remove_client_color(/datum/client_color/noir)
			viewer.update_client_color()
		else
			viewer.add_client_color(/datum/client_color/noir)
			viewer.update_client_color()


#define ADD_SCREEN(fullscreen) CALL(src, add_fullscreen, #fullscreen)
/datum/modular_cutscene/proc/add_fullscreen(fullscreen)
	for(var/mob/viewer as() in camera_mobs)
		viewer.overlay_fullscreen(fullscreen, text2path("/obj/screen/fullscreen/fd[fullscreen]"))

#define REMOVE_SCREEN(fullscreen, time) CALL(src, remove_fullscreen, #fullscreen, time)
/datum/modular_cutscene/proc/remove_fullscreen(fullscreen, time)
	for(var/mob/viewer as() in camera_mobs)
		viewer.clear_fullscreen(fullscreen, time)

#define PLAY_SOUND(sound) CALL(src, play_sound, sound)
/datum/modular_cutscene/proc/play_sound(sound/sound)
	for(var/viewer in camera_mobs)
		sound_to(viewer, sound)

#define COPY_APPEARANCE(actor, target) CALL(src, copy_appearance, actor, target)
/datum/modular_cutscene/proc/copy_appearance(mob/living/actor, mob/living/target)
	message_admins("copy_appearance ещё не сделан я ленивая жопа")

#define RETURN_VIEWERS CALL(src, return_viewers)
/datum/modular_cutscene/proc/return_viewers()
	for(var/ckey in ckey2body)
		var/mob/viewer = ckey2body[ckey]
		if(QDELETED(viewer))
			message_admins("НЕ МОГУ ОБНАРУЖИТЬ ОРИГИНАЛЬНОГО МОБА У [ckey], ОТПРАВЛЯЮ ЕГО В ЛОББИ...")
			var/mob/new_player/M = new /mob/new_player()
			M.ckey = ckey
			continue
		viewer.ckey = ckey
		viewer.no_ssd = FALSE

/// Фуллскрины

/obj/screen/fullscreen/fd/blackout/animated_better
	alpha = 0

/obj/screen/fullscreen/fd/blackout/animated_better/nofade
	alpha = 255

/obj/screen/fullscreen/fd/blackout/animated_better/Initialize()
	. = ..()
	animate(src, 3 SECOND, alpha = 255)

/obj/screen/fullscreen/fd/blackout/animated_better/proc/remove_blackscreen()
	animate(src, 3 SECOND, alpha = 0)

// PEAK cynema x3

/datum/modular_cutscene/test/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 11") = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/test/second)
	)

/datum/modular_cutscene/test/second/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 10") = 2 SECONDS,
		RETURN_VIEWERS
	)
