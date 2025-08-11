/datum/map/gaia/setup_map()
	..()

/datum/map/gaia/get_map_info()
	. = list()
	. += "Welcome to <b>[full_name]</b>, a former colony world now torn apart by the Gaian Conflict — a brutal war between the Solar Central Government and the Gilgamesh Colonial Confederation."
	. += "Once a thriving green planet, Gaia is now a shattered warzone where loyalist partisans and occupying forces clash daily across ruined cities, rebel hideouts, and strategic facilities."
	. += "This map features asymmetrical gameplay: SCG irregulars operate from makeshift base and engage in guerrilla tactics, while GCC forces maintain fortified garrisons and martial law."
	. += "Choose your side — disrupt the occupiers, or restore order to the planet by force."
	return jointext(., "<br>")
