/mob/living/simple_animal/cutscene_character/invisible_speakers
	name = "speaker"
	desc = "..."
	mouse_opacity = FALSE

	icon_state = "none"
	icon_living = "none"
	icon_dead = "none"

	should_show_name = FALSE
	alpha = 0

	maptext_x = 8
	maptext_y = 16

/mob/living/simple_animal/cutscene_character/invisible_speakers/Initialize()
	maptext = STYLE_SMALLFONTS_OUTLINE("[name]", 7, COLOR_WHITE, COLOR_BLACK)

	. = ..()

/mob/living/simple_animal/cutscene_character/amelia/s2ep2/amelia_eyes
	name = "eyes"
	desc = "..."
	mouse_opacity = FALSE

	icon_state = "Amelia Eyes"
	icon_living = "Amelia Eyes"
	icon_dead = "Amelia Eyes"

	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/s2ep5/computer
	name = "computer"
	desc = "..."
	mouse_opacity = FALSE

	icon = 'mods/_fd/fd_assets/icons/machinery/computer.dmi'
	icon_state = "engineering_terminal"
	icon_living = "engineering_terminal"
	icon_dead = "engineering_terminal"

	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/s2ep5/wall
	name = "wall"
	desc = "..."
	mouse_opacity = FALSE

	icon = 'mods/_fd/fd_assets/icons/turfs/wall/wall_metal.dmi'
	icon_state = "me_ge_t1"
	icon_living = "me_ge_t1"
	icon_dead = "me_ge_t1"

	color = "#575757"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/s2ep5/chair
	name = "chair"
	desc = "..."
	mouse_opacity = FALSE

	icon = 'mods/_fd/fd_assets/icons/structures/furniture/furniture.dmi'
	icon_state = "chair_noble_d"
	icon_living = "chair_noble_d"
	icon_dead = "chair_noble_d"

	color = "#808080"
	should_show_name = FALSE
