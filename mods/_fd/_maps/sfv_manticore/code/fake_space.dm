// Короче. Что я нахуевертил?
// Перед вами - блядский пол. Обычный нормальный пол. Только выглядит он как космос. И пахнет как космос. Но это нихуя не космос.
// А чуть ниже этого богомерзкой копии космоса находится латтис, который должен с этим космосом работать. Не ставьте этот латтис никуда больше, я хуй знает, чем это может закончиться.

/turf/simulated/floor/plating/fake_space

	var/starlit = FALSE
	icon = 'icons/turf/space.dmi'
	icon_state = "black"
	name = "\proper space"

/turf/simulated/floor/plating/fake_space/proc/update_starlight()
	if(!config.starlight)
		return

	//We only need starlight on turfs adjacent to dynamically lit turfs, for example space near bulkhead
	for (var/turf/T in RANGE_TURFS(src, 1))
		if (!isloc(T.loc) || !TURF_IS_DYNAMICALLY_LIT_UNSAFE(T))
			continue

		add_ambient_light(SSskybox.background_color, config.starlight)
		starlit = TRUE
		return

	if(TURF_IS_AMBIENT_LIT_UNSAFE(src))
		remove_starlight()

/turf/simulated/floor/plating/fake_space/proc/remove_starlight()
	if(starlit)
		replace_ambient_light(SSskybox.background_color, null, config.starlight, 0)

/turf/simulated/floor/plating/fake_space/Initialize()
	. = ..()
	update_starlight()

	appearance = SSskybox.space_appearance_cache[(((x + y) ^ ~(x * y) + z) % 25) + 1]

/obj/structure/fake_lattice
	name = "lattice"
	desc = "A lightweight support lattice."
	icon = 'icons/obj/structures/smoothlattice.dmi'
	icon_state = "lattice0"
	density = FALSE
	anchored = TRUE
	w_class = ITEM_SIZE_NORMAL
	layer = 2.23
	color = COLOR_STEEL
	obj_flags = OBJ_FLAG_NOFALL
