/client/proc/add_client_color(mob/T as mob in GLOB.human_mobs)
	set category = "Debug"
	set name = "Add Client Color"
	set desc = "Adds a client color to a given mob"

	if(!check_rights())
		return

	if(!ishuman(T))
		to_chat(usr, "This can only be done to instances of type /mob/living/carbon/human")
		return

	var/mob/living/carbon/human/C = T

	var/rr = input("Enter color value", "Red-Red") as num|null
	var/rg = input("Enter color value", "Red-Green") as num|null
	var/rb = input("Enter color value", "Red-Blue") as num|null
	var/gr = input("Enter color value", "Green-Red") as num|null
	var/gg = input("Enter color value", "Green-Green") as num|null
	var/gb = input("Enter color value", "Green-Blue") as num|null
	var/br = input("Enter color value", "Blue-Red") as num|null
	var/bg = input("Enter color value", "Blue-Green") as num|null
	var/bb = input("Enter color value", "Blue-Blue") as num|null
	var/order = input("Enter order value.", "order") as num|null
	if(!usr)
		return
	if(!C)
		to_chat(usr, "Mob doesn't exist anymore")
		return

	if(order)
		var/datum/client_color/CC = new /datum/client_color()
		CC.client_color = list(rr,rg,rb, gr,gg,gb, br,bg,bb)
		CC.order = order
		C.client_colors |= CC
		sortTim(C.client_colors, GLOBAL_PROC_REF(cmp_clientcolor_order))
		C.update_client_color()

	log_and_message_admins(SPAN_NOTICE("gave [key_name(C)] a new client color."))

// /proc/cmp_clientcolor_order(datum/client_color/A, datum/client_color/B)
//	return B.order - A.order
