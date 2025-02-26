GLOBAL_LIST_INIT(potion_recipes, list("Potion of Affection" = "3 Lux, 5 Unum, 8 Nox",
									"Potion of Reconstruction" = "10 Lux, 4 Unum, 2 Nox",
									"Potion of Physical Change" = "5 Lux, 5 Unum, 5 Nox",
									"Potion of Foreshadowing" = "2 Lux, 2 Unum, 6 Nox",))

/obj/item/catalchemy/potion
	icon = 'mods/_fd/cat_alchemist/icons/alchemy.dmi'
	icon_state = "cauldron0"

/obj/item/catalchemy/spoon
	name = "wooden spoon"
	desc = "Simple eating spoon!"
	icon = 'mods/_fd/cat_alchemist/icons/cooking.dmi'
	icon_state = "spoon"
	w_class = ITEM_SIZE_TINY

/obj/item/catalchemy/ingredient
	name = "ingredient"
	desc = "Simple ingredient!"
	icon = 'mods/_fd/cat_alchemist/icons/alchemy.dmi'
	icon_state = "cauldron0"
// Прежде чем помещать этот ингредиент в котёл - его нужно растолочь
	var/pure = TRUE
// Если это смесь - может ли она использоваться в ещё каких-либо манипуляциях?
	var/manufactured = FALSE

// Состав
	var/high = 0
	var/medium = 0
	var/low = 0

// Модификаторы ингредиента
	var/increasing_difficulty = 0
	var/decreasing_difficulty = 0

	var/stability_buff = 0
	var/time_reducer = 0
	var/time_increaser = 0

/obj/effect/alchemy_cloud
	name = "cloud"
	desc = "cloud"
	icon = 'mods/_fd/cat_alchemist/icons/alchemy_effects.dmi'
	icon_state = "cloud_1"
	color = "#43cfc4"
	layer = ABOVE_HUMAN_LAYER

/obj/effect/alchemy_splash
	name = "splash"
	desc = "splash"
	icon = 'mods/_fd/cat_alchemist/icons/alchemy_effects.dmi'
	icon_state = "splash"
	color = "#43cfc4"
	layer = ABOVE_HUMAN_LAYER

/obj/effect/alchemy_brewing
	name = "brew"
	desc = "brew"
	icon = 'mods/_fd/cat_alchemist/icons/alchemy_effects.dmi'
	icon_state = "dazed"
	color = "#8ad6d0"
	layer = ABOVE_HUMAN_LAYER

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

/obj/effect/recipe_overlay/Click(location, control, params)
	. = ..()
	var/mob/living/user = usr

	if(do_after(user, 1 SECOND))
		to_chat(user, SPAN_GOOD("For [SPAN_COLOR("#5fffca", "[name]")] you will need: [SPAN_COLOR("#5fffca", "[GLOB.potion_recipes[name]]")]."))
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
		delay += 3

/obj/structure/catalchemy/cauldron
	name = "Cauldron"
	desc = "An big alchemist pot."
	icon = 'mods/_fd/cat_alchemist/icons/alchemy.dmi'
	icon_state = "cauldron_small"

	var/cooking = "Nothing"

// Параметры зелья. Добавляя какой-либо из ингредиентов - мы прибавляем числа к данным параметрам. Затем, на этапе замешивания, по ним определяется что мы варим!

	var/high = 0
	var/medium = 0
	var/low = 0

// Стандартное время варки. Увеличивается или уменьшается в зависимости от добавляемых ингредиентов
	var/brewing = FALSE
	var/brewing_time = 100
// Шанс появлений QTE, понижающего стабильность/увеличивающего время
	var/difficulty = 10
// Здоровье зелья. Если стабильность опустится до нуля - зелье испортится!
	var/stability = 50
	var/destroyed = FALSE
// Мы готовы! Время наливать!
	var/ready = FALSE

	anchored = TRUE

/obj/structure/catalchemy/cauldron/examine(mob/user)
	. = ..()
	to_chat(user, SPAN_NOTICE("There is currently [SPAN_COLOR("#ffc933", "[high] Lux")], [SPAN_COLOR("#adadad", "[medium] Unum")], and [SPAN_COLOR("#503075", "[low] Nox")]!"))
	if(brewing)
		to_chat(user, SPAN_NOTICE("Potion will be ready in [SPAN_COLOR("#27f0f7", "[brewing_time] seconds")]!"))
	if(stability <= 20)
		to_chat(user, SPAN_NOTICE("This brew [SPAN_COLOR("#b40505", "doesn't look promising")]..."))

/obj/structure/catalchemy/cauldron/use_tool(obj/item/I, mob/living/user, list/click_params)
	. = ..()

	if(istype(I, /obj/item/catalchemy/spoon) && !brewing && !ready)
		to_chat(user, SPAN_NOTICE("You starting to stir the contents of cauldron with a spoon!"))
		if(do_after(user, 3 SECOND))
			for(var/obj/effect/recipe_overlay/recipe in loc)
				qdel(recipe)
			brewing = TRUE
			var/obj/effect/alchemy_brewing/brew = new /obj/effect/alchemy_brewing(loc)
			brew.pixel_y = pixel_y + 8
			START_PROCESSING(SSobj, src)
			return 1

	if(istype(I, /obj/item/catalchemy/ingredient))
		var/obj/item/catalchemy/ingredient/part = I
		if(ready)
			to_chat(user, SPAN_DANGER("Firstly clear the pot!"))
		if(part.pure)
			to_chat(user, SPAN_DANGER("You can't add [part] to the cauldron in it's current state!"))
			return 0
		if(do_after(user, 1 SECOND))
			var/cloud_sprite = rand(1,5)
			var/obj/effect/alchemy_cloud/cloud = new /obj/effect/alchemy_cloud(loc)
			cloud.pixel_y = pixel_y + 20
			cloud.icon_state = "cloud_[cloud_sprite]"
			var/obj/effect/alchemy_splash/splash = new /obj/effect/alchemy_splash(loc)
			splash.pixel_y = pixel_y + 10
			animate(splash, 1 SECONDS, alpha = 0)
			animate(cloud, 2 SECONDS, alpha = 0)
			var/adjust = cloud.pixel_y + 10
			animate(cloud, pixel_y = adjust, time = 2 SECONDS, easing = LINEAR_EASING | EASE_IN)
			spawn(3 SECONDS)
				qdel(cloud)
				qdel(splash)

			high += part.high
			medium += part.medium
			low += part.low

			if(part.increasing_difficulty > 0)
				difficulty += part.increasing_difficulty
			if(part.decreasing_difficulty > 0)
				difficulty -= part.decreasing_difficulty

			if(part.time_increaser > 0)
				brewing_time += part.time_increaser
			if(part.time_reducer > 0)
				brewing_time -= part.time_reducer

			if(part.stability_buff > 0)
				stability += part.stability_buff

			qdel(part)
			return 1


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
		to_chat(user, SPAN_GOOD("For [SPAN_COLOR("#5fffca", "[cooking]")] you will need: [SPAN_COLOR("#5fffca", "[GLOB.potion_recipes[cooking]]")]."))
		for(var/obj/effect/recipe_overlay/old_recipe in loc)
			qdel(old_recipe)
		var/obj/effect/recipe_overlay/recipe = new /obj/effect/recipe_overlay(loc)
		recipe.alpha = 0
		recipe.icon_state = "[cooking]"
		recipe.name = "[cooking]"
		recipe.desc = "For [SPAN_COLOR("#5fffca", "[cooking]")] you will need: [SPAN_COLOR("#5fffca", "[GLOB.potion_recipes[cooking]]")]."
		animate(recipe, 3 SECONDS, alpha = 150)
		animate(recipe, pixel_y = 22, time = 3 SECONDS, easing = LINEAR_EASING | EASE_IN)
		START_PROCESSING(SSobj, recipe)

		return 1
