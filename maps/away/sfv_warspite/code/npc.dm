/obj/landmark/corpse/fleet/warspite
	name = "Warspite - Fleet Fatigue"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/torch/ert/fatigue)
	spawn_flags = CORPSE_SPAWNER_RANDOM_NAME | CORPSE_SPAWNER_ALL_SKIPS
	facial_styles_per_species = list(SPECIES_HUMAN = list("Shaved"))
	hair_styles_per_species = list(SPECIES_HUMAN = list("CIA"))
	genders_per_species = list(SPECIES_HUMAN = list(MALE))


/singleton/hierarchy/outfit/job/torch/ert/fatigue
	name = "Warspite - Fleet Fatigue"
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	suit = null
	head = null
	mask = null
	flags = OUTFIT_RESET_EQUIPMENT | OUTFIT_ADJUSTMENT_ALL_SKIPS
	l_ear = null
	id_types = null


//			PILOTS AND ENGIES			\\


/obj/landmark/corpse/fleet/warspite/pilot
	name = "Warspite - Fleet Pilot"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/torch/ert/pilot)
	spawn_flags = CORPSE_SPAWNER_RANDOM_NAME | CORPSE_SPAWNER_ALL_SKIPS

/singleton/hierarchy/outfit/job/torch/ert/pilot
	name = "Warspite - Fleet Pilot"
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	head = /obj/item/clothing/head/helmet/solgov/pilot/fleet
	glasses = /obj/item/clothing/glasses/tacgoggles
	flags = OUTFIT_RESET_EQUIPMENT | OUTFIT_ADJUSTMENT_ALL_SKIPS

/obj/landmark/corpse/fleet/warspite/pilot/vest
	name = "Warspite - Fleet Pilot-Vest"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/torch/ert/pilot/vest)
	spawn_flags = CORPSE_SPAWNER_RANDOM_NAME | CORPSE_SPAWNER_ALL_SKIPS

/singleton/hierarchy/outfit/job/torch/ert/pilot/vest
	name = "Warspite - Fleet Pilot, Vested"
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	suit = /obj/item/clothing/suit/storage/hazardvest/white
	head = /obj/item/clothing/head/helmet/solgov/pilot/fleet
	mask = null
	glasses = /obj/item/clothing/glasses/tacgoggles
	flags = OUTFIT_RESET_EQUIPMENT | OUTFIT_ADJUSTMENT_ALL_SKIPS
	l_ear = null


/obj/landmark/corpse/fleet/warspite/pilot/armor
	name = "Warspite - Fleet Pilot-Vest"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/torch/ert/pilot/armor)
	spawn_flags = CORPSE_SPAWNER_RANDOM_NAME | CORPSE_SPAWNER_ALL_SKIPS

/singleton/hierarchy/outfit/job/torch/ert/pilot/armor
	name = "Warspite - Fleet Pilot, Armored"
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	suit = /obj/item/clothing/suit/storage/vest/solgov
	head = /obj/item/clothing/head/helmet/solgov/pilot/fleet
	mask = null
	glasses = /obj/item/clothing/glasses/tacgoggles
	flags = OUTFIT_RESET_EQUIPMENT | OUTFIT_ADJUSTMENT_ALL_SKIPS
	l_ear = null


/obj/landmark/corpse/fleet/warspite/utility
	name = "Warspite - Fleet Utility"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/torch/ert/utility)
	spawn_flags = CORPSE_SPAWNER_RANDOM_NAME | CORPSE_SPAWNER_ALL_SKIPS

/singleton/hierarchy/outfit/job/torch/ert/utility
	name = "Warspite - Fleet Utility"
	uniform = /obj/item/clothing/under/solgov/utility/fleet
	suit = null
	head = null
	mask = null
	flags = OUTFIT_RESET_EQUIPMENT | OUTFIT_ADJUSTMENT_ALL_SKIPS
	l_ear = null
	id_types = null

/obj/landmark/corpse/fleet/warspite/utility/engi
	name = "Warspite - Fleet Engi"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/torch/ert/utility/engi)
	spawn_flags = CORPSE_SPAWNER_RANDOM_NAME | CORPSE_SPAWNER_ALL_SKIPS

/singleton/hierarchy/outfit/job/torch/ert/utility/engi
	name = "Warspite - Fleet Engi"
	uniform = /obj/item/clothing/under/solgov/utility/fleet
	suit = /obj/item/clothing/suit/storage/hazardvest
	head = /obj/item/clothing/head/beret/solgov/fleet/branch/third
	mask = null
	glasses = /obj/item/clothing/glasses/meson
	flags = OUTFIT_RESET_EQUIPMENT | OUTFIT_ADJUSTMENT_ALL_SKIPS
	l_ear = null
	id_types = null

/obj/landmark/corpse/fleet/warspite/utility/engi/marshall
	name = "Warspite - Fleet Air Controller"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/torch/ert/utility/engi)
	spawn_flags = CORPSE_SPAWNER_RANDOM_NAME | CORPSE_SPAWNER_ALL_SKIPS

/singleton/hierarchy/outfit/job/torch/ert/utility/engi
	name = "Warspite - Fleet Air Controller"
	uniform = /obj/item/clothing/under/solgov/utility/fleet
	suit = /obj/item/clothing/suit/storage/hazardvest
	head = /obj/item/clothing/head/beret/solgov/fleet/branch/third
	mask = null
	glasses = /obj/item/clothing/glasses/material
	flags = OUTFIT_RESET_EQUIPMENT | OUTFIT_ADJUSTMENT_ALL_SKIPS
	l_ear = null
	id_types = null


//				SECURITY				\\

/obj/landmark/corpse/fleet/warspite/security
	name = "Warspite - Fleet Master At Arms"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/torch/ert/fatigue/security)
	spawn_flags = CORPSE_SPAWNER_RANDOM_NAME | CORPSE_SPAWNER_ALL_SKIPS

/singleton/hierarchy/outfit/job/torch/ert/fatigue/security
	name = "Warspite - Fleet Master At Arms"
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	suit = null
	head = null
	mask = null
	glasses = /obj/item/clothing/glasses/hud/security/prot/sunglasses
	flags = OUTFIT_RESET_EQUIPMENT | OUTFIT_ADJUSTMENT_ALL_SKIPS
	l_ear = null
	id_types = null

/obj/landmark/corpse/fleet/warspite/security/armor
	name = "Warspite - Fleet Master At Arms, Armored"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/torch/ert/fatigue/security/armor)
	spawn_flags = CORPSE_SPAWNER_RANDOM_NAME | CORPSE_SPAWNER_ALL_SKIPS

/singleton/hierarchy/outfit/job/torch/ert/fatigue/security/armor
	name = "Warspite - Fleet Master At Arms, Armored"
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	suit = /obj/item/clothing/suit/storage/vest/solgov/security
	head = /obj/item/clothing/head/beret/solgov/fleet/branch/third
	mask = null
	glasses = /obj/item/clothing/glasses/hud/security/prot/sunglasses
	flags = OUTFIT_RESET_EQUIPMENT | OUTFIT_ADJUSTMENT_ALL_SKIPS
	l_ear = null
	id_types = null

/obj/landmark/corpse/fleet/warspite/security/armor/full
	name = "Warspite - Fleet Master At Arms, FULL Armored"
	corpse_outfits = list(/singleton/hierarchy/outfit/job/torch/ert/fatigue/security/armor/full)
	spawn_flags = CORPSE_SPAWNER_RANDOM_NAME | CORPSE_SPAWNER_ALL_SKIPS

/singleton/hierarchy/outfit/job/torch/ert/fatigue/security/armor/full
	name = "Warspite - RIOT Fleet Master At Arms"
	suit = /obj/item/clothing/suit/storage/vest/tactical
	head = /obj/item/clothing/head/helmet/tactical
	mask = /obj/item/clothing/mask/gas
	glasses = /obj/item/clothing/glasses/hud/security/prot/sunglasses
	flags = OUTFIT_RESET_EQUIPMENT | OUTFIT_ADJUSTMENT_ALL_SKIPS
	l_ear = null
	id_types = null


//			AI HOLDER			\\

/datum/ai_holder/simple_animal/humanoid/hostile/warspite/passive_crewman
	faction_friends = list(MOB_FACTION_CREW, "fleet")
	can_flee = TRUE
	dying_threshold = 0.7

/datum/ai_holder/simple_animal/humanoid/hostile/warspite
	faction_friends = list(MOB_FACTION_CREW, "fleet")
	hostile = FALSE
	home_low_priority = FALSE
	threaten_delay = 4 SECOND
	threaten_timeout = 30 SECONDS
	speak_chance = 2
	cooperative = TRUE
	base_wander_delay = 3
	returns_home = TRUE
	home_low_priority = TRUE
	violent_breakthrough = FALSE
	conserve_ammo = FALSE
	pointblank = FALSE
	can_flee = FALSE
	flee_when_outmatched = TRUE
	flee_when_dying = TRUE
	threaten = TRUE
	dying_threshold = 0.2

/datum/ai_holder/simple_animal/humanoid/hostile/warspite/masteratarms
	home_low_priority = TRUE
	// FLEE TACTIC
	flee_when_outmatched = TRUE
	// BATTLE TACTIC
	pointblank = FALSE
	conserve_ammo = TRUE
	can_breakthrough = TRUE
	flee_when_dying = FALSE

/datum/ai_holder/simple_animal/humanoid/hostile/warspite/masteratarms/melee/post_melee_attack(atom/A)
	if(holder.Adjacent(A))
		holder.IMove(get_step(holder, pick(GLOB.alldirs)))
		holder.face_atom(A)

/datum/ai_holder/simple_animal/humanoid/hostile/warspite/masteratarms/shotgun
	// FLEE TACTIC
	flee_when_outmatched = TRUE
	// BATTLE TACTIC
	pointblank = TRUE
	conserve_ammo = FALSE
	can_breakthrough = TRUE
	var/closest_distance = 3

/datum/ai_holder/simple_animal/humanoid/hostile/warspite/masteratarms/shotgun/on_engagement(atom/A)
	if(get_dist(holder, A) > closest_distance)
		holder.IMove(get_step_towards(holder, A))
		holder.face_atom(A)

/datum/ai_holder/simple_animal/humanoid/hostile/warspite/riot
	home_low_priority = TRUE
	hostile = 1 // BLOOD FOR BLOOD GOD!
	threaten_delay = 2 SECOND
	threaten_timeout = 30 SECONDS
	speak_chance = 5
	base_wander_delay = 3
	// FLEE TACTIC
	can_flee = 0
	flee_when_outmatched = FALSE // MORE BLOOOD
	// BATTLE TACTIC
	conserve_ammo = FALSE
	can_breakthrough = TRUE
	returns_home = FALSE
	violent_breakthrough = TRUE
	conserve_ammo = FALSE
	destructive = TRUE
	pointblank = TRUE

/datum/ai_holder/simple_animal/humanoid/hostile/warspite/riot/shotgun
	home_low_priority = TRUE
	// FLEE TACTIC
		// WE DON'T FLEE!
	// BATTLE TACTIC
	pointblank = TRUE
	conserve_ammo = FALSE
	can_breakthrough = TRUE
	var/closest_distance = 1

/datum/ai_holder/simple_animal/humanoid/hostile/warspite/riot/shotgun/on_engagement(atom/A)
	if(get_dist(holder, A) > closest_distance)
		holder.IMove(get_step_towards(holder, A))
		holder.face_atom(A)

/datum/ai_holder/simple_animal/humanoid/hostile/warspite/riot/shotgun/shield
	closest_distance = 3
// Some shit \\

/obj/item/natural_weapon/punch/combatant
	force = 15
	damtype = DAMAGE_PAIN

/obj/item/natural_weapon/punch/combatant/bad
	force = 5

/obj/item/natural_weapon/punch/combatant/good
	force = 20


// 			NPC-s		\\


// ENGINEERS AND PILOTS \\

/mob/living/simple_animal/hostile/human/fleet/warspite
	name = "\improper Fleet Engineer"
	desc = "An Engineer wearing Fleet garbs. They have a Third Fleet patch on their uniform, and pride on their shoulders."
	icon = 'maps/away/sfv_warspite/icons/fleetcrew.dmi'
	icon_state = "engineer"
	icon_dead = "fleetassault_dead"
	icon_gib = "fleetarmsman_gib"
	turns_per_move = 5
	response_help = "pats"
	response_disarm = "shoves"
	response_harm = "hits"
	natural_armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_SMALL
		)
	speed = 8
	maxHealth = 100
	health = 100
	harm_intent_damage = 50
	sa_accuracy = 15
	natural_weapon = /obj/item/natural_weapon/punch
	can_escape = TRUE
	a_intent = I_HURT
	corpse = /obj/landmark/corpse/fleet/warspite/utility/engi
	weapon1 = null
	weapon2 = null
	unsuitable_atmos_damage = 15
	environment_smash = 0
	faction = "fleet"
	status_flags = CANPUSH|CANWEAKEN|CANSTUN

	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/warspite/passive_crewman
//	say_list_type =
	ranged = FALSE

/mob/living/simple_animal/hostile/human/fleet/warspite/Initialize()
	. = ..()
	icon_living = icon_state
	desc = "An [name] wearing Fleet garbs. They have a Third Fleet patch on their uniform, and pride on their shoulders."

/mob/living/simple_animal/hostile/human/fleet/warspite/random/Initialize()
	. = ..()
	if(prob(50))
		ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/warspite
		return
	return

/mob/living/simple_animal/hostile/human/fleet/warspite/marshall
	name = "\improper Fleet Air Controller"
	icon_state = "engineer_marsh"
	desc = "An aircontroller wearing Fleet garbs. They have a Third Fleet patch on their uniform, and pride on their shoulders."
	corpse = /obj/landmark/corpse/fleet/warspite/utility/engi/marshall
	weapon1 = /obj/item/marshalling_wand

// \\

/mob/living/simple_animal/hostile/human/fleet/warspite/pilot
	name = "\improper Fleet Pilot"
	icon_state = "pilot"
	desc = "An pilot wearing Fleet garbs. They have a Third Fleet patch on their uniform, and pride on their shoulders."
	corpse = /obj/landmark/corpse/fleet/warspite/pilot

/mob/living/simple_animal/hostile/human/fleet/warspite/pilot/vest
	icon_state = "pilot_vest"
	corpse = /obj/landmark/corpse/fleet/warspite/pilot/vest

/mob/living/simple_animal/hostile/human/fleet/warspite/pilot/armor
	icon_state = "pilot_armor"
	desc = "An pilot wearing Fleet garbs. They have a Third Fleet patch on their uniform, and pride on their shoulders. That one - had a armor"
	corpse = /obj/landmark/corpse/fleet/warspite/pilot/armor
	natural_armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED
		)

/mob/living/simple_animal/hostile/human/fleet/warspite/crewman
	name = "\improper Fleet Crewman"
	icon_state = "222"
	sa_accuracy = 75
	desc = "An crewman wearing Fleet garbs. They have a Third Fleet patch on their uniform, and pride on their shoulders."
	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/warspite
	corpse = /obj/landmark/corpse/fleet/warspite
	natural_weapon = /obj/item/natural_weapon/punch/combatant

/mob/living/simple_animal/hostile/human/fleet/warspite/crewman/utility
	name = "\improper Fleet Crewman"
	icon_state = "utility"
	sa_accuracy = 50
	desc = "An crewman wearing Fleet garbs. They have a Third Fleet patch on their uniform, and pride on their shoulders."
	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/warspite
	natural_weapon = /obj/item/natural_weapon/punch/combatant/bad
	corpse = /obj/landmark/corpse/fleet/warspite/utility

// MASTER AT ARMS \\

/mob/living/simple_animal/hostile/human/fleet/warspite/security/offduty
	name = "\improper Off-Duty Master At Arms"
	icon_state = "security"
	sa_accuracy = 85
	corpse = /obj/landmark/corpse/fleet/warspite/security

/mob/living/simple_animal/hostile/human/fleet/warspite/security
	name = "\improper Master At Arms"
	icon_state = "security_1"
	harm_intent_damage = 25
	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/warspite/masteratarms/melee
	status_flags = CANPUSH
	var/lethal = 0
	corpse = /obj/landmark/corpse/fleet/warspite/security/armor
	natural_armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED
		)
	natural_weapon = /obj/item/natural_weapon/punch/combatant/good


/mob/living/simple_animal/hostile/human/fleet/warspite/security/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/mob/living/simple_animal/hostile/human/fleet/warspite/security/Process()
	if(!lethal)
		natural_weapon = /obj/item/natural_weapon/punch/combatant/good
		weapon1 = null
		icon_state = "[initial(icon_state)]"
	else
		natural_weapon = /obj/item/material/knife/combat
		weapon1 = /obj/item/material/knife/combat
		icon_state = "[icon_state]_knife"
	return 1


/mob/living/simple_animal/hostile/human/fleet/warspite/security/death(gibbed, deathmessage, show_dead_message)
	. = ..()

/mob/living/simple_animal/hostile/human/fleet/warspite/security/laser
	icon_state = "security_1_laser"
	weapon1 = /obj/item/gun/energy/laser
	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/warspite/masteratarms
	projectiletype = /obj/item/projectile/beam/stun/shock
	natural_weapon = /obj/item/gun/energy/laser
	sa_accuracy = 55
	ranged = TRUE

/mob/living/simple_animal/hostile/human/fleet/warspite/security/laser/Process()
	if(lethal)
		projectiletype = /obj/item/projectile/beam/midlaser
	else
		projectiletype = /obj/item/projectile/beam/stun/shock

/mob/living/simple_animal/hostile/human/fleet/warspite/security/laser/lethal
	lethal = 1
	projectiletype = /obj/item/projectile/beam/midlaser

/mob/living/simple_animal/hostile/human/fleet/warspite/security/shotgun
	icon_state = "security_1_sgun"
	weapon1 = /obj/item/gun/projectile/shotgun/pump/scg
	projectiletype = /obj/item/projectile/bullet/shotgun/beanbag
	ranged = TRUE
	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/warspite/masteratarms/shotgun
	sa_accuracy = 55
	casingtype = /obj/item/ammo_casing/shotgun/beanbag
	natural_weapon = /obj/item/gun/projectile/shotgun/pump/scg

/mob/living/simple_animal/hostile/human/fleet/warspite/security/shotgun/Process()
	if(lethal)
		projectiletype = /obj/item/projectile/bullet/pellet/shotgun
		casingtype = /obj/item/ammo_casing/shotgun/pellet
	else
		projectiletype = /obj/item/projectile/bullet/shotgun/beanbag
		casingtype = /obj/item/ammo_casing/shotgun/beanbag

/mob/living/simple_animal/hostile/human/fleet/warspite/security/shotgun/lethal
	lethal = 1
	projectiletype = /obj/item/projectile/bullet/pellet/shotgun
	casingtype = /obj/item/ammo_casing/shotgun/pellet

// 				RIOT TEAM			\\

// KILL, BURN AND TEAAR!

/mob/living/simple_animal/hostile/human/fleet/warspite/riot
	name = "Fleet Spec Ops team"
	sa_accuracy = 75
	natural_armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED
	) // Oh-oh...
	harm_intent_damage = 3 // PATHETIC!
	status_flags = EMPTY_BITFIELD // You can't even push it
	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/warspite/riot
	faction = "fleet"
	corpse = /obj/landmark/corpse/fleet/warspite/security/armor/full
	icon_state = "security_2_laser"
	weapon1 = /obj/item/gun/energy/laser
	projectiletype = /obj/item/projectile/beam/midlaser
	natural_weapon = /obj/item/gun/energy/laser
	ranged = 1
	speed = 5
	rapid = 1


/mob/living/simple_animal/hostile/human/fleet/warspite/riot/shotgun
	icon_state = "security_2_sgun"
	weapon1 = /obj/item/gun/projectile/automatic/shotgun/scg
	natural_weapon = /obj/item/gun/projectile/automatic/shotgun/scg
	projectiletype = /obj/item/projectile/bullet/pellet/shotgun
	casingtype = /obj/item/ammo_casing/shotgun/pellet
	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/warspite/riot/shotgun

/mob/living/simple_animal/hostile/human/fleet/warspite/riot/bullup
	icon_state = "security_2_z8"
	weapon1 = /obj/item/gun/projectile/automatic/bullpup_rifle
	natural_weapon = /obj/item/gun/projectile/automatic/bullpup_rifle
	projectiletype = /obj/item/projectile/bullet/pellet/shotgun
	casingtype = /obj/item/projectile/bullet/rifle/military

/mob/living/simple_animal/hostile/human/fleet/warspite/riot/shield
	icon_state = "security_2_shield"
	weapon1 = /obj/item/shield/riot/metal
	natural_weapon = /obj/item/material/knife/combat
	speed = 3
	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/warspite/riot/shotgun/shield
	projectiletype = null
	ranged = 0
	var/base_block_chance = 60
	var/max_block = 0


/mob/living/simple_animal/hostile/human/fleet/warspite/riot/shield/proc/handle_shield(damage, atom/damage_source = null, mob/attacker = null, def_zone = null, attack_text = "the attack")
	if(incapacitated())
		return 0

	//block as long as they are not directly behind us
	var/bad_arc = reverse_direction(src.dir) //arc of directions from which we cannot block
	if(check_shield_arc(src, bad_arc, damage_source, attacker))
		if(prob(get_block_chance(src, damage, damage_source, attacker)))
			src.visible_message(SPAN_DANGER("\The [src] blocks [attack_text] with \the ballistic shield!"))
			return 1
	return 0

/mob/living/simple_animal/hostile/human/fleet/warspite/riot/shield/proc/get_block_chance(damage, atom/damage_source = null, mob/attacker = null)
	if(istype(damage_source, /obj/item/projectile))
		var/obj/item/projectile/P = damage_source
		//plastic shields do not stop bullets or lasers, even in space. Will block beanbags, rubber bullets, and stunshots just fine though.
		if(is_sharp(P) && damage >= max_block)
			return 0
		if(istype(P, /obj/item/projectile/beam) && (P.armor_penetration >= max_block))
			return 0
	return base_block_chance


/*
/datum/say_list/fleet/friendly
	speak = list(
		"Wish someone would act up. Just once.",
		"I love this job, but boy do I hate the damn wait...",
		"Really wish something would happen right about now.",
		"The hell'd we pack all this ammo for if we're not using it?",
		"Wish something would pop up to shoot now..."
	)
	emote_hear = list(
		"fidgets, antsy.",
		"unloads their weapon to check their ammo, before reloading.",
		"is rearing and ready to go, bouncing in their boots.",
		"scans the area for threats."
	)
	say_threaten = list(
		"There you are, let's get the party started!",
		"Hey, contact spotted, load up!",
		"Found one, a hostile!",
		"About time I got to shoot something!",
		"Time to lock and load!"
	)
	say_maybe_target = list(
		"Hold up, heard something.",
		"Saw a contact, checking them.",
		"Hey, you, hold a minute!",
		"Think I heard something over there.",
		"Saw something move, let's check it out."
	)
	say_escalate = list(
		"Fire on that one!!",
		"Engage that hostile!",
		"Fire at will!",
		"Pursuing hostile target!",
		"Clearing the area!",
		"Engaging hostile target!"
	)
	say_stand_down = list(
		"We're clear! Let's find these guys!",
		"All hostiles down or gone, area clear. Keep watch!",
		"Hostiles have broken contact, pull security!",
		"Visual broken, find them!",
		"Visual lost, make sure they're gone!",
		"They're gone, clear the area!"
	)
	*/
