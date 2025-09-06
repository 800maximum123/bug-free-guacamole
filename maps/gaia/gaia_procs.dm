/datum/map/gaia/roundend_player_status()
	for(var/mob/Player in GLOB.player_list)
		if(Player.mind && !isnewplayer(Player))
			if(Player.stat != DEAD)
				var/turf/playerTurf = get_turf(Player)
				if(issilicon(Player))
					to_chat(Player, SPAN_COLOR("green", "<b>You remain operational after the operation as [Player.real_name].</b>"))
				else if (isNotStationLevel(playerTurf.z))
					to_chat(Player, SPAN_INFO("<b>You managed to survive, but were marooned in the area of operations as [Player.real_name]...</b>"))
				else
					to_chat(Player, SPAN_INFO("<b>You got through just another operation as [Player.real_name].</b>"))
			else
				if(isghost(Player))
					var/mob/observer/ghost/O = Player
					if(!O.started_as_observer)
						to_chat(Player, SPAN_COLOR("red", "<b>You did not survive the operation. War never changes...</b>"))
				else
					to_chat(Player, SPAN_COLOR("red", "<b>You did not survive the operation. War never changes...</b>"))

/datum/map/gaia/roundend_summary(list/data)
	var/desc
	var/survivors = data["surviving_total"]
	var/marooned_total = data["left_behind_total"]
	var/ghosts = data["ghosts"]

	if(survivors > 0)
		desc += "There [survivors > 1 ? "were <b>[survivors] survivors</b>" : "was <b>one survivor</b>"]"
		desc += " [marooned_total] MIA total</b>),"
		data += " and <b>[ghosts] KIA total</b>.<br>"
	else
		desc += "There were <b>no survivors</b>, <b>[ghosts] KIA total</b>."

	return desc

/datum/map/gaia/default_internal_channels()
	return list(
		num2text(PUB_FREQ)   = list(access_maint_tunnels),
		num2text(AI_FREQ)    = list(access_synth),
		num2text(ENT_FREQ)   = list(),
		num2text(ERT_FREQ)   = list(access_cent_specops),
		num2text(MED_I_FREQ) = list(access_iccg_med),
		num2text(SEC_I_FREQ) = list(access_iccg_sec),
		num2text(HAIL_FREQ)  = list(),
		num2text(SFV_FREQ)   = list(access_solgov_crew),
		num2text(ICCGN_FREQ) = list(access_iccg),
	)

/datum/map/gaia/setup_economy()
	for (var/datum/feed_network/N in news_network)
		N.CreateFeedChannel("Nyx Daily", "SolGov Minister of Information", 1, 1)
		N.CreateFeedChannel("The Gibson Gazette", "Editor Mike Hammers", 1, 1)
		N.CreateFeedChannel("Nezavisimyye Novosti", "Redaktor Aleksandr Chernitskiy", 1, 1)
		N.CreateFeedChannel("Verdad Gaiana", "The People", 1, 1)

	for(var/loc_type in typesof(/datum/trade_destination) - /datum/trade_destination)
		var/datum/trade_destination/D = new loc_type
		weighted_randomevent_locations[D] = length(D.viable_random_events)
		weighted_mundaneevent_locations[D] = length(D.viable_mundane_events)

	if(!station_account)
		station_account = create_account("[full_name] National Bank Account", "[full_name]", starting_money, ACCOUNT_TYPE_DEPARTMENT)

	for(var/job in allowed_jobs)
		var/datum/job/J = job
		var/dept = initial(J.department)
		if(dept)
			station_departments |= dept

	for(var/department in station_departments)
		department_accounts[department] = create_account("[department] Account", "[department]", department_money, ACCOUNT_TYPE_DEPARTMENT)

	department_accounts["Vendor"] = create_account("Vendor Account", "Vendor", 0, ACCOUNT_TYPE_DEPARTMENT)
	vendor_account = department_accounts["Vendor"]

// ADMIN PROCS
/client/proc/commander_message()
	set category = "Fun"
	set name = "Commander Message"

	if(!check_rights(R_FUN))
		return

	// Collect commanders
	var/mob/living/carbon/human/scg_commander
	var/mob/living/carbon/human/iccg_commander

	for(var/mob/living/carbon/human/H in GLOB.alive_mobs)
		if(H.mind && H.mind.assigned_job)
			if(istype(H.mind.assigned_job, /datum/job/scg_co))
				scg_commander = H
			else if(istype(H.mind.assigned_job, /datum/job/iccg_co))
				iccg_commander = H

	if(!scg_commander && !iccg_commander)
		to_chat(SPAN_WARNING("No commanders are currently present!"))
		return

	var/list/commanders = list()
	if(scg_commander)
		commanders += "SCG Commander ([scg_commander.name])"
	if(iccg_commander)
		commanders += "ICCG Commander ([iccg_commander.name])"
	var/mob/living/carbon/human/choice = input("Which commander do you want to speak as?", "Commander Message") as null|anything in commanders
	if(!choice)
		return

	if(choice == "SCG Commander ([scg_commander.name])")
		choice = scg_commander
	else if(choice == "ICCG Commander ([iccg_commander.name])")
		choice = iccg_commander

	var/msg = input("Enter the message for [choice.name]:", "Commander Message") as null|text
	if(!msg)
		return

	// Force the speech
	choice.say(msg)
