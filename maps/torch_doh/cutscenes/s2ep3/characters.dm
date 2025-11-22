//СПЕЦЭФФФЕКТЫ
/mob/living/simple_animal/cutscene_character/hit_impact
	name = "Контактное попадание"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/impact.dmi'
	icon_state = "impact_pulse"
	should_show_name = FALSE
	mouse_opacity = FALSE
	alpha = 0
/mob/living/simple_animal/cutscene_character/hit_impact/Life()
	. = ..()
	layer = 4.3
/mob/living/simple_animal/cutscene_character/hit_impact/rotated/Initialize()
	. = ..()
	SetTransform(rotation = 180)
/mob/living/simple_animal/cutscene_character/hit_impact/rotated/Life()
	. = ..()
	layer = 3.9

/mob/living/simple_animal/cutscene_character/hit_impact/muzzle_norotation
	alpha = 255
/mob/living/simple_animal/cutscene_character/hit_impact/muzzle
	alpha = 255
/mob/living/simple_animal/cutscene_character/hit_impact/muzzle/Initialize()
	. = ..()
	SetTransform(rotation = 180)

//ПЕРСОНАЖИ

/mob/living/simple_animal/cutscene_character/emmy
	name = "Эмми Р."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Emmy.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/rifler_actual
	name = "Кристиана Р."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Rifler.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/luke
	name = "Люк Л."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Luke.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/kai
	name = "Уфурзар"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Kai.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/pavel
	name = "Павел С."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Pavel.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/cf355
	name = "CF-355"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_CF.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/fourth
	name = "Четвёртая"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_IV.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

	alpha = 150
	color = "#e40031"
/mob/living/simple_animal/cutscene_character/fourth/Life()
	. = ..()
	layer = 3.9

/mob/living/simple_animal/cutscene_character/soldier
	name = "Солдат"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/soldiers.dmi'
	icon_state = "Mech Pilot"
	icon_living = "Mech Pilot"
	icon_dead = "Mech Pilot"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/soldier_enemy
	name = "Солдат"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/soldiers.dmi'
	icon_state = "Ascent Mech Pilot"
	icon_living = "Ascent Mech Pilot"
	icon_dead = "Ascent Mech Pilot"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/mech1
	name = "Эмми Р."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/mecha_characters.dmi'
	icon_state = "hero"
	icon_living = "hero"
	icon_dead = "hero"
	should_show_name = FALSE
/mob/living/simple_animal/cutscene_character/mech1/Initialize()
	. = ..()
	SetTransform(2)

/mob/living/simple_animal/cutscene_character/mech2
	name = "Солдат"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/mecha_characters.dmi'
	icon_state = "basic"
	icon_living = "basic"
	icon_dead = "basic"
	should_show_name = FALSE
/mob/living/simple_animal/cutscene_character/mech2/Initialize()
	. = ..()
	SetTransform(2)

/mob/living/simple_animal/cutscene_character/mech3
	name = "Враг"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/mecha_characters.dmi'
	icon_state = "ascent"
	icon_living = "ascent"
	icon_dead = "ascent"
	should_show_name = FALSE
/mob/living/simple_animal/cutscene_character/mech3/Initialize()
	. = ..()
	SetTransform(2)
/mob/living/simple_animal/cutscene_character/mech3/Life()
	. = ..()
	layer = 4.3

/mob/living/simple_animal/cutscene_character/mech3_2
	name = "Враг"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/mecha_characters.dmi'
	icon_state = "ascent"
	icon_living = "ascent"
	icon_dead = "ascent"
	should_show_name = FALSE
/mob/living/simple_animal/cutscene_character/mech3_2/Initialize()
	. = ..()
	SetTransform(2)
/mob/living/simple_animal/cutscene_character/mech3_2/Life()
	. = ..()
	layer = 3.9

/mob/living/simple_animal/cutscene_character/radio
	icon = 'icons/obj/machines/radio.dmi'
	icon_state = "intercom"
	name = "Радио"
	mouse_opacity = FALSE
	should_show_name = FALSE
