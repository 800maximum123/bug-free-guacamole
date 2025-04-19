/obj/structure/catalchemy/source
	name = "source"
	desc = "source"
	icon = 'mods/_fd/cat_alchemist/icons/herbfoliage.dmi'
	icon_state = "spritemeplz"

	// Что у нас внутри?
	var/stored = /obj/item/catalchemy/ingredient
	var/recharge_time = 5 SECONDS
	anchored = TRUE

/obj/structure/catalchemy/source/attack_hand(mob/living/user)
	. = ..()

	pixel_y += 2
	pixel_x += 2
	spawn(5)
		pixel_y += 3
		pixel_x -= 5
	spawn(10)
		pixel_y -= 4
		pixel_x -= 2
	spawn(15)
		pixel_y -= 2
		pixel_x += 3
	if(do_after(user, 5 SECONDS))
		pixel_y = initial(pixel_y)
		pixel_x = initial(pixel_x)
		alpha = 0
		mouse_opacity = FALSE
		new stored(loc)
		//dumb and yet effective
		spawn(recharge_time)
			animate(src, 3 SECONDS, alpha = 255)
			mouse_opacity = TRUE

// Вспомогательное

/obj/structure/catalchemy/source/dye_bin
	name = "dye bin"
	desc = "Bin full of colors"
	icon = 'mods/_fd/cat_alchemist/icons/structure.dmi'
	icon_state = "dye_bin_full"
	stored = /obj/item/catalchemy/ingredient/dye

/obj/structure/catalchemy/source/dye_bin/attack_hand(mob/living/user)
	pixel_y += 2
	pixel_x += 2
	spawn(5)
		pixel_y += 3
		pixel_x -= 5
	spawn(10)
		pixel_y -= 4
		pixel_x -= 2
	spawn(15)
		pixel_y -= 2
		pixel_x += 3
	if(do_after(user, 5 SECOND))
		pixel_y = initial(pixel_y)
		pixel_x = initial(pixel_x)
		icon_state = "washbin"
		mouse_opacity = FALSE
		new stored(loc)
		//dumb and yet effective
		spawn(recharge_time)
			icon_state = "dye_bin_full"
			mouse_opacity = TRUE

// Краски замедляют готовку, но восстанавливают стабильность
/obj/item/catalchemy/ingredient/dye
	name = "dyes"
	desc = "Various colorful sand."
	icon = 'mods/_fd/cat_alchemist/icons/misc.dmi'
	icon_state = "cheap_dyes"

	pure = FALSE
	manufactured = TRUE

	stability_buff = 10
	time_increaser = 20

/obj/structure/catalchemy/source/feather_bag
	name = "bag"
	desc = "Bag full of feathers"
	icon = 'mods/_fd/cat_alchemist/icons/misc.dmi'
	icon_state = "fbag"
	stored = /obj/item/catalchemy/ingredient/feather

/obj/structure/catalchemy/source/feather_bag/attack_hand(mob/living/user)
	pixel_y += 2
	pixel_x += 2
	spawn(5)
		pixel_y += 3
		pixel_x -= 5
	spawn(10)
		pixel_y -= 4
		pixel_x -= 2
	spawn(15)
		pixel_y -= 2
		pixel_x += 3
	if(do_after(user, 5 SECOND))
		pixel_y = initial(pixel_y)
		pixel_x = initial(pixel_x)
		icon_state = "cbag"
		mouse_opacity = FALSE
		new stored(loc)
		//dumb and yet effective
		spawn(recharge_time)
			icon_state = "fbag"
			mouse_opacity = TRUE

// Перья значительно ускоряют варку, но при этом бьют по стабильности зелья
/obj/item/catalchemy/ingredient/feather
	name = "feather"
	desc = "Very fragile feather."
	icon = 'mods/_fd/cat_alchemist/icons/natural.dmi'
	icon_state = "feather"

	pure = FALSE
	manufactured = TRUE

	increasing_difficulty = 10

	stability_debuff = 10
	time_reducer = 30

/obj/structure/catalchemy/nest
	name = "strange nest"
	desc = "Do not shove your hands inside, please..."
	icon = 'mods/_fd/cat_alchemist/icons/structure.dmi'
	icon_state = "crabnest"

/obj/structure/catalchemy/source/leech_pile
	name = "leech pile"
	desc = "Pile of blood-suckers."
	icon = 'mods/_fd/cat_alchemist/icons/natural.dmi'
	icon_state = "worm4"
	color = "#252323"

	stored = /obj/item/catalchemy/ingredient/leech

/obj/item/catalchemy/ingredient/leech
	name = "leech"
	desc = "Ugh, gross!"
	icon = 'mods/_fd/cat_alchemist/icons/surgery.dmi'
	icon_state = "leech_alt"
	pure = FALSE
	manufactured = TRUE

	low = 5

	increasing_difficulty = 5
	time_increaser = 10

	w_class = ITEM_SIZE_TINY

/obj/structure/catalchemy/source/darkflower
	name = "dark flower"
	desc = "It kinda burns your hand, when you touching it."
	icon = 'mods/_fd/cat_alchemist/icons/crops.dmi'
	icon_state = "cabbage2"

	stored = /obj/item/catalchemy/ingredient/blackrose

/obj/item/catalchemy/ingredient/blackrose
	name = "black rose"
	desc = "Spiky!"
	icon = 'mods/_fd/cat_alchemist/icons/ingredients.dmi'
	icon_state = "blackrose"

	low = 1

	increasing_difficulty = 5
	stability_debuff = 5
