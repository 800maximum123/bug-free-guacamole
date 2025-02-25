GLOBAL_LIST_INIT(potion_recipes, list("Potion of Affection" = "3 Lux, 5 Unum, 8 Nox",
									"Potion of Reconstruction" = "10 Lux, 4 Unum, 2 Nox",
									"Potion of Physical Change" = "5 Lux, 5 Unum, 5 Nox",
									"Potion of Foreshadowing" = "2 Lux, 2 Unum, 6 Nox",))

/obj/item/catalchemy/potion
	icon = 'mods/_fd/cat_alchemist/icons/alchemy.dmi'
	icon_state = "cauldron0"


/obj/item/catalchemy/ingredient
	name = "ingredient"
	desc = "Simple ingredient!"
	icon = 'mods/_fd/cat_alchemist/icons/alchemy.dmi'
	icon_state = "cauldron0"
// Прежде чем помещать этот ингредиент в котёл - его нужно растолочь
	var/pure = TRUE
// Если это смесь - может ли она использоваться в ещё каких-либо манипуляциях?
	var/manufactured = FALSE

//Состав
	var/high = 0
	var/medium = 0
	var/low = 0

/obj/effect/recipe_overlay
	name = "Potion"
	desc = "Something..."
	icon = 'mods/_fd/cat_alchemist/icons/potions_icons.dmi'
	icon_state = "Potion of Affection"
	layer = ABOVE_HUMAN_LAYER
	mouse_opacity = TRUE
	anchored = TRUE
	var/do_animation = TRUE
	var/delay = 0

/obj/effect/recipe_overlay/attack_hand(mob/living/user)
	if(do_after(user, 1 SECOND))
		to_chat(user, SPAN_GOOD("For [name] you will need: [GLOB.potion_recipes[name]]."))
		return 1

/obj/effect/recipe_overlay/proc/reset_animation()
	animate(src, pixel_y = 22, time = 1 SECOND, easing = LINEAR_EASING | EASE_OUT)
	spawn(1 SECOND)
		do_animation = TRUE

/obj/effect/recipe_overlay/Process()

	if(delay > 0)
		delay -= 1

	if(!do_animation && delay == 0)
		reset_animation()

	if(do_animation && delay == 0)
		animate(src, pixel_y = 26, time = 1 SECOND, easing = LINEAR_EASING | EASE_IN)
		do_animation = FALSE
		delay += 5

/obj/structure/catalchemy/cauldron
	name = "Cauldron"
	desc = "An big alchemist pot."
	icon = 'mods/_fd/cat_alchemist/icons/alchemy.dmi'
	icon_state = "cauldron0"

	var/cooking = "Nothing"

// Параметры зелья. Добавляя какой-либо из ингредиентов - мы прибавляем числа к данным параметрам. Затем, на этапе замешивания, по ним определяется что мы варим!

	var/high = 0
	var/medium = 0
	var/low = 0

// Стандартное время варки. Увеличивается или уменьшается в зависимости от добавляемых ингредиентов
	var/brewing_time = 10 SECONDS
// Шанс появлений QTE, понижающего стабильность/увеличивающего время
	var/difficulty = 10
// Здоровье зелья. Если стабильность опустится до нуля - зелье испортится!
	var/stability = 50
	var/destroyed = FALSE
// Мы готовы! Время наливать!
	var/ready = FALSE

	anchored = TRUE
	density = TRUE

/obj/structure/catalchemy/cauldron/AltClick(mob/living/user)
// Список зелий позволяет просмотреть ингредиенты, необходимые для того или иного зелья. К сожалению, я не могу вынести его в переменные самого котла!
	var/list/potions = list(
		"Potion of Affection" = image('mods/_fd/cat_alchemist/icons/potions_icons.dmi', "Potion of Affection"),
		"Potion of Reconstruction" = image('mods/_fd/cat_alchemist/icons/potions_icons.dmi', "Potion of Reconstruction"),
		"Potion of Physical Change" = image('mods/_fd/cat_alchemist/icons/potions_icons.dmi', "Potion of Physical Change"),
		"Potion of Foreshadowing" = image('mods/_fd/cat_alchemist/icons/potions_icons.dmi', "Potion of Foreshadowing"),
		"Potion of Nerdness" = image('mods/_fd/cat_alchemist/icons/potions_icons.dmi', "ADD LATER"),
		"Potion of Idiotism" = image('mods/_fd/cat_alchemist/icons/potions_icons.dmi', "ADD LATER"),
		"Potion of Glowing" = image('mods/_fd/cat_alchemist/icons/potions_icons.dmi', "ADD LATER"),
		"Potion of Bloodlust" = image('mods/_fd/cat_alchemist/icons/potions_icons.dmi', "ADD LATER"),
		"Potion of Atomization" = image('mods/_fd/cat_alchemist/icons/potions_icons.dmi', "ADD LATER"),
		"Potion of Grave Fever" = image('mods/_fd/cat_alchemist/icons/potions_icons.dmi', "ADD LATER"),
	)

	var/chosen_potion = show_radial_menu(user, user, potions, radius = 60, require_near = TRUE)
	if (!chosen_potion)
		return 0

	cooking = chosen_potion
	if(do_after(user, 1 SECOND))
		to_chat(user, SPAN_GOOD("For [cooking] you will need: [GLOB.potion_recipes[cooking]]."))
		for(var/obj/effect/recipe_overlay/old_recipe in loc)
			qdel(old_recipe)
		var/obj/effect/recipe_overlay/recipe = new /obj/effect/recipe_overlay(loc)
		recipe.alpha = 0
		recipe.icon_state = "[cooking]"
		recipe.name = "[cooking]"
		recipe.desc = "For [cooking] you will need: [GLOB.potion_recipes[cooking]]."
		animate(recipe, 3 SECONDS, alpha = 150)
		animate(recipe, pixel_y = 22, time = 3 SECONDS, easing = LINEAR_EASING | EASE_IN)
		START_PROCESSING(SSobj, recipe)

		return 1
