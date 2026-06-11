/mob/living/simple_animal/aquatic/fish
	name = "small fish"
	desc = "Glub glub."
	icon_state = "content"
	icon_living = "content"
	icon_dead = "content_dead"
	faction = "fishes"
	maxHealth = 10
	health = 10
	mob_size = MOB_TINY
	density = FALSE

	meat_amount = 1
	bone_amount = 3
	skin_amount = 3

	holder_type = /obj/item/holder/fish

/obj/item/holder/fish
	w_class = ITEM_SIZE_TINY
	item_icons = list(
		slot_l_hand_str = 'mods/_fd/fd_assets/icons/tgmc/onmob/fish_lefthand.dmi',
		slot_r_hand_str = 'mods/_fd/fd_assets/icons/tgmc/onmob/fish_righthand.dmi',
		)

/mob/living/simple_animal/aquatic/fish/grump
	icon_state = "grump"
	icon_living = "grump"
	icon_dead = "grump_dead"

/mob/living/simple_animal/aquatic/fish/judge
	icon_state = "judge"
	icon_living = "judge"
	icon_dead = "judge_dead"
	meat_amount = 2
