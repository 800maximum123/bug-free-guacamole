// Говнокод, но более-менее модульный

/obj/machinery/media/music_writer/interact(mob/user)
	var/dat = "Please insert a cassette.<br>"

	if(writing)
		dat = "Memory scan completed. <br>Writing the tune from scan of [customer.name] mind... Please, stand still."

	if(disk && !writing)
		dat += "<br><a href='?src=\ref[src];eject=1'>Eject Disk</a>"

	if(cooldown)
		dat = "[src] is recalibrating its systems for a new rewrite. Please, wait [cooldown/10] seconds."

	playsound(src, 'packs/infinity/sound/machines/console/console2.ogg', 40, 1)

	var/datum/browser/popup = new(user, "musicwriter", "Music Writer", 200, 100)
	popup.set_content(dat)
	popup.open()

/obj/machinery/media/music_writer/write_disk(mob/user)
	. = ..()
	disk.rewrites_left++
