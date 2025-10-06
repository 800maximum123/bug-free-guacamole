#define CALL(target, proc, args...) new Callback(target, PROC_REF(proc), ##args)
#define CALL_GLOB(proc, args...) new Callback(GLOBAL_PROC, GLOBAL_PROC_REF(proc), ##args)
#define CALL_TYPE(target, proc, type, args...) new Callback(target, TYPE_PROC_REF(type, proc), ##args)

#define MOVE_CAMERA(id) CALL(src, move_camera, id)
#define START_CUTSCENE(datum) CALL_GLOB(start_cutscene, datum, ckey2body)

/proc/start_cutscene(cutscene_type, list/old_viewers)
	new cutscene_type(old_viewers)

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
//	 - null
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
	actions = list(
		MOVE_CAMERA("Сцена 1"),
		CALL(actor("Нубик"), Move, NORTH) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1),
	)
*/
//	В данном примере мы перемещаем камеру нашей сцены на лендмарку с тэгом "Сцена 1"
//	А потом СРАЗУ же вызываем прок Move() у актёра с тэгом "Нубик", после которого ждём 2 секунды.
//	В конце, мы активируем новую катсцену, в которую для удобства перенесли часть этой.

/datum/modular_cutscene
	/// Список действий, которая должна произвести катсцена
	var/list/actions = list(
		/* CALL = DURATION, */
	)
	/// Список сикеев участников и их оригинальных персонажей
	var/list/ckey2body = list(
		/* "ckey" = /mob, */
	)
	/// Список активных скибиди камерамэнов, участвующих в сцене
	var/list/camera_mobs = list(
		/* /mob/cutscene_pov, */
	)
	/// Должны ли мы ждать, пока эта катсцена проиграется. Полезно, когда одна катсцена вызывает другую
	var/wait_for = TRUE

/datum/modular_cutscene/New(list/old_viewers, ...)
	. = ..()
	if(old_viewers)
		ckey2body = old_viewers.Copy()
	else
		for(var/client/viewer in GLOB.clients)
			ckey2body[viewer.ckey] = viewer.mob

	var/argument_list = args.Copy(2)
	play(arglist(argument_list))

/datum/modular_cutscene/Destroy()
	for(var/ckey in ckey2body)
		var/mob/viewer = ckey2body[ckey]
		viewer.ckey = ckey
	ckey2body.Cut()
	for(var/camera in camera_mobs)
		qdel(camera)
	camera_mobs.Cut()
	. = ..()

/datum/modular_cutscene/proc/play(...)
	if(!wait_for)
		set waitfor = FALSE

	var/action_index = 0
	var/next_sleep_delay = 0

	for(var/cutscene_data in actions)
		action_index++

		if(!isnull(cutscene_data))
			invoke(cutscene_data)

		if(actions[action_index] != 0)
			if(actions[action_index])
				next_sleep_delay = actions[action_index]
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

/datum/modular_cutscene/proc/move_camera(camera_id)
	if(!GLOB.cutscene_cameras.Find(camera_id))
		message_admins("КАМЕРА \"[camera_id]\" В [type] ОТСУТСТВУЕТ, ПРОПУСКАЮ")
		return

	for(var/camera in camera_mobs)
		qdel(camera)

	camera_mobs.Cut()

	for(var/ckey in ckey2body)
		var/mob/new_camera = new /mob/cutscene_pov(get_turf(GLOB.cutscene_cameras[camera_id]))
		new_camera.ckey = ckey
		camera_mobs += new_camera

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

/mob/cutscene_pov
	stunned = INFINITY
	paralysis = INFINITY
	anchored = TRUE
	density = FALSE

// PEAK cynema x3
