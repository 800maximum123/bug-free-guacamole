//			Machines

var/global/const/UL_CIC_FREQ = 1561
var/global/const/UL_SPECOPS_FREQ = 1563
var/global/const/UL_ENG_FREQ = 1565
var/global/const/UL_MED_FREQ = 1567
var/global/const/UL_PUB_FREQ = 1569
/*
global/list/radiochannels += "UL CIC"
global/list/radiochannels += "UL SPECOPS"
global/list/radiochannels += "UL ENGINEERING"
global/list/radiochannels += "UL MEDICAL"
global/list/radiochannels += "UL PUBLIC"

global/list/radiochannels["UL CIC"] = UL_CIC_FREQ
global/list/radiochannels["UL SPECOPS"] = UL_SPECOPS_FREQ
global/list/radiochannels["UL ENGINEERING"] = UL_ENG_FREQ
global/list/radiochannels["UL MEDICAL"] = UL_MED_FREQ
global/list/radiochannels["UL PUBLIC"] = UL_PUB_FREQ
*/
/obj/machinery/telecomms/hub/map_preset/ulyanovsk
	id = "UL Hub"
	network = "ULcomsat"
	autolinkers = list("ul_hub", "ul_cic", "ul_engineering", "ul_specops", "ul_medical", "ul_public", "ul_receiverA", "ul_broadcasterA")

/obj/machinery/telecomms/receiver/map_preset/ulyanovsk
	id = "UL Receiver A"
	network = "ULcomsat"
	autolinkers = list("ul_receiverA")
	freq_listening = list(UL_CIC_FREQ, UL_SPECOPS_FREQ, UL_ENG_FREQ, UL_MED_FREQ, UL_PUB_FREQ)

/obj/machinery/telecomms/bus/map_preset/ulyanovsk/com_sec
	id = "UL Bus 1"
	network = "ULcomsat"
	freq_listening = list(UL_SPECOPS_FREQ, UL_CIC_FREQ)
	autolinkers = list("ul_processor1", "ul_specops", "ul_cic")

/obj/machinery/telecomms/bus/map_preset/ulyanovsk/eng_med
	id = "UL Bus 2"
	network = "ULcomsat"
	freq_listening = list(UL_ENG_FREQ, UL_MED_FREQ, UL_PUB_FREQ)
	autolinkers = list("ul_processor2", "ul_engineering", "ul_medical", "ul_public")

/obj/machinery/telecomms/processor/map_preset/ulyanovsk/p1
	id = "UL Processor 1"
	network = "ULcomsat"
	autolinkers = list("ul_processor1")

/obj/machinery/telecomms/processor/map_preset/ulyanovsk/p2
	id = "UL Processor 2"
	network = "ULcomsat"
	autolinkers = list("ul_processor2")

/obj/machinery/telecomms/server/map_preset/ulyanovsk
	network = "ULcomsat"

/obj/machinery/telecomms/server/map_preset/ulyanovsk/com
	id = "CIC Server"
	freq_listening = list(UL_CIC_FREQ)
	channel_tags = list(list(UL_CIC_FREQ, "CIC", "#1a38e4"))
	autolinkers = list("ul_cic")

/obj/machinery/telecomms/server/map_preset/ulyanovsk/specops
	id = "SpecOps Server"
	freq_listening = list(UL_SPECOPS_FREQ)
	channel_tags = list(list(UL_SPECOPS_FREQ, "SpecOps", "#ff0000"))
	autolinkers = list("ul_specops")

/obj/machinery/telecomms/server/map_preset/ulyanovsk/eng
	id = "Engineering Server"
	freq_listening = list(UL_ENG_FREQ)
	channel_tags = list(list(UL_ENG_FREQ, "Engineering", "#e0a911"))
	autolinkers = list("ul_engineering")

/obj/machinery/telecomms/server/map_preset/ulyanovsk/med
	id = "Medical Server"
	freq_listening = list(UL_MED_FREQ)
	channel_tags = list(list(UL_MED_FREQ, "Medical", "#047d92"))
	autolinkers = list("ul_medical")

/obj/machinery/telecomms/server/map_preset/ulyanovsk/public
	id = "Public Server"
	freq_listening = list(UL_PUB_FREQ)
	channel_tags = list(list(UL_PUB_FREQ, "Ulyanovsk", "#0b9612"))
	autolinkers = list("ul_public")

/obj/machinery/telecomms/broadcaster/map_preset/ulyanovsk
	id = "UL Broadcaster A"
	network = "ULcomsat"
	autolinkers = list("ul_broadcasterA")

//			Items

/obj/item/device/radio/map_preset/ulyanovsk
	name = "GCCV Ulyanovsk shortwave radio"
	icon = 'mods/_fd/_maps/gccv_ulyanovsk/icons/ulyanovsk.dmi'
	icon_state = "walkietalkie_gcc-1"
	matter = list(MATERIAL_GLASS = 25, MATERIAL_ALUMINIUM = 75, MATERIAL_SILVER = 50)
	frequency = UL_PUB_FREQ
	channels = list("UL PUBLIC" = 1)

/obj/item/device/radio/intercom/map_preset/ulyanovsk
	name = "GCCV Ulyanovsk Intercom"
	frequency = UL_PUB_FREQ
	channels = list("UL PUBLIC" = 1)

/obj/item/device/encryptionkey/map_preset/ulyanovsk
	name = "GCCV Ulyanovsk EKey"
	icon = 'mods/_fd/_maps/gccv_ulyanovsk/icons/ulyanovsk.dmi'
	icon_state = "gcc_cypherkey"
	channels = list("UL PUBLIC" = 1)

/obj/item/device/encryptionkey/map_preset/ulyanovsk/all
	name = "GCCV Ulyanovsk Command EKey"
	icon_state = "gcc_cypherkey_cic"
	channels = list("UL CIC" = 1, "UL SPECOPS" = 1, "UL ENGINEERING" = 1, "UL MEDICAL" = 1, "UL PUBLIC" = 1)

/obj/item/device/encryptionkey/map_preset/ulyanovsk/specops
	name = "GCCV Ulyanovsk SpecOps EKey"
	icon_state = "gcc_cypherkey_specops"
	channels = list("UL SPECOPS" = 1, "UL PUBLIC" = 1)

/obj/item/device/encryptionkey/map_preset/ulyanovsk/eng
	name = "GCCV Ulyanovsk Engineering EKey"
	icon_state = "gcc_cypherkey_eng"
	channels = list("UL ENGINEERING" = 1, "UL PUBLIC" = 1)

/obj/item/device/encryptionkey/map_preset/ulyanovsk/med
	name = "GCCV Ulyanovsk Medical EKey"
	icon_state = "gcc_cypherkey_med"
	channels = list("UL MEDICAL" = 1, "UL PUBLIC" = 1)

/obj/item/device/radio/headset/map_preset/ulyanovsk
	ks1type = /obj/item/device/encryptionkey/map_preset/ulyanovsk
	icon = 'mods/_fd/_maps/gccv_ulyanovsk/icons/ulyanovsk.dmi'
	icon_state = "gcc_headset"

/obj/item/device/radio/headset/map_preset/ulyanovsk/command
	ks1type = /obj/item/device/encryptionkey/map_preset/ulyanovsk/all

/obj/item/device/radio/headset/map_preset/ulyanovsk/specops
	ks1type = /obj/item/device/encryptionkey/map_preset/ulyanovsk/specops

/obj/item/device/radio/headset/map_preset/ulyanovsk/eng
	ks1type = /obj/item/device/encryptionkey/map_preset/ulyanovsk/eng

/obj/item/device/radio/headset/map_preset/ulyanovsk/med
	ks1type = /obj/item/device/encryptionkey/map_preset/ulyanovsk/med
