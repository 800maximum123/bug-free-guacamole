/mob/living/simple_animal/hostile/silksong
	name = "Big bug"
	desc = "So-o-o-o-o big bug!!!"
	icon = 'mods/_fd/fd_assets/icons/animals/hollow_knight_bugs.dmi'
	icon_state = "bug"
	icon_living = "bug"
	icon_dead = "bug_dead"
	speak_emote = list("twitches.")
	turns_per_move = 5
	see_in_dark = 10
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	maxHealth = 100
	health = 100
	movement_cooldown = 5
	natural_weapon = /obj/item/natural_weapon/bug
	heat_damage_per_tick = 20
	cold_damage_per_tick = 0
	faction = "bugs_silksong"
	pass_flags = PASS_FLAG_TABLE
	move_to_delay = 3
	speed = 0.5
	bleed_colour = "#5c0606"
	break_stuff_probability = 25
	pry_time = 8 SECONDS
	pry_desc = "bitting"
	min_gas = null
	max_gas = null
	minbodytemp = 0
	natural_armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = 40,
		laser = ARMOR_LASER_MINOR
		)

	ai_holder = /datum/ai_holder/simple_animal/retaliate/cooperative/bug
	say_list = /datum/say_list/bug


/mob/living/simple_animal/hostile/silksong/small_glist
	icon_state = "glist_small"
	icon_living = "glist_small"
	icon_dead = "glist_small_dead"
	maxHealth = 30
	health = 30
	movement_cooldown = 0
	natural_weapon = /obj/item/natural_weapon/small_glist
	move_to_delay = 6
	speed = 2
	natural_armor = list(
		melee = ARMOR_MELEE_SMALL,
		laser = ARMOR_LASER_MINOR
		)
	ai_holder = /datum/ai_holder/simple_animal/melee/evasive/bug

/mob/living/simple_animal/hostile/silksong/big_glist
	icon_state = "glist_big"
	icon_living = "glist_big"
	icon_dead = "glist_big_dead"
	maxHealth = 80
	health = 80
	movement_cooldown = 6
	natural_weapon = /obj/item/natural_weapon/big_glist
	move_to_delay = 2
	speed = 0.6
	natural_armor = list(
		melee = ARMOR_MELEE_SMALL,
		laser = ARMOR_LASER_MINOR
		)
	ai_holder = /datum/ai_holder/simple_animal/melee/bug

/obj/item/natural_weapon/bug
	force = 5
	armor_penetration = 10
	sharp = TRUE
	edge = TRUE
	attack_cooldown = 1 SECONDS
	attack_verb = list("bit", "cut")


/obj/item/natural_weapon/small_glist
	force = 7
	sharp = TRUE
	edge = TRUE
	attack_cooldown = 1 SECONDS
	attack_verb = list("bit", "tail slash")

/obj/item/natural_weapon/big_glist
	force = 20
	armor_penetration = 3
	sharp = TRUE
	edge = TRUE
	attack_cooldown = 1 SECONDS
	attack_verb = list("bit", "tail slash")

/datum/ai_holder/simple_animal/melee/bug
	speak_chance = 5

/datum/ai_holder/simple_animal/melee/evasive/bug
	speak_chance = 5

/datum/ai_holder/simple_animal/retaliate/cooperative/bug
	speak_chance = 5

/datum/say_list/bug
	emote_hear = list("roars!", "groans...")
	emote_see = list("snaps it's head at something...", "twitches", "stops suddenly")
