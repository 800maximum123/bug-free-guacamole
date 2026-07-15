
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
	var/style_open = "<span class='maptext' style=text-align:center valign='top'>"
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
	style_open = "<span class='maptext' style=font-size:20pt;text-align:left valign='top'>"
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


/atom/movable/screen/screen_text/potrait
	screen_loc = "LEFT,TOP-3"
	maptext_height = 64
	maptext_width = 400
	maptext_x = 66
	maptext_y = 0
	letters_per_update = 2
	fade_out_delay = 10 SECONDS
	style_open = "<span class='maptext' style=font-size:20pt;text-align:left valign='top'>"
	style_close = "</span>"

/atom/movable/screen/screen_text/potrait/Initialize(mapload, datum/hud/hud_owner, name, icon_to_use, image_to_play)
	. = ..()
	var/image/alertimage = image(icon_to_use, icon_state = image_to_play)
	alertimage.appearance_flags = APPEARANCE_UI
	overlays += alertimage
	var/atom/movable/holding_movable = new
	holding_movable.appearance_flags = APPEARANCE_UI|KEEP_TOGETHER
	holding_movable.mouse_opacity = FALSE

	var/mutable_appearance/mugshot_name = mutable_appearance()
	mugshot_name.appearance_flags = APPEARANCE_UI
	mugshot_name.maptext_width = 66 // 64 (the icon) + 1 buffer each side
	mugshot_name.maptext_x = -1
	mugshot_name.maptext_y = -1
	mugshot_name.plane = plane
	mugshot_name.layer = layer+0.3

	if(!name)
		name = ""
	mugshot_name.maptext = "<span class='maptext' style=font-size:6px;text-align:center>[name]</span>"

	holding_movable.overlays += mugshot_name

	vis_contents += holding_movable

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

	icon_choice = input(usr, "Upload Icon? (64x64 for best result)", "Icon") in list("Yes","No")
	if(icon_choice == "Yes")
		icon_choice = input(usr, "Choose an icon", "Upload Icon") as null|file
		icon_choice_state = input(src, "Portrait icon state, leave blank for unknown.", "Icon state")
	else
		icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi'
		icon_choice_state = input(src, "Portrait icon state.", "Icon state") as null|anything in selectable_icons
		portrait_color = input(src, "Portrait color, leave blank for default.", "Icon state") in list("red", "green", "blue")
		if(!portrait_color)
			portrait_color = "green"
		icon_choice_state = icon_choice_state + "_[portrait_color]"
	if(!icon_choice_state)
		icon_choice_state = "unknown"
	var/text = input(src, "Enter the body text for the screen alert.", "Announcement Body") as null|text
	if(!text)
		return
	name = input(src, "Enter the name to be put inside the portrait.", "Name") as null|text
	var/title = input(src, "Enter the title of the screen alert. Leave blank for the default title.", "Announcement Title") as null|text
	if(!title)
		title = "Command Announce"
	for(var/mob/mob_receiver in GLOB.player_list)
		mob_receiver.play_screen_text("<span class='maptext' style=font-size:24pt;text-align:left valign='top'><u>[uppertext(title)]</u></span><br>" + text, new /atom/movable/screen/screen_text/potrait(null, null, name, icon_choice, icon_choice_state))
	message_admins("[key_name_admin(src)] has made an admin screen alert.")
	log_admin("[key_name_admin(src)] made an admin screen alert: [text]")

/proc/shitcoded_screenalert(name, title = "Command Announce", text, icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state)
	if(!icon_choice_state)
		icon_choice_state = "unknown"
	for(var/mob/mob_receiver in GLOB.player_list)
		mob_receiver.play_screen_text("<span class='maptext' style=font-size:24pt;text-align:left valign='top'><u>[uppertext(title)]</u></span><br>" + text, new /atom/movable/screen/screen_text/potrait(null, null, name, icon_choice, icon_choice_state))

/atom/movable/screen/screen_text/potrait/faster
	fade_out_delay = 4 SECONDS

/*
/atom/movable/screen/text/screen_text/picture/potrait_custom_mugshot
	image_to_play = "custom"
	screen_loc = "LEFT,TOP-3"
	maptext_width = 400
	image_to_play_offset_y = 0
	maptext_y = 0
	letters_per_update = 2

#define MAX_NON_COMMTITLE_LEN 9

/atom/movable/screen/text/screen_text/picture/potrait_custom_mugshot/Initialize(mapload, datum/hud/hud_owner, mob/living/mugshottee)
	. = ..()
	var/atom/movable/holding_movable = new
	holding_movable.appearance_flags = APPEARANCE_UI|KEEP_TOGETHER
	holding_movable.mouse_opacity = MOUSE_OPACITY_TRANSPARENT

	var/mutable_appearance/mugshot = mutable_appearance()
	mugshot.appearance = mugshottee.appearance
	mugshot.pixel_x = image_to_play_offset_x + 17
	mugshot.pixel_y = image_to_play_offset_y - 1 //scale shittery meant this didn't line up exactly without the -1
	mugshot.layer = layer+0.1
	mugshot.plane = plane
	mugshot.transform = matrix().Scale(3) //only need to scale once, although this can actually be after as well alpha filter stuff, makes no diff. we use a NEW matrix to also fix things like people lying down
	mugshot.dir = SOUTH

	var/mutable_appearance/alphafilter = mutable_appearance('icons/effects/alphacolors.dmi', "announcement")
	alphafilter.appearance_flags = APPEARANCE_UI
	alphafilter.render_target = "*mugshots"

	mugshot.overlays += alphafilter
	mugshot.filters += filter(arglist(alpha_mask_filter(0, 0, null, "*mugshots")))

	holding_movable.overlays += mugshot

	var/image/static_overlay = image('icons/UI_Icons/screen_alert_images.dmi', icon_state = image_to_play+"_static", pixel_y = image_to_play_offset_y, pixel_x = image_to_play_offset_x)
	static_overlay.appearance_flags = APPEARANCE_UI
	static_overlay.alpha = 75
	static_overlay.layer = layer+0.2
	static_overlay.plane = plane
	holding_movable.overlays += static_overlay

	var/mutable_appearance/mugshot_name = mutable_appearance()
	mugshot_name.appearance_flags = APPEARANCE_UI
	mugshot_name.maptext_width = 66 // 64 (the icon) + 1 buffer each side
	mugshot_name.maptext_x = -1
	mugshot_name.maptext_y = -1
	mugshot_name.plane = plane
	mugshot_name.layer = layer+0.3

	var/cleaned_realname = mugshottee.real_name
	var/firstname = copytext(cleaned_realname, 1, findtext(cleaned_realname, " "))
	var/lastname = trim(copytext(cleaned_realname, findtext(cleaned_realname, " ")))
	var/nametouse
	if(length(lastname) >= 1 && length(lastname) <= MAX_NON_COMMTITLE_LEN)
		nametouse = lastname
	else if(length(firstname) >= 1 && length(firstname) <= MAX_NON_COMMTITLE_LEN)
		nametouse = firstname
	else if(length(cleaned_realname) >= 1)
		if(length(cleaned_realname) > MAX_NON_COMMTITLE_LEN)
			//cleans too long clone names down to a better fitting length
			cleaned_realname = replacetext(cleaned_realname, regex(@"CS-.-"), "")
		nametouse = copytext(cleaned_realname, 1, MAX_NON_COMMTITLE_LEN+1)
	else
		nametouse = "UNKNOWN"
	var/user_name = trim(mugshottee.comm_title + " " + nametouse)
	mugshot_name.maptext = "<span class='maptext' style=font-size:6px;text-align:center>[user_name]</span>"

	holding_movable.overlays += mugshot_name

	vis_contents += holding_movable

#undef MAX_NON_COMMTITLE_LEN
*/
