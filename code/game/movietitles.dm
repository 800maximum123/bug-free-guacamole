#define CREDIT_ROLL_SPEED 185
#define CREDIT_SPAWN_SPEED 20
#define CREDIT_ANIMATE_HEIGHT (14 * world.icon_size)
#define CREDIT_EASE_DURATION 22

GLOBAL_LIST(end_titles)

/client/var/list/credits

/client/proc/RollCredits()
	set waitfor = FALSE

	if(get_preference_value(/datum/client_preference/show_credits) != GLOB.PREF_YES)
		return

	if(!GLOB.end_titles)
		GLOB.end_titles = generate_titles()

	LAZYINITLIST(credits)

	if(mob)
		mob.overlay_fullscreen("fishbed",/obj/screen/fullscreen/fishbed)
		mob.overlay_fullscreen("fadeout",/obj/screen/fullscreen/fadeout)

		if(mob.get_preference_value(/datum/client_preference/play_lobby_music) == GLOB.PREF_YES)
			sound_to(mob, sound(null, channel = GLOB.lobby_sound_channel))
			if(isnull(GLOB.end_credits_song))
				var/title_song = pick('sound/music/spooky_fields.ogg')
				sound_to(mob, sound(title_song, wait = 0, volume = 40, channel = GLOB.lobby_sound_channel))
			else if(get_preference_value(/datum/client_preference/play_admin_midis) == GLOB.PREF_YES)
				sound_to(mob, sound(GLOB.end_credits_song, wait = 0, volume = 40, channel = GLOB.lobby_sound_channel))
	sleep(50)
	var/list/_credits = credits
	verbs += /client/proc/ClearCredits
	for(var/I in GLOB.end_titles)
		if(!credits)
			return
		var/obj/screen/credit/T = new(null, I, src)
		_credits += T
		T.rollem()
		sleep(CREDIT_SPAWN_SPEED)
	sleep(CREDIT_ROLL_SPEED - CREDIT_SPAWN_SPEED)

	ClearCredits()
	verbs -= /client/proc/ClearCredits

/client/proc/ClearCredits()
	set name = "Stop End Titles"
	set category = "OOC"
	verbs -= /client/proc/ClearCredits
	QDEL_NULL_LIST(credits)
	mob.clear_fullscreen("fishbed")
	mob.clear_fullscreen("fadeout")
	sound_to(mob, sound(null, channel = GLOB.lobby_sound_channel))

/obj/screen/credit
	icon_state = "blank"
	mouse_opacity = 0
	alpha = 0
	screen_loc = "1,1"
	plane = HUD_PLANE
	layer = HUD_ABOVE_ITEM_LAYER
	var/client/parent
	var/matrix/target

/obj/screen/credit/Initialize(mapload, credited, client/P)
	. = ..()
	parent = P
	maptext = {"<div style="font:'Small Fonts'">[credited]</div>"}
	maptext_height = world.icon_size * 2
	maptext_width = world.icon_size * 14

/obj/screen/credit/proc/rollem()
	var/matrix/M = matrix(transform)
	M.Translate(0, CREDIT_ANIMATE_HEIGHT)
	animate(src, transform = M, time = CREDIT_ROLL_SPEED)
	target = M
	animate(src, alpha = 255, time = CREDIT_EASE_DURATION, flags = ANIMATION_PARALLEL)
	spawn(CREDIT_ROLL_SPEED - CREDIT_EASE_DURATION)
		if(!QDELETED(src))
			animate(src, alpha = 0, transform = target, time = CREDIT_EASE_DURATION)
			sleep(CREDIT_EASE_DURATION)
			qdel(src)
	parent.screen += src

/obj/screen/credit/Destroy()
	if(parent)
		parent.screen -= src
		LAZYREMOVE(parent.credits, src)
		parent = null
	return ..()

/proc/generate_titles()
	RETURN_TYPE(/list)
	var/list/titles = list()
	var/list/cast = list()
	var/list/chunk = list()
	var/list/possible_titles = list()
	var/chunksize = 0
	if(!GLOB.end_credits_title)
		/* Establish a big-ass list of potential titles for the "episode". */
		possible_titles += "THE [pick("LEGACY OF ", "REBELLION OF ", "LAST DAYS OF ", "RETURN OF ", "SECRETS OF ", "CONQUEST OF ",
							"TWILIGHT OF ", "AFTERMATH OF ", "CURSE OF ", "DAWN OF ", "RECKONING OF ", "IRON HAND OF ", "BURDEN OF ", "SHADOW OVER ", "PRICE OF ")]\
							[pick("GAIAN UPRISING", "BOXCUTTER PLATOON", "ICCG CRUSADE", "DRAGUNY CAMPAIGN", "SCG FRONTLINE",
							"RESISTANCE MOVEMENT", "OCCUPATION WAR", "PEOPLE'S STRUGGLE", "LOST FLEET", "FORGOTTEN LEGION", "COLONIAL CRISIS", "OUTER RIM REVOLT", "SILENT WAR", "RED MARCH", "BLACK DAWN")]"
		possible_titles += "[pick("CALL OF GAIA ", "BATTLESPACE ", "PREEMPTIVE-STRIKE ", "SPCARMA ", "ESCAPE FROM GAIA ")][pick("", "REMASTER", "GOTY", "I", "2", "3", "4", "5", "6", "2295", "SOFTLINE")]\
							[pick("", ": POST-MODERN WARFARE", ": SOL AT WAR", ": WAR NEVER CHANGES", ": LAST CONFLICT", ": LOST FIELDS", ": HEGEMONS GAMBLE", ": SOL VS GILGAMESH", ": SILENCED STAR", ": CRY OF GALILEI", ": SOL, INDIE, AND LITTLE GAIA")]"
		titles += "<center><h1>[pick(possible_titles)]<h1></h1></h1></center>"
	else
		titles += "<center><h1>[GLOB.end_credits_title]<h1></h1></h1></center>"

	for(var/mob/living/carbon/human/H in GLOB.alive_mobs|GLOB.dead_mobs)
		if(findtext(H.real_name,"(mannequin)"))
			continue
		if(H.is_species(SPECIES_MONKEY) && findtext(H.real_name,"[lowertext(H.species.name)]")) //no monki
			continue
		if(isnull(H.last_ckey)) //don't mention these losers (prespawned corpses mostly)
			continue
		if(!length(cast) && !chunksize)
			chunk += "MOTION CAPTURE CAST:"
		var/job = ""
		if(GetAssignment(H) != "Unassigned")
			job = ", [uppertext(GetAssignment(H))]"
		var/used_name = H.real_name
		var/datum/computer_file/report/crew_record/R = get_crewmember_record(H.real_name)
		if(R && R.get_rank())
			var/datum/mil_rank/rank = GLOB.mil_branches.get_rank(R.get_branch(), R.get_rank())
			if(rank.name_short)
				used_name = "[rank.name_short] [used_name]"
		var/showckey = 0
		if(H.ckey && H.client)
			if(H.client.get_preference_value(/datum/client_preference/show_ckey_credits) == GLOB.PREF_SHOW)
				showckey = 1
		var/singleton/cultural_info/actor_culture = SSculture.get_culture(H.get_cultural_value(TAG_CULTURE))
		if(!actor_culture || !(H.species.spawn_flags & SPECIES_CAN_JOIN) || prob(10))
			actor_culture = SSculture.get_culture(CULTURE_HUMAN)
		if(!showckey)
			if(prob(90))
				chunk += "[actor_culture.get_random_name(H.pronouns)]\t \t \t \t[uppertext(used_name)][job]"
			else
				var/datum/pronouns/P = H.choose_from_pronouns()
				chunk += "[used_name]\t \t \t \t[uppertext(P.him)]SELF"
		else
			chunk += "[uppertext(actor_culture.get_random_name(H.pronouns))] a.k.a. '[uppertext(H.ckey)]'\t \t \t \t[uppertext(used_name)][job]"
		chunksize++
		if(chunksize > 2)
			cast += "<center>[jointext(chunk,"<br>")]</center>"
			chunk.Cut()
			chunksize = 0
	if(length(chunk))
		cast += "<center>[jointext(chunk,"<br>")]</center>"

	titles += cast

	var/list/corpses = list()
	var/list/monkies = list()
	var/list/scg_casualties = 0
	var/list/iccg_casualties = 0
	var/list/civilian_casualties = 0
	for(var/mob/living/carbon/human/H in GLOB.dead_mobs)
		if(isnull(H.last_ckey)) //no prespawned corpses
			continue
		if(H.is_species(SPECIES_MONKEY) && findtext(H.real_name,"[lowertext(H.species.name)]"))
			monkies[H.species.name] += 1
		else if(H.real_name)
			corpses += H.real_name

		if(H.faction == MOB_FACTION_SCG)
			scg_casualties += 1
		else if(H.faction == MOB_FACTION_ICCG)
			iccg_casualties += 1
		else if(H.faction == MOB_FACTION_NEUTRAL)
			civilian_casualties += 1
	for(var/spec in monkies)
		var/datum/species/S = all_species[spec]
		corpses += "[monkies[spec]] [lowertext(monkies[spec] > 1 ? S.name_plural : S.name)]"
	if(length(corpses))
		titles += "<center>BASED ON REAL EVENTS<br>In memory of [english_list(corpses)].</center>"

	if(scg_casualties != 0)
		titles += "<center>[scg_casualties] SolGov troops and loyalists have died...</center>"
	if(iccg_casualties != 0)
		titles += "<center>[scg_casualties] Indie soldiers have perished...</center>"
	if(civilian_casualties != 0)
		titles += "<center>[scg_casualties] innocent civilians have been lost...</center>"
	titles += "<center><b>WAR NEVER CHANGES.</b></center>"

	var/list/staff = list("DEVELOPERS:")
	var/list/staffjobs = list("Bug Tester", "Level Designer", "Balance Whiner", "Sprite Polisher", "Lore Writer", "Code Janitor", "Server Gremlin", "Patch Note Intern", "Exploit Finder",
							"AI Pathing Consultant", "Hotfix Deployer", "Mechanics Over-Complicator", "Particle Effect Enthusiast", "Save Corruption Specialist", "Assistant QA Lead (Unpaid)", "Government Censor")

	var/list/goodboys = list()
	for(var/client/C)
		if(!C.holder || C.is_stealthed())
			continue

		if(C.holder.rights & (R_DEBUG|R_ADMIN))
			var/singleton/cultural_info/cult = SSculture.cultural_info_by_name[pick(SSculture.cultural_info_by_name)]
			staff += "[uppertext(pick(staffjobs))] - [cult.get_random_name(pick(MALE, FEMALE))] a.k.a. '[C.key]'"
		else if(C.holder.rights & R_MOD)
			goodboys += "[C.key]"

	titles += "<center>[jointext(staff,"<br>")]</center>"
	if(length(goodboys))
		titles += "<center>SPECIAL THANKS:<br>[english_list(goodboys)]</center><br>"

	var/disclaimer = "<br>Published by [GLOB.using_map.company_name].<br>All rights reserved.<br>\
					This interactive software is protected under the intellectual property laws of the Sol Central Government<br> and other nations throughout the galaxy.<br>\
					First Release Platform: [pick("Mars", "Luna", "Earth", "Venus", "Phobos", "Ceres", "Tiamat", "Ceti Epsilon", "Eos", "Pluto", "Ouere",\
					"Tadmor", "Brahe", "Pirx", "Iolaus", "Saffar", "Gaia")].<br>"

	disclaimer += pick("Unauthorized reproduction, rental, or streaming of this game may result in an ERT raid on your hab-unit.",
					"Gameplay may cause dizziness, nausea, or sudden desire to overthrow your local planetary government.",
					"All characters and factions depicted in this game are fictitious... except the ones you know are real.",
					"[GLOB.using_map.company_name] reminds you: save early, save often, and never trust the autosave.",
					"This software contains optional microtransactions. Purchasing them is mandatory.",
					"Any resemblance to actual wars, occupations, or rebellions is purely coincidental. Or classified.",
					"For best experience, please play in a cryosleep chamber with neural uplink enabled.",
					"Warning: Prolonged play may lead to permanent assignment to the SCG Army.",
					"NPC deaths are simulated. Player deaths are permanent. Please enjoy responsibly.",
					"This software is definitely not a propaganda device created and utilized for recruiting into the SCG Armed Forces,\
					nor is it designed to create distrust and hate towards GCC and their actions.")

	titles += "<hr>"
	titles += "<center><span style='font-size:6pt;'>[JOINTEXT(disclaimer)]</span></center>"

	titles += "<center>THANKS <b>YOU</b> FOR PLAYING!</center>"

	return titles
