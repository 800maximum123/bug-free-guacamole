/datum/map/lightbrigade/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/lightbrigade/get_map_info()
	. = list()
	. +=  "Welcome aboard the " + replacetext_char("<b>[station_name]</b>", "\improper", "") + ", a Sol Central Government Fleet starship. It is one of the few new, high-tech warships around."
	return jointext(., "<br>")

/datum/map/lightbrigade/send_welcome()
	var/obj/effect/overmap/visitable/ship/lightbrigade = SSshuttle.ship_by_type(/obj/effect/overmap/visitable/ship/lightbrigade)

	var/welcome_text = "<center><img src = fleetlogo.png /><br /><font size = 3><b>ГЭК \"Факел\"</b> Показания сенсоров:</font><br>"
	welcome_text += "Отчёт сгенирирован [stationdate2text()] в [stationtime2text()]</center><br /><br />"
	welcome_text += "<hr>Текущая система:<br /><b>[lightbrigade ? system_name : "Unknown"]</b><br /><br>"

	if (lightbrigade) //If the overmap is disabled, it's possible for there to be no torch.
		var/list/space_things = list()
		welcome_text += "Текущие координаты:<br /><b>[lightbrigade.x]:[lightbrigade.y]</b><br /><br>"
		welcome_text += "Следующая система для прыжка:<br /><b>[generate_system_name()]</b><br /><br>"
		welcome_text += "Дней до Солнечной Системы:<br /><b>[rand(15,45)] days</b><br /><br>"
		welcome_text += "Дней с последнего визита в порт:<br /><b>[rand(60,180)] days</b><br /><hr>"
		welcome_text += "Результаты сканирования показали следующие потенциальные объекты для исследования:<br />"

		for(var/zlevel in map_sectors)
			var/obj/effect/overmap/visitable/O = map_sectors[zlevel]
			if(O.name == lightbrigade.name)
				continue
			if(istype(O, /obj/effect/overmap/visitable/ship/landable)) //Don't show shuttles
				continue
			if (O.hide_from_reports)
				continue
			space_things |= O

		for(var/obj/effect/overmap/visitable/O in space_things)
			var/location_desc = " at present co-ordinates."
			if(O.loc != lightbrigade.loc)
				var/bearing = round(90 - Atan2(O.x - lightbrigade.x, O.y - lightbrigade.y),5) //fucking triangles how do they work
				if(bearing < 0)
					bearing += 360
				location_desc = ", bearing [bearing]."
			welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

		welcome_text += "<hr>"

	post_comm_message("SFV Light Brigade Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New sensor scan update available at all communication consoles.")
