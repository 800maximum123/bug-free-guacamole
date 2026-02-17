/obj/structure/bed/padded/raised
	layer = 3.1
	pixel_y = 8

/mob/living
	var/raised = FALSE

/mob/living/Life()
	. = ..()
	if(raised)
		layer = 3.2

/obj/structure/bed/padded/raised/post_buckle_mob(mob/living/M)
	..()
	if(M.buckled == src)
		M.pixel_y += src.pixel_y
		M.raised = TRUE
	else
		M.pixel_y = initial(M.pixel_y)
		M.raised = FALSE
