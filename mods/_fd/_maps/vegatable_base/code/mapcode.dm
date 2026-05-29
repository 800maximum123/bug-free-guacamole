/singleton/submap_archetype/vegetable_base
	descriptor = "Vegetable Base"
	map = "TRK-17 Vegetable Base"
	crew_jobs = list(/datum/job/submap/vegetable_base)

/obj/submap_landmark/joinable_submap/vegetable_base
	name = "TRK-17 Vegetable Base"
	archetype = /singleton/submap_archetype/vegetable_base

/datum/job/submap/vegetable_base
	title = "Heaven Prisoner"
	total_positions = -1
	outfit_type = /singleton/hierarchy/outfit/vegetable_base
	create_record = TRUE
	skill_points = 62
	no_skill_buffs = TRUE
	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_MAX,
		SKILL_FINANCE = SKILL_MAX,
		SKILL_EVA = SKILL_MAX,
		SKILL_MECH = SKILL_MAX,
		SKILL_PILOT = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_MAX,
		SKILL_BOTANY = SKILL_MAX,
		SKILL_COOKING = SKILL_MAX,
		SKILL_COMBAT = SKILL_MAX,
		SKILL_WEAPONS = SKILL_MAX,
		SKILL_FORENSICS = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL = SKILL_MAX,
		SKILL_ATMOS = SKILL_MAX,
		SKILL_ENGINES = SKILL_MAX,
		SKILL_DEVICES = SKILL_MAX,
		SKILL_SCIENCE = SKILL_MAX,
		SKILL_MEDICAL = SKILL_MAX,
		SKILL_ANATOMY = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_MAX
	)

/datum/job/submap/aaaa_facility/post_equip_rank(mob/living/person, alt_title)
	. = ..()
	person.simple_combat_on = TRUE
	person.generate_binds()

/singleton/hierarchy/outfit/vegetable_base
	name = "Heaven Prisoner Appearance"

	uniform = /obj/item/clothing/under/color/black
	shoes = null

	back = null

/obj/submap_landmark/spawnpoint/vegetable_base
	name = "Heaven Prisoner"

/mob/living
	var/mob/living/connected_copy

/obj/structure/fd/vegetable_base/teleport_target
	name = "teleport target"
	desc = "..."

	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "landmark"

	invisibility = 101
	mouse_opacity = FALSE

/obj/structure/fd/vegetable_base/teleport_trigger
	name = "teleport"
	desc = "..."

	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "noteam"

	invisibility = 50
	var/list/obj/structure/fd/vegetable_base/teleport_target/t_targets = list()

/obj/structure/fd/vegetable_base/teleport_trigger/Initialize()
	. = ..()

	for(var/obj/structure/fd/vegetable_base/teleport_target/T in world)
		t_targets += T

/obj/structure/fd/vegetable_base/teleport_trigger/Crossed(mob/living/M)
	. = ..()

	if(isliving(M))
		if(M.connected_copy)
			animate(M, alpha = 0, time = 0.5 SECONDS, easing = LINEAR_EASING)
			spawn(0.5 SECONDS)

				M.ghostize(0)
				M.connected_copy.ckey = M.ckey

			spawn(1 SECONDS)
				qdel(M)
			return TRUE
		else
			animate(M, alpha = 0, time = 0.5 SECONDS, easing = LINEAR_EASING)
			spawn(0.5 SECONDS)
				M.forceMove(get_turf(pick(t_targets)))
				M.alpha = 255

			return TRUE
