/obj/machinery/button/alternate/door/keypad
	name = "door keypad"
	desc = "Кодовая панель управления дверью."
	icon = 'mods/_fd/_maps/metro/icons/panel.dmi'
	icon_state = "panel_password"

	var/correctcode = "909"
	var/keycode = ""


/obj/machinery/button/alternate/door/keypad/interface_interact(user)
	if(!CanInteract(user, DefaultTopicState()))
		return FALSE
	if(istype(user, /mob/living/carbon))
		if(!operable())
			to_chat(user, "<span class='warning'>Панель не работает.</span>")
			return
		add_fingerprint(user)
		if(!allowed(user))
			to_chat(user, "<span class='danger'>Access Denied</span>")
			flick("[icon_state]-denied", src)
			return
		ShowKeypad(user)
	return TRUE


/obj/machinery/button/alternate/door/keypad/proc/ShowKeypad(mob/living/user)
	var/html = {"<html><body><div align='center'>
		<b>Введите пароль</b><hr color='#FF9900'>
		<font size='5'>[keycode ? keycode : "••••"]</font><hr color='#FF9900'>
		<table border='0'>"}

	for(var/i = 1 to 9 step 3)
		html += "<tr>"
		for(var/j = 0 to 2)
			html += "<td><a href='?src=\ref[src];choice=[i+j]'>[i+j]</a></td>"
		html += "</tr>"

	html += {"<tr>
		<td><a href='?src=\ref[src];choice=C'>C</a></td>
		<td><a href='?src=\ref[src];choice=0'>0</a></td>
		<td><a href='?src=\ref[src];choice=R'>R</a></td>
	</tr></table>"}

	if(keycode == correctcode)
		html += "<br><a href='?src=\ref[src];choice=pulse'><font color='green'><b>ОТКРЫТЬ / ЗАКРЫТЬ ДВЕРЬ</b></font></a>"
		html += " | <a href='?src=\ref[src];choice=change_code'>Сменить код</a>"

	html += "<br><small>ID двери: <b>[id_tag ? id_tag : "Не привязана"]</b></small>"
	html += "</div></body></html>"

	var/datum/browser/popup = new(user, "keypad", "Keypad v0.4", 230, 360)
	popup.set_content(html)
	popup.set_title_image(user.browse_rsc_icon(icon, icon_state))
	popup.open()

/obj/machinery/button/alternate/door/keypad/Topic(href, href_list)
	..()
	var/mob/living/user = usr
	if(!user || !operable() || !Adjacent(user))
		return

	switch(href_list["choice"])
		if("1","2","3","4","5","6","7","8","9","0")
			keycode += href_list["choice"]
		if("C","R")
			keycode = ""
		if("pulse")
			if(keycode == correctcode)
				activate()
				playsound(loc, 'sound/machines/defib_success.ogg', 40, 1)
			else
				playsound(loc, 'sound/machines/buzz-two.ogg', 40, 1)
			keycode = ""
		if("change_code")
			if(keycode == correctcode)
				var/newcode = input(user, "Новый код:", "Смена кода", correctcode) as text|null
				if(newcode && length(newcode))
					correctcode = newcode
					to_chat(user, "<span class='notice'>Код изменён на [correctcode]!</span>")

	ShowKeypad(user)
	return
