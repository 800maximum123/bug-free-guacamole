/proc/intro_sequence()
	for(var/mob/living/carbon/human/human as anything in GLOB.player_list)
		human.play_screen_text(
			"<span class='maptext' style=font-size:24pt;text-align:left valign='top'><u>\[ШТУРМ УЛЬЯНОВСКА\]</u><br>" + "\[Ремонтная станция глубоко в тылу врага\]<br>" + "█:█, ██<br>" + "\[ Третий Флот \]<br>" + "\[Капитан\], [human]<br> </span>", /atom/movable/screen/screen_text/picture/fleetlogo)
		var/admin_names
		for(var/client/admin in GLOB.admins)
			admin_names += "[admin.ckey]<br>"
		human.play_screen_text("<span class='maptext' style=font-size:24pt;text-align:left valign='top'>Directed by: <br>[admin_names]", /atom/movable/screen/screen_text)

// human.play_screen_text("<span class='maptext' style=font-size:24pt;text-align:left valign='top'><u>
// [uppertext(GLOB.round_statistics.round_name)]</u></span><br>"
//  + "[SSmapping.configs[GROUND_MAP].map_name]<br>"
//  + "[worldtime2text("hh:mm")], [time2text(REALTIMEOFDAY, "DD-MMM-[GLOB.game_year]")]<br>"
//  + "Gamma Troop<br>"
// + "[human.job], [human]<br>", /atom/movable/screen/text/screen_text/picture/gamma_troop)

			// var/admin_names
