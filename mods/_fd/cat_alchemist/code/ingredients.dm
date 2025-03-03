/obj/structure/catalchemy/source
	name = "source"
	desc = "source"
	icon = 'mods/_fd/cat_alchemist/icons/herbfoliage.dmi'
	icon_state = "spritemeplz"

	// Что у нас внутри?
	var/stored = /obj/item/catalchemy/ingredient
	anchored = TRUE

/obj/structure/catalchemy/source/attack_hand(mob/living/user)
	. = ..()

	if(do_after(user, 5 SECOND))
		alpha = 0
		mouse_opacity = FALSE
		new stored(loc)
		//dumb and yet effective
		spawn(10 SECONDS)
			animate(src, 3 SECONDS, alpha = 255)
		spawn(12 SECONDS)
			mouse_opacity = TRUE

// Вспомогательное

/obj/structure/catalchemy/source/dye_bin
	name = "dye bin"
	desc = "Bin full of colors"
	icon = 'mods/_fd/cat_alchemist/icons/structure.dmi'
	icon_state = "dye_bin_full"
	stored = /obj/item/catalchemy/ingredient/dye

/obj/structure/catalchemy/source/dye_bin/attack_hand(mob/living/user)
	if(do_after(user, 5 SECOND))
		icon_state = "washbin"
		mouse_opacity = FALSE
		new stored(loc)
		//dumb and yet effective
		spawn(10 SECONDS)
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
	if(do_after(user, 5 SECOND))
		icon_state = "cbag"
		mouse_opacity = FALSE
		new stored(loc)
		//dumb and yet effective
		spawn(10 SECONDS)
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
