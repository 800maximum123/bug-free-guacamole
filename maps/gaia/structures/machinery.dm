// SOLAR CENTRAL GOVERNMENT
// Telecomms
/obj/machinery/telecomms/allinone/gaia_scg
	listening_freqs = list(SFV_FREQ)
	channel_color = COMMS_COLOR_SOL
	channel_name = "SCGDF"
	circuitboard = /obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_scg

/obj/machinery/telecomms/allinone/gaia_scg/cam
	listening_freqs = list(SFV_CAM_FREQ)
	channel_color = COMMS_COLOR_SOL_C
	channel_name = "SCGDF (C)"
	circuitboard = /obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_scg/cam

// Telecomms Items
/obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_scg
	build_path = /obj/machinery/telecomms/allinone/gaia_scg

/obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_scg/cam
	build_path = /obj/machinery/telecomms/allinone/gaia_scg/cam

/obj/item/device/radio/headset/gaia_scg
	name = "SCGDF headset"
	desc = "A headset used by the 'Solar Central Government Defense Force' troops and their loyalists, allowing them to communicate with each other."
	icon_state = "pilot_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/gaia_scg

/obj/item/device/radio/headset/gaia_scg/Initialize()
	. = ..()
	set_frequency(SFV_FREQ)

/obj/item/device/encryptionkey/gaia_scg
	name = "\improper SCGDF radio encryption key"
	icon_state = "com_cypherkey"
	channels = list("SCGDF" = 1, "Hailing" = 1)

/obj/item/device/radio/headset/gaia_scg/command
	name = "SCGDF command headset"
	desc = "A headset used by the 'Solar Central Government Defense Force' leaders, allowing them to command their troops."
	command = TRUE
	can_command = TRUE

/obj/item/device/radio/off/gaia_scg
	name = "shortwave radio (SCGDF)"
	listening = 0
	frequency = SFV_FREQ

/obj/item/device/radio/intercom/gaia_scg
	name = "intercom (SCGDF)"
	frequency = SFV_FREQ

/obj/item/device/radio/intercom/gaia_scg/cam
	name = "intercom (SCGDF (C))"
	frequency = SFV_CAM_FREQ
	canhear_range = 5
	broadcasting = 0
	listening = 1

// INDEPENDENT COLONIAL CONFEDERATION OF GILGAMESH
// Telecomms
/obj/machinery/telecomms/allinone/gaia_iccg
	listening_freqs = list(ICCGN_FREQ)
	channel_color = COMMS_COLOR_ICCG
	channel_name = "ICCGN"
	circuitboard = /obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_iccg

/obj/machinery/telecomms/allinone/gaia_iccg/cam
	listening_freqs = list(ICCGN_CAM_FREQ)
	channel_color = COMMS_COLOR_ICCG_C
	channel_name = "ICCGN (C)"
	circuitboard = /obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_iccg/cam

// Telecomms Items
/obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_iccg
	build_path = /obj/machinery/telecomms/allinone/gaia_iccg

/obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_iccg/cam
	build_path = /obj/machinery/telecomms/allinone/gaia_iccg/cam

/obj/item/device/radio/headset/gaia_iccg
	name = "ICCGN headset"
	desc = "A headset used by the 'Independent Colonial Confederation of Gilgamesh Navy' and their loyalists, allowing them to communicate with each other."
	icon_state = "syndie_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/gaia_iccg

/obj/item/device/radio/headset/gaia_iccg/Initialize()
	. = ..()
	set_frequency(ICCGN_FREQ)

/obj/item/device/encryptionkey/gaia_iccg
	name = "\improper ICCGN radio encryption key"
	channels = list("ICCGN" = 1, "Hailing" = 1)

/obj/item/device/radio/headset/gaia_iccg/command
	name = "ICCGN command headset"
	desc = "A headset used by the 'Independent Colonial Confederation of Gilgamesh Navy' leaders, allowing them to command their troops."
	command = TRUE
	can_command = TRUE

/obj/item/device/radio/off/gaia_iccg
	name = "shortwave radio (ICCGN)"
	listening = 0
	frequency = ICCGN_FREQ

/obj/item/device/radio/intercom/gaia_iccg
	name = "intercom (ICCGN)"
	frequency = ICCGN_FREQ

/obj/item/device/radio/intercom/gaia_iccg/cam
	name = "intercom (ICCGN (C))"
	frequency = ICCGN_CAM_FREQ
	canhear_range = 5
	broadcasting = 0
	listening = 1
