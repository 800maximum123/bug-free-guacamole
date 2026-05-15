/obj/screen/novel_message/note_name
	alpha = 255

/obj/screen/novel_message/note_name/set_text(text, text_color)
	SetTransform(3)
	maptext = "<span class='maptext' style='text-align: center; font-size: 300%; color: [text_color]'>[text]</span>"

/mob/living
	var/list/datum/interactive_note/note_archive = list()
	var/datum/interactive_note/opened_note

/mob/living/proc/add_to_archive(datum/interactive_note/note)
	LAZYDISTINCTADD(note_archive, note)

/datum/keybinding/living/fd/open_archive
	category = CATEGORY_FD
	hotkey_keys = list("I")
	name = "open_archive"
	full_name = "General: OPEN ARCHIVE"
	description = ""

/datum/keybinding/living/fd/open_archive/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob
	if(L.stat != CONSCIOUS)
		return FALSE

	if(L.resting)
		return FALSE

	if(!length(L.note_archive))
		return FALSE

/datum/keybinding/living/fd/open_archive/down(client/user)
	var/mob/living/M = user.mob

	if(M.reading)
		return FALSE

	var/list/options = list()
	var/list/actions = list()
	for(var/datum/interactive_note/pages as anything in M.note_archive)
		options[pages.name] = image('mods/_fd/fd_utilities/icons/newsource.dmi', "target_info")
		actions[pages.name] = pages

	var/chosen_option = show_radial_menu(M, M, options, radius = 65, require_near = TRUE)
	if(!chosen_option)
		return FALSE

	var/datum/interactive_note/page = actions[chosen_option]
	M.opened_note = page
	page.reveal_note_to_player(M)
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
	animate(src, transform = matrix(0, 600, MATRIX_TRANSLATE), time = 1 SECONDS, easing = LINEAR_EASING, flags = ANIMATION_PARALLEL)
	animate(src, transform = matrix(3, MATRIX_SCALE), time = 1 SECONDS, easing = LINEAR_EASING, flags = ANIMATION_PARALLEL)

/obj/screen/fullscreen/shade
	icon = 'mods/_fd/fd_assets/icons/screen_full.dmi'
	icon_state = "fullblack"
	allstate = 1
	alpha = 100

	plane = HUD_PLANE
	layer = 5.3

/obj/structure/fd/interactive/note
	name = "Записка"
	desc = "Содержит в себе всякое!"

	icon = 'mods/_fd/fd_assets/icons/obj/items/mrakiizar_book.dmi'
	icon_state = "torn_words"

	anchored = TRUE
	density = FALSE
	var/list/datum/interactive_note/attached_text = list()

/obj/structure/fd/interactive/note/Initialize(mapload, ...)
	. = ..()

	var/list/note_creation = attached_text.Copy()
	attached_text.Cut()
	for(var/notes in note_creation)
		new notes(src, null)

/obj/structure/fd/interactive/note/interact_with(mob/living/user)
	. = ..()

	if(user.reading)
		return FALSE

	var/list/options = list()
	var/list/actions = list()
	for(var/datum/interactive_note/pages as anything in attached_text)
		options[pages.name] = image(icon, icon_state)
		actions[pages.name] = pages

	var/chosen_option = show_radial_menu(user, src, options, radius = 25, require_near = TRUE)
	if(!chosen_option)
		return TRUE

	var/datum/interactive_note/page = actions[chosen_option]

	page.reveal_note_to_player(user)

	user.currently_interacting = src
	user.anchored = TRUE

	new page.type(null, user)

/datum/interactive_note
	var/name = "ЗАГОЛОВОК ДОКУМЕНТА"
	var/note_info = {"ОТОБРАЖАЕМЫЙ НИЖЕ ТЕКСТ"}

	var/note_overlay = /obj/screen/fullscreen/paperwork

	var/obj/structure/fd/interactive/note/connected_note

/datum/interactive_note/New(obj/structure/fd/interactive/note/note, mob/living/mind_archive)
	. = ..()
	if(note)
		connected_note = note
		note.attached_text += src

	if(mind_archive)
		mind_archive.add_to_archive(src)

	Initialize()

/datum/interactive_note/proc/Initialize()
	if(name)
		src.name = name

/datum/interactive_note/Destroy()
	if(connected_note)
		connected_note.attached_text -= src
		connected_note = null
	. = ..()

/datum/interactive_note/proc/reveal_note_to_player(mob/living/user)
	user.generate_binds()
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/maintext = new /obj/screen/player_message()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -230

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/datum/interactive_note/proc/hide_note_from_player(mob/living/user)
	user.reading = FALSE
	if(connected_note)
		user.currently_interacting = null
	if(user.opened_note)
		user.opened_note = null
	user.anchored = FALSE

	user.clear_fullscreen("background_note")
	user.clear_fullscreen("smallshade")

	if(connected_note)
		spawn(4)
			connected_note.ci.connected_mob = null
			user.client.screen -= connected_note.ci
		animate(connected_note.ci, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)

	for(var/obj/screen/messages in user.client.screen)
		if(istype(messages, /obj/screen/player_message))
			user.client.screen -= messages
			qdel(messages)
		if(istype(messages, /obj/screen/novel_message/note_name))
			user.client.screen -= messages
			qdel(messages)

////TEST///
/obj/structure/fd/interactive/note/test
	name = "ТЕСТОВАЯ ЗАПИСКА"
	attached_text = list(/datum/interactive_note/test, /datum/interactive_note/test2)

/datum/interactive_note/test
	name = "ТЕСТОВАЯ ЗАПИСКА"
	note_info = {"Я пишу это сугубо для того чтобы проверить насколько <span style="color: yellow;">длинное</span> сообщение я смогу сюда написать прежде чем текст начнёт вылезать или не помещаться в пределы экрана игрока. \
	Если вам нужен ориентир по количеству текста которое можно уместить на одной странице - <span style="color: yellow;">ориентируйтесь на эту записку</span>."}

/datum/interactive_note/test2
	name = "ТЕСТОВАЯ ЗАПИСКА 2"
	note_info = {"Эта записка тут только для того чтобы проверить функционал записок с несколькими пейджами."}
