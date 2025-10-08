#define CALL(target, proc, args...) new Callback(target, PROC_REF(proc), ##args)
#define CALL_TYPE(target, type, proc, args...) new Callback(target, TYPE_PROC_REF(type, proc), ##args)
#define CALL_GLOB(proc, args...) new Callback(GLOBAL_PROC, GLOBAL_PROC_REF(proc), ##args)

#define DO_NOTHING CALL(src, do_nothing)

#define TP_CAMERA(id) CALL(src, teleport_camera, id)
#define MOVE_CAMERA(args...) CALL(src, move_camera, ##args)
#define NEW_CUTSCENE(type) CALL_GLOB(create_cutscene, type, ckey2body)
#define START_CUTSCENE(datum) CALL_GLOB(start_cutscene, datum)
#define MOVE_ACTOR(actor, direction) CALL(src, move_actor, actor, direction)
#define MAKE_ACTOR_TALK(actor, text) CALL(src, make_actor_talk, actor, text)
#define ROTATE_ACTOR(actor, direction) CALL(src, rotate_actor, actor, direction)

/proc/start_cutscene(cutscene_type, list/old_viewers, ...)
	return new cutscene_type(arglist(args.Copy(2)))

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
	/// Список сикеев участников и их оригинальных персонажей
	var/list/ckey2body = list(
		/* "ckey" = /mob, */
	)
	/// Список активных скибиди камерамэнов, участвующих в сцене
	var/list/camera_mobs = list(
		/* /mob/living/cutscene_pov, */
	)
	/// Список действий, которая должна произвести катсцена. !Необходимо заполнять его внутри прока /New()!
	var/list/actions
	/// Должны ли мы ждать, пока эта катсцена проиграется. Полезно, когда одна катсцена вызывает другую
	var/wait_for = TRUE

/datum/modular_cutscene/New(list/old_viewers, ...)
	. = ..()
	if(old_viewers)
		ckey2body = old_viewers.Copy()
	else
		for(var/client/viewer in GLOB.clients)
			ckey2body[viewer.ckey] = viewer.mob

	var/list/arguments = args.Copy(2)

	setup_actions(arglist(arguments))
	play(arglist(arguments))

/datum/modular_cutscene/Destroy()
	for(var/ckey in ckey2body)
		var/mob/viewer = ckey2body[ckey]
		if(QDELETED(viewer))
			message_admins("НЕ МОГУ ОБНАРУЖИТЬ ОРИГИНАЛЬНОГО МОБА У [ckey], ОТПРАВЛЯЮ ЕГО В ЛОББИ...")
			var/mob/new_player/M = new /mob/new_player()
			M.ckey = ckey
			continue
		viewer.ckey = ckey
	ckey2body.Cut()

	for(var/camera in camera_mobs)
		qdel(camera)
	camera_mobs.Cut()

	. = ..()

/datum/modular_cutscene/proc/setup_actions(...)
	actions = list(
		/* CALL = DURATION, */
	)

/datum/modular_cutscene/proc/play(...)
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

/datum/modular_cutscene/proc/actor(id)
	if(!GLOB.cutscene_actors.Find(id))
		message_admins("АКТЁР \"[id]\" В [type] ОТСУТСТВУЕТ, ПРОПУСКАЮ")
		return pick(GLOB.alive_mobs)
	return GLOB.cutscene_actors[id]

/datum/modular_cutscene/proc/teleport_camera(camera_id)
	if(!GLOB.cutscene_cameras.Find(camera_id))
		message_admins("КАМЕРА \"[camera_id]\" В [type] ОТСУТСТВУЕТ, ПРОПУСКАЮ")
		return

	for(var/camera in camera_mobs)
		qdel(camera)

	camera_mobs.Cut()

	var/turf/target_turf = get_turf(GLOB.cutscene_cameras[camera_id])
	for(var/ckey in ckey2body)
		var/mob/new_camera = new /mob/living/cutscene_pov(target_turf)
		new_camera.ckey = ckey
		camera_mobs += new_camera

/datum/modular_cutscene/proc/move_camera(...)
	var/list/target_mobs
	if(length(camera_mobs))
		target_mobs = camera_mobs
	else
		target_mobs = list_values(ckey2body.Copy())

	for(var/mob/viewer in target_mobs)
		if(viewer.client)
			animate(viewer.client, arglist(args))

/datum/modular_cutscene/proc/move_actor(mob/living/actor, direction)
	return actor.forceMove(get_step(get_turf(actor), direction))

/datum/modular_cutscene/proc/make_actor_talk(mob/living/actor, text = "anything")
	return actor.ISay(text)

/datum/modular_cutscene/proc/rotate_actor(mob/living/actor, direction)
	return actor.set_dir(direction)

/datum/modular_cutscene/proc/do_nothing()
	return

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

/mob/living/cutscene_pov
	stunned = INFINITY
	paralysis = INFINITY
	anchored = TRUE
	density = FALSE
	can_speak = FALSE
	status_flags = GODMODE
	mouse_opacity = MOUSE_OPACITY_UNCLICKABLE


// PEAK cynema x3
