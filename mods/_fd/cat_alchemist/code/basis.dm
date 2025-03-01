
GLOBAL_LIST_INIT(potion_recipes, list("Potion of Affection" = "3 Lux, 5 Unum, 8 Nox",
									"Potion of Reconstruction" = "10 Lux, 4 Unum, 2 Nox",
									"Potion of Physical Change" = "5 Lux, 5 Unum, 5 Nox",
									"Potion of Foreshadowing" = "2 Lux, 2 Unum, 6 Nox",))

GLOBAL_LIST_INIT(potions, list("3, 5, 8" = /obj/item/catalchemy/potion/affection,
							"10, 4, 2" = /obj/item/catalchemy/potion/reconstruction,
							"5, 5, 5" = /obj/item/catalchemy/potion/change,
							"2, 2, 6" = /obj/item/catalchemy/potion/foreshadowing))

/obj/item/catalchemy/potion
	name = "potion bottle"
	desc = "Bottle to store potions!"
	icon = 'mods/_fd/cat_alchemist/icons/glass_reagent_container.dmi'
	icon_state = "clear_bottle4"
	var/potion_id = "1, 1, 1"
	var/potion_to_hand = null
	var/filled_up = FALSE

/obj/item/catalchemy/potion/afterattack(atom/A as mob|obj|turf|area, mob/living/user as mob, proximity)
	if(istype(A, /obj/structure/catalchemy/cauldron))
		var/obj/structure/catalchemy/cauldron/pot = A
		if(filled_up)
			to_chat(user, SPAN_DANGER("This bottle already have something inside!"))
			return 0
		if(pot.ready == FALSE)
			to_chat(user, SPAN_DANGER("There is nothing to take YET!"))
			return 0
		audible_message(SPAN_NOTICE("[user] starts to fill [src] up!"))
		potion_id = "[pot.high], [pot.medium], [pot.low]"
		if(!(potion_id in GLOB.potions))
			to_chat(user, SPAN_DANGER("Contents of this [pot] is a mess! You can't get anything useful from it!"))
			return 0
		if(do_after(user, 5 SECOND))
			potion_to_hand = GLOB.potions[potion_id]
			new potion_to_hand(pot.loc)
			pot.ready = FALSE
			pot.high = 0
			pot.medium = 0
			pot.low = 0
			pot.brewing_time = 100
			pot.qte_timer = 30
			pot.stability = 50
			qdel(src)
			return 1

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

	w_class = ITEM_SIZE_TINY

/obj/item/catalchemy/pestle
	name = "pestle"
	desc = "Simple steel pestle!"
	icon = 'mods/_fd/cat_alchemist/icons/alchemy.dmi'
	icon_state = "pestle"

//.unEquip(tool, src)

/obj/item/catalchemy/mortar
	name = "mortar"
	desc = "Simple steel mortar!"
	icon = 'mods/_fd/cat_alchemist/icons/alchemy.dmi'
	icon_state = "mortar"

// В ступе может быть только два ингредиента. Если оба ингредиента помещены внутрь - вместо того чтобы растолочь их в труху, мы попытаемся смешать их
// в одну субстанцию, чтобы получить полностью новый ингредиент
	var/obj/item/catalchemy/ingredient/inside_one = null
	var/obj/item/catalchemy/ingredient/inside_two = null
	var/combination = "Nothing, Nothing"

/obj/item/catalchemy/mortar/use_tool(obj/item/I, mob/living/user, list/click_params)
	. = ..()

	if(istype(I, /obj/item/catalchemy/ingredient))
		if(isnull(inside_one))
			user.unEquip(I, src)
			inside_one = I
			return 1
		if(!isnull(inside_one))
			if(isnull(inside_two))
				user.unEquip(I, src)
				inside_two = I
				return 1

	if(istype(I, /obj/item/catalchemy/pestle))
		if(do_after(src, 5 SECOND))
			if(!isnull(inside_one) && isnull(inside_two))
				inside_one.pure = FALSE
				inside_one.icon_state = "[initial(icon_state)]_dusted"
				return 1
			if(!isnull(inside_one) && !isnull(inside_two))
				combination = "[inside_one.name], [inside_two.name]"
				//Тут должен быть очередной лист с определением предмета, который мы хотим создать согласно содержащимся тут материалам


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

/obj/effect/alchemy_qte
	name = "cloud"
	desc = "cloud"
	icon = 'mods/_fd/cat_alchemist/icons/alchemy_effects.dmi'
	icon_state = "qte_swirl"
	layer = ABOVE_HUMAN_LAYER

/obj/effect/alchemy_damage
	name = "damage"
	desc = "damage"
	icon = 'mods/_fd/cat_alchemist/icons/alchemy_effects.dmi'
	icon_state = "cauldron_overlay"
	layer = ABOVE_HUMAN_LAYER

/obj/effect/alchemy_brewing
	name = "brew"
	desc = "brew"
	icon = 'mods/_fd/cat_alchemist/icons/alchemy_effects.dmi'
	icon_state = "dazed"
	color = "#8ad6d0"
	layer = ABOVE_HUMAN_LAYER

/obj/effect/alchemy_explosion
	name = "smoke"
	desc = "smoke"
	icon = 'mods/_fd/cat_alchemist/icons/alchemy_effects.dmi'
	icon_state = "smoke"
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

/obj/effect/recipe_overlay/cloud
	name = "cloud"
	desc = "cloud!"
	icon = 'mods/_fd/cat_alchemist/icons/potions_icons.dmi'
	icon_state = "Bubble"
	layer = 4.07
	mouse_opacity = FALSE

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
// Частота появления QTE, понижающего стабильность/увеличивающего время
	var/qte_timer = 30
	var/qte_in = 30
// Окно, в которое игрок должен успеть сделать клик
	var/in_danger = FALSE
	var/danger_time = 10
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
	if(stability <= 20 && !destroyed)
		to_chat(user, SPAN_NOTICE("This brew [SPAN_COLOR("#b40505", "doesn't look promising")]..."))
	if(destroyed)
		to_chat(user, SPAN_NOTICE("This brew is [SPAN_COLOR("#b40505", "completly destroyed")]!"))

/obj/structure/catalchemy/cauldron/Process()

// Мы проебали QTE. Вот последствия. Заодно, пожалуйста, вернём всё на исходную
	if(danger_time <= 0)
		for(var/obj/effect/alchemy_qte/qte in loc)
			animate(qte, 1 SECOND, alpha = 0)
			spawn(2 SECONDS)
				qdel(qte)

		var/obj/effect/alchemy_damage/damage = new /obj/effect/alchemy_damage(loc)
		damage.alpha = 0
		damage.pixel_y = pixel_y
		damage.pixel_x = pixel_x
		animate(damage, 1 SECOND, alpha = 255)
		spawn(1 SECOND)
			animate(damage, 1 SECOND, alpha = 0)
		spawn(2 SECONDS)
			qdel(damage)
		if(prob(50))
			stability -= 5
			danger_time = 10
			in_danger = FALSE
		else
			brewing_time += 10
			danger_time = 10
			in_danger = FALSE

// Если таймер дотикал - запускаем QTE и обновляем его с небольшим бонусом поверх, дабы эти ивенты не были столь частыми
	if(qte_in <= 0)
		in_danger = TRUE
		qte_in = qte_timer + 10

// Если стабильность нулевая - мы испортили смесь. Останавливаем варку
	if(stability <= 0)
		destroyed = TRUE
		brewing = FALSE
		var/adjust_one = pixel_x + 2
		var/adjust_two = pixel_x - 4
		var/adjust_three = pixel_x + 2
		animate(src, pixel_x = adjust_one, time = 2, easing = LINEAR_EASING | EASE_IN)
		spawn(2)
			animate(src, pixel_x = adjust_two, time = 2, easing = LINEAR_EASING | EASE_OUT)
		spawn(4)
			animate(src, pixel_x = adjust_three, time = 2, easing = LINEAR_EASING | EASE_IN)
			icon_state = "cauldron_small_failure"
		for(var/obj/effect/alchemy_brewing/bubbles in loc)
			qdel(bubbles)

		audible_message(SPAN_NOTICE("In one moment, [FONT_LARGE("[icon2html(src, viewers(get_turf(src)))]")] [SPAN_COLOR("#b40505", "EXPLODES")], sending various liquid flying!"))
		var/obj/effect/alchemy_explosion/explosion = new /obj/effect/alchemy_explosion(loc)
		explosion.pixel_y = pixel_y + 15
		explosion.pixel_x = pixel_x
		spawn(8)
			qdel(explosion)
		STOP_PROCESSING(SSobj, src)

// Если время варки дошло до нуля и мы не взорвались - останавливаем варку и отмечаем смесь как готовую к употреблению!
	if(brewing_time <= 0)
		ready = TRUE
		brewing = FALSE
		in_danger = FALSE

		danger_time = 10
		brewing_time = 100
		qte_timer = 30
		stability = 50

		for(var/obj/effect/alchemy_brewing/bubbles in loc)
			animate(bubbles, 1 SECOND, alpha = 0)
			spawn(2 SECONDS)
				qdel(bubbles)
		for(var/obj/effect/alchemy_qte/qte in loc)
			animate(qte, 1 SECOND, alpha = 0)
			spawn(2 SECONDS)
				qdel(qte)
		STOP_PROCESSING(SSobj, src)

// Таймеры тикают лишь во время варки, при условии того что смесь ещё НЕ готова / НЕ испорчена
	if(brewing && !ready && !destroyed)
		brewing_time -= 1
		qte_in -= 1

// Уменьшает окно времени на ответную реакцию
	if(in_danger)
		var/obj/effect/alchemy_qte/qte = new /obj/effect/alchemy_qte(loc)
		qte.alpha = 0
		qte.pixel_y = pixel_y + 10
		qte.pixel_x = pixel_x
		animate(qte, 1 SECONDS, alpha = 255)
		danger_time -= 1

/obj/structure/catalchemy/cauldron/attack_hand(mob/living/user)
	. = ..()
	to_chat(user, SPAN_DANGER("You starting clearing cauldron insides!"))
	if(do_after(user, 3 SECOND))
		audible_message(SPAN_NOTICE("In one moment, [FONT_LARGE("[icon2html(src, viewers(get_turf(src)))]")] [SPAN_COLOR("#b40505", "EXPLODES")], sending various liquid flying!"))
		var/obj/effect/alchemy_explosion/explosion = new /obj/effect/alchemy_explosion(loc)
		explosion.pixel_y = pixel_y + 15
		explosion.pixel_x = pixel_x
		spawn(4)
			qdel(explosion)
		high = 0
		medium = 0
		low = 0
		brewing = FALSE
		brewing_time = 100
		qte_timer = 30
		in_danger = FALSE
		danger_time = 10
		stability = 50
		if(destroyed)
			destroyed = FALSE
			icon_state = "cauldron_small"
		ready = FALSE

/obj/structure/catalchemy/cauldron/use_tool(obj/item/I, mob/living/user, list/click_params)
	. = ..()

// Чтобы начать варку - мы кликаем по котлу ложкой! Проверяем, нет ли там уже готовой / активно варящейся / испорченной смеси
	if(istype(I, /obj/item/catalchemy/spoon))
		// ЛОЖКОЙ ЕГО! ЛОЖКОЙ!!!
		if(in_danger)
			for(var/obj/effect/alchemy_qte/qte in loc)
				animate(qte, 1 SECOND, alpha = 0)
				spawn(2 SECONDS)
					qdel(qte)
			in_danger = FALSE
			danger_time = 10
			return 1
		// А что нам тут мешать, если всё испорчено?
		if(destroyed)
			to_chat(user, SPAN_DANGER("What's the point of it even? Potion already failed!"))
			return 0
		// Смотрим, может она уже готова?
		if(ready)
			to_chat(user, SPAN_DANGER("It's already done! No need for that!"))
			return 0
		if(!brewing)
			to_chat(user, SPAN_NOTICE("You starting to stir the contents of cauldron with a spoon!"))
			if(do_after(user, 3 SECOND))
				// Если у нас была отображена подсказка по зелью - убираем её из поля зрения игрока
				for(var/obj/effect/recipe_overlay/recipe in loc)
					qdel(recipe)
				brewing = TRUE
				var/obj/effect/alchemy_brewing/brew = new /obj/effect/alchemy_brewing(loc)
				brew.pixel_y = pixel_y + 8
				brew.pixel_x = pixel_x
				START_PROCESSING(SSobj, src)
				return 1

// Добавляем ингредиент
	if(istype(I, /obj/item/catalchemy/ingredient))
		var/obj/item/catalchemy/ingredient/part = I
		// Проверяем, не испорчена ли смесь...
		if(destroyed)
			to_chat(user, SPAN_DANGER("Adding more things to this mess will not help!"))
			return 0
		// Смотрим, нет ли там уже готовой смеси
		if(ready)
			to_chat(user, SPAN_DANGER("Firstly clear the pot!"))
			return 0
		// Наш ингредиент обработан?
		if(part.pure)
			to_chat(user, SPAN_DANGER("You can't add [part] to the cauldron in it's current state!"))
			return 0
		if(do_after(user, 1 SECOND))
			var/cloud_sprite = rand(1,5)
			var/obj/effect/alchemy_cloud/cloud = new /obj/effect/alchemy_cloud(loc)
			cloud.pixel_y = pixel_y + 20
			cloud.pixel_x = pixel_x
			cloud.icon_state = "cloud_[cloud_sprite]"
			var/obj/effect/alchemy_splash/splash = new /obj/effect/alchemy_splash(loc)
			splash.pixel_y = pixel_y + 10
			splash.pixel_x = pixel_x
			animate(splash, 1 SECONDS, alpha = 0)
			animate(cloud, 2 SECONDS, alpha = 0)
			var/adjust = cloud.pixel_y + 10
			animate(cloud, pixel_y = adjust, time = 2 SECONDS, easing = LINEAR_EASING | EASE_IN)
			spawn(3 SECONDS)
				qdel(cloud)
				qdel(splash)

			// Добавляем характеристики ингредиента к характеристикам хрючева!

			high += part.high
			medium += part.medium
			low += part.low

			if(part.increasing_difficulty > 0)
				qte_timer -= part.increasing_difficulty
			if(part.decreasing_difficulty > 0)
				qte_timer += part.decreasing_difficulty

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
		var/obj/effect/recipe_overlay/cloud/cloud = new /obj/effect/recipe_overlay/cloud(loc)
		var/obj/effect/recipe_overlay/recipe = new /obj/effect/recipe_overlay(loc)
		cloud.alpha = 0
		cloud.SetTransform(scale = 1.2)
		cloud.pixel_y = pixel_y
		cloud.pixel_x = pixel_x
		recipe.alpha = 0
		recipe.pixel_y = pixel_y
		recipe.pixel_x = pixel_x
		recipe.icon_state = "[cooking]"
		recipe.name = "[cooking]"
		recipe.desc = "For [SPAN_COLOR("#5fffca", "[cooking]")] you will need: [SPAN_COLOR("#5fffca", "[GLOB.potion_recipes[cooking]]")]."
		var/adjust = cloud.pixel_y + 22
		animate(cloud, 3 SECONDS, alpha = 150)
		animate(recipe, 3 SECONDS, alpha = 255)
		animate(cloud, pixel_y = adjust, time = 3 SECONDS, easing = LINEAR_EASING | EASE_IN)
		animate(recipe, pixel_y = adjust, time = 3 SECONDS, easing = LINEAR_EASING | EASE_IN)
		START_PROCESSING(SSobj, recipe)

		return 1
