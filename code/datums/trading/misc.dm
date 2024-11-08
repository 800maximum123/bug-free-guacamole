/datum/trader/ship/pet_shop
	name = "Владелец Пет-Шопа"
	name_language = LANGUAGE_SKRELLIAN
	skill_req = SKILL_SCIENCE
	origin = "Пет-Шоп"
	trade_flags = TRADER_GOODS|TRADER_MONEY|TRADER_WANTED_ONLY
	possible_origins = list("Лапы наружу", "Сообразительные четвероногие", "Тентакли в помощь", "Всё для Ксенофауны", "Лай и Рык")
	speech = list(TRADER_HAIL_GENERIC    = "Добро пожаловать в мой Пет-Шоп! Надеюсь, вы найдёте себе друга по душе. Некоторые из них...немного агрессивные, но всё равно очень верные! Я также скупаю животных. Обмен тоже возможен!",
				TRADER_HAIL_DENY         = "Мне больше нечего вам сказать.",

				TRADER_TRADE_COMPLETE    = "Не забывайте ухаживать за ним!",
				TRADER_NO_BLACKLISTED   = "Мне не позволит принять это ни закон, ни мораль.",
				TRADER_FOUND_UNWANTED = "Мне нужны только животные, ладно? Меня не интересует еда или эти блестящие штучки. И я говорю о вполне конкретных животных - я не возьму того, для кого у меня нет еды и клетки.",
				TRADER_NOT_ENOUGH   = "Я бы отдал тебе его и за бесплатно, но мне нужно на что-то кормить других. Поэтому - никаких торгов. Только полная стоимость.",
				TRADER_HOW_MUCH          = "Отличный выбор, высший сорт...он обойдётся вам в VALUE CURRENCY.",
				TRADER_WHAT_WANT         = "В данный момент я смог бы принять к себе на борт...",

				TRADER_COMPLEMENT_FAILURE   = "Это было так мило! Но нет, спасибо.",
				TRADER_COMPLEMENT_SUCCESS = "Спасибо, мне было это нужно.",
				TRADER_INSULT_GOOD       = "Я прошу вас прекратить. Давайте общаться как цивилизованные личности...",
				TRADER_INSULT_BAD        = "Этот диалог становится всё более неловким.",

				TRADER_BRIBE_FAILURE     = "Простите, но у меня нет времени чтобы делать столь длительные остановки.",
				TRADER_BRIBE_SUCCESS      = "Хм. Животным нужно отдохнуть от блюспейс-прыжка. Я подожду.",
				)

	possible_wanted_items = list(/mob/living/simple_animal/passive/corgi      = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/cat         = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/crab        = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/lizard      = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/mouse       = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/mushroom    = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/tomato      = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/cow         = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/chick       = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/chicken     = TRADER_THIS_TYPE,
								/mob/living/simple_animal/hostile/bear = TRADER_THIS_TYPE,
								/mob/living/simple_animal/hostile/retaliate/parrot      = TRADER_THIS_TYPE,
								/mob/living/simple_animal/hostile/retaliate/goat = TRADER_THIS_TYPE,
								/mob/living/simple_animal/hostile/carp = TRADER_THIS_TYPE)

	possible_trading_items = list(/mob/living/simple_animal/passive/corgi     = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/cat         = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/crab        = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/lizard      = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/mouse       = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/mushroom    = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/tomato      = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/cow         = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/chick       = TRADER_THIS_TYPE,
								/mob/living/simple_animal/passive/chicken     = TRADER_THIS_TYPE,
								/mob/living/simple_animal/hostile/bear= TRADER_THIS_TYPE,
								/mob/living/simple_animal/hostile/retaliate/parrot      = TRADER_THIS_TYPE,
								/mob/living/simple_animal/hostile/retaliate/goat = TRADER_THIS_TYPE,
								/mob/living/simple_animal/hostile/carp= TRADER_THIS_TYPE,
								/obj/structure/dogbed                 = TRADER_THIS_TYPE)

/datum/trader/ship/pet_shop/New()
	..()
	speech[TRADER_HAIL_START + SPECIES_SKRELL] = "Ах! Мой собрат по несчастью! Встретить в этих краях другого скрелла - редкость! Слушай, у меня, кажется, сохранилась в запасе пара ребят с родины...хочешь взглянуть?"

/datum/trader/ship/prank_shop
	name = "Владелец Пранк-Шопа"
	name_language = LANGUAGE_ROOTLOCAL
	origin = "Пранк-Шоп"
	compliment_increase = 0
	insult_drop = 0
	possible_origins = list("Смешинки", "Пранковый Гештальт", "Клоунский Арсенал", "Бункер дядюшки Кнаклза", "То самое место где продают смешные приколы", "То самое место где я заставляю людей смеяться")
	speech = list(TRADER_HAIL_GENERIC = "Мы приглашаем вас в наш магазин, где продаются предметы увесилительного характера. Мы предлагаем вам стать свидетелем уникального опыта бытья пранкнутым, или пранкнуть кого-то самостоятельно.",
				TRADER_HAIL_DENY      = "Мы больше не можем иметь с вами дел, вы слишком не смешной.",

				TRADER_TRADE_COMPLETE = "Мы благодарим вас за покупку этого замечательно предмета. Нам понравилось то, что вы купили у нас данную вещь и мы извлечём из этого полезный урок.",
				TRADER_NO_BLACKLISTED= "Мы заинтересованы только в создании пранков. Военные преступления не звучат как что-то весёлое для нас.",
				TRADER_NOT_ENOUGH="Мы уже осознали опыт раздачи вещей бесплатно. Теперь мы хотим осознать опыт получения денег за это.",
				TRADER_HOW_MUCH       = "Мы верим в то, что этот предмет стоит VALUE CURRENCY.",
				TRADER_WHAT_WANT      = "Нам важен лишь опыт и впечатления, которые вы производите. Однако, если вы настаиваете, то мы бы хотели...",

				TRADER_COMPLEMENT_FAILURE= "Вы попытались сделать нам комплимент. Зачем?",
				TRADER_COMPLEMENT_SUCCESS="Вы попытались сделать нам комплимент. Зачем?",
				TRADER_INSULT_GOOD    = "Вы попытались сильно оскорбить нас, правильно?",
				TRADER_INSULT_BAD     = "Мы, не смотря на вековой опыт, ничего не поняли.",

				TRADER_BRIBE_FAILURE  = "Мы должны получить больше опыта. Мы извлекли из этого места весь спектр эмоций, который могли извлечь.",
				TRADER_BRIBE_SUCCESS   = "Мы считаем, что вы можете показать нам ещё много чего. Мы задержимся.",
				)
	possible_trading_items = list(/obj/item/clothing/mask/gas/clown_hat = TRADER_THIS_TYPE,
								/obj/item/clothing/mask/gas/mime        = TRADER_THIS_TYPE,
								/obj/item/clothing/shoes/clown_shoes    = TRADER_THIS_TYPE,
								/obj/item/clothing/under/rank/clown     = TRADER_THIS_TYPE,
								/obj/item/stamp/clown            = TRADER_THIS_TYPE,
								/obj/item/storage/backpack/clown = TRADER_THIS_TYPE,
								/obj/item/bananapeel             = TRADER_THIS_TYPE,
								/obj/item/gun/launcher/money     = TRADER_THIS_TYPE,
								/obj/item/reagent_containers/food/snacks/pie = TRADER_THIS_TYPE,
								/obj/item/bikehorn               = TRADER_THIS_TYPE,
								/obj/item/reagent_containers/spray/waterflower = TRADER_THIS_TYPE,
								/obj/item/gun/launcher/pneumatic/small = TRADER_THIS_TYPE,
								/obj/item/gun/projectile/revolving/capgun = TRADER_THIS_TYPE,
								/obj/item/clothing/mask/fakemoustache   = TRADER_THIS_TYPE,
								/obj/item/grenade/spawnergrenade/fake_carp = TRADER_THIS_TYPE)

/datum/trader/ship/prank_shop/New()
	..()
	speech[TRADER_HAIL_START + SPECIES_DIONA] = "Welcome, other gestalt. We invite you to learn of our experiences, and teach us of your own."

/datum/trader/ship/replica_shop
	name = "Владелец летающей кузницы"
	skill_req = SKILL_COMBAT
	name_language = TRADER_DEFAULT_NAME
	origin = "Летающая кузница"
	possible_origins = list("Старая-добрая Оружейная", "Рыцари и Негодяи", "Кузнец", "Историческое одеяние и оружие человеческой расы", "Острый Конец", "Сталь Эльминестера", "Дюрандаль", "Слуга Королевы")
	speech = list(TRADER_HAIL_GENERIC = "Приветствую, путник! Ты определённо выглядишь как тот, кто хочет окунуться в человеческую историю поглубже! Прошу! Заходи! Может быть, тебе даже что-нибудь приглянётся?...",
				TRADER_HAIL_DENY      = "Чтоб чёрт меня побрал - не знаю на что я надеялась! Ты просто грязный брут!",

				TRADER_TRADE_COMPLETE = "Благодарю, о великий воин. И помни - не смотря на то, что это всё реплика, их концы остры как реальные!",
				TRADER_NO_BLACKLISTED= "Ишь что удумал - мы принимаем либо золото, либо CURRENCY_SINGULAR! Впрочем, королевские реликвии тоже сойдут...",
				TRADER_NOT_ENOUGH="Извини, путник, но даже моя рубах стоит дороже, чем ты мне предлагаешь.",
				TRADER_HOW_MUCH       = "Думаю, VALUE CURRENCY будет достаточно, чтобы почтить историю.",
				TRADER_WHAT_WANT      = "Я всю свою жизнь охочусь за...",

				TRADER_COMPLEMENT_FAILURE= "Ха-ха-ха! Да ты настоящий Шут!",
				TRADER_COMPLEMENT_SUCCESS="Благодарю, путник. Я не слышала таких комплиментов со времён того, как ковала мечи для армии Его Высочества.",
				TRADER_INSULT_GOOD    = "Слушай, бро, я просто пытаюсь заработать себе на жизнь, ок? Вся эта Авалонская туфта - просто часть моего бренда.",
				TRADER_INSULT_BAD     = "Ну и ебись с конём, если так хочешь.",

				TRADER_BRIBE_FAILURE  = "Право, путник, я бы обсуждала с тобой нашу замечательную историю хоть целый день! Но мой следующий клиент - Унати. А они ждать не научены...",
				TRADER_BRIBE_SUCCESS   = "Может быть, мы можем и задержаться...тем более, магу нужно время отдохнуть после последнего прыжка. Иначе он не сможет открыть портал в следующую точку нашего тернистого пути!",
				)
	possible_trading_items = list(/obj/item/clothing/head/wizard/magus = TRADER_THIS_TYPE,
								/obj/item/shield/buckler        = TRADER_THIS_TYPE,
								/obj/item/clothing/head/redcoat        = TRADER_THIS_TYPE,
								/obj/item/clothing/head/powdered_wig   = TRADER_THIS_TYPE,
								/obj/item/clothing/head/hasturhood     = TRADER_THIS_TYPE,
								/obj/item/clothing/head/helmet/gladiator=TRADER_THIS_TYPE,
								/obj/item/clothing/head/plaguedoctorhat= TRADER_THIS_TYPE,
								/obj/item/clothing/glasses/monocle     = TRADER_THIS_TYPE,
								/obj/item/clothing/mask/smokable/pipe  = TRADER_THIS_TYPE,
								/obj/item/clothing/mask/gas/plaguedoctor=TRADER_THIS_TYPE,
								/obj/item/clothing/suit/hastur         = TRADER_THIS_TYPE,
								/obj/item/clothing/suit/imperium_monk  = TRADER_THIS_TYPE,
								/obj/item/clothing/suit/judgerobe      = TRADER_THIS_TYPE,
								/obj/item/clothing/suit/wizrobe/magusred=TRADER_THIS_TYPE,
								/obj/item/clothing/suit/wizrobe/magusblue=TRADER_THIS_TYPE,
								/obj/item/clothing/under/gladiator     = TRADER_THIS_TYPE,
								/obj/item/clothing/under/kilt          = TRADER_THIS_TYPE,
								/obj/item/clothing/under/redcoat       = TRADER_THIS_TYPE,
								/obj/item/clothing/under/soviet        = TRADER_THIS_TYPE,
								/obj/item/material/harpoon      = TRADER_THIS_TYPE,
								/obj/item/material/sword        = TRADER_ALL,
								/obj/item/material/scythe       = TRADER_THIS_TYPE,
								/obj/item/material/star         = TRADER_THIS_TYPE,
								/obj/item/material/twohanded/baseballbat = TRADER_THIS_TYPE)

/datum/trader/ship/replica_shop/New()
	..()
	speech[TRADER_HAIL_START + SPECIES_UNATHI] = "Ах, вы выглядите как воин, способно орудующий клинком. Прошу, входите! Мы можем лишь надеяться, что наша сталь может сравняться с стандартами Могеса."
