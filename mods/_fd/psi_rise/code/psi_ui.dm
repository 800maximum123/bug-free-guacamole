/obj/screen/psi/hub/Click(location, control, click_params)
	. = ..()

	owner.psi.update_buttons()
