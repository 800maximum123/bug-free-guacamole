/singleton/psionic_faculty/consciousness
	id = PSI_CONSCIOUSNESS
	name = "Allaxetia"
	associated_intent = I_HELP
	armour_types = list(DAMAGE_PSIONIC)

/singleton/psionic_power/consciousness
	faculty = PSI_CONSCIOUSNESS
	abstract_type = /singleton/psionic_power/consciousness

/singleton/psionic_power/consciousness/invoke(mob/living/user, mob/living/target)
	. = ..()
	if (!.)
		return FALSE

	if(!isliving(target)) // No more Telepathy with doors :(
		return FALSE

	if (!istype(target))
		to_chat(user, SPAN_WARNING("Вы не можете пробиться в сознание [target]."))
		return FALSE

	if(. && target.deflect_psionic_attack(user) && target != user)
		return FALSE

/singleton/psionic_power/consciousness/telepathy
	name =            "Telepathy"
	cost =            2
	cooldown =        50
	use_ranged =     TRUE
	use_melee =     TRUE
	min_rank =        PSI_RANK_APPRENTICE
	use_description = "Выберите рот на зелёном интенте, и затем нажмите по цели с любого расстояния, чтобы установить с ней ментальную связь."

/mob/living
	var/space = 0
	var/linked_soul

/mob/living/proc/ContactSoulmate()
	set name     = "Contact your friend"
	set category = "Psionics"

	if (!linked_soul)
		return

	var/phrase =  input(usr, "Что вы хотите сказать?", "Связаться", "Ты меня слышишь?") as null|text
	if(!phrase || usr.incapacitated())
		return FALSE

	to_chat(usr, SPAN_NOTICE("<b>Вы пытаетесь установить контакт с сознанием [linked_soul], дабы донести до него следующее: <i>[phrase]</i></b>"))
	to_chat(linked_soul, SPAN_OCCULT("<b>Вы слышите отчётливый голос [usr] в своей голове, он говорит вам: <i>[phrase]</i></b>"))
	log_and_message_admins(SPAN_OCCULT("<b> \[ALLAXETIA | PsyBound \] [usr] говорит [linked_soul]: <i>[phrase]</i></b>"))
	var/option =  alert(linked_soul, "Вы хотите ответить этому зову?", "Обратная связь", "Да", "Нет")
	switch(option)
		if("Да")
			var/answer =  input(linked_soul, "Что вы хотите передать в ответ?", "Связаться", "...") as null|text
			to_chat(usr, SPAN_OCCULT("<b>[linked_soul] отвечает вам: <i>[answer]</i></b>"))
			log_and_message_admins(SPAN_OCCULT("<b> \[ALLAXETIA | PsyBound \] [linked_soul] говорит [usr]: <i>[answer]</i></b>"))
		else
			return

/singleton/psionic_power/consciousness/telepathy/invoke(mob/living/user, mob/living/target)
	if(user.zone_sel.selecting != BP_MOUTH || user.a_intent != I_HELP || target == user)
		return FALSE
	. = ..()
	if(.)
		if(target.stat == DEAD || (target.status_flags & FAKEDEATH) || !target.client)
			to_chat(user, SPAN_WARNING("[target] не в состоянии ответить вам. Его мозг погрузился в вечный сон."))
			return FALSE

		if(user.psi.get_rank(PSI_CONSCIOUSNESS) >= PSI_RANK_MASTER && target != user)
			var/option = input(user, "Связь!", "Что вы хотите сделать?") in list("Поговорить", "Привязать", "Отвязать")
			if (!option)
				return
			if(option == "Привязать")
				if(user.space >= 1)
					to_chat(user, SPAN_NOTICE("<b>Вы не можете поддерживать столь личную связь с более чем одним человеком! Это неправильно!</b>"))
					return 0
				var/answer = alert(target, "[user] пытается связать ваши разумы воедино. Вы позволите ему сделать это?", "Слияние", "Да", "Нет")
				switch(answer)
					if("Да")
						user.linked_soul = target
						user.space = 1
						user.verbs += /mob/living/proc/ContactSoulmate
						to_chat(user, SPAN_NOTICE("<b>Вы ощущаете, как ваше сознание становится единым целым с сознанием [target]</b>"))
						log_and_message_admins("<b> \[ALLAXETIA | PsyBound \] [user] соединил свой разум с [target]]")
						return 0
					else
						to_chat(user, SPAN_NOTICE("<b>[target] отказался от вашего предложения.</b>"))
						return 0
			if(option == "Отвязать")
				if(user.linked_soul == target)
					user.verbs -= /mob/living/proc/ContactSoulmate
					user.linked_soul = null
					user.space = 0
					to_chat(user, SPAN_NOTICE("<b>Вы раз и навсегда рвёте ваши узы с [target]!</b>"))
					to_chat(target, SPAN_WARNING("Вы ощущаете странную потерю..."))
					log_and_message_admins("<b> \[ALLAXETIA | PsyBound \] [user] разорвал узы своего разума с [target]]")
					return 0
				else
					to_chat(user, SPAN_NOTICE("<b>У вас нет никаких уз с [target]!</b>"))
			if(option == "Поговорить")

	///Yes. And no, i don't know how to do it better///

				var/phrase =  input(user, "Что вы хотите сказать?", "Связаться", "Ты меня слышишь?") as null|text
				if(!phrase || user.incapacitated() || !do_after(user, 40 / user.psi.get_rank(PSI_CONSCIOUSNESS)))
					return 0

				var/con_rank_user = user.psi.get_rank(PSI_CONSCIOUSNESS)
				to_chat(user, SPAN_NOTICE("<b>Вы пытаетесь установить контакт с сознанием [target], дабы донести до него следующее: <i>[phrase]</i></b>"))
				log_and_message_admins(SPAN_OCCULT("<b> \[ALLAXETIA | Telepathy \] [user] говорит [target]: <i>[phrase]</i></b>"))
				if(target.psi)
					var/con_rank_target = target.psi.get_rank(PSI_CONSCIOUSNESS)
					if(con_rank_target >= con_rank_user)
						to_chat(target, SPAN_OCCULT("<b>Вы слышите отчётливый голос [user] в своей голове, он говорит вам: <i>[phrase]</i></b>"))
					if(con_rank_target > con_rank_user)
						var/what =  alert(target, "Вы хотите ответить этому зову?", "Обратная связь", "Да", "Нет")
						switch(what)
							if("Да")
								var/answer =  input(user, "Что вы хотите передать в ответ?", "Связаться", "...") as null|text
								to_chat(user, SPAN_OCCULT("<b>[target] отвечает вам: <i>[answer]</i></b>"))
								log_and_message_admins(SPAN_OCCULT("<b> \[ALLAXETIA | Telepathy \] [target] отвечает [user]: <i>[phrase]</i></b>"))
							else
								return 0
					else
						to_chat(target, SPAN_OCCULT("<b>Вы слышите чей-то отдалённый голос в своей голове, больше напоминающий шёпот...голос говорит вам: <i>[phrase]</i></b>"))
				else if(!target.psi)
					to_chat(target, SPAN_OCCULT("<b>Вы слышите чей-то отдалённый голос в своей голове, больше напоминающий шёпот...голос говорит вам: <i>[phrase]</i></b>"))
				return 1

	/// ///

		var/phrase =  input(user, "Что вы хотите сказать?", "Связаться", "Ты меня слышишь?") as null|text
		if(!phrase || user.incapacitated() || !do_after(user, 40 / user.psi.get_rank(PSI_CONSCIOUSNESS)))
			return FALSE

		var/con_rank_user = user.psi.get_rank(PSI_CONSCIOUSNESS)
		to_chat(user, SPAN_NOTICE("<b>Вы пытаетесь установить контакт с сознанием [target], дабы донести до него следующее: <i>[phrase]</i></b>"))
		log_and_message_admins(SPAN_OCCULT("<b> \[ALLAXETIA | Telepathy \] [user] говорит [target]: <i>[phrase]</i></b>"))
		if(target.psi)
			var/con_rank_target = target.psi.get_rank(PSI_CONSCIOUSNESS)
			if(con_rank_target >= con_rank_user)
				to_chat(target, SPAN_OCCULT("<b>Вы слышите отчётливый голос [user] в своей голове, он говорит вам: <i>[phrase]</i></b>"))
				if(con_rank_target > con_rank_user)
					var/option =  alert(target, "Вы хотите ответить этому зову?", "Обратная связь", "Да", "Нет")
					switch(option)
						if("Да")
							var/answer =  input(target, "Что вы хотите передать в ответ?", "Связаться", "...") as null|text
							to_chat(user, SPAN_OCCULT("<b>[target] отвечает вам: <i>[answer]</i></b>"))
							log_and_message_admins(SPAN_OCCULT("<b> \[ALLAXETIA | Telepathy \] [target] отвечает [user]: <i>[phrase]</i></b>"))
						else
							return
			else
				to_chat(target, SPAN_OCCULT("<b>Вы слышите чей-то отдалённый голос в своей голове, больше напоминающий шёпот...голос говорит вам: <i>[phrase]</i></b>"))
		else if(!target.psi)
			to_chat(target, SPAN_OCCULT("<b>Вы слышите чей-то отдалённый голос в своей голове, больше напоминающий шёпот...голос говорит вам: <i>[phrase]</i></b>"))
		return TRUE


/singleton/psionic_power/consciousness/mindread
	name =            "Read Mind"
	cost =            6
	cooldown =        80
	use_ranged =     TRUE
	use_melee =     TRUE
	min_rank =        PSI_RANK_APPRENTICE
	use_description = "Выберите голову на зелёном интенте и затем нажмите по цели находясь на любом расстоянии, чтобы попытаться прочитать его мысли."

/singleton/psionic_power/consciousness/mindread/invoke(mob/living/user, mob/living/target)
	if(user.zone_sel.selecting != BP_HEAD || user.a_intent != I_HELP || target == user)
		return FALSE
	. = ..()
	if(.)

		if(target.stat == DEAD || (target.status_flags & FAKEDEATH) || !target.client)
			to_chat(user, SPAN_WARNING("[target] не в состоянии ответить вам. Его мозг погрузился в вечный сон."))
			return FALSE

		var/question =  input(user, "Что вы хотите сказать?", "Чтение мыслей", "Идеи?") as null|text
		if(!question || user.incapacitated() || !do_after(user, 40 / user.psi.get_rank(PSI_CONSCIOUSNESS)))
			return FALSE

		var/con_rank_user = user.psi.get_rank(PSI_CONSCIOUSNESS)
		var/started_mindread = world.time
		to_chat(user, SPAN_NOTICE("<b>Вы погружаетесь в глубины сознания [target], ища ответ на вопрос: <i>[question]</i></b>"))
		log_and_message_admins(SPAN_OCCULT("<b> \[ALLAXETIA | Read Mind \] [user] читает разум [target], ища ответ на вопрос: <i>[question]</i></b>"))
		var/option = alert(target, "Кто-то пытается проникнуть в ваше сознание, дабы получить доступ к его воспоминаниям! Вы позволите этому случиться?", "Выбирай!", "Да", "Нет")
		if (!option)
			if(target.psi)
				var/con_rank_target = target.psi.get_rank(PSI_CONSCIOUSNESS)
				if(con_rank_target > con_rank_user)
					to_chat(user, SPAN_NOTICE("<b>[target]без каких-либо проблем блокирует ваши попытки узнать что-либо!</b>"))
					to_chat(target, SPAN_NOTICE("<b>Вы без проблем защитили свой разум от вторжения!</b>"))
					return
				else
					target.adjustBrainLoss(25)
					to_chat(user, SPAN_NOTICE("<b>[target] удаётся предотвратить ваше проникновение, но часть его мозга была повреждена в процессе!</b>"))
					to_chat(target, SPAN_NOTICE("<b>Вам удаётся защитить свои воспоминания, но ваше сопротивление повлекло за собой куда больше проблем. Ваша голова просто раскалывается.</b>"))
					return
			else if(!target.psi)
				target.adjustBrainLoss(25)
				to_chat(user, SPAN_NOTICE("<b>[target] удаётся предотвратить ваше проникновение, но часть его мозга была повреждена в процессе!</b>"))
				to_chat(target, SPAN_NOTICE("<b>Вам удаётся защитить свои воспоминания, но ваше сопротивление повлекло за собой куда больше проблем. Ваша голова просто раскалывается.</b>"))
				return
			log_and_message_admins(SPAN_OCCULT("<b> \[ALLAXETIA | Read Mind \] [user] встретил сопротивление со стороны [target]!</b>"))
		if(option == "Yes")
			to_chat(target, SPAN_NOTICE("<b>Некто пытается получить ответ на вопрос: <i>[question]</i></b>"))
		if(option == "No")
			if(target.psi)
				var/con_rank_target = target.psi.get_rank(PSI_CONSCIOUSNESS)
				if(con_rank_target > con_rank_user)
					to_chat(user, SPAN_NOTICE("<b>[target]без каких-либо проблем блокирует ваши попытки узнать что-либо!</b>"))
					to_chat(target, SPAN_NOTICE("<b>Вы без проблем защитили свой разум от вторжения!</b>"))
					return
				else
					target.adjustBrainLoss(25)
					to_chat(user, SPAN_NOTICE("<b>[target] удаётся предотвратить ваше проникновение, но часть его мозга была повреждена в процессе!</b>"))
					to_chat(target, SPAN_NOTICE("<b>Вам удаётся защитить свои воспоминания, но ваше сопротивление повлекло за собой куда больше проблем. Ваша голова просто раскалывается.</b>"))
					return
			else if(!target.psi)
				target.adjustBrainLoss(25)
				to_chat(user, SPAN_NOTICE("<b>[target] удаётся предотвратить ваше проникновение, но часть его мозга была повреждена в процессе!</b>"))
				to_chat(target, SPAN_NOTICE("<b>Вам удаётся защитить свои воспоминания, но ваше сопротивление повлекло за собой куда больше проблем. Ваша голова просто раскалывается.</b>"))
				return
			log_and_message_admins(SPAN_OCCULT("<b> \[ALLAXETIA | Read Mind \] [user] встретил сопротивление со стороны [target]!</b>"))


		var/answer =  input(target, question, "Чтение мыслей") as null|text
		if(!answer || world.time > started_mindread + 60 SECONDS || user.stat != CONSCIOUS || target.stat == DEAD)
			to_chat(user, SPAN_NOTICE("<b>Вам не удалось добиться чего-либо полезного от [target].</b>"))
			log_and_message_admins(SPAN_OCCULT("<b> \[ALLAXETIA | Read Mind \] [user] не получил ответов от [target]!</b>"))
		else
			to_chat(user, SPAN_NOTICE("<b>В поисках ответов в голове [target], вы нахоите следующее: <i>[answer]</i></b>"))
		log_and_message_admins(SPAN_OCCULT("<b> \[ALLAXETIA | Read Mind \] [user] нашел в разуме [target] ответ: <i>[answer]</i></b>"))
//		msg_admin_attack("[key_name(user)] использует чтение мыслей на [key_name(target)] с вопросом \"[question]\" и [answer?"следующим ответом \"[answer]\".":"не получил никакого ответа."]")
		return TRUE

/singleton/psionic_power/consciousness/focus
	name =          "Focus"
	cost =          10
	cooldown =      80
	use_grab =     TRUE
	min_rank =      PSI_RANK_APPRENTICE
	use_description = "Схватите цель, затем выберите рот на зелёном интенте и нажмите по ней захватом ещё раз, дабы частично очистить её сознание от возможного урона."

/singleton/psionic_power/consciousness/focus/invoke(mob/living/user, mob/living/target)
	if(user.zone_sel.selecting != BP_MOUTH || user.a_intent != I_HELP)
		return FALSE
	. = ..()
	if(.)
		user.visible_message(SPAN_WARNING("[user] целует [target] в лоб..."))
		to_chat(user, SPAN_NOTICE("Вы проверяете разум [target] на наличие повреждений..."))
		to_chat(target, SPAN_WARNING("Вы ощущаете, как ваш разум очищается, становясь яснее."))
		if(!do_after(user, (target.stat == CONSCIOUS ? 50 : 25), target))
			user.psi.backblast(rand(5,10))
			return TRUE
		to_chat(user, SPAN_WARNING("Вы полностью очистили сознание [target] от проблем и ран."))
		to_chat(target, SPAN_WARNING("Вы ощущаете полную ясность мыслей. Словно стали новым человеком."))

		var/coercion_rank = user.psi.get_rank(PSI_COERCION)
		if(coercion_rank > PSI_RANK_APPRENTICE)
			target.AdjustParalysis(-1)
		target.drowsyness = 0
		if(istype(target, /mob/living/carbon))
			var/mob/living/carbon/M = target
			M.adjust_hallucination(-30)
			M.adjustBrainLoss(-rand(20,35))
		return TRUE

/singleton/psionic_power/consciousness/assay
	name =            "Assay"
	cost =            15
	cooldown =        100
	use_grab =        TRUE
	min_rank =        PSI_RANK_APPRENTICE
	use_description = "Схватите цель, затем выберите голову и зелёном интент. После этого, нажмите по цели захватом, чтобы погрузится в глубины её разума и отыскать там скрытый потенциал."

/singleton/psionic_power/consciousness/assay/invoke(mob/living/user, mob/living/target)
	if(user.zone_sel.selecting != BP_HEAD || user.a_intent != I_HELP)
		return FALSE
	. = ..()
	if(.)
		user.visible_message(SPAN_WARNING("[user] обхватывает голову [target] обеими руками..."))
		to_chat(user, SPAN_NOTICE("Вы погружаетесь в глубины сознания [target]..."))
		to_chat(target, SPAN_WARNING("Вы ощущаете, как [user] копается в вашем подсознании, что-то выискивая."))
		if(!do_after(user, (target.stat == CONSCIOUS ? 50 : 25), target))
			user.psi.backblast(rand(5,10))
			return TRUE
		to_chat(user, SPAN_NOTICE("Вы покидаете разум [target], получив желаемое."))
		to_chat(target, SPAN_DANGER("[user] наконец покидает ваше сознание, узнав желаемое."))
		target.show_psi_assay(user)

		log_and_message_admins(SPAN_OCCULT("\[ALLAXETIA | Assay \] [user] ищет Пси-Потенциал в разуме [target]"))
		return TRUE

/singleton/psionic_power/consciousness/absorb
	name =            "Absorption"
	cost =            10
	cooldown =        40
	use_ranged =     TRUE
	use_melee =     TRUE
	min_rank =        PSI_RANK_APPRENTICE
	use_description = "Выберите верхнюю часть тела на зелёном интенте, и затем нажмите по цели с любого расстояния, чтобы попытаться поглатить часть его псионической силы."

/singleton/psionic_power/consciousness/absorb/invoke(mob/living/user, mob/living/target)
	var/con_rank_user = user.psi.get_rank(PSI_CONSCIOUSNESS)
	if(user.zone_sel.selecting != BP_CHEST || user.a_intent != I_HELP)
		return FALSE
	. = ..()
	if(.)
		if(target == user)
			to_chat(user, "<span class='warning'>Вы не можете применить эту способность на себе!</span>")
			return 0
		if(target.psi)
			var/con_rank_target = target.psi.get_rank(PSI_CONSCIOUSNESS)
			log_and_message_admins(SPAN_DANGER("<b> \[ALLAXETIA | Absorb \] [user] атакует разум [target]!</b>"))
			if(con_rank_user > con_rank_target)
				sound_to(user, 'sound/effects/psi/power_fail.ogg')
				if(prob(30))
					to_chat(user, SPAN_DANGER("Вы попытались проникнуть в разум [target], но тот ловко ускользнул из под вашего воздействия."))
					to_chat(target, SPAN_WARNING("Не важно как, но вы чудом избежали губительного воздействия [user] на ваш разум."))
					return 0
				to_chat(user, SPAN_NOTICE("Вы с лёгкостью разбили защиту [target], забрав часть его сил себе."))
				to_chat(target, SPAN_DANGER("Вы ощущаете сильную головную боль, пока [user] пристально сверлит вас взглядом. Ваше тело ослабевает..."))
				target.adjustBrainLoss(20)
				user.psi.stamina = min(user.psi.max_stamina, user.psi.stamina + rand(25,30))
				target.psi.spend_power(rand(15,25))
			if(con_rank_user == con_rank_target)
				sound_to(user, 'sound/effects/psi/power_fail.ogg')
				if(prob(50))
					to_chat(user, SPAN_WARNING("Вы попытались проникнуть в разум [target], но в ходе битвы сами получаете значительный урон!"))
					to_chat(target, SPAN_DANGER("Вы что есть силы пытались отбить атаки [user] на ваш разум, но в конечном счёте всё равно проиграли. По-крайней мере, ему тоже досталось."))
					user.psi.stamina = min(user.psi.max_stamina, user.psi.stamina + rand(10,20))
					target.psi.spend_power(rand(10,20))
					user.adjustBrainLoss(20)
					target.adjustBrainLoss(20)
					user.emote("scream")
					target.emote("scream")
					return 0
				to_chat(user, SPAN_WARNING("Вы с лёгкостью разбили защиту [target], забрав часть его сил себе."))
				to_chat(target, SPAN_DANGER("Вы ощущаете сильную головную боль, пока [user] пристально сверлит вас взглядом. Ваше тело ослабевает..."))
				target.adjustBrainLoss(20)
				user.psi.stamina = min(user.psi.max_stamina, user.psi.stamina + rand(25,30))
				target.psi.spend_power(rand(15,25))
			if(con_rank_user < con_rank_target)
				sound_to(user, 'sound/effects/psi/power_fail.ogg')
				if(prob(30))
					to_chat(user, SPAN_WARNING("Каким-то чудом, но вам удалось пробиться через псионическую завесу [target]!"))
					to_chat(target, SPAN_DANGER("Вопреки всякой логике и здравому смыслу, [user] пробился в ваш разум чистой, грубой силой, нанеся в процессе значительный урон."))
					target.adjustBrainLoss(20)
					user.psi.stamina = min(user.psi.max_stamina, user.psi.stamina + rand(30,45))
					target.psi.spend_power(35)
					return 0
				to_chat(user, SPAN_DANGER("Вы пытаетесь пробиться через барьер [target], но встречаете серьёзное сопротивление!"))
				to_chat(target, SPAN_NOTICE("[user] только что попытался пробиться в ваше сознание...к его сожалению - безуспешно."))
				user.emote("scream")
				user.adjustBrainLoss(30)
				user.psi.spend_power(50)
		else
			to_chat(user, SPAN_NOTICE("Вы не обнаружили у [target] каких-либо псионических способностей для подпитки."))
			return 0

/singleton/psionic_power/consciousness/invis
	name =            "Invisibility"
	cost =            50
	cooldown =        50
	use_ranged =     TRUE
	use_melee =     TRUE
	min_rank =        PSI_RANK_OPERANT
	use_description = "Выберите глаза на зелёном интенте, и затем нажмите по себе или другому человеку(начиная с мастера), чтобы временно сделать его или себя невидимым для остальных."

/mob/living/proc/reset_invisibility()
	if(alpha != 255)
		animate(src, alpha = 255, time = 0.5 SECONDS, easing = SINE_EASING|EASE_OUT)

	if(simple_combat_on)
		if(get_status_effect(/datum/simple_status/invisibility))
			remove_status_effect(/datum/simple_status/invisibility)

/singleton/psionic_power/consciousness/invis/invoke(mob/living/user, mob/living/target)
	var/con_rank_user = user.psi.get_rank(PSI_CONSCIOUSNESS)
	if(user.zone_sel.selecting != BP_EYES || user.a_intent != I_HELP)
		return FALSE

	if (!istype(target))
		to_chat(user, SPAN_WARNING("Вы не можете сделать [target] невидимым."))
		return FALSE

	if(istype(target, /mob/living/carbon) && target != user && con_rank_user >= PSI_RANK_MASTER)
		if(do_after(user, 30))
			log_and_message_admins("<b> \[ALLAXETIA | Invis \] [user] сделал невидимым [target]!</b>")
			user.visible_message(SPAN_WARNING("[user] касается [target] и тот исчезает на глазах!"))
			animate(target, alpha = 10, time = 0.5 SECONDS, easing = SINE_EASING|EASE_IN)
			if(target.simple_combat_on)
				target.add_status_effect(/datum/simple_status/invisibility)
			addtimer(new Callback(target, TYPE_PROC_REF(/mob/living, reset_invisibility)), 60*con_rank_user)
			return TRUE

	if(target == user)
		user.visible_message(SPAN_WARNING("[user] исчезает у всех на глазах!"))
		animate(user, alpha = 10, time = 0.5 SECONDS, easing = SINE_EASING|EASE_IN)
		if(user.simple_combat_on)
			user.add_status_effect(/datum/simple_status/invisibility)
		addtimer(new Callback(user, TYPE_PROC_REF(/mob/living, reset_invisibility)), 120*con_rank_user)
		return TRUE

/singleton/psionic_power/consciousness/invis_tele
	name =            "Invisibility Teleport"
	cost =            80
	cooldown =        50
	use_ranged =     TRUE
	min_rank =        PSI_RANK_MASTER
	use_description = "Выберите пятку на зелёном интенте, и затем нажмите по любому тайлу, чтобы переместиться туда. РАБОТАЕТ ТОЛЬКО В НЕВИДИМОСТИ!"

/singleton/psionic_power/consciousness/invis_tele/invoke(mob/living/user, turf/simulated/floor/target)
	var/target_part = user.zone_sel?.selecting
	if(!(target_part in BP_FEET_ONLY) || user.a_intent != I_HELP)
		return FALSE

	if(!istype(target))
		to_chat(user, SPAN_WARNING("Вы не можете переместиться туда."))
		return FALSE

	user.forceMove(target)
	return TRUE

/singleton/psionic_power/consciousness/curse
	name =            "Hallucinations"
	cost =            20
	cooldown =        50
	use_grab =        TRUE
	use_melee =     TRUE
	min_rank =        PSI_RANK_OPERANT
	use_description = "Схватите цель, затем выберите верхнюю часть тела на зелёном интент. После этого, нажмите по цели захватом, чтобы погрузить её в мир галлюцинаций."

/singleton/psionic_power/consciousness/curse/invoke(mob/living/user, mob/living/carbon/target)
	var/con_rank_user = user.psi.get_rank(PSI_CONSCIOUSNESS)
	if(user.zone_sel.selecting != BP_CHEST || user.a_intent != I_HELP)
		return FALSE
	if(target == user)
		return FALSE
	. = ..()
	if(.)
		log_and_message_admins(SPAN_DANGER("<b> \[ALLAXETIA | Hallucinations \] [user] вызвал галлюцинации у [target]!</b>"))
		new /obj/temporary(get_turf(target),8, 'icons/effects/effects.dmi', "eye_opening")
		playsound(target.loc, 'sound/hallucinations/far_noise.ogg', 15, 1)
		target.hallucination(rand(10,20) * con_rank_user, 100)

/singleton/psionic_power/consciousness/swap
	name =           "Shadow Swap"
	cost =           30
	cooldown =       100
	use_ranged =     TRUE
	min_rank =       PSI_RANK_MASTER
	use_description = "Выберите пятки или ноги на зелёном интенте. Затем, нажмите по цели на дистанции, чтобы незаметно обменяться с ней местами."

/singleton/psionic_power/consciousness/swap/invoke(mob/living/user, mob/living/target)
	var/cn_rank_user = user.psi.get_rank(PSI_CONSCIOUSNESS)

	if(!istype(target))
		return FALSE

	if(user.a_intent != I_HELP)
		return FALSE

	if(!(user.zone_sel.selecting in list(BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)))
		return FALSE

	. = ..()
	if(.)
		var/turf/target_turf = get_turf(target)
		var/turf/user_turf = get_turf(user)

		var/list/mobs = GLOB.alive_mobs + GLOB.dead_mobs
		for(var/mob/living/M in mobs)
			if(M == user)
				continue
			if(get_dist(user, M) > cn_rank_user)
				continue
			M.eye_blind = max(M.eye_blind,cn_rank_user)
		target.forceMove(user_turf)
		user.forceMove(target_turf)

		return TRUE

//This differs from how TG does it, they have a dedicated turf type for open turf, we have to check the density. Thanks Bay, always be special.
///Returns a list with all the adjacent open turfs. Clears the list of nulls in the end.
/proc/get_adjacent_open_turfs(atom/center)
	var/list/hand_back = list()
	// Inlined get_open_turf_in_dir, just to be fast
	var/turf/new_turf = get_step(center, NORTH)
	if(istype(new_turf) && !new_turf.density)
		hand_back += new_turf
	new_turf = get_step(center, SOUTH)
	if(istype(new_turf) && !new_turf.density)
		hand_back += new_turf
	new_turf = get_step(center, EAST)
	if(istype(new_turf) && !new_turf.density)
		hand_back += new_turf
	new_turf = get_step(center, WEST)
	if(istype(new_turf) && !new_turf.density)
		hand_back += new_turf
	return hand_back

/singleton/psionic_power/consciousness/copies
	name =            "Non-Existing Copies"
	cost =            50
	cooldown =        100
	use_melee =     TRUE
	min_rank =        PSI_RANK_OPERANT
	use_description = "Выберите рот на синем интенте, и затем нажмите по себе, чтобы создать сразу несколько копий самого себя."
	var/amount = 1

/singleton/psionic_power/consciousness/copies/invoke(mob/living/user, mob/living/carbon/human/target)
	var/con_rank_user = user.psi.get_rank(PSI_CONSCIOUSNESS)

	if(con_rank_user == PSI_RANK_OPERANT)
		amount = 3

	if(con_rank_user == PSI_RANK_MASTER)
		amount = 4

	if(con_rank_user == PSI_RANK_GRANDMASTER)
		amount = 6

	if(user.zone_sel.selecting != BP_MOUTH)
		return FALSE

	if(user.a_intent != I_DISARM)
		return FALSE

	if(target != user)
		return FALSE

	. = ..()
	if(.)
		var/list/options = list(
			"FREE FOR ALL" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "red"),
			"ALLIED" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "green")
		)
		var/chosen_option = show_radial_menu(user, user, options, radius = 25, require_near = TRUE)
		if (!chosen_option)
			return 0
		if(do_after(user, 10))
			log_and_message_admins(SPAN_DANGER("<b> \[ALLAXETIA | Copies \] [user] размножился на [amount] копий!</b>"))
			to_chat(user, SPAN_WARNING("Ты разделяешь своё подсознание на [amount] копий"))
			for(var/i = 1 to amount)
				var/mob/living/simple_animal/hostile/mirror_shade/MS = new(pick(get_adjacent_open_turfs(user)), user)
				MS.CopyOverlays(user, TRUE)
				MS.icon = null

				MS.alpha = user.alpha

				if(user.simple_combat_on)
					MS.simple_combat_on = TRUE

					for(var/datum/simple_status/effect in user.status_effects)
						if(!effect.positive_effect)
							continue
						MS.add_status_effect(effect)

				if(ishuman(user))
					var/mob/living/carbon/human/H = user
					var/obj/item/I = H.get_inactive_hand()
					if(I)

						if(istype(I,/obj/item/gun))
							var/obj/item/gun/G = I
							MS.ranged = TRUE
							MS.base_attack_cooldown = G.fire_delay
							if(istype(G,/obj/item/gun/energy))
								var/obj/item/gun/energy/E = G
								MS.projectiletype = E.projectile_type
							if(istype(G,/obj/item/gun/projectile))
								var/obj/item/gun/projectile/P = G
								if(P.load_method == MAGAZINE)
									var/obj/item/ammo_casing/casing

									for(var/obj/item/ammo_casing/C in P.ammo_magazine.stored_ammo)
										if(!casing)
											casing = C

									MS.projectiletype = casing.projectile_type
									return TRUE
								if(P.load_method == SINGLE_CASING|SPEEDLOADER)
									var/obj/item/ammo_casing/casing
									for(var/obj/item/ammo_casing/C in P.loaded)
										if(!casing)
											casing = C

									MS.projectiletype = casing.projectile_type
							else
								MS.projectiletype = /obj/item/projectile/bullet/rifle
							MS.projectilesound = G.fire_sound
							MS.needs_reload = TRUE
							MS.reload_time = 5 SECONDS
							if(istype(G,/obj/item/gun/energy))
								var/obj/item/gun/energy/E = G
								MS.reload_max = E.max_shots
								MS.reload_sound = 'sound/machines/defib_charge.ogg'
							if(istype(G,/obj/item/gun/projectile))
								var/obj/item/gun/projectile/P = G
								if(P.load_method == MAGAZINE)
									MS.reload_max = P.ammo_magazine.max_ammo
									MS.reload_sound = P.mag_insert_sound
								if(P.load_method == SINGLE_CASING|SPEEDLOADER)
									MS.reload_max = P.max_shells
									MS.reload_sound = P.load_sound
								else
									MS.reload_max = 10
									MS.reload_sound = 'sound/weapons/guns/interaction/pistol_magin.ogg'
							else
								MS.reload_max = 10
								MS.reload_sound = 'sound/weapons/guns/interaction/pistol_magin.ogg'

						else
							MS.natural_weapon = I
					else
						MS.natural_weapon = /obj/item/natural_weapon/punch/holo

				if(chosen_option == "ALLIED")
					MS.faction = user.faction
			return TRUE

/obj/item/natural_weapon/punch/holo
	damtype = DAMAGE_PAIN
	simple_damage = 10

/mob/living/simple_animal/hostile/mirror_shade
	turns_per_move = 2
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	movement_cooldown = 0
	maxHealth = 20
	health = 20
	natural_weapon = /obj/item/natural_weapon/punch/holo

	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/angry
	a_intent = I_HURT
	status_flags = CANPUSH

	simple_health = 40
	max_simple_health = 40

	var/mob/living/carbon/human/owner

/mob/living/simple_animal/hostile/mirror_shade/Initialize(mapload, mob/set_owner)
	. = ..()
	if(set_owner)
		owner = set_owner
		friends += owner
	QDEL_IN(src, 30 SECONDS)

/mob/living/simple_animal/hostile/mirror_shade/examine(mob/user)
	if(!QDELETED(owner))
		/// Technically suspicious, but these have 30 seconds of lifetime so it's probably fine.
		return owner.examine(user)
	return ..()

/mob/living/simple_animal/hostile/mirror_shade/death()
	if(owner.simple_combat_on)
		owner.simple_health_calculation(10,0,0,0)
	. = ..()

/mob/living/simple_animal/hostile/mirror_shade/Destroy()

	owner = null
	visible_message(SPAN_WARNING("[src] dissipates into nothingness, as if it were air all along!"))
	return ..()
