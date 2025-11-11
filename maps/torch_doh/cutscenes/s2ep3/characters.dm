//СПЕЦЭФФФЕКТЫ
/mob/living/simple_animal/cutscene_character/hit_impact
	name = "Контактное попадание"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/impact.dmi'
	icon_state = "impact_pulse"
	should_show_name = FALSE
	mouse_opacity = FALSE
/mob/living/simple_animal/cutscene_character/hit_impact/Life()
	. = ..()
	layer = 4.3

//ПЕРСОНАЖИ

/mob/living/simple_animal/cutscene_character/emmy
	name = "Эмми Р."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Emmy.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/soldier
	name = "Солдат"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/soldiers.dmi'
	icon_state = "Mech Pilot"
	icon_living = "Mech Pilot"
	icon_dead = "Mech Pilot"
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
