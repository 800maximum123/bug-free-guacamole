/obj/sturcture/fd/interactive/basic_power/fuse_box/filtration/turn_on()
	area.unbreathable = FALSE
	. = ..()

/obj/sturcture/fd/interactive/basic_power/fuse_box/filtration/turn_off()
	area.unbreathable = TRUE
	. = ..()

/obj/structure/fd/decorative_pipes
	name = "pipe"
	desc = "Simple pipe."
	icon = 'mods/_fd/_maps/metro/icons/pipes.dmi'
	icon_state = "large_pipe_ground"

/particles/gasleak
	name = "gasleak"

	icon = 'icons/effects/particles.dmi'
	icon_state = list("steam_1" = 1, "steam_2" = 1, "steam_3" = 1)

	width = 200
	height = 500
	count = 2400
	spawning = 20
	lifespan = 40
	fade = 40
	position = generator("box", list(-8, -8), list(8, 0), NORMAL_RAND)
	friction = 0.1
	color = COLOR_PALE_BTL_GREEN
	gravity = list(0, 1)
	drift = generator("vector", list(-0.3, -0.4), list(0.3, 0.4))
	velocity = generator("box", list(-2, 3), list(2, 3), NORMAL_RAND)

/obj/particle_emitter/gasleak
	particle_type = "gasleak"
	appearance_flags = NO_CLIENT_COLOR
	layer = FIRE_LAYER
	alpha = 100

/obj/structure/fd/interactive/leak
	name = "pipe"
	desc = "Шипит...."

	desc_special_show = TRUE
	desc_special = {"Похоже, <span style="color: green;">газ</span> идёт отсюда."}

	icon = 'mods/_fd/_maps/metro/icons/pipes.dmi'
	icon_state = "large_pipe_ground"

	var/datum/sound_token/sound_token
	var/sound_id

	var/obj/particle_emitter/P
	var/area/A

/obj/sturcture/fd/interactive/leak/Initialize()
	. = ..()

	A = get_area(src)
	START_PROCESSING(SSobj,src)

/obj/sturcture/fd/interactive/leak/Process()
	update_sound()

	if(A.unbreathable && !P)
		P = new /obj/particle_emitter/gasleak(get_turf(src))
		switch(dir)
			if(NORTH)
				P.pixel_y = pixel_y + 15
				layer = FIRE_LAYER + 0.1
			if(SOUTH)
				P.pixel_y = pixel_y + 5
			if(WEST)
				P.pixel_x = pixel_x - 15
				P.pixel_y = pixel_y + 5
			if(EAST)
				P.pixel_x = pixel_x + 15
				P.pixel_y = pixel_y + 5

	if(!A.unbreathable && P)
		qdel(P)

/obj/sturcture/fd/interactive/leak/proc/update_sound()
	if(!sound_id)
		sound_id = "[type]_[sequential_id(/obj/sturcture/fd/interactive/leak)]"
	if(A.unbreathable)
		if(!sound_token)
			sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, 'sound/machines/pipeleak.ogg', volume = 50)
		sound_token.SetVolume(50)
	else if(sound_token)
		QDEL_NULL(sound_token)
