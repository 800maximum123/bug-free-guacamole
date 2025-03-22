// Топливная ячейка дрона

/obj/item/drone_cell

	name = "salvage drone fuel cell"
	desc = "A fuel cell for an onboard salvage drone. ONE CELL is used per ONE extraction operation. DO NOT PLACE MORE THAN ONE!"
	icon = 'mods/_fd/fd_assets/icons/obj/items/oddities.dmi'
	icon_state = "techno_part6"


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
	name_language = null
	trade_flags = TRADER_GOODS|TRADER_WANTED_ONLY
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
	wanted_items = list(/obj/item/drone_cell   = TRADER_WANTED_ALL)
	possible_wanted_items = list(/obj/item/drone_cell   = TRADER_WANTED_ALL)
	possible_trading_items = list(/obj/machinery/portable_atmospherics/canister/carbon_dioxide = TRADER_THIS_TYPE)

	insult_drop = 0
	compliment_increase = 0

/datum/trader/trading_beacon/debris
	name = "spaceship debris"
	origin = "spaceship debris"
	name_language = null
	trade_flags = TRADER_GOODS|TRADER_WANTED_ONLY
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
	wanted_items = list(/obj/item/drone_cell   = TRADER_WANTED_ALL)
	possible_wanted_items = list(/obj/item/drone_cell = TRADER_WANTED_ALL)
	possible_trading_items = list(/obj/item/stack/material/steel/fifty   = TRADER_THIS_TYPE,
								/obj/item/stack/material/rods/fifty      = TRADER_THIS_TYPE,
								/obj/item/stack/material/plasteel/fifty  = TRADER_THIS_TYPE,
								/obj/item/rcd_ammo                       = TRADER_THIS_TYPE
	)

	insult_drop = 0
	compliment_increase = 0

/datum/trader/trading_beacon/ammo_stash
	name = "military ammo stash"
	origin = "ammo_stash"
	name_language = null
	trade_flags = TRADER_GOODS|TRADER_WANTED_ONLY
	speech = list(TRADER_HAIL_GENERIC    = "Вы наблюдаете небольшой защищённый карго-контейнер",
				TRADER_HAIL_DENY         = "",

				TRADER_TRADE_COMPLETE    = "Дрону удалось достать кое-какие боеприпасы!",
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
	wanted_items = list(/obj/item/drone_cell   = TRADER_WANTED_ALL)
	possible_wanted_items = list(/obj/item/drone_cell = TRADER_WANTED_ALL)
	possible_trading_items = list(/obj/item/ammo_magazine/ammobox/minigun                   = TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/ammobox/autocannon                  = TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/ammobox/hmg                         = TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/ammobox/autocannon/armour_piercing  = TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/ammobox/disruptor                   = TRADER_THIS_TYPE,
								/obj/item/missile_equipment/payload/diffuser                = TRADER_THIS_TYPE,
								/obj/item/missile_equipment/payload/explosive               = TRADER_THIS_TYPE,
	)

	insult_drop = 0
	compliment_increase = 0

/datum/trader/trading_beacon/torpedo_stash
	name = "military torpedo stash"
	origin = "torpedo_stash"
	name_language = null
	trade_flags = TRADER_GOODS|TRADER_WANTED_ONLY
	speech = list(TRADER_HAIL_GENERIC    = "Вы наблюдаете небольшой защищённый карго-контейнер.",
				TRADER_HAIL_DENY         = "",

				TRADER_TRADE_COMPLETE    = "Дрону удалось достать кое-какие запчасти торпед!",
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
	wanted_items = list(/obj/item/drone_cell   = TRADER_WANTED_ALL)
	possible_wanted_items = list(/obj/item/drone_cell = TRADER_WANTED_ALL)
	possible_trading_items = list(/obj/item/missile_equipment/thruster                      = TRADER_THIS_TYPE,
								/obj/item/missile_equipment/payload/diffuser                = TRADER_THIS_TYPE,
								/obj/item/missile_equipment/payload/explosive               = TRADER_THIS_TYPE,
								/obj/item/missile_equipment/payload/emp                     = TRADER_THIS_TYPE
	)
