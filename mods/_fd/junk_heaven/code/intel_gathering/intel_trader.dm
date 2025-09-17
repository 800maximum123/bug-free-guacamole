var/global/list/intel_cost = list(
//INTEL
					/obj/item/fd/data = 100,

					/obj/item/fd/data/weapons = 400,

					/obj/item/fd/data/weapons/lvl2/kinetic = 1000,
					/obj/item/fd/data/weapons/lvl2/energy = 800,
					/obj/item/fd/data/weapons/lvl2/magnetic = 800,
					/obj/item/fd/data/weapons/lvl2/special = 1100,

					/obj/item/fd/data/weapons/lvl3/kinetic = 1600,
					/obj/item/fd/data/weapons/lvl3/energy = 1700,
					/obj/item/fd/data/weapons/lvl3/magnetic = 1700,
					/obj/item/fd/data/weapons/lvl3/special = 2000,
					/obj/item/fd/data/weapons/lvl3/secret = 2200,

					/obj/item/fd/data/weapons/lvl4/kinetic = 2100,
					/obj/item/fd/data/weapons/lvl4/energy = 2000,
					/obj/item/fd/data/weapons/lvl4/magnetic = 2000,
					/obj/item/fd/data/weapons/lvl4/special = 2400,
					/obj/item/fd/data/weapons/lvl4/secret = 2800,

					/obj/item/fd/data/engineering = 1000,
					/obj/item/fd/data/engineering/lvl2 = 1600,
					/obj/item/fd/data/engineering/lvl3 = 2000,
					/obj/item/fd/data/engineering/lvl4 = 2400,

					/obj/item/fd/data/science = 1000,
					/obj/item/fd/data/science/lvl2 = 1600,
					/obj/item/fd/data/science/lvl3 = 2000,
					/obj/item/fd/data/science/lvl4 = 2400,
//RELICS
					/obj/item/fd/ancient_items = 100,
					/obj/item/fd/ancient_items/psionic = 1000,
					/obj/item/fd/ancient_items/zippo = 600,
					/obj/item/fd/ancient_items/bs_shard = 5000,
					/obj/item/fd/ancient_items/corrupted_radio = 1800,
					/obj/item/fd/ancient_items/energy_container = 500,
					/obj/item/fd/ancient_items/teddy_bear = 200,
					/obj/item/fd/ancient_items/jap_neko = 4000,
					/obj/item/fd/ancient_items/gold_necklace = 1600,
					/obj/item/fd/ancient_items/strange_photo = 100,
					/obj/item/fd/ancient_items/starmap = 3500,
					/obj/item/fd/ancient_items/phone = 1600,
					/obj/item/fd/ancient_items/skull = 1600,
					/obj/item/fd/ancient_items/emerald = 5500,
					/obj/item/fd/ancient_items/bio_implant = 2000,
					/obj/item/fd/ancient_items/lighting_staff = 2000,
					/obj/item/fd/ancient_items/eye_of_the_maw = 5000)

/datum/trader/ship/intel_collector
	name = "Загадочный Фиксер"
	origin = "Странствующий в Тени"
	trade_flags = TRADER_GOODS|TRADER_MONEY|TRADER_WANTED_ONLY|TRADER_WANTED_ALL
	want_multiplier = 1.5
	margin = 2
	possible_origins = list("IPV 'Странствующий в Тени'", "IPV 'Библиотекарь'",)
	speech = list(TRADER_HAIL_GENERIC    = "Мне нужны данные, а вам деньги. Не задавайте лишних вопросов и мы сработаемся.",
				TRADER_HAIL_DENY         = "...",

				TRADER_TRADE_COMPLETE    = "Хм...я смогу извлечь из этого некоторую выгоду.",
				TRADER_NO_BLACKLISTED   = "Меня не интересуют подобные безделушки.",
				TRADER_FOUND_UNWANTED = "Простите, но этим вы меня не удивите.",
				TRADER_NOT_ENOUGH   = "Вам понадобится куда больше, если вы хотите это купить...",
				TRADER_HOW_MUCH          = "Я готов продать вам эту информацию за VALUE CURRENCY.",
				TRADER_WHAT_WANT         = "На данный момент я нахожусь в поисках...",

				TRADER_COMPLEMENT_FAILURE   = "Отрадно наблюдать за вашими потугами.",
				TRADER_COMPLEMENT_SUCCESS = "Должен отметить ваши старания, но я здесь лишь ради бизнеса.",
				TRADER_INSULT_GOOD       = "Хочется признать, трепать языком вы умеете...главное, следите за тем, чтобы его не отрезали после таких слов.",
				TRADER_INSULT_BAD        = "Жалкая попытка.",
				)

	overmap_object_color = COLOR_BLACK

	insult_drop = 0
	compliment_increase = 0

	possible_wanted_items = list(/obj/item/fd/data = TRADER_SUBTYPES_ONLY)

/datum/trader/collector
	name = "Загадочный коллекционер"
	origin = "Музей"
	trade_flags = TRADER_GOODS|TRADER_MONEY|TRADER_WANTED_ONLY|TRADER_WANTED_ALL
	want_multiplier = 1.5
	margin = 2
	possible_origins = list("Музей имени Говарда Л.", "Частная выстовочная площадка",)
	speech = list(TRADER_HAIL_GENERIC    = "Добро пожаловать, мой дорогой друг! Что вы принесли сегодня?",
				TRADER_HAIL_DENY         = "--ВЫ БЫЛИ ЗАБЛОКИРОВАНЫ--",

				TRADER_TRADE_COMPLETE    = "Отличный товар...воистину большой улов!",
				TRADER_NO_BLACKLISTED   = "Простите, но я, всё-таки, ЛЕГАЛЬНЫЙ предприниматель.",
				TRADER_FOUND_UNWANTED = "Такое даже на витрину поставить стыдно...уж простите.",
				TRADER_NOT_ENOUGH   = "Вам понадобится куда больше, если вы хотите это купить, мой друг!",
				TRADER_HOW_MUCH          = "Я готов продать вам эту прекрасную вещицу всего за VALUE CURRENCY!",
				TRADER_WHAT_WANT         = "Я буду крайне удивлён, если у вас окажется...",

				TRADER_COMPLEMENT_FAILURE   = "Допустим?...",
				TRADER_COMPLEMENT_SUCCESS = "Ох-хо-хо, не стоит, правда!",
				TRADER_INSULT_GOOD       = "Послушайте...давайте вести себя цивильно, хорошо? Пожалуйста.",
				TRADER_INSULT_BAD        = "Надеюсь, что я просто не так вас понял...",
				)

	overmap_object_color = COLOR_WHITE

	possible_wanted_items = list(/obj/item/fd/ancient_items = TRADER_SUBTYPES_ONLY,
								/obj/item/cell/bluespace_ancient = TRADER_THIS_TYPE,
								/obj/item/clothing/glasses/psionic = TRADER_THIS_TYPE)
