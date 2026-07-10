// Attachable cameras for clothes, so like body or helmet cams
/obj/item/attachable_camera
	name = "wearable camera"
	desc = "A small camera with a microphone that can be attached to various piece of clothes to stream live-feed. \
			Usually worn by law-enforcement officers on uniforms and soldiers on helmets to prevent misconduct."
	icon = 'icons/obj/tools/attachable_camera.dmi'
	icon_state = "camera"
	w_class = ITEM_SIZE_TINY
	/// On what clothes you can put the camera on?
	var/list/allowed_clothes = list(
		/obj/item/clothing/under,
		/obj/item/clothing/suit,
		/obj/item/clothing/head,
	)
	/// What camera it will attach?
	var/obj/machinery/camera/camera = /obj/machinery/camera/network/security
	var/obj/item/device/radio/radio = /obj/item/device/radio

/obj/item/device/radio/attachable_camera
	name = "built-in radio"
	desc = "How did you take this out?!"
	w_class = ITEM_SIZE_TINY
	power_usage = 0
	canhear_range = 7
	frequency = SEC_FREQ
	cell = null
	broadcasting = FALSE
	listening = FALSE
	on = TRUE

// Variants for Gaia
/obj/item/attachable_camera/gaia
	name = "Gaia wearable camera"
	camera = /obj/machinery/camera/network/gaia

/obj/item/attachable_camera/iccg
	name = "ICCG wearable camera"
	camera = /obj/machinery/camera/network/helmet_iccg
	radio = /obj/item/device/radio/attachable_camera/iccg

/obj/item/device/radio/attachable_camera/iccg
	frequency = ICCGN_CAM_FREQ

/obj/item/attachable_camera/scg
	name = "SCG wearable camera"
	camera = /obj/machinery/camera/network/helmet_scg
	radio = /obj/item/device/radio/attachable_camera/scg

/obj/item/device/radio/attachable_camera/scg
	frequency = SFV_CAM_FREQ
