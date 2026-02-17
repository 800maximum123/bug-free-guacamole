var/global/const/NETWORK_DROPSHIP      = "Dropship"
var/global/const/NETWORK_SCOUT	     = "Scout Shuttle"
var/global/const/NETWORK_LOWER_DECK  = "Lower Deck"
var/global/const/NETWORK_MIDDLE_DECK = "Middle Deck"
var/global/const/NETWORK_UPPER_DECK = "Upper Deck"
var/global/const/NETWORK_POD         = "General Utility Pod"
var/global/const/NETWORK_SUPPLY      = "Supply"
var/global/const/NETWORK_HANGAR      = "Hangar"

/datum/map/lightbrigade/get_network_access(network)
	switch(network)
		if(NETWORK_DROPSHIP)
			return access_aquila
		if(NETWORK_SCOUT)
			return access_expedition_shuttle
		if(NETWORK_SUPPLY)
			return access_mailsorting
		if(NETWORK_HANGAR)
			return access_hangar
		if(NETWORK_HELMETS)
			return access_solgov_crew
	return get_shared_network_access(network) || ..()

/datum/map/lightbrigade
	// Networks that will show up as options in the camera monitor program
	station_networks = list(
		NETWORK_LOWER_DECK,
		NETWORK_MIDDLE_DECK,
		NETWORK_UPPER_DECK,
		NETWORK_ENGINEERING,
		NETWORK_MEDICAL,
		NETWORK_SECURITY,
		NETWORK_HANGAR,
		NETWORK_DROPSHIP,
		NETWORK_SCOUT,
		NETWORK_HELMETS,
		NETWORK_ALARM_ATMOS,
		NETWORK_ALARM_CAMERA,
		NETWORK_ALARM_FIRE,
		NETWORK_ALARM_MOTION,
		NETWORK_ALARM_POWER,
		NETWORK_THUNDER,
	)

//
// Cameras
//

// Networks

/obj/machinery/camera/network/dropship
	network = list(NETWORK_DROPSHIP)

/obj/machinery/camera/network/scout
	network = list(NETWORK_SCOUT)

/obj/machinery/camera/network/lower_deck
	network = list(NETWORK_LOWER_DECK)

/obj/machinery/camera/network/middle_deck
	network = list(NETWORK_MIDDLE_DECK)

/obj/machinery/camera/network/upper_deck
	network = list(NETWORK_UPPER_DECK)

/obj/machinery/camera/network/supply
	network = list(NETWORK_SUPPLY)

/obj/machinery/camera/network/hangar
	network = list(NETWORK_HANGAR)

/obj/machinery/camera/network/crescent
	network = list(NETWORK_CRESCENT)

/obj/machinery/camera/network/engineering_outpost
	network = list(NETWORK_ENGINEERING_OUTPOST)

// Motion
/obj/machinery/camera/motion/engineering_outpost
	network = list(NETWORK_ENGINEERING_OUTPOST)


//
// SMES units
//

// Substation SMES
/obj/machinery/power/smes/buildable/preset/torch/substation
	uncreated_component_parts = list(/obj/item/stock_parts/smes_coil = 1) // Note that it gets one more from construction
	_input_maxed = TRUE
	_output_maxed = TRUE

// Substation SMES (charged and with full I/O setting)
/obj/machinery/power/smes/buildable/preset/torch/substation_full
	uncreated_component_parts = list(/obj/item/stock_parts/smes_coil = 1)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

/obj/machinery/power/smes/buildable/preset/torch/substation_full/rust
	uncreated_component_parts = list(/obj/item/stock_parts/smes_coil/super_io = 2)

// Supermatter output SMES
/obj/machinery/power/smes/buildable/preset/torch/engine_main
	uncreated_component_parts = list(
		/obj/item/stock_parts/smes_coil/super_io = 2,
		/obj/item/stock_parts/smes_coil/super_capacity = 2)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

//RUST Output SMES
/obj/machinery/power/smes/buildable/preset/torch/engine_empty
	uncreated_component_parts = list(
		/obj/item/stock_parts/smes_coil/super_io = 2,
		/obj/item/stock_parts/smes_coil/super_capacity = 2)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE

// Shuttle SMES
/obj/machinery/power/smes/buildable/preset/torch/shuttle
	uncreated_component_parts = list(
		/obj/item/stock_parts/smes_coil/super_io = 1,
		/obj/item/stock_parts/smes_coil/super_capacity = 1)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

// Hangar SMES. Charges the shuttles so needs a pretty big throughput.
/obj/machinery/power/smes/buildable/preset/torch/hangar
	uncreated_component_parts = list(
		/obj/item/stock_parts/smes_coil/super_io = 2)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

// Bridge Solars SMES. For those low pop rounds.
/obj/machinery/power/smes/buildable/preset/torch/bridge_solar
	uncreated_component_parts = list(
		/obj/item/stock_parts/smes_coil = 1
	)
	RCon_tag = "Solar - Bridge"
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

var/global/const/NETWORK_COMMAND = "Command"
var/global/const/NETWORK_ENGINE  = "Engine"
var/global/const/NETWORK_ENGINEERING_OUTPOST = "Engineering Outpost"

/datum/map/proc/get_shared_network_access(network)
	switch(network)
		if(NETWORK_COMMAND)
			return access_heads
		if(NETWORK_ENGINE, NETWORK_ENGINEERING_OUTPOST)
			return access_engine

/datum/map/lightbrigade/default_internal_channels()
	return list(
		num2text(PUB_FREQ)   = list(),
		num2text(AI_FREQ)    = list(access_synth),
		num2text(ENT_FREQ)   = list(),
		num2text(ERT_FREQ)   = list(access_cent_specops),
		num2text(COMM_FREQ)  = list(access_radio_comm),
		num2text(ENG_FREQ)   = list(access_radio_eng),
		num2text(MED_FREQ)   = list(access_radio_med),
		num2text(MED_I_FREQ) = list(access_radio_med),
		num2text(SEC_FREQ)   = list(access_radio_sec),
		num2text(SEC_I_FREQ) = list(access_radio_sec),
		num2text(SUP_FREQ)   = list(access_radio_sup),
		num2text(SRV_FREQ)   = list(access_radio_serv),
		num2text(EXP_FREQ)   = list(access_radio_exp),
		num2text(HAIL_FREQ)  = list(),
	)
