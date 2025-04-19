/proc/move_to_resurgence(mob/living/carbon/human/target, mob/user)
	if(!target.stat)
		alert("Персонаж ещё недостаточно слаб для условий соглашения")
		return

	var/ckey = target.last_ckey // This var never has @, even if aghosted
	if(!ckey)
		alert("У персонажа нет души")
		return

	var/client/client = target.client || ckey2client(ckey)
	if(!client)
		alert("Клиента нет на сервере")
		return

	load_resurgence_map()
	log_and_message_admins("[target.real_name] будет сподвигнут на контракт.")

	var/datum/map_template/resurgence/map_data = GLOB.resurgence_map
	map_data.previous_body = target

	map_data.astral_body = duplicate_character(target, map_data.center, client)
	map_data.astral_body.set_dir(NORTH)
	map_data.astral_body.ckey = ckey //Manually transfer the key to log them in

	map_data.prev_admin_loc = get_turf(user)
	map_data.omega.ckey = user.ckey

/proc/return_from_resurgence(mob/living/carbon/human/target, revive)
	var/datum/map_template/resurgence/map_data = GLOB.resurgence_map

	if(!map_data.omega)
		var/text = "Контракт был использован вне условий соглашения."
		message_admins(text)
		log_admin(text)
		return FALSE

	var/mob/observer/ghost/ghost = map_data.omega.ghostize(FALSE)
	if(ghost)
		ghost.forceMove(map_data.prev_admin_loc)

//	QDEL_NULL(map_data.previous_body.client)

	map_data.previous_body.ckey = target.ckey
	map_data.previous_body.rejuvenate()

	qdel(map_data.astral_body)
	map_data.astral_body = null

	map_data.prev_admin_loc = null
	map_data.previous_body = null

	return TRUE

/proc/duplicate_character(mob/body_to_copy, turf/spawn_loc, client/client)
	RETURN_TYPE(/mob/living/carbon/human)

	var/datum/preferences/prefs = client.prefs
	for(var/slot in 1 to config.character_slots)
		var/datum/pref_record_reader/reader = prefs.load_pref_record(prefs.get_slot_key(slot))
		if(!reader)
			continue
		if(reader.read("real_name") == body_to_copy.real_name)
			prefs.load_character(slot)
			break

	var/mob/living/carbon/human/new_body = new(spawn_loc)
	prefs.copy_to(new_body)

	new_body.lastarea = get_area(spawn_loc)

	new_body.dna.ready_dna(new_body)
	new_body.dna.b_type = prefs.b_type
	new_body.sync_organ_dna()
	if(prefs.disabilities)
		// Set defer to 1 if you add more crap here so it only recalculates struc_enzymes once. - N3X
		new_body.dna.SetSEState(GLOB.GLASSESBLOCK,1,0)
		new_body.disabilities |= NEARSIGHTED

	// Do the initial caching of the player's body icons.
	new_body.force_update_limbs()
	new_body.update_eyes()
	new_body.regenerate_icons()

	return new_body
