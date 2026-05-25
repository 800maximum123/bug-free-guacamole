#define CALL_NONE 0
#define CALL_CALLING 1
#define CALL_RINGING 2
#define CALL_IN_CALL 3

/datum/computer_file/program/phone
	filename = "phone"
	filedesc = "Holopad Phone"
	extended_desc = "Use portable holopad functions from your PDA."
	ui_header = "phone_idle.gif"
	program_icon_state = "phone_idle"
	program_key_state = "generic_key"
	program_menu_icon = "phone"
	size = 1
	processing_size = 0
	requires_ntnet = TRUE
	requires_ntnet_feature = NTNET_COMMUNICATION
	available_on_ntnet = TRUE
	undeletable = TRUE
	usage_flags = PROGRAM_PDA|PROGRAM_NO_KILL
	category = PROG_UTIL

	var/stored_id = ""
	var/stored_uniq_id = ""
	var/error = ""
	var/set_ringtone = ""

	nanomodule_path = /datum/nano_module/program/holopad_client

/datum/computer_file/program/phone/on_shutdown()
	if(NM)
		var/datum/nano_module/program/holopad_client/NM2 = NM
		NM2.close_phantom()
	. = ..()

/datum/computer_file/program/phone/on_startup()
	. = ..()
	if(NM)
		var/datum/nano_module/program/holopad_client/NM2 = NM
		NM2.phone_app = src
		NM2.ensure_phantom()

/datum/computer_file/program/phone/process_tick()
	. = ..()
	if(NM)
		var/datum/nano_module/program/holopad_client/NM2 = NM
		var/status = NM2.get_status()
		NM2.set_phantom_loc()
		switch(status)
			if("Offline")
				program_icon_state = "phone_offline"
				ui_header = "phone_idle.gif"
				update_computer_icon()
			if("Idle")
				program_icon_state =  "phone_idle"
				ui_header = "phone_idle.gif"
				update_computer_icon()
			if("Dialing")
				program_icon_state =  "phone_dialing"
				ui_header = "phone_call.gif"
				update_computer_icon()
			if("Incoming call")
				program_icon_state =  "phone_incoming"
				ui_header = "phone_call.gif"
				update_computer_icon()
			if("In call")
				program_icon_state =  "phone_incall"
				ui_header = "phone_incall.gif"
				update_computer_icon()

/datum/nano_module/program/holopad_client
	name = "Phone Holopad"
	var/obj/item/device/holopad/phantom_holopad = null
	var/datum/computer_file/program/phone/phone_app

/datum/nano_module/program/holopad_client/proc/ensure_phantom()
	if(!phantom_holopad)
		var/atom/movable/A = nano_host()
		phantom_holopad = new /obj/item/device/holopad()
		phantom_holopad.loc = A
		phantom_holopad.anchored = TRUE

	if(phone_app.stored_id)
		phantom_holopad.id = phone_app.stored_id
	phone_app.stored_id = phantom_holopad.id
	if(phone_app.stored_uniq_id)
		phantom_holopad.uniq_id = phone_app.stored_uniq_id
	phone_app.stored_uniq_id = phantom_holopad.uniq_id
	if(phone_app.set_ringtone)
		phantom_holopad.ringtone = phone_app.set_ringtone

	phone_app.set_ringtone = phantom_holopad.ringtone
	if(phone_app.stored_id && phone_app.stored_uniq_id)
	{
		phantom_holopad.name = "[initial(phantom_holopad.name)] [phone_app.stored_id] #[phone_app.stored_uniq_id]"
		phantom_holopad.voice = "[initial(phantom_holopad.name)] [phone_app.stored_id]"
	}

/datum/nano_module/program/holopad_client/proc/close_phantom()
	if(istype(phantom_holopad))
		qdel(phantom_holopad)
		phantom_holopad = null

/*
Puts phantom holopad inside of a mob if its carrying the PDA
This is important because when holopad is inside a PDA - user cannot use it
But it cannot be always inside of the mob as that would be weird
*/
/datum/nano_module/program/holopad_client/proc/set_phantom_loc()
	if(!phantom_holopad)
		ensure_phantom()
		return
	var/atom/movable/A = nano_host()
	var/mob/living/carbon/human/carrier = A.loc
	if(carrier)
		phantom_holopad.loc = carrier
		return

	phantom_holopad.loc = A

/datum/nano_module/program/holopad_client/proc/get_status()
	if(!istype(phantom_holopad))
		return "Offline"
	if(phantom_holopad.call_state == CALL_NONE)
		return "Idle"
	if(phantom_holopad.call_state == CALL_CALLING)
		return "Dialing"
	if(phantom_holopad.call_state == CALL_RINGING)
		return "Incoming call"
	if(phantom_holopad.call_state == CALL_IN_CALL)
		return "In call"
	return "Unknown"

/datum/nano_module/program/holopad_client/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, datum/topic_state/state = GLOB.default_state)
	ensure_phantom()
	var/list/data = host.initial_data()
	if(istype(phantom_holopad))
		data["holopad_name"] = phantom_holopad.getName(1)
		data["call_state"] = get_status()
		data["call_target"] = phantom_holopad.abonent ? phantom_holopad.abonent.getName(1) : "None"
	else
		data["holopad_name"] = "Offline"
		data["call_state"] = "Offline"
		data["call_target"] = "None"

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "phone.tmpl", "Holopad", 400, 500, state = state)
		if(host?.update_layout())
			ui.auto_update_layout = 1
		ui.set_auto_update(1)
		ui.set_initial_data(data)
		ui.open()

/datum/nano_module/program/holopad_client/Topic(href, href_list)
	if(..())
		return TOPIC_HANDLED

	if(href_list["open"])
		ui_interact()
		return TOPIC_HANDLED

	// Place a call (opens target selection via holopad.placeCall)
	if(href_list["placecall"])
		ensure_phantom()
		if(!istype(phantom_holopad))
			phone_app.error = "Holopad offline"
			ui_interact()
			return TOPIC_HANDLED
		phantom_holopad.placeCall(usr)
		ui_interact()
		return TOPIC_HANDLED

	// Accept an incoming call
	if(href_list["acceptcall"])
		ensure_phantom()
		if(istype(phantom_holopad))
			phantom_holopad.acceptCall(usr, TRUE)
		ui_interact()
		return TOPIC_HANDLED

	// Hang up
	if(href_list["hangup"])
		ensure_phantom()
		if(istype(phantom_holopad))
			phantom_holopad.hangUp(FALSE)
		ui_interact()
		return TOPIC_HANDLED

	// Set ID
	if(href_list["setid"])
		ensure_phantom()
		if(istype(phantom_holopad))
			phantom_holopad.setID(usr, TRUE)
		phone_app.stored_id = phantom_holopad.id
		ui_interact()
		return TOPIC_HANDLED

	// Change ringtone
	if(href_list["changeringtone"])
		ensure_phantom()
		if(istype(phantom_holopad))
		{
			phantom_holopad.changeringtone(usr)
			phone_app.set_ringtone = phantom_holopad.ringtone
		}
		ui_interact()
		return TOPIC_HANDLED

	return TOPIC_HANDLED

#undef CALL_NONE
#undef CALL_CALLING
#undef CALL_RINGING
#undef CALL_IN_CALL
