//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СЮДА ИДУТ ТОЛЬКО ПОВТОРЯЮЩИЕСЯ, ИЛИ КОМПЛЕКСНЫЕ АНИМАЦИИ, КОТОРЫЕ ЛЕГЧЕ ВЫНЕСТИ В ОТДЕЛЬНЫЕ ОТ КАТСЦЕНЫ ПРОКИ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/mob/proc/move_cutscene_camera(atom/movable/UNIT, move_by_x = 0, move_by_y = 0, time_frame = 3 SECONDS)
	set waitfor = FALSE

	if(istype(UNIT, /mob))
		var/mob/user = UNIT

		var/client/client = user.client
		ADD_TRANSFORMATION_MOVEMENT_HANDLER(user)
		animate(client, pixel_y = move_by_y, pixel_x = move_by_x, time = time_frame, easing = SINE_EASING|EASE_IN)

		sleep(time_frame)
		DEL_TRANSFORMATION_MOVEMENT_HANDLER(user)
