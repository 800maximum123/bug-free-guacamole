// Программа

/datum/computer_file/program/merchant/drone
	available_on_ntnet = FALSE
	required_access = null
	filename = "drone"
	filedesc = "Salvage Drone"
	extended_desc = "Program allows to operate a small salvage-drone to collect various materials."
	program_menu_icon = "gear"

/datum/nano_module/program/merchant
	name = "Salvage Drone"

// Консоль

/obj/machinery/computer/modular/preset/drone
	default_software = list(
		/datum/computer_file/program/merchant/drone)

// Пит-стопы

/datum/trader/trading_beacon/fuel_depot
	name = "fuel depot"
	origin = "fuel depot"
	name_language = LANGUAGE_HUMAN_EURO
	trade_flags = TRADER_MONEY|TRADER_GOODS|TRADER_WANTED_ONLY
	speech = list(TRADER_HAIL_GENERIC    = "Вы наблюдаете левитирующий в космосе топливный контейнер.",
				TRADER_HAIL_DENY         = "",

				TRADER_TRADE_COMPLETE    = "Дрону удалось забрать одну канистру топлива.",
				TRADER_NOT_ENOUGH  = "",
				TRADER_NO_BLACKLISTED = "",
				TRADER_HOW_MUCH          = "",
				TRADER_WHAT_WANT         = "",

				TRADER_COMPLEMENT_FAILURE   = "",
				TRADER_COMPLEMENT_SUCCESS = "",
				TRADER_INSULT_GOOD       = "",
				TRADER_INSULT_BAD        = "",

				TRADER_BRIBE_FAILURE     = "",
				)
	possible_wanted_items = list()
	possible_trading_items = list(/obj/machinery/portable_atmospherics/canister/carbon_dioxide = TRADER_THIS_TYPE)

	insult_drop = 0
	compliment_increase = 0

/datum/trader/trading_beacon/debris
	name = "spaceship debris"
	origin = "spaceship debris"
	name_language = LANGUAGE_HUMAN_EURO
	trade_flags = TRADER_MONEY|TRADER_GOODS|TRADER_WANTED_ONLY
	speech = list(TRADER_HAIL_GENERIC    = "Вы наблюдаете поле разбросанных на километры металлических обломков какого-то корабля",
				TRADER_HAIL_DENY         = "",

				TRADER_TRADE_COMPLETE    = "Дрону удалось достать кое-какие запчасти!",
				TRADER_NOT_ENOUGH  = "",
				TRADER_NO_BLACKLISTED = "",
				TRADER_HOW_MUCH          = "",
				TRADER_WHAT_WANT         = "",

				TRADER_COMPLEMENT_FAILURE   = "",
				TRADER_COMPLEMENT_SUCCESS = "",
				TRADER_INSULT_GOOD       = "",
				TRADER_INSULT_BAD        = "",

				TRADER_BRIBE_FAILURE     = "",
				)
	possible_wanted_items = list()
	possible_trading_items = list(/obj/item/stack/material/steel/fifty = TRADER_THIS_TYPE,
								/obj/item/stack/material/rods/fifty    = TRADER_THIS_TYPE,
								/obj/item/stack/material/scrap         = TRADER_THIS_TYPE,
								/obj/item/stack/material/plasteel/ten  = TRADER_THIS_TYPE
	)

	insult_drop = 0
	compliment_increase = 0
