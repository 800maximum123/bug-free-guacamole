/obj/screen/novel_message/start_credits/note_name
	alpha = 255

/obj/screen/novel_message/start_credits/note_name/set_text(text, text_color)
	SetTransform(3)
	maptext = "<span class='maptext' style='text-align: center; font-size: 300%; color: [text_color]'>[text]</span>"

/mob/
	var/reading_note = FALSE
	var/datum/interactive_note/currently_reading

	var/list/datum/interactive_note/note_archive = list()

/datum/keybinding/mob/hide_note
	category = CATEGORY_FD
	hotkey_keys = list("Escape")
	name = "hide_note"
	full_name = "General: HIDE NOTE"
	description = ""

/datum/keybinding/mob/hide_note/down(client/user)
	var/mob/M = user.mob

	M.currently_reading.hide_note_from_player(M)
	return TRUE

/obj/screen/fullscreen/paperwork
	icon = 'mods/_fd/fd_utilities/icons/note_backgrounds.dmi'
	icon_state = "white_stripes"
	allstate = 1
	screen_loc = "CENTER,CENTER-7"

	plane = HUD_PLANE
	layer = 5.2

/obj/screen/fullscreen/paperwork/Initialize()
	. = ..()
	animate(src, transform = matrix(0, 600, MATRIX_TRANSLATE), time = 0.5 SECONDS, easing = LINEAR_EASING, flags = ANIMATION_PARALLEL)
	animate(src, transform = matrix(3, MATRIX_SCALE), time = 0.5 SECONDS, easing = LINEAR_EASING, flags = ANIMATION_PARALLEL)

/obj/screen/fullscreen/shade
	icon = 'mods/_fd/fd_assets/icons/screen_full.dmi'
	icon_state = "fullblack"
	allstate = 1
	alpha = 100

	plane = HUD_PLANE
	layer = 5.3

/obj/item/fd/interactive_note
	name = "Записка"
	desc = "Содержит в себе всякое!"

	icon = 'mods/_fd/fd_assets/icons/obj/items/mrakiizar_book.dmi'
	icon_state = "torn_words"

	anchored = TRUE
	var/list/datum/interactive_note/attached_text = list()

/obj/item/fd/interactive_note/Initialize(mapload, ...)
	. = ..()

	var/list/note_creation = attached_text.Copy()
	attached_text.Cut()
	for(var/notes in note_creation)
		new notes(src)

/obj/item/fd/interactive_note/attack_hand(mob/user)
	. = ..()

	if(user.reading_note)
		return FALSE

	if(length(attached_text) < 2)
		var/datum/interactive_note/text_to_show = attached_text[1]
		text_to_show.reveal_note_to_player(user)

		for(var/datum/interactive_note/archive_entries in user.note_archive)
			if(!text_to_show)
				user.note_archive += text_to_show

	else
		var/datum/interactive_note/option = input(user, "Выберите страницу, которую хотите прочесть") as null | anything in attached_text
		if(!option)
			return FALSE

		option.reveal_note_to_player(user)

		for(var/datum/interactive_note/archive_entries in user.note_archive)
			if(!option)
				user.note_archive += option

/datum/interactive_note
	var/name = "ЗАГОЛОВОК ДОКУМЕНТА"
	var/note_info = {"ОТОБРАЖАЕМЫЙ НИЖЕ ТЕКСТ"}

	var/note_overlay = /obj/screen/fullscreen/paperwork

	var/obj/item/fd/interactive_note/connected_note

/datum/interactive_note/New(obj/item/fd/interactive_note/note)
	. = ..()
	connected_note = note
	note.attached_text += src

	Initialize()

/datum/interactive_note/proc/Initialize()
	if(name)
		src.name = name

/datum/interactive_note/Destroy()
	connected_note.attached_text -= src
	connected_note = null
	. = ..()

/datum/interactive_note/proc/reveal_note_to_player(mob/user)
	user.reading_note = TRUE
	user.currently_reading = src

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/maintext = new /obj/screen/player_message()
		var/obj/screen/novel_message/start_credits/note_name/nameplate = new /obj/screen/novel_message/start_credits/note_name()
		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -230

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/datum/interactive_note/proc/hide_note_from_player(mob/user)
	user.reading_note = FALSE
	user.currently_reading = null

	user.clear_fullscreen("background_note")
	user.clear_fullscreen("smallshade")
	for(var/obj/screen/messages in user.client.screen)
		if(istype(messages, /obj/screen/player_message))
			user.client.screen -= messages
			qdel(messages)
		if(istype(messages, /obj/screen/novel_message/start_credits/note_name))
			user.client.screen -= messages
			qdel(messages)

////TEST///
/obj/item/fd/interactive_note/test
	name = "ТЕСТОВАЯ ЗАПИСКА"
	attached_text = list(/datum/interactive_note/test, /datum/interactive_note/test2)

/datum/interactive_note/test
	name = "ТЕСТОВАЯ ЗАПИСКА"
	note_info = {"Я пишу это сугубо для того чтобы проверить насколько <span style="color: yellow;">длинное</span> сообщение я смогу сюда написать прежде чем текст начнёт вылезать или не помещаться в пределы экрана игрока. \
	Если вам нужен ориентир по количеству текста которое можно уместить на одной странице - <span style="color: yellow;">ориентируйтесь на эту записку</span>."}

/datum/interactive_note/test2
	name = "ТЕСТОВАЯ ЗАПИСКА 2"
	note_info = {"Эта записка тут только для того чтобы проверить функционал записок с несколькими пейджами."}
