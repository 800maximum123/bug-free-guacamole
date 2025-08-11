// SOLAR CENTRAL GOVERNMENT
// Telecomms
/obj/machinery/telecomms/allinone/gaia_scg
	listening_freqs = list(SFV_FREQ)
	channel_color = COMMS_COLOR_CENTCOMM
	channel_name = "SCGDF"
	circuitboard = /obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_scg

// Items
/obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_scg
	build_path = /obj/machinery/telecomms/allinone/gaia_scg

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
	channels = list("SCGDF" = 1)

/obj/item/device/radio/off/gaia_scg
	name = "shortwave radio (SCGDF)"
	listening = 0

/obj/item/device/radio/off/gaia_scg/Initialize()
	. = ..()
	set_frequency(SFV_FREQ)

// INDEPENDENT COLONIAL CONFEDERATION of GILGAMESH
// Telecomms
/obj/machinery/telecomms/allinone/gaia_iccg
	listening_freqs = list(ICCGN_FREQ)
	channel_color = COMMS_COLOR_ICCG
	channel_name = "ICCGGOF"
	circuitboard = /obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_iccg

// Items
/obj/item/stock_parts/circuitboard/telecomms/allinone/gaia_iccg
	build_path = /obj/machinery/telecomms/allinone/gaia_iccg

/obj/item/device/radio/headset/gaia_iccg
	name = "ICCGGOF headset"
	desc = "A headset used by the 'Independent Colonial Confederation of Gilgamesh Ground Occupation Force' and their loyalists, allowing them to communicate with each other."
	icon_state = "syndie_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/gaia_iccg

/obj/item/device/radio/headset/gaia_iccg/Initialize()
	. = ..()
	set_frequency(ICCGN_FREQ)

/obj/item/device/encryptionkey/gaia_iccg
	name = "\improper ICCGGOF radio encryption key"
	channels = list("ICCGGOF" = 1)

/obj/item/device/radio/off/gaia_iccg
	name = "shortwave radio (ICCGGOF)"
	listening = 0

/obj/item/device/radio/off/gaia_iccg/Initialize()
	. = ..()
	set_frequency(ICCGN_FREQ)
