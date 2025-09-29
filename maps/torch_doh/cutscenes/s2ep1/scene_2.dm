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

/mob/living/simple_animal/cutscene_character/amper
	name = "Пауль А."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/characters.dmi'
	icon_state = "Paul"
	icon_living = "Paul"
	icon_dead = "Paul"

/mob/living/simple_animal/cutscene_character/amper/s2ep1/part2_1
	alpha = 0
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/amper/s2ep1/part2_2
	icon_state = "Paul 2"
	icon_living = "Paul 2"
	icon_dead = "Paul 2"

/mob/living/simple_animal/cutscene_character/kz
	name = "Абигейл И."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/characters.dmi'
	icon_state = "Abigail"
	icon_living = "Abigail"
	icon_dead = "Abigail"

/mob/living/simple_animal/cutscene_character/kz/s2ep1/part2_2
	icon_state = "Abigail 2"
	icon_living = "Abigail 2"
	icon_dead = "Abigail 2"

/mob/living/simple_animal/cutscene_character/naia
	name = "Ная Ф."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/characters.dmi'
	icon_state = "Naia"
	icon_living = "Naia"
	icon_dead = "Naia"

/mob/living/simple_animal/cutscene_character/naia/s2ep1/part2_1

/mob/living/simple_animal/cutscene_character/naia/s2ep1/part2_2
	alpha = 0
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/meat
	name = "Мр. Мясо"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/characters.dmi'
	icon_state = "Meat"
	icon_living = "Meat"
	icon_dead = "Meat"

/mob/living/simple_animal/cutscene_character/meat/s2ep1/part2_1

/mob/living/simple_animal/cutscene_character/swift
	name = "С.В.И.Ф.Т."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/characters.dmi'
	icon_state = "S.W.I.F.T"
	icon_living = "S.W.I.F.T"
	icon_dead = "S.W.I.F.T"

/mob/living/simple_animal/cutscene_character/swift/s2ep1/part2_1
	icon_state = "S.W.I.F.T 2"
	icon_living = "S.W.I.F.T 2"
	icon_dead = "S.W.I.F.T 2"

/obj/structure/fd/players_geter/s2ep1/part2_1 // Мостик

/obj/structure/fd/players_geter/s2ep1/part2_2 // Инженерный отсек

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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ СЦЕНЫ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/proc/fds2ep1_sc2()

	for(var/mob/all in GLOB.player_list)
		sound_to(all.client, sound(null))

		for(var/obj/structure/fd/players_geter/s2ep1/part2_1/G in world)
			all.alpha = 0
			all.forceMove(G)
			repeating_siren(G)

		all.client.pixel_x = 160

		spawn(15 SECONDS)
			credits_mapper()
			credits_headdev()

		spawn(25 SECONDS)
			all.move_cutscene_camera(all, 0, 0, 5 SECONDS)

		spawn(65 SECONDS)
			sound_to(all.client, sound(null))

			for(var/obj/structure/fd/players_geter/s2ep1/part2_2/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

		spawn(71 SECONDS)
			sound_to(all.client, sound(null))

			for(var/obj/structure/fd/players_geter/s2ep1/part2_1/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

	spawn(10 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt21")
				continue
			C.do_stuff()

	spawn(66 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt22")
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

	spawn(2 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(3 SECONDS)
		forceMove(get_step(src, WEST))

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

	spawn(24 SECONDS)
		dir = WEST
		ISay("Сомневаюсь, что там осталось кому отвечать.")
		forceMove(get_step(src, WEST))

	spawn(25 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(26 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(27 SECONDS)
		ISay("Да и мостика у нас, в целом-то, тоже не осталось.")

	spawn(32 SECONDS)
		ISay("Самое то для массового захоронения, не могу не согласиться.")

	spawn(35 SECONDS)
		ISay("Что с кораблём?")

/mob/living/simple_animal/cutscene_character/naia/s2ep1/part2_1/do_stuff()
	spawn(1.5 SECONDS)
		ISay("Ты всегда так мог?")

	spawn(3 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(6.5 SECONDS)
		ISay("!усмехается.")

	spawn(8 SECONDS)
		ISay("Даже не знаю, радоваться ли мне тому, что я для тебя недостаточная проблема...")
		forceMove(get_step(src, WEST))

	spawn(9 SECONDS)
		dir = SOUTH
		forceMove(get_step(src, SOUTH))

	spawn(10 SECONDS)
		dir = WEST
		forceMove(get_step(src, WEST))

	spawn(11 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(12 SECONDS)
		ISay("...или обижаться на то, что ты недооцениваешь мои способности.")
		forceMove(get_step(src, WEST))

	spawn(13 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(14 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(15 SECONDS)
		dir = SOUTH

	spawn(17 SECONDS)
		forceMove(get_step(src, SOUTH))

	spawn(18 SECONDS)
		forceMove(get_step(src, SOUTH))

	spawn(18.5 SECONDS)
		dir = WEST

	spawn(18.8 SECONDS)
		animate(src, pixel_x = -15, 0.5 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
		animate(src, pixel_y = -10, 0.5 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

	spawn(19 SECONDS)
		ISay("Эй, железный дровосек, ты ещё с нами?")

	spawn(19.5 SECONDS)
		ISay("!слегка трясёт ИПСа за плечо.")

	spawn(21.5 SECONDS)
		dir = SOUTH
		ISay("Твою-то!")
		animate(src, pixel_y = 10, 0.5 SECONDS, easing = JUMP_EASING|EASE_IN)

	spawn(24 SECONDS)
		dir = EAST

	spawn(26 SECONDS)
		dir = SOUTH

	spawn(26.5 SECONDS)
		dir = WEST

	spawn(30 SECONDS)
		ISay("Хотя бы вид красивый.")

	spawn(37 SECONDS)
		ISay("!ворчливо закатила глаза.")

	spawn(37.5 SECONDS)
		animate(src, pixel_x = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
		animate(src, pixel_y = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
		forceMove(get_step(src, WEST))

	spawn(39 SECONDS)
		forceMove(get_step(src, SOUTH))

	spawn(40 SECONDS)
		icon_state = "Naia 3"
		animate(src, pixel_x = -15, 0.5 SECONDS, easing = SINE_EASING|EASE_OUT)
		ISay("Я ожидала услышать ответ от тебя, мистер-мои-щупальца-везде-успеют.")
		ISay("!щёлкает по клавишам.")

	spawn(44 SECONDS)
		ISay("Мостик инженерному отсеку. Каз? Ампер?")

	spawn(46 SECONDS)
		ISay("На частоте кто-нибудь есть?")

	spawn(56 SECONDS)
		ISay("У меня здесь корабль по швам трещит, а его штурман решил прикурнуть.")

	spawn(60 SECONDS)
		ISay("Я делаю всё что в моих силах, чтобы мы не пошли с ним ко дну.")

	spawn(64 SECONDS)
		ISay("У нас есть шансы доковылять хотя бы до берега?")

/mob/living/simple_animal/cutscene_character/swift/s2ep1/part2_1/do_stuff()
	spawn(20 SECONDS)
		animate(src, 1 SECONDS, transform = matrix(90, MATRIX_ROTATE), easing = BACK_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(src, pixel_y = -15, 1 SECONDS, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)

	spawn(20.5 SECONDS)
		icon_state = "S.W.I.F.T 4"

/mob/living/simple_animal/cutscene_character/naia/s2ep1/part2_2/do_stuff()
	ISay("Да не молчите же вы, как убитые!")

	spawn(1 SECOND)
		ISay("Пауль!")

/mob/living/simple_animal/cutscene_character/kz/s2ep1/part2_2/do_stuff()
	spawn(2 SECONDS)
		ISay("!нервно протягивает трубку мужчине.")

/mob/living/simple_animal/cutscene_character/amper/s2ep1/part2_2/do_stuff()
	ISay("!сплёвывает кровь.")

	spawn(4 SECONDS)
		ISay("!хрипит.")
		ISay("...здесь я.")

	spawn(6 SECONDS)
		ISay("!кашляет.")
		ISay("Чего разоралась?")

/mob/living/simple_animal/cutscene_character/amper/s2ep1/part2_1/do_stuff()

	spawn(68 SECONDS)
		ISay("!болезненно смеётся.")
