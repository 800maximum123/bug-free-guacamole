/datum/mech_ability/death_mark
	name = "Метка смерти"
	action_state = "37"

	charges_max = 6
	charges = 6

	charges_cooldown = 10 SECONDS

/obj/screen/fullscreen/mech/kamina
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "kamina"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/mech/kamina/Initialize()
	. = ..()
	animate(src, transform = matrix1.Update(1,1,0,150,0), time = 1.5 SECOND, easing = SINE_EASING | EASE_OUT)

	spawn(4 SECONDS)
		animate(src, 1 SECOND, alpha = 0)

/obj/screen/novel_message/kamina
	var/matrix/matrix1

/obj/screen/novel_message/kamina/set_text(text, text_color)
	animate(src, 1 SECOND, alpha = 255)
	matrix1 = new()

	animate(src, transform = matrix1.Update(1,1,0,-60,0), time = 1 SECOND, easing = SINE_EASING | EASE_OUT)
	maptext = "<span class='maptext' style='font-size: 64px; color: [text_color]'>[text]</span>"

/obj/screen/novel_message/kamina/sec/set_text(text, text_color)
	animate(src, 1 SECOND, alpha = 255)
	matrix1 = new()

	animate(src, transform = matrix1.Update(1,1,0,30,0), time = 1 SECOND, easing = SINE_EASING | EASE_OUT)
	spawn(0.5 SECONDS)
		animate(src, transform = matrix1.Update(1.9,1.9), time = 0.1 SECOND, easing = SINE_EASING)
	maptext = "<span class='maptext' style='text-align: center; font-size: 32px; color: [text_color]'>[text]</span>"

/datum/mech_ability/death_mark/proc/kamina_speech1()
	var/message = "Ага!"
	var/colored = "#60cfa5"

	var/obj/screen/novel_message/kamina/speech = new /obj/screen/novel_message/kamina()
	speech.maptext_y = -90
	owner.client.screen += speech
	speech.set_text(message, colored)

	spawn(6 SECONDS)
		for(var/obj/screen/novel_message/kamina/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/datum/mech_ability/death_mark/proc/kamina_speech2()
	var/message = "Так держать!"
	var/colored = "#60cfa5"

	var/obj/screen/novel_message/kamina/sec/speech = new /obj/screen/novel_message/kamina/sec()
	speech.maptext_y = -250
	owner.client.screen += speech
	speech.set_text(message, colored)

	spawn(6 SECONDS)
		for(var/obj/screen/novel_message/kamina/sec/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/datum/mech_ability/death_mark/proc/kamina_speech3()
	var/message = "В яблочко!"
	var/colored = "#60cfa5"

	var/obj/screen/novel_message/speech = new /obj/screen/novel_message()
	speech.maptext_y = -310
	speech.maptext_x = -240
	owner.client.screen += speech
	speech.set_text(message, colored)

	spawn(6 SECONDS)
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/datum/mech_ability/death_mark/proc/kamina()
	owner.overlay_fullscreen("kamina", /obj/screen/fullscreen/mech/kamina)
	kamina_speech1()
	kamina_speech2()
	kamina_speech3()

	spawn(6 SECONDS)
		owner.clear_fullscreen("kamina")

/datum/mech_ability/death_mark/Process()

	if(charges == 0)
		charges = charges_max

	. = ..()
