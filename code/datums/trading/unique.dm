/datum/trader/ship/unique
	trade_flags = TRADER_WANTED_ONLY|TRADER_GOODS
	want_multiplier = 5
	typical_duration = 40

/*/datum/trader/ship/unique/New()
	..()
	wanted_items = list()
	for(var/type in possible_wanted_items)
		var/status = possible_wanted_items[type]
		if(status & TRADER_THIS_TYPE)
			wanted_items += type
		if(status & TRADER_SUBTYPES_ONLY)
			wanted_items += subtypesof(type)
		if(status & TRADER_BLACKLIST)
			wanted_items -= type
		if(status & TRADER_BLACKLIST_SUB)
			wanted_items -= subtypesof(type)*/

/datum/trader/ship/unique/tick()
	if(prob(-min(list_values(disposition))))
		duration_of_stay--
	return --duration_of_stay > 0

/datum/trader/ship/unique/what_do_you_want()
	return make_response(TRADER_WHAT_WANT, "I don't want anything!", 0, FALSE)

/datum/trader/ship/unique/severance
	name = "Неизвестный"
	origin = "ITV Северин"
	skill_req = SKILL_COOKING

	possible_wanted_items = list(
							/obj/item/reagent_containers/food/snacks/human                      = TRADER_SUBTYPES_ONLY,
							/obj/item/reagent_containers/food/snacks/meat/human                 = TRADER_THIS_TYPE,
							/mob/living/carbon/human                                                   = TRADER_ALL
							)

	wanted_items = list(
							/obj/item/reagent_containers/food/snacks/human                      = TRADER_SUBTYPES_ONLY,
							/obj/item/reagent_containers/food/snacks/meat/human                 = TRADER_THIS_TYPE,
							/mob/living/carbon/human                                                   = TRADER_ALL
							)

	possible_trading_items = list(/obj/item/gun/projectile/automatic                            = TRADER_SUBTYPES_ONLY,
							/obj/item/gun/projectile/automatic/smg/machine_pistol/usi                     = TRADER_BLACKLIST,
							/obj/item/gun/projectile/automatic/l6_saw/mag                       = TRADER_BLACKLIST
							)

	blacklisted_trade_items = null

	speech = list(TRADER_HAIL_GENERIC     = "П-привет. Меня слышно? П-прекрасно...у меня есть...специфичная просьба...и конечно я могу предложить не мало интересного в обмен.",
				TRADER_HAIL_DENY          = "--CONNECTION SEVERED--",

				TRADER_TRADE_COMPLETE     = "АХАХАХАХахахаХХАхАХа! Спасибоспасибоспасибоспасибо!",
				TRADER_NO_MONEY       = "Мне н-не нужны ДЕНЬГИ.",
				TRADER_NOT_ENOUGH     = "Н-не-не-не. Б-больше...мне нужно больше.",
				TRADER_FOUND_UNWANTED = "М-мне кажется т-ты не понимаешь ч-что мне РЕАЛЬНО НУЖНО.",
				TRADER_HOW_MUCH       = "Мясо. Мне нужно мясо. Такое, какое не принято подавать в цивилизованном обществе...",
				TRADER_WHAT_WANT      = "Пожирнее. Да...я хочу...",

				TRADER_COMPLEMENT_FAILURE    = "Твоя ложь уже ничего не изменит.",
				TRADER_COMPLEMENT_SUCCESS  = "Да...я действительно не так уж и плох.",
				TRADER_INSULT_GOOD        = "Я...заслужил это.",
				TRADER_INSULT_BAD         = "Может, ты подойдёшь поближе, и скажешь м-мне это в лицо? ЧТОБЫЯВОНЗИЛЭТОТНОЖПРЯМОВТВОЮГЛОТКУ!",
				)
	mob_transfer_message = "<span class='danger'>Вы были перемещены на ORIGIN. Последнее, что вы помните - это удар по голове. А затем была только темнота.</span>"


/datum/trader/ship/unique/rock
	name = "Бобо"
	origin = "Камень с двигателями"

	possible_wanted_items  = list(/obj/item/ore                        = TRADER_ALL)
	wanted_items  = list(/obj/item/ore                        = TRADER_ALL)
	possible_trading_items = list(/obj/machinery/power/supermatter            = TRADER_ALL,
								/obj/item/aiModule                     = TRADER_SUBTYPES_ONLY)
	want_multiplier = 4000 // was 5000, yeah

	speech = list(TRADER_HAIL_GENERIC     = "Бобо не ТОРГУЕТ. Бобо ЕСТ. Бу приносить Бобо еду, хорошо?",
				TRADER_HAIL_DENY          = "Бу обидел Бобо. Бобо больше не хочет общаться с Бу.",

				TRADER_TRADE_COMPLETE     = "Вкууусно.",
				TRADER_NO_MONEY     = "Бобо не любит бумажки. Бумажки не питательны.",
				TRADER_NOT_ENOUGH   = "Бобо нужно больше.",
				TRADER_FOUND_UNWANTED = "Бобо хочет только хрустяшки.",
				TRADER_HOW_MUCH           = "Бобо хочет хрустяшек. Бу давать хрустяшки. Бобо давать что-то взамен.",
				TRADER_WHAT_WANT          = "Бобо хочет хрустяшек. Больших хрустяшек, маленьких хрустяшек. Блестящих хрустяшек!",

				TRADER_COMPLEMENT_FAILURE    = "Бобо просто хочет есть. Что Бу имеет в виду?",
				TRADER_COMPLEMENT_SUCCESS  = "Бу хороший!",
				TRADER_INSULT_GOOD        = "Бобо не понимает! Бобо думал что мы с Бу друзья!",
				TRADER_INSULT_BAD         = "Бобо чувствует себя грустно.",
				)

//probably could stick soem Howl references in here but like, eh. Haven't seen it in years.
/datum/trader/ship/unique/wizard
	name = "Заклинатель"
	origin = "Космический Замок"
	possible_origins = list("Дворец короля Артура", "Гробница Фараона", "Память о далёком прошлом", "Темница Хроноса")
	name_language = TRADER_DEFAULT_NAME

	possible_wanted_items = list(/mob/living/simple_animal/construct            = TRADER_SUBTYPES_ONLY,
								/obj/item/melee/cultblade                = TRADER_THIS_TYPE,
								/obj/item/clothing/head/culthood                = TRADER_ALL,
								/obj/item/clothing/suit/space/cult              = TRADER_ALL,
								/obj/item/clothing/suit/cultrobes               = TRADER_ALL,
								/obj/item/clothing/head/helmet/space/cult       = TRADER_ALL,
								/obj/structure/cult                             = TRADER_SUBTYPES_ONLY,
								/obj/structure/constructshell                   = TRADER_ALL,
								/mob/living/simple_animal/familiar              = TRADER_SUBTYPES_ONLY,
								/mob/living/simple_animal/familiar/pet          = TRADER_BLACKLIST,
								/mob/living/simple_animal/hostile/mimic         = TRADER_ALL)

	possible_trading_items = list(/obj/item/clothing/gloves/wizard        = TRADER_THIS_TYPE,
								/obj/item/clothing/head/helmet/space/void/wizard = TRADER_THIS_TYPE,
								/obj/item/clothing/head/wizard                   = TRADER_ALL,
								/obj/item/clothing/suit/space/void/wizard        = TRADER_THIS_TYPE,
								/obj/item/toy/figure/wizard                      = TRADER_THIS_TYPE,
								/obj/item/staff                           = TRADER_ALL,
								) //Probably see about getting some more wizard based shit

	speech = list(TRADER_HAIL_GENERIC     = "Приветствую! Вы заглянули ко мне за помощью, или за сделкой?",
				TRADER_HAIL_DENY          = "Прошу прощения, но у меня есть дела по-важнее, нежели общение с ЧЕРНЬЮ.",

				TRADER_TRADE_COMPLETE     = "Отличная сделка. Волшебная!",
				TRADER_NO_MONEY     = "Деньги? Ха! Что деньги для такого как я?",
				TRADER_NOT_ENOUGH   = "Хм, ваше предложение валидно, но я бы всё-таки хотел чего-то, что достойно моего ассортимента.",
				TRADER_FOUND_UNWANTED = "Что мне нужно? Мне нужны реликвии! Магические артефакты! Неужели непонятно?",
				TRADER_HOW_MUCH           = "Мне нужны мощные предметы. Обладающие воистину ВЕЛИКОЙ аурой.",
				TRADER_WHAT_WANT          = "Хм...Культ Нар-Си? Рат'вара? Впрочем, сомневаюсь, что это о многом вам говорит.",

				TRADER_COMPLEMENT_FAILURE    = "Боже! Словно я не слышал этого раньше",
				TRADER_COMPLEMENT_SUCCESS  = "Ха-ха! Ну разве вы не сама любезность?",
				TRADER_INSULT_GOOD        = "Нагло...действительно нагло.",
				TRADER_INSULT_BAD         = "Знаете, я ведь могу превратить вас в мышь до конца вашей жалкой жизни.",
				)

/datum/trader/ship/unique/wizard/New()
	..()
	speech[TRADER_HAIL_START + SPECIES_GOLEM] = "Интересно...воистину интересно...прошу, вершина магической науки - проходите!"
