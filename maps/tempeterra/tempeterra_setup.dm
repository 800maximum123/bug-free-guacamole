/datum/map/tempeterra/setup_map()
	..()
	system_name = generate_system_name()
	minor_announcement = new(new_sound = sound('sound/AI/torch/commandreport.ogg', volume = 45))

/datum/map/tempeterra/get_map_info()
	. = list()
	. +=  "You're aboard the " + replacetext("<b>[station_name]</b>", "\improper", "") + ", an Expeditionary Corps starship. Its primary mission is looking for undiscovered sapient alien species, and general exploration along the way."
	. +=  "The vessel is staffed with a mix of SCG government personnel and hired contractors."
	. +=  "This area of space is uncharted, away from SCG territory. You might encounter remote outposts or drifting hulks, but no recognized government holds claim on this sector."
	return jointext(., "<br>")

/datum/map/tempeterra/send_welcome()
	var/obj/overmap/visitable/ship/torch = SSshuttle.ship_by_type(/obj/overmap/visitable/ship/sfv_tempeterra)

	var/welcome_text = "<center><img src = sollogo.png /><br />[FONT_LARGE("<b>SEV Torch</b> Показания Сенсоров:")]<br>"
	welcome_text += "Отчет сгенерирован [stationdate2text()] в [stationtime2text()]</center><br /><br />"
	welcome_text += "<hr>Текущая система:<br /><b>[torch ? system_name : "Unknown"]</b><br /><br>"

	if (torch) //If the overmap is disabled, it's possible for there to be no torch.
		var/list/space_things = list()
		welcome_text += "Текущие координаты:<br /><b>[torch.x]:[torch.y]</b><br /><br>"
		welcome_text += "Следующая система для прыжка:<br /><b>[generate_system_name()]</b><br /><br>"
		welcome_text += "Дней до Сола:<br /><b>[rand(15,45)] days</b><br /><br>"
		welcome_text += "Дней с последнего визита в порт:<br /><b>[rand(60,180)] days</b><br /><hr>"
		welcome_text += "Результаты сканирования показали следующие потенциальные объекты для исследования:<br />"

		for(var/zlevel in map_sectors)
			var/obj/overmap/visitable/O = map_sectors[zlevel]
			if(O.name == torch.name)
				continue
			if(istype(O, /obj/overmap/visitable/ship/landable)) //Don't show shuttles
				continue
			if (O.hide_from_reports)
				continue
			space_things |= O

		for(var/obj/overmap/visitable/O in space_things)
			var/location_desc = " на текущем квадрате."
			if(O.loc != torch.loc)
				var/bearing = get_bearing(torch, O)
				location_desc = ", по направлению [bearing]."
			welcome_text += "<li>\A <b>[O.name]</b>[location_desc]</li>"

		welcome_text += "<hr>"

	post_comm_message("SFV Tempeterra Sensor Readings", welcome_text)
	minor_announcement.Announce(message = "New [GLOB.using_map.company_name] Update available at all communication consoles.")
