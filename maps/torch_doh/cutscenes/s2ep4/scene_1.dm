/obj/effect/cutscene_camera/s2ep4sc1
	camera_id = "Сцена 4-1 - Кадр 1"

/proc/fds2ep4_cutscene1()
	start_cutscene(/datum/modular_cutscene/s2ep4sc1)

/datum/modular_cutscene/s2ep4sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 4 SECONDS,
		MOVE_CAMERA(0, -6, 0, null),
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Сцена 4-1 - Кадр 1"),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 40), null),
		MOVE_CAMERA(0, 0, 4 SECONDS, LINEAR_EASING|EASE_IN),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Райфлер - 4-1-1"), "Значит, ситуация снаружи не сильно краше чем здесь...") = 6 SECONDS,
		TALK_ACTOR(actor("Канарис - 4-1-1"), "!молча кивает, поглядывая в сторону.") = 4 SECONDS,
		TALK_ACTOR(actor("Канарис - 4-1-1"), "И если у вас в кармане не звалялось лишней флотилии -") = 1 SECONDS,
		TURN_ACTOR(actor("Канарис - 4-1-1"), SOUTH) = 3 SECONDS,
		TALK_ACTOR(actor("Канарис - 4-1-1"), "- боюсь что эта ваша...") = 2 SECONDS,
		TURN_ACTOR(actor("Райфлер - 4-1-1"), EAST),
		TURN_ACTOR(actor("Року - 4-1-1"), NORTH),
		TALK_ACTOR(actor("Року - 4-1-1"), "Терра.") = 2 SECONDS,

		TALK_ACTOR(actor("Уфу - 4-1-1"), "!принюхивается к девушке."),
		TURN_ACTOR(actor("Уфу - 4-1-1"), EAST),

		TALK_ACTOR(actor("Канарис - 4-1-1"), "Ага...") = 1 SECONDS,
		TURN_ACTOR(actor("Райфлер - 4-1-1"), NORTH),
		TALK_ACTOR(actor("Канарис - 4-1-1"), "Короче, не уверен что она настолько же большая проблема в перспективе.") = 2 SECONDS,

		SHIFT_ACTOR(actor("Амелия - 4-1-1"), 5, 37, 1 SECONDS, LINEAR_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Амелия - 4-1-1"), "!слегка отодвигается от ассашита.") = 1 SECONDS,
		TURN_ACTOR(actor("Люк - 4-1-1"), WEST) = 1 SECONDS,
		TALK_ACTOR(actor("Уфу - 4-1-1"), "!недовольно дёргает усами.") = 4 SECONDS,
		TALK_ACTOR(actor("Уфу - 4-1-1"), "Уши есть...но выглядит как человек..."),

		TALK_ACTOR(actor("Канарис - 4-1-1"), "Во всяком случае, небольшое обезвоживание от задротства в лигу двадцать четыре на семь звучит не так страшно, как перспектива вполне реальной и крайне болезненной смерти.") = 7.5 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 40), null),

		TALK_ACTOR(actor("Люк - 4-1-1"), "!начинает повторять за ассашитом.") = 0.5 SECONDS,
		SHIFT_ACTOR(actor("Амелия - 4-1-1"), -10, 37, 1 SECONDS, SINE_EASING|EASE_IN, null),
		TURN_ACTOR(actor("Амелия - 4-1-1"), EAST),

		PLAY_SOUND(sound('mods/emote_panel/sound/sigh_female.ogg', volume = 30), null),
		TALK_ACTOR(actor("Райфлер - 4-1-1"), "!вздыхает.") = 2 SECONDS,

		TALK_ACTOR(actor("Люк - 4-1-1"), "...и пахнет как человек.") = 1 SECONDS,

		TALK_ACTOR(actor("Райфлер - 4-1-1"), "...ты совсем на него не похож.") = 6 SECONDS,
		TALK_ACTOR(actor("Райфлер - 4-1-1"), "!скрестила руки на груди."),
		TALK_ACTOR(actor("Райфлер - 4-1-1"), "Всё ещё не понимаю, как подобное в принципе возможно.") = 2 SECONDS,
		TURN_ACTOR(actor("Райфлер - 4-1-1"), EAST),

		TALK_ACTOR(actor("Амелия - 4-1-1"), "!прижала уши, чуть шипя."),
		TALK_ACTOR(actor("Амелия - 4-1-1"), "Может, ещё проверите есть ли у меня хвост?") = 2 SECONDS,

		TALK_ACTOR(actor("Райфлер - 4-1-1"), "Року, как специалист. Вам приходилось...") = 4 SECONDS,
		TURN_ACTOR(actor("Року - 4-1-1"), WEST),
		TALK_ACTOR(actor("Року - 4-1-1"), "Сталкиваться с подобным?") = 4 SECONDS,
		TURN_ACTOR(actor("Канарис - 4-1-1"), EAST),
		TALK_ACTOR(actor("Року - 4-1-1"), "!пожимает плечами.") = 2 SECONDS,
		TALK_ACTOR(actor("Року - 4-1-1"), "Даже при цивилизации никто не мог дать точное определение тому, как блюспейс функционирует. Теперь же - мы в целом на вряд ли об этом узнаем.") = 8 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 40), null),

		TALK_ACTOR(actor("Року - 4-1-1"), "Ну, точнее будет сказать, что совершить это открытие доведётся точно не нашему поколению.") = 6 SECONDS,
		TALK_ACTOR(actor("Року - 4-1-1"), "!заправила руки в карманы."),
		TALK_ACTOR(actor("Року - 4-1-1"), "Бытовала теория о том, что мы вовсе не перемещаемся вперёд во времени, а попросту меняем вселенную на ту, что больше всего совпадает с нашей по параметрам, но появилась позже или напротив раньше.") = 10 SECONDS,
		TALK_ACTOR(actor("Року - 4-1-1"), "Однако это создаёт только больше вопросов, так что-о...") = 4 SECONDS,
		TALK_ACTOR(actor("Райфлер - 4-1-1"), "Окей, спасибо, этого достаточно.") = 4 SECONDS,
		TALK_ACTOR(actor("Райфлер - 4-1-1"), "Боюсь, ещё немного, и мой котелок точно закипит...") = 2 SECONDS,
		TURN_ACTOR(actor("Райфлер - 4-1-1"), WEST) = 1 SECONDS,
		MOVE_CAMERA(-2, 0, 3 SECONDS, CUBIC_EASING|EASE_OUT),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Райфлер - 4-1-1"), WEST) = 2 SECONDS,
		TURN_ACTOR(actor("Канарис - 4-1-1"), WEST),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Райфлер - 4-1-1"), WEST) = 2 SECONDS,
		TURN_ACTOR(actor("Райфлер - 4-1-1"), EAST) = 2 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 40), null),

		TALK_ACTOR(actor("Райфлер - 4-1-1"), "!сверлит мужчину взглядом.") = 4 SECONDS,
		TALK_ACTOR(actor("Канарис - 4-1-1"), "Послушай, я прекрасно понимаю твоё возможное разочарование, сметение...и не хочу сильно назидать, но...") = 6 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Эйс - 4-1-1"), WEST),
		TALK_ACTOR(actor("Эйс - 4-1-1"), "Мы точно должны отвечать на их вопросы?") = 4 SECONDS,
		TURN_ACTOR(actor("Канарис - 4-1-1"), EAST) = 2 SECONDS,
		TALK_ACTOR(actor("Эйс - 4-1-1"), "!поправляет ремень ружья."),
		TALK_ACTOR(actor("Эйс - 4-1-1"), "Оружие здесь, всё-таки, у нас, приятель. Не нужно на меня так смотреть.") = 6 SECONDS,
		TALK_ACTOR(actor("Райфлер - 4-1-1"), "Хватит, Эйс, они и мухи не обидят.") = 2 SECONDS,
		TURN_ACTOR(actor("Эйс - 4-1-1"), SOUTH),
		TALK_ACTOR(actor("Эйс - 4-1-1"), "!разводит руки в стороны."),
		MOVE_ACTOR(actor("Эйс - 4-1-1"), EAST) = 1 SECONDS,
		TURN_ACTOR(actor("Эйс - 4-1-1"), WEST),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid3.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Райфлер - 4-1-1"), EAST) = 1 SECONDS,
		TALK_ACTOR(actor("Райфлер - 4-1-1"), "Уговор - есть уговор. Что вы хотите знать?") = 6 SECONDS,
		TURN_ACTOR(actor("Канарис - 4-1-1"), WEST),
		TALK_ACTOR(actor("Канарис - 4-1-1"), "Перед тем как вы поймали нас...в этом направлении ушло ещё трое.") = 6 SECONDS,
		TALK_ACTOR(actor("Канарис - 4-1-1"), "Ужасно хмурая блондинка, робот на инвалидной коляске, и Реймонд. Его ты должна помнить, если наши миры различаются не настолько сильно.") = 10 SECONDS,
		TALK_ACTOR(actor("Райфлер - 4-1-1"), "Надоедливый синеволосый адапт, кативший яйца к барменше? Сложно забыть.") = 6 SECONDS,
		TALK_ACTOR(actor("Райфлер - 4-1-1"), "Он тоже здесь?") = 4 SECONDS,
		TURN_ACTOR(actor("Канарис - 4-1-1"), NORTH),
		TALK_ACTOR(actor("Канарис - 4-1-1"), "Просто прекрасно...") = 2 SECONDS,
		TALK_ACTOR(actor("Райфлер - 4-1-1"), "Хотя...это не так важно, в чём вопрос-то?") = 6 SECONDS,
		TURN_ACTOR(actor("Канарис - 4-1-1"), EAST),
		TALK_ACTOR(actor("Канарис - 4-1-1"), "Проехали. Ответ я уже услышал.") = 2 SECONDS,
		TURN_ACTOR(actor("Павел - 4-1-1"), SOUTH),
		TURN_ACTOR(actor("Линч - 4-1-1"), WEST) = 2 SECONDS,
		TALK_ACTOR(actor("Павел - 4-1-1"), "!вопросительно крутит пальцем у виска.") = 2 SECONDS,
		TALK_ACTOR(actor("Канарис - 4-1-1"), "Фиддлер будет просто в восторге..."),
		ADD_SCREEN(/blackout) = 4 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc1)
	)
