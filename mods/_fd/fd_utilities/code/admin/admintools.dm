
/datum/controller/subsystem/jobs/check_general_join_blockers(mob/new_player/joining, datum/job/job)
	. = ..()
	if(check_rights(, show_msg = FALSE) || joining.client.enter_lock_bypass)
		return TRUE

/client
	var/enter_lock_bypass = 0


/client/proc/allow_to_join()
	set name = "Entering Lock Bypass"
	set category = "Special Verbs"

	if(holder)
		var/client/player = input("Select mob.", "Allow Bypass Entering Lock") as null|anything in GLOB.clients
		if(!player.enter_lock_bypass)
			player.enter_lock_bypass = 1
			to_chat(player, FONT_LARGE(SPAN_NOTICE("Высшие силы даровали возможность тебе зайти!")))
			if(player.get_preference_value(/datum/client_preference/staff/play_adminhelp_ping) == GLOB.PREF_HEAR)
				sound_to(player, sound('sound/ui/pm-notify.ogg', volume = 70))
			log_and_message_admins("Игроку [player.ckey] дали возможность зайти в игру.")
		else
			player.enter_lock_bypass = 0
			to_chat(player, FONT_LARGE(SPAN_NOTICE("Высшие силы изъяли у тебя возможность зайти!")))
			log_and_message_admins("У игрока [player.ckey] забрали возможность зайти в игру.")

/client/proc/remove_slot_crew_full() // fully close job slot
	set name = "Remove Fully Job Slot (Crew)"
	set category = "Admin"

	if(holder)
		var/list/jobs = list()
		for (var/datum/job/J in SSjobs.primary_job_datums)
			if(J.is_position_available())
				jobs[J.title] = J
		if (!jobs.len)
			to_chat(usr, "There are no avaible jobs.")
			return
		var/job_title = input("Please select job slot to close", "Close job slot")  as null|anything in jobs
		var/datum/job/job = jobs[job_title]
		if(job && job.is_position_available())
			job.make_position_unavailable_full()
			message_admins("A job slot for [job_title] has been closed by [key_name_admin(usr)]")
			return


/datum/job/proc/make_position_unavailable_full()
	total_positions = 0
