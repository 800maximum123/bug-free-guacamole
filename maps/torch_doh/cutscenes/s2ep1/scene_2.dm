//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// АССЕТЫ, НЕОБХОДИМЫЕ СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/smoke_wall_notimer
	icon_state = "smoke wall"
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER
	icon = 'icons/effects/smoke.dmi'
	icon_state = "smoke"
	pixel_x = -9
	pixel_y = -6

/obj/turf_fire/prop
	interact_with_atmos = FALSE
	passive_loss = FALSE
	color = COLOR_MEDICAL_BURN

/mob/living/simple_animal/cutscene_character/airlock/s2ep1/part2_1
	name = "Airlock"
	desc = "..."
	icon = 'icons/obj/doors/station/door.dmi'
	icon_state = "closed"
	icon_living = "closed"
	icon_dead = "closed"

	opacity = TRUE
	should_show_name = FALSE

/obj/structure/fd/players_geter/s2ep1/part2_1 // Мостик

/obj/structure/fd/players_geter/s2ep1/part2_2 // Инженерный отсек

/obj/structure/fd/players_geter/s2ep1/part2_3 // Коридор третьей

/obj/structure/fd/players_geter/s2ep1/part2_4 // Кошки помирают

/obj/structure/fd/players_geter/s2ep1/part2_5 // Ганбоат

/obj/structure/fd/players_geter/s2ep1/part2_6 // Госпиталь

/obj/structure/fd/players_geter/s2ep1/part2_7 // Фиддлер

/obj/structure/fd/players_geter/s2ep1/part2_8 // Неизвестные

/proc/credits_mapper()
	var/novel_message = "РАБОТА НАД ЛОКАЦИЯМИ: PALERNO"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_headdev()
	var/novel_message = "ТЕХНИЧЕСКАЯ ЧАСТЬ: DANILCUS"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -100
	visuals.maptext_y = -15
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_writers()
	var/novel_message = "ПОМОЩНИКИ СЦЕНАРИСТА: TECHPRIEST34, HELPMEEE, LOZARI, KANARYSS"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 110
	visuals.maptext_y = -10
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_investors()
	var/novel_message = "ФИНАНСОВУЮ ПОМОЩЬ ОКАЗЫВАЛИ: TREESISS, VISTA1, TACKCARD, DELTA23, GRIGPASHTET"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 10
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ СЦЕНЫ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/proc/fds2ep1_sc2()
	var/sound/opening_minus = sound('maps/torch_doh/cutscenes/sounds/opening2_inst.ogg', repeat = 0, wait = 1, channel = GLOB.admin_sound_channel)
	opening_minus.priority = 255
	opening_minus.volume = 3

	var/sound/opening_plus = sound('maps/torch_doh/cutscenes/sounds/opening2_vocal.ogg', repeat = 0, wait = 1, channel = GLOB.admin_sound_channel)
	opening_plus.priority = 255
	opening_plus.volume = 4

	for(var/mob/all in GLOB.player_list)

		sound_to(all, opening_minus)

		for(var/obj/structure/fd/players_geter/s2ep1/part2_1/G in world)
			all.alpha = 0
			all.forceMove(G)
			repeating_siren(G)

		all.client.pixel_x = 192

		spawn(15 SECONDS)
			credits_mapper()
			credits_headdev()

		spawn(25 SECONDS)
			all.move_cutscene_camera(all, 0, 0, 5 SECONDS)

		spawn(67 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_2/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

				spawn(3 SECONDS)
					playsound(get_turf(G), "sparks", 50, 1)

		spawn(70 SECONDS)
			credits_writers()

		spawn(78 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_1/G in world)
				all.alpha = 0
				all.forceMove(G)

		spawn(93 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_2/G in world)
				all.alpha = 0
				all.forceMove(G)

				spawn(2 SECONDS)
					playsound(get_turf(G), 'sound/mecha/lowpowernano.ogg', 10)

		spawn(120 SECONDS)
			credits_investors()

		spawn(142 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_1/G in world)
				all.alpha = 0
				all.forceMove(G)

		spawn(178 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_2/G in world)
				all.alpha = 0
				all.forceMove(G)

				spawn(2 SECONDS)
					playsound(get_turf(G), "sparks", 50, 1)

				spawn(8 SECONDS)
					playsound(get_turf(G), "sparks", 50, 1)

		spawn(222 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_1/G in world)
				all.alpha = 0
				all.forceMove(G)

		spawn(288 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_2/G in world)
				all.alpha = 0
				all.forceMove(G)

				spawn(4 SECONDS)
					playsound(get_turf(G), "sparks", 50, 1)

				spawn(6 SECONDS)
					playsound(get_turf(G), "sparks", 50, 1)

		spawn(305 SECONDS)
			sound_to(all, opening_plus)

		spawn(318 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_1/G in world)
				all.alpha = 0
				all.forceMove(G)

		spawn(395 SECONDS)
			all.client.pixel_x = 288

		spawn(400 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_3/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

		spawn(405 SECONDS)
			all.move_cutscene_camera(all, 0, 0, 5 SECONDS)

		spawn(445 SECONDS)
			all.move_cutscene_camera(all, 0, 80, 3 SECONDS)

		spawn(450 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_4/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

		spawn(452 SECONDS)
			all.move_cutscene_camera(all, 0, 160, 2 SECONDS)

		spawn(629 SECONDS)
			all.client.pixel_y = 0

		spawn(632 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_5/G in world)
				all.alpha = 0
				all.forceMove(G)

		spawn(722 SECONDS)
			all.move_cutscene_camera(all, 128, 0, 3 SECONDS)

		spawn(726 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_6/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

		spawn(728 SECONDS)
			all.move_cutscene_camera(all, 160, 0, 2 SECONDS)

		spawn(762 SECONDS)
			all.client.pixel_x = 0

		spawn(766 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part2_7/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

		spawn(790 SECONDS)
			all.client.view = all.remember_camera_size
			all.forceMove(all.remember_position)

			all.alpha = 255
			all.client.pixel_x = 0
			all.client.pixel_y = 192

			all.SetStunned(0)

		spawn(800 SECONDS)
			fds2ep1_sc3()

	spawn(10 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt21")
				continue
			C.do_stuff()

	spawn(69 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt22")
				continue
			C.do_stuff()

	spawn(405 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt23")
				continue
			C.do_stuff()

	spawn(455 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt24")
				continue
			C.do_stuff()

	spawn(636 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt25")
				continue
			C.do_stuff()

	spawn(730 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt26")
				continue
			C.do_stuff()

	spawn(770 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt27")
				continue
			C.do_stuff()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ ПЕРСОНАЖЕЙ В СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/mob/living/simple_animal/cutscene_character/airlock/s2ep1/part2_1/do_stuff()
	icon_state = "construction"

	var/datum/effect/spark_spread/spark_system = new /datum/effect/spark_spread()
	spark_system.set_up(5, 0, loc)
	spark_system.start()
	playsound(loc, 'sound/weapons/pushhiss.ogg', 50, 1)
	playsound(loc, "sparks", 50, 1)

	forceMove(get_step(src, WEST))
	spin(0.65 SECONDS, 0.125 SECONDS)

	spawn(0.2 SECONDS)
		spin(0.65 SECONDS, 0.125 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(0.4 SECONDS)
		spin(0.65 SECONDS, 0.125 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(0.6 SECONDS)
		spin(0.65 SECONDS, 0.125 SECONDS)
		forceMove(get_step(src, WEST))

/mob/living/simple_animal/cutscene_character/meat/s2ep1/part2_1/do_stuff()
	spawn(1 SECOND)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

	spawn(2 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(3 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(3.5 SECONDS)
		dir = SOUTH

	spawn(3.8 SECONDS)
		animate(src, pixel_y = 15, 0.5 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(5 SECONDS)
		ISay("Предпочитал не тратить силы почём зря.")

	spawn(17 SECONDS)
		ISay("Любите же вы поговорить...")

	spawn(22 SECONDS)
		ISay("!вздыхает.")
		animate(src, pixel_y = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(23 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating5.ogg', 70)

	spawn(24 SECONDS)
		ISay("Сомневаюсь, что там осталось кому отвечать.")

	spawn(25 SECONDS)
		dir = WEST
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(26 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating2.ogg', 70)

	spawn(27 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating5.ogg', 70)

	spawn(28 SECONDS)
		ISay("Да и мостика у нас, в целом-то, тоже не осталось.")

	spawn(38 SECONDS)
		ISay("Самое то для массового захоронения, не могу не согласиться.")

	spawn(41 SECONDS)
		ISay("Ты можешь получить доступ к корабельным системам?")

	spawn(140 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

	spawn(141 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(142 SECONDS)
		dir = SOUTH
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(320 SECONDS)
		ISay("Мы не могли ему помочь.")

	spawn(332 SECONDS)
		ISay("На какие-то вещи мы просто неспособны повлиять.")

	spawn(340 SECONDS)
		ISay("Зациклишься на них лишний раз - быстро потеряешь себя.")

	spawn(366 SECONDS)
		dir = EAST
		ISay("Куда ты собралась?")

	spawn(376 SECONDS)
		CutOverlays(maptext_name)

/mob/living/simple_animal/cutscene_character/naia/s2ep1/part2_1/do_stuff()
	spawn(1.5 SECONDS)
		ISay("Ты всегда так мог?")

	spawn(3 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(6.5 SECONDS)
		ISay("!усмехается.")

	spawn(8 SECONDS)
		ISay("Даже не знаю, обижаться ли мне на то, что ты меня ни во что не ставишь...")
		forceMove(get_step(src, WEST))

	spawn(9 SECONDS)
		dir = SOUTH
		forceMove(get_step(src, SOUTH))

	spawn(10 SECONDS)
		dir = WEST
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

	spawn(11 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating5.ogg', 70)

	spawn(12 SECONDS)
		ISay("...или радоваться тому, что я точно вне списка потенциальных жертв.")
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating2.ogg', 70)

	spawn(13 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(14 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(15 SECONDS)
		dir = SOUTH

	spawn(17 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(18 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(18.5 SECONDS)
		dir = WEST

	spawn(18.8 SECONDS)
		animate(src, pixel_x = -15, 0.5 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
		animate(src, pixel_y = -10, 0.5 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

	spawn(19 SECONDS)
		ISay("Эй, железный дровосек, ты ещё с нами?")
		ISay("!слегка трясёт ИПСа за плечо.")

	spawn(22 SECONDS)
		dir = SOUTH
		ISay("Твою-то!")
		animate(src, pixel_y = 10, 0.3 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(24 SECONDS)
		dir = EAST

	spawn(28 SECONDS)
		dir = SOUTH

	spawn(28.5 SECONDS)
		dir = WEST

	spawn(34 SECONDS)
		ISay("Хотя бы вид красивый.")

	spawn(44 SECONDS)
		ISay("!ворчливо закатила глаза.")

	spawn(44.5 SECONDS)
		animate(src, pixel_x = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
		animate(src, pixel_y = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
		forceMove(get_step(src, WEST))

	spawn(45 SECONDS)
		forceMove(get_step(src, SOUTH))

	spawn(46 SECONDS)
		icon_state = "Naia 3"
		animate(src, pixel_x = -15, 0.5 SECONDS, easing = SINE_EASING|EASE_OUT)
		ISay("Я ожидала услышать ответ от тебя, мистер-мои-щупальца-везде-успеют.")
		ISay("!щёлкает по клавишам.")

	spawn(52 SECONDS)
		ISay("Мостик инженерному отсеку. Каз? Ампер?")

	spawn(54 SECONDS)
		ISay("На частоте кто-нибудь есть?")

	spawn(70 SECONDS)
		ISay("У меня здесь корабль по швам трещит, а его штурман решил прикурнуть.")

	spawn(76 SECONDS)
		ISay("Есть немалые шансы пойти на дно вместе с ним, коли ничего не предпринять.")

	spawn(80 SECONDS)
		ISay("Скажи мне, Факел сможет доковылять хотя бы до берега?")

	spawn(130 SECONDS)
		ISay("!вздыхает.")

	spawn(142 SECONDS)
		ISay("Сколько у нас времени?")

	spawn(162 SECONDS)
		ISay("Пауль.")

	spawn(216 SECONDS)
		ISay("!нахмурилась.")
		ISay("Даже не вздумай, мы придумаем что-нибудь е-...")

	spawn(238 SECONDS)
		icon_state = "Naia 4"
		ISay("!опускает голову.")

	spawn(320 SECONDS)
		icon_state = "Naia 5"
		animate(src, pixel_x = -5, 0.5 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(325 SECONDS)
		ISay("Ты так считаешь?")

	spawn(344 SECONDS)
		dir = NORTH
		ISay("Легко говорить об этом сидя на заборе.")

	spawn(348 SECONDS)
		dir = SOUTH
		ISay("Без врагов...")

	spawn(350 SECONDS)
		pixel_x = 0
		dir = EAST
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)
		ISay("Или друзей, на которых можно было бы положиться.")

	spawn(354 SECONDS)
		dir = NORTH
		forceMove(get_step(src, NORTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(356 SECONDS)
		forceMove(get_step(src, NORTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(358 SECONDS)
		ISay("Придумай, что делать с железным.")
		forceMove(get_step(src, NORTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating5.ogg', 70)

	spawn(360 SECONDS)
		dir = EAST
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating2.ogg', 70)

	spawn(362 SECONDS)
		ISay("Мостик в твоём распоряжении.")
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

	spawn(364 SECONDS)
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(370 SECONDS)
		ISay("Постараюсь сделать так, чтобы их жертва не стала напрасной.")

	spawn(372 SECONDS)
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

	spawn(374 SECONDS)
		ISay("В процессе не подохнув в твоих же отходах.")
		dir = NORTH
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating5.ogg', 70)

	spawn(376 SECONDS)
		CutOverlays(maptext_name)

/mob/living/simple_animal/cutscene_character/swift/s2ep1/part2_1/do_stuff()
	spawn(19 SECONDS)
		animate(src, 0.2 SECONDS, transform = matrix(-5, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_IN)
	spawn(19.2 SECONDS)
		animate(src, 0.2 SECONDS, transform = matrix(0, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_OUT)
	spawn(19.4 SECONDS)
		animate(src, 0.2 SECONDS, transform = matrix(-5, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_IN)
	spawn(19.6 SECONDS)
		animate(src, 0.2 SECONDS, transform = matrix(0, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_OUT)
	spawn(19.8 SECONDS)
		animate(src, 0.2 SECONDS, transform = matrix(-5, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_IN)
	spawn(20 SECONDS)
		animate(src, 0.4 SECONDS, transform = matrix(0, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_OUT)
	spawn(20.4 SECONDS)
		animate(src, 0.4 SECONDS, transform = matrix(-5, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_IN)
	spawn(20.8 SECONDS)
		animate(src, 0.4 SECONDS, transform = matrix(0, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_OUT)
	spawn(21.2 SECONDS)
		animate(src, 0.4 SECONDS, transform = matrix(-10, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_IN)
	spawn(21.6 SECONDS)
		animate(src, 0.4 SECONDS, transform = matrix(0, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_OUT)

	spawn(22 SECONDS)
		animate(src, 1 SECONDS, transform = matrix(90, MATRIX_ROTATE), easing = BACK_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(src, pixel_y = -15, 1 SECONDS, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)

	spawn(22.5 SECONDS)
		icon_state = "S.W.I.F.T 4"

	spawn(376 SECONDS)
		CutOverlays(maptext_name)

/mob/living/simple_animal/cutscene_character/naia/s2ep1/part2_2/do_stuff()
	ISay("Да не молчите же вы, как убитые!")

	spawn(2 SECOND)
		ISay("Вольтанутый!")

	spawn(44 SECOND)
		ISay("А я удивлена тому, что у тебя ещё остались силы отшучиваться.")

	spawn(130 SECONDS)
		ISay("...словно сама вселенная нам смерти желает. Что насчёт переборок?")

	spawn(134 SECONDS)
		ISay("Мы можем как-то приуменьшить очаг возгорания?")

	spawn(220 SECOND)
		ISay("...")

	spawn(225 SECOND)
		ISay("Обязательно.")

/mob/living/simple_animal/cutscene_character/kz/s2ep1/part2_2/do_stuff()
	spawn(2 SECONDS)
		ISay("!нервно протягивает трубку мужчине.")

	spawn(34 SECONDS)
		animate(src, pixel_x = 4, 0.5 SECONDS, easing = SINE_EASING|EASE_IN)
		ISay("!паникующе поднесла руку.")

	spawn(34.3 SECONDS)
		icon_state = "Abigail 3"

	spawn(160 SECONDS)
		icon_state = "Abigail 4"

	spawn(226 SECONDS)
		icon_state = "Abigail 2"
		animate(src, pixel_x = 15, 1 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(234 SECOND)
		icon_state = "Abigail 5"
		ISay("!утирает нос.")
		pixel_x = 0
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating2.ogg', 70)

	spawn(236 SECOND)
		icon_state = "Abigail 2"

	spawn(238 SECOND)
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(242 SECOND)
		dir = EAST
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating5.ogg', 70)

	spawn(246 SECOND)
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(248 SECOND)
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

/mob/living/simple_animal/cutscene_character/amper/s2ep1/part2_2/do_stuff()
	ISay("!сплёвывает кровь.")

	spawn(4 SECONDS)
		ISay("!хрипит.")
		ISay("...здесь я.")

	spawn(6 SECONDS)
		ISay("!кашляет.")
		ISay("Чего разоралась?")

	spawn(30 SECONDS)
		ISay("Я не знал, что ты-...")

	spawn(34 SECONDS)
		ISay("!сжался от боли.")

	spawn(38 SECONDS)
		ISay("...болеешь оптимизмом.")

	spawn(52 SECONDS)
		ISay("Нужно же смеяться, пока дают.")

	spawn(54 SECONDS)
		ISay("!кашляет.")

	spawn(56 SECONDS)
		ISay("Все двигатели выведены из строя. Никуда этот металлолом уже не доковыляет.")

	spawn(66 SECONDS)
		ISay("Советую паковать вещички и сваливать, пока ещё есть такая возможность.")

	spawn(116 SECONDS)
		icon_state = "Paul 3"

		ISay("!кашляет.")
		ISay("Час. Я рекомендую уложиться в минут тридцать.")

	spawn(124 SECONDS)
		ISay("Если пламя доберётся до топлива - станет ещё меньше.")

	spawn(136 SECONDS)
		ISay("!вздыхает.")

	spawn(140 SECONDS)
		ISay("...есть одна секция, правда...")
		icon_state = "Paul 2"

	spawn(144 SECONDS)
		ISay("...перекрыть мы её сможем только изнутри.")

	spawn(144 SECONDS)
		animate(src, pixel_x = -15, 0.2 SECONDS, easing = SINE_EASING|EASE_OUT)
	spawn(144.4 SECONDS)
		animate(src, pixel_x = -14, 0.2 SECONDS, easing = SINE_EASING|EASE_IN)
	spawn(144.8 SECONDS)
		animate(src, pixel_x = -15, 0.2 SECONDS, easing = SINE_EASING|EASE_OUT)

	spawn(145 SECONDS)
		animate(src, pixel_x = -14, 0.2 SECONDS, easing = SINE_EASING|EASE_IN)
		ISay("!сплёвывает кровь.")

	spawn(160 SECONDS)
		icon_state = "Paul 4"

/mob/living/simple_animal/cutscene_character/amper/s2ep1/part2_1/do_stuff()

	spawn(132 SECONDS)
		ISay("Потому что скоро здесь всё бенгальскими огнями загорится.")

	spawn(138 SECONDS)
		ISay("Сомневаюсь, что ты хочешь ощутить как кожа медленно слезает с твоего тела.")

	spawn(146 SECONDS)
		ISay("...")

	spawn(148 SECONDS)
		ISay("Сейчас было бы самое время соврать.")

	spawn(154 SECONDS)
		ISay("Да только я вот...")

	spawn(160 SECONDS)
		ISay("...короче, не по-Землянски как-...")

	spawn(218 SECONDS)
		ISay("...и поставим под угрозу очередную жизнь?")

	spawn(226 SECONDS)
		ISay("!хрипит.")
		ISay("Хрена-с два, чтоб из-за меня ещё кто-то помер. Мы с Каз уже всё решили.")

	spawn(230 SECONDS)
		ISay("Коли осталось недолго, хоть пользу принесу.")

	spawn(236 SECONDS)
		ISay("!болезненно смеётся.")
		ISay("...звиняйте уж, что так получается.")

	spawn(240 SECONDS)
		ISay("Я бы ещё многое хотел повидать...жаль жизнь мест не выбирает.")

	spawn(245 SECONDS)
		ISay("...")

	spawn(250 SECONDS)
		ISay("Шеф...можно попросить вас об одолжении?")

	spawn(258 SECONDS)
		ISay("Если доживёте до того дня...когда человек снова станет свободным-...")

	spawn(262 SECONDS)
		ISay("...расскажете...п-потом...")

	spawn(266 SECONDS)
		ISay("...к-как оно было?")

/mob/living/simple_animal/cutscene_character/wind/s2ep1/part2_3/do_stuff()
	forceMove(get_step(src, WEST))

	spawn(0.3 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(0.6 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(0.9 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(1.2 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(1.5 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(1.8 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(2.1 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(2.4 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(2.7 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(3 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(3.3 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(3.6 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(3.9 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(4.2 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(4.5 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(4.6 SECONDS)
		animate(src, pixel_x = -16, 0.4 SECONDS, easing = SINE_EASING|EASE_OUT)

	spawn(5 SECONDS)
		animate(src, pixel_x = -8, 0.1 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(7 SECONDS)
		ISay("В чём. Дело?")

	spawn(40 SECONDS)
		ISay("Должен...вновь заставить друзей улыбаться. Быть похожим на собрата.")

/mob/living/simple_animal/cutscene_character/froise/s2ep1/part2_3/do_stuff()
	forceMove(get_step(src, WEST))

	spawn(0.3 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(0.6 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(0.9 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(1.2 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(1.5 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(1.8 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(2.1 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(2.4 SECONDS)
		ISay("!хлопает по крышке меха.")
		ISay("Притормози чуток!")
		forceMove(get_step(src, WEST))

	spawn(2.7 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(3 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(3.3 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(3.6 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(3.9 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(4.2 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(4.5 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(4.6 SECONDS)
		animate(src, pixel_x = 0, 0.4 SECONDS, easing = SINE_EASING|EASE_OUT)

	spawn(5 SECONDS)
		animate(src, pixel_x = 8, 0.1 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(7 SECONDS)
		icon_state = "Alexander 3"
		ISay("!достаёт КПК из кармана.")

	spawn(11 SECONDS)
		ISay("Это сообщение от Мяса.")

	spawn(15 SECONDS)
		dir = EAST
		icon_state = "Alexander 4"
		animate(src, pixel_y = 0, 1 SECONDS, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(src, pixel_x = 0, 1 SECONDS, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)

	spawn(16 SECONDS)
		forceMove(get_step(src, EAST))

	spawn(18 SECONDS)
		forceMove(get_step(src, EAST))
		ISay("Похоже, что они наконец восстановили связь.")

	spawn(26 SECONDS)
		ISay("!хмурится.")

	spawn(27 SECONDS)
		icon_state = "Alexander 5"
		ISay("...вот как. Снова в бега, значит?")

	spawn(32 SECONDS)
		ISay("Ветерок!")

	spawn(36 SECONDS)
		dir = SOUTH
		ISay("Меняем маршрут, твоя помощь нужна на левой батарее!")

	spawn(40 SECONDS)
		ISay("!убирает КПК.")
		dir = WEST
		forceMove(get_step(src, WEST))

	spawn(42 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(43 SECONDS)
		dir = NORTH
		animate(src, pixel_y = 10, 1 SECONDS, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)

/mob/living/simple_animal/cutscene_character/ashira/s2ep1/part2_4/do_stuff()
	ISay("!скалится от боли.")

	spawn(6 SECONDS)
		ISay("П-похоже эвакуация идёт...гх-...")

	spawn(10 SECONDS)
		ISay("...полным х-ходом.")

	spawn(16.5 SECONDS)
		icon_state = "Ashira 3"

	spawn(16 SECONDS)
		ISay("Н-нам следует поторропиться. С-семеро явно одного ждать не будут...")

	spawn(21 SECONDS)
		animate(src, 1 SECONDS, transform = matrix(30, MATRIX_ROTATE), easing = BACK_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(src, pixel_x = -20, 1 SECONDS, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		icon_state = "Ashira 4"

	spawn(22 SECONDS)
		animate(src, 0.5 SECONDS, transform = matrix(0, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_OUT)

	spawn(22.5 SECONDS)
		pixel_x = 0

	spawn(23 SECONDS)
		ISay("Д-давай-...ещё немного, и мы-...")
		forceMove(get_step(src, WEST))

	spawn(23.5 SECONDS)
		icon_state = "Ashira 5"
		animate(src, pixel_x = -8, 0.5 SECONDS, easing = SINE_EASING|EASE_OUT)

	spawn(29 SECONDS)
		ISay("!повела ухом.")

	spawn(34 SECONDS)
		icon_state = "Ashira 6"
		ISay("Р-рано опускать лапы!")

	spawn(38 SECONDS)
		ISay("Ты же сама говоррила, что духи нам с-сегодня благоволят!")

	spawn(55 SECONDS)
		ISay("Откуда ты...")

	spawn(58 SECONDS)
		icon_state = "Ashira 5"

	spawn(62 SECONDS)
		animate(src, pixel_x = -13, 0.5 SECONDS, easing = SINE_EASING|EASE_OUT)
		icon_state = "Ashira 7"

	spawn(88 SECONDS)
		dir = EAST
		icon_state = "Ashira 8"
		ISay("...то я бы всё рравно не послушалась. Ни тебя, ни Свифта.")

	spawn(90 SECONDS)
		animate(src, pixel_y = -10, 5 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(92 SECONDS)
		icon_state = "Ashira 9"

	spawn(96 SECONDS)
		ISay("Не нужно винить себя за то, на ч-что ты изначально не могла повлиять...")

	spawn(102 SECONDS)
		ISay("Тем более, что...")

	spawn(108 SECONDS)
		ISay("Я...даже не знаю, что бы я делала без тебя.")

	spawn(112 SECONDS)
		ISay("Мы стольких потерряли...и наверняка в будущем жеррртв было бы только больше...")

	spawn(118 SECONDS)
		ISay("Ты п-позволила мне сблизиться с тобой несмотря на пррошлые боли. Впустила меня в свою душу.")

	spawn(126 SECONDS)
		ISay("Может...я и н-не очень рразбираюсь в ваших обычаях, но даже так могу сказать, что это дорогого стоит-...")

	spawn(130 SECONDS)
		ISay("На вр-рряд ли я встрретила бы кого-то вроде тебя ещё рраз.")

	spawn(146 SECONDS)
		icon_state = "Ashira 10"
		ISay("!вздыхает.")

	spawn(148 SECONDS)
		ISay("...По крайней меррре, вопррос о существовании д-духов будет наконец закрррыт.")

	spawn(156 SECONDS)
		icon_state = "Ashira 9"
		ISay("Ч-чт...что смешного?!")

	spawn(158 SECONDS)
		icon_state = "Ashira 8"
		ISay("Надоррвёшься ве-...")
		animate(src, pixel_y = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
		animate(src, pixel_x = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

	spawn(168 SECONDS)
		CutOverlays(maptext_name)

	spawn(172 SECONDS)
		ISay("!с трудом улыбнулась.")
		playsound(get_turf(src), 'mods/emote_panel/sound/giggle_female_1.ogg', 20)

/mob/living/simple_animal/cutscene_character/miri/s2ep1/part2_4/do_stuff()
	spawn(28 SECONDS)
		ISay("...это всё бессмысленно...")

	spawn(44 SECONDS)
		icon_state = "Miri'am 3"
		ISay("!болезненно улыбается, поднимая одну лапу вверх.")

	spawn(46 SECONDS)
		ISay("Видишь эти фиолетовые полосы? Они медленно ррасходятся по всему нашему телу...")

	spawn(52 SECONDS)
		ISay("...коварррный внеземной яд медленно рразрушает клетки организма изнутри.")

	spawn(57 SECONDS)
		ISay("Ворронцов рассказывал.")

	spawn(62 SECONDS)
		ISay("О том-...как один такой осколок был способен извести даже самого здоррового человека.")

	spawn(72 SECONDS)
		ISay("Поэтому, даже при условии того, что мы выберрремся с корабля...даже если мы извлечём эти к-кристалы-...")

	spawn(76 SECONDS)
		icon_state = "Miri'am 4"
		ISay("!закрывает лапой лицо, хныча.")

	spawn(80 SECONDS)
		ISay("П-пррости...-это всё м-моя вина.")

	spawn(86 SECONDS)
		ISay("Если бы я только возрразила на счёт твоего участия в бою...")

	spawn(100 SECONDS)
		ISay("!шмыгает носом.")

	spawn(118 SECONDS)
		ISay("...")

	spawn(152 SECONDS)
		ISay("!внезапно засмеялась.")
		playsound(get_turf(src), 'mods/emote_panel/sound/laugh_female_2.ogg', 20)

	spawn(158 SECONDS)
		ISay("Аширра...")

	spawn(164 SECONDS)
		icon_state = "Miri'am 2"
		ISay("...к-какая же ты всё-таки...")

	spawn(168 SECONDS)
		CutOverlays(maptext_name)

	spawn(170 SECONDS)
		ISay("...дуррочка.")

/mob/living/simple_animal/cutscene_character/naia/s2ep1/part2_5/do_stuff()
	ISay("Теперь, пожалуйста, можно повторить для людей?")

	spawn(22 SECONDS)
		ISay("В карман предлагаешь его положить?")

	spawn(28 SECONDS)
		ISay("Это скреллианская техника тридцатилетней давности. То, что она в принципе всё ещё функционирует - чудо.")

	spawn(34 SECONDS)
		dir = EAST
		ISay("Если мы попытаемся выключить её БЕЗ специалистов - это может аукнуться нам даже сильнее.")

	spawn(52 SECONDS)
		ISay("!скрестила руки на груди.")

	spawn(57 SECONDS)
		dir = EAST

	spawn(72 SECONDS)
		ISay("!кивает.")

	spawn(74 SECONDS)
		dir = SOUTH

	spawn(75 SECONDS)
		forceMove(get_step(src, SOUTH))

	spawn(76 SECONDS)
		dir = EAST

	spawn(77 SECONDS)
		icon_state = "Naia 7"
		animate(src, pixel_x = 8, 0.5 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(79 SECONDS)
		ISay("Он прав. Мы можем озаботиться данным вопросом после того как будем уверены в общей безопасности.")

	spawn(84 SECONDS)
		ISay("Сейчас эти разногласия нам ни к чему.")

/mob/living/simple_animal/cutscene_character/olivia/s2ep1/part2_5/do_stuff()
	spawn(3 SECONDS)
		ISay("!тяжело вздыхает.")

	spawn(6 SECONDS)
		ISay("Радиоактивные отходы - это МЕНЬШАЯ из наших проблем.")

	spawn(10 SECONDS)
		ISay("Мы не можем оставить на корабле в аварийном состоянии безхозный БСД, надеясь на то что с ним НИЧЕГО не случится!")

	spawn(18 SECONDS)
		ISay("Никто банально знать-не-знает что произойдёт, если его дестабилизировать!")

	spawn(40 SECONDS)
		dir = NORTH
		ISay("Что если тот кто найдёт БСД после - попытается использовать его против нас?")

	spawn(46 SECONDS)
		ISay("Кто-то ведь должен был отключить планетарный щит, правильно?")

	spawn(50 SECONDS)
		ISay("Что если этот кто-то - ещё один враг?")

	spawn(57 SECONDS)
		dir = EAST

	spawn(63 SECONDS)
		forceMove(get_step(src, EAST))

	spawn(64 SECONDS)
		forceMove(get_step(src, EAST))
		ISay("Н-но-!...")

	spawn(77 SECONDS)
		icon_state = "Olivia 3"
		dir = SOUTH

	spawn(85 SECONDS)
		icon_state = "Olivia 4"
		dir = EAST
		ISay("!прикрывает лицо рукой.")

	spawn(88 SECONDS)
		icon_state = "Olivia 2"
		ISay("Нам это точно аукнется.")

/mob/living/simple_animal/cutscene_character/maxim/s2ep1/part2_5/do_stuff()

	spawn(2 SECONDS)
		playsound(get_turf(src), 'sound/items/welderactivate.ogg', 20)

	spawn(4 SECONDS)
		playsound(get_turf(src), 'sound/items/Welder2.ogg', 20)

	spawn(6 SECONDS)
		playsound(get_turf(src), 'sound/items/welderdeactivate.ogg', 20)

	spawn(10 SECONDS)
		playsound(get_turf(src), 'sound/items/rped.ogg', 20)

	spawn(16 SECONDS)
		playsound(get_turf(src), 'sound/items/welderactivate.ogg', 20)

	spawn(18 SECONDS)
		playsound(get_turf(src), 'sound/items/Welder.ogg', 20)

	spawn(20 SECONDS)
		playsound(get_turf(src), 'sound/items/welderdeactivate.ogg', 20)

	spawn(30 SECONDS)
		ISay("!что-то бубнит.")
		playsound(get_turf(src), 'sound/items/welderactivate.ogg', 20)

	spawn(32 SECONDS)
		playsound(get_turf(src), 'sound/items/Welder2.ogg', 20)

	spawn(34 SECONDS)
		playsound(get_turf(src), 'sound/items/welderdeactivate.ogg', 20)

	spawn(48 SECONDS)
		ISay("!кивает сам себе.")
		icon_state = "Maxim 5"

	spawn(56 SECONDS)
		dir = WEST
		ISay("Вы закончили?")

	spawn(60 SECONDS)
		ISay("Прекрасно, теперь принесите мне ключ на шестнадцать.")

	spawn(64 SECONDS)
		ISay("И без ноканья.")

	spawn(70 SECONDS)
		ISay("Если этот кусок мусора не поплывёт - мы в любом случае покойники.")

	spawn(76 SECONDS)
		icon_state = "Maxim 6"
		dir = NORTH
		playsound(get_turf(src), 'sound/items/scrape_clunk.ogg', 20)
		ISay("И где вообще Ветра носит?! Я сварщик, а не физик-ядерщик!")

	spawn(80 SECONDS)
		ISay("...и вообще шаттлы никогда не строил.")

/mob/living/simple_animal/cutscene_character/lira/s2ep1/part2_6/do_stuff()
	ISay("Поразительно...")

	spawn(2 SECONDS)
		ISay("...этот агент действительно настолько же опасен, насколько его и описывают...")

	spawn(11 SECONDS)
		ISay("В текущих реалиях-...")

	spawn(12 SECONDS)
		icon_state = "Lira 4"

/mob/living/simple_animal/cutscene_character/gora/s2ep1/part2_6/do_stuff()
	spawn(8 SECONDS)
		ISay("Можем ли мы как-то помочь ему?")

	spawn(12 SECONDS)
		icon_state = "Gora 5"

	spawn(23 SECONDS)
		dir = SOUTH

	spawn(24 SECONDS)
		forceMove(get_step(src, SOUTH))

/mob/living/simple_animal/cutscene_character/datura/s2ep1/part2_6/do_stuff()
	spawn(12 SECONDS)
		dir = SOUTH

/mob/living/simple_animal/cutscene_character/amelia/s2ep1/part2_6/do_stuff()
	spawn(2 SECONDS)
		ISay("Н-нет...")

	spawn(6 SECONDS)
		ISay("Этого н-не может-...")
		forceMove(get_step(src, WEST))

	spawn(8 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(10 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(11 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(12 SECONDS)
		animate(src, pixel_x = -25, 0.5 SECONDS, easing = SINE_EASING|EASE_IN)
		icon_state = "Amelia 4"
		ISay("ПЕРСИВАЛЬ!")

	spawn(14 SECONDS)
		ISay("!шмыгает носом.")
		ISay("Луни! П-пусти меня к нему!")

	spawn(28 SECONDS)
		ISay("!утыкается парню в плечо, скалясь.")
		icon_state = "Amelia"

/mob/living/simple_animal/cutscene_character/zlata/s2ep1/part2_6/do_stuff()

	spawn(9 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(10 SECONDS)
		icon_state = "Zlata 5"
		ISay("Амелия-!")
		animate(src, pixel_x = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(11 SECONDS)
		icon_state = "Zlata 7"
		animate(src, pixel_x = 10, 0.5 SECONDS, easing = SINE_EASING|EASE_IN)

/mob/living/simple_animal/cutscene_character/luny/s2ep1/part2_6/do_stuff()
	spawn(10 SECONDS)
		animate(src, pixel_x = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(11 SECONDS)
		dir = NORTH
		forceMove(get_step(src, NORTH))

	spawn(11.5 SECONDS)
		dir = EAST
		forceMove(get_step(src, NORTH))

	spawn(12 SECONDS)
		ISay("!перехватывает девушку.")

	spawn(20 SECONDS)
		ISay("Будет только больнее. Хватит.")

	spawn(24 SECONDS)
		ISay("Он не хотел бы чтобы ты видела его таким.")

/mob/living/simple_animal/cutscene_character/fiddler/s2ep1/part2_7/do_stuff()
	spawn(2 SECONDS)
		icon_state = "Fiddler 3"

	spawn(4 SECONDS)
		icon_state = "Fiddler"
		dir = SOUTH

	spawn(6 SECONDS)
		animate(src, 5 SECONDS, transform = matrix(0, MATRIX_ROTATE), easing = BOUNCE_EASING|EASE_OUT)

	spawn(11 SECONDS)
		ISay("!щёлкает затвор на шее.")
		dir = NORTH

	spawn(12 SECONDS)
		icon_state = "Fiddler 4"

	spawn(13 SECONDS)
		dir = EAST

	spawn(14 SECONDS)
		forceMove(get_step(src, EAST))
		ISay("Шо%ф--л1д?")

	spawn(15 SECONDS)
		dir = SOUTH

	spawn(16 SECONDS)
		dir = WEST
		forceMove(get_step(src, EAST))

	spawn(18 SECONDS)
		ISay("М4йор!")

	spawn(20 SECONDS)
		ISay("!стучит по голове.")

	spawn(22 SECONDS)
		icon_state = "Fiddler 5"
		animate(src, pixel_x = 5, 0.5 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(23 SECONDS)
		dir = NORTH

	spawn(24 SECONDS)
		ISay("...его трость.")
		forceMove(get_step(src, NORTH))

	spawn(28 SECONDS)
		dir = EAST
		animate(src, pixel_x = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_IN)
		ISay("Кайлер, где ты чёрт возьми?...")
