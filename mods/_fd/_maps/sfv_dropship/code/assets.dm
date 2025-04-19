/obj/floor_decal/industrial/outline/red/iccg
	name = "bloody-red outline"
	color = "#940004"

/turf/simulated/floor/reinforced/airless
	map_airless = TRUE

/obj/floor_decal/hull
	name = "hull edges"
	icon = 'mods/_fd/_maps/sfv_dropship/icons/decals.dmi'
	icon_state = "hull_edges"

/obj/floor_decal/hull/corner
	name = "hull corner"
	icon_state = "hull_corners"

/obj/machinery/button/blast_door/indicator
	icon = 'mods/_fd/_maps/sfv_dropship/icons/buttons.dmi'
	name = "blast door-control"
	desc = "It controls blast doors, remotely. This one with indicator."
	icon_state = "blastctrl"
	var/state = FALSE //state for indicator, really simple.



/obj/machinery/button/blast_door/indicator/on_update_icon()
	if(state)
		icon_state = "blastctrlin"
	else
		icon_state = "blastctrlin1"

/obj/machinery/button/blast_door/indicator/activate(mob/living/user)
	if(state)
		state = FALSE
	else
		state = TRUE
	..()
