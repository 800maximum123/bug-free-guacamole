
/**
 * proc for playing a screen_text on a mob.
 * enqueues it if a screen text is running and plays i otherwise
 * Arguments:
 * * text: text we want to be displayed
 * * alert_type: typepath OR atom for screen text type we want to play here
 * * override_color: the color of the text to use
 */
/mob/proc/play_screen_text(text, alert_type = /atom/movable/screen/screen_text, override_color = "#FFFFFF")
	var/atom/movable/screen/screen_text/text_box = isatom(alert_type) ? alert_type : new alert_type()
	text_box.text_to_play = text
	text_box.player = client
	if(override_color)
		text_box.color = override_color

	LAZYADD(client.screen_texts, text_box)
	if(LAZYLEN(client.screen_texts) == 1) //lets only play one at a time, for thematic effect and prevent overlap
		invoke_async(text_box, TYPE_PROC_REF(/atom/movable/screen/screen_text, play_to_client))


/client
	//screen_text vars
	///lazylist of screen_texts for this client, first in this list is the one playing
	var/list/atom/movable/screen/screen_text/screen_texts

/atom/movable/screen/screen_text
	icon = null
	icon_state = null
	alpha = 255

	maptext_height = 64
	maptext_width = 480
	maptext_x = 0
	maptext_y = 0
	mouse_opacity = FALSE
	layer = RUNE_LAYER
	plane = RUNECHAT_PLANE
	screen_loc = "LEFT,TOP-3"
	appearance_flags = NO_CLIENT_COLOR|PIXEL_SCALE

	///Time taken to fade in as we start printing text
	var/fade_in_time = 0
	///Time before fade out after printing is finished
	var/fade_out_delay = 2 SECONDS
	///Time taken when fading out after fade_out_delay
	var/fade_out_time = 0.5 SECONDS
	///delay between playing each letter. in general use 1 for fluff and 0.5 for time sensitive messsages
	var/play_delay = 0.5
	///letters to update by per text to per play_delay
	var/letters_per_update = 1

	///opening styling for the message
	var/style_open = "<span class='langchat' style=text-align:center valign='top'>"
	///closing styling for the message
	var/style_close = "</span>"
	///var for the text we are going to play
	var/text_to_play
	///The client that this text is for
	var/client/player

///proc for actually playing this screen_text on a mob.
/atom/movable/screen/screen_text/proc/play_to_client()
	player?.add_to_screen(src)
	if(fade_in_time)
		animate(src, alpha = 255)
	var/list/lines_to_skip = list()
	var/static/html_locate_regex = regex("<.*>")
	var/tag_position = findtext(text_to_play, html_locate_regex)
	var/reading_tag = TRUE
	while(tag_position)
		if(reading_tag)
			if(text_to_play[tag_position] == ">")
				reading_tag = FALSE
			lines_to_skip += tag_position
			tag_position++
		else
			tag_position = findtext(text_to_play, html_locate_regex, tag_position)
			reading_tag = TRUE

	for(var/letter = 2 to length(text_to_play) + letters_per_update step letters_per_update)
		if(letter in lines_to_skip)
			continue
		maptext = "[style_open][copytext_char(text_to_play, 1, letter)][style_close]"
		sleep(play_delay)

	addtimer(new Callback(src, PROC_REF(after_play)), fade_out_delay)

///handles post-play effects like fade out after the fade out delay
/atom/movable/screen/screen_text/proc/after_play()
	if(!fade_out_time)
		end_play()
		return

	animate(src, alpha = 0, time = fade_out_time)
	addtimer(new Callback(src, PROC_REF(end_play)), fade_out_time)

///ends the play then deletes this screen object and plays the next one in queue if it exists
/atom/movable/screen/screen_text/proc/end_play()
	if(!player)
		qdel(src)
		return

	player.remove_from_screen(src)
	LAZYREMOVE(player.screen_texts, src)
	qdel(src)

	if(QDELETED(player))
		QDEL_NULL_LIST(player.screen_texts)
		return

	if(LAZYLEN(player.screen_texts))
		player.screen_texts[1].play_to_client() // Theres more?

/// Wrapper for adding anything to a client's screen
/client/proc/add_to_screen(screen_add)
	screen += screen_add

/// Wrapper for removing anything from a client's screen
/client/proc/remove_from_screen(screen_remove)
	screen -= screen_remove




/atom/movable/screen/screen_text/picture
	maptext_height = 64
	maptext_width = 480
	maptext_x = 66
	maptext_y = 32
	letters_per_update = 1
	fade_out_delay = 5 SECONDS
	screen_loc = "WEST:6,1:5"
	style_open = "<span class='langchat' style=font-size:20pt;text-align:left valign='top'>"
	style_close = "</span>"
	icon = 'mods/_fd/fd_events/icons/screen_alert_images.dmi' // Оно продолжало ныть что это плохой файл.
	///image that will display on the left of the screen alert
	var/image_to_play
	///y offset of image
	var/image_to_play_offset_y = 32
	///x offset of image
	var/image_to_play_offset_x = 0

/atom/movable/screen/screen_text/picture/Initialize(mapload, datum/hud/hud_owner)
	. = ..()
	var/image/alertimage = image(icon, icon_state = image_to_play, pixel_y = image_to_play_offset_y, pixel_x = image_to_play_offset_x)
	alertimage.appearance_flags = APPEARANCE_UI
	overlays += alertimage

/atom/movable/screen/screen_text/picture/fleetlogo
	image_to_play = "fleetlogo"
/*
/client/proc/screen_alert_menu()
	set name = "Send Screen Alert"
	set category = "Special Verbs"

	if(!check_rights(R_ADMIN))
		return
	var/icon_choice
	var/icon_choice_state
	var/selectable_icons = list(
		"marine",
		"marine_2",
		"requisition",
		"requisition_2",
		"overwatch",
		"overwatch_2",
		"overwatch_3",
		"spacesuit",
		"robot",
		"pilot",
		"pilot_2",
		"pilot_3",
		"beret",
		"beret_2",
		"trooper",
		"trooper_2",
		"scientist",
		"messiah",
		"militia",
		"guy",
		"agent",
		"operator",
		"vip",
		"woman_fleet",
		"pmc_bald",
		)
	var/portrait_color
	var/name

	icon_choice = tgui_input_list(src, "Upload Icon? (64x64 for best result)", "Icon", list("Yes","No"))
	if(icon_choice == "Yes")
		icon_choice = input(usr, "Choose an icon", "Upload Icon") as null|file
		icon_choice_state = tgui_input_text(src, "Portrait icon state, leave blank for unknown.", "Icon state")
	else
		icon_choice = 'icons/ui_icons/screen_alert_images.dmi'
		icon_choice_state = tgui_input_list(src, "Portrait icon state.", "Icon state", selectable_icons)
		portrait_color = tgui_input_list(src, "Portrait color, leave blank for default.", "Icon state", list("red", "green", "blue"))
		if(!portrait_color)
			portrait_color = "green"
		icon_choice_state = icon_choice_state + "_[portrait_color]"
	if(!icon_choice_state)
		icon_choice_state = "unknown"
	var/text = tgui_input_text(src, "Enter the body text for the screen alert.", title = "Announcement Body", multiline = TRUE, encode = FALSE)
	if(!text)
		return
	name = tgui_input_text(src, "Enter the name to be put inside the portrait.", title = "Name")
	var/title = tgui_input_text(src, "Enter the title of the screen alert. Leave blank for the default title.", title = "Announcement Title")
	if(!title)
		title = "Command Announce"
	var/list/alert_receivers = list()
	for(var/mob/living/carbon/human/human as anything in GLOB.alive_human_list)
		if(!faction_to_send)
			alert_receivers += human
		else if(faction_to_send == human.faction)
			alert_receivers += human
	alert_receivers += GLOB.observer_list
	for(var/mob/mob_receiver in alert_receivers)
		mob_receiver.play_screen_text("<span class='langchat' style=font-size:24pt;text-align:left valign='top'><u>[uppertext(title)]</u></span><br>" + text, new /atom/movable/screen/screen_text/potrait(null, null, name, icon_choice, icon_choice_state))
	message_admins("[key_name_admin(src)] has made an admin screen alert.")
	log_admin("[key_name_admin(src)] made an admin screen alert: [text]")
*/
