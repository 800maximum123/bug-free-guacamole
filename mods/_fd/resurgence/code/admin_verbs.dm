/client/add_admin_verbs()
	. = ..()
	if(holder)
		verbs += /client/proc/cmd_admin_rejuvenate_mod

/client/remove_admin_verbs()
	. = ..()
	verbs -= /client/proc/cmd_admin_rejuvenate_mod

/client/proc/cmd_admin_rejuvenate_mod(mob/living/carbon/human/target as mob in SSmobs.mob_list)
	set category = "Special Verbs"
	set name = "Rejuvenate"

	if(!holder)
		to_chat(src, "Only administrators may use this command.")
		return

	if(!mob)
		return

	if(!istype(target))
		alert("Cannot revive a ghost")
		return

	if(!config.allow_admin_rev)
		alert("Admin revive disabled in config")
		return

	var/answer = alert("Вы точно хотите возродить [target.real_name]?", "Подтверждение", "Да", "Нет", "Хартия")
	switch(answer)
		if("Да")
			target.revive()
			log_and_message_admins("healed / revived [key_name_admin(target)]!")
		if("Хартия")
			if(!mob.stat)
				alert("Персонаж всё ещё в сознании")
				return
			var/datum/map_template/resurgence/map_data = GLOB.resurgence_map
			if(map_data?.astral_body)
				alert("Одна из душ уже находится на переговорах")
				return
			move_to_resurgence(target, usr)
