/obj/structure/bed/padded/raised
	layer = 3.1
	pixel_y = 8

/mob
	var/should_update_layer = FALSE
	var/forced_layer

/mob/living/Life()
	. = ..()
	if(should_update_layer)
		layer = forced_layer

/obj/structure/bed/post_buckle_mob(mob/living/M)
	..()
	if(M.buckled == src)
		M.pixel_y += pixel_y
		M.pixel_x += pixel_x
		M.should_update_layer = TRUE
		M.forced_layer = layer + 0.01
	else
		M.pixel_y = initial(M.pixel_y)
		M.pixel_x = initial(M.pixel_x)
		M.should_update_layer = FALSE
		M.forced_layer = initial(M.layer)
