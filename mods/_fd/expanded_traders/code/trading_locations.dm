/obj/overmap/trading
	name = "station"
	desc = "A trading station."
	icon_state = "trading_station"
	scannable = TRUE
	requires_contact = TRUE	// Whether or not the effect must be identified by ship sensors before being seen.
	instant_contact  = TRUE	// Do we instantly identify ourselves to any ship in sensors range?
	plane = 4

	var/datum/trader/trader_merchant_datum

/obj/overmap/trading/on_update_icon()
	return

/obj/overmap/trading/ship
	name = "ship"
	desc = "A trading ship."
	icon_state = "trading_ship"
