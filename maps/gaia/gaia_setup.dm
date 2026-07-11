/datum/map/gaia/setup_map()
	..()

/datum/map/gaia/get_map_info()
	. = list()
	. += "Welcome to <b>[full_name]</b>, a former farm world now torn apart by the Gaian Conflict - a brutal war between the Solar Central Government and the Gilgamesh Colonial Confederation."
	. += "Choose your side - disrupt the occupiers, or restore order to the planet by force."
	return jointext(., "<br>")
