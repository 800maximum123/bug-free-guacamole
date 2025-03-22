/obj/structure/fd/ladder_teleport
	name = "airlock"
	desc = "Some old-looking airlock."
	icon = 'mods/_fd/_maps/sfv_manticore/icons/ms_ladders2.dmi'
	icon_state = "dasbunker"
	var/id = null			//id of this bump_teleporter.
	var/id_target = null	//id of bump_teleporter which this moves you to.
	anchored = TRUE
	density = FALSE
	opacity = FALSE

	var/static/list/AllFDTeleporters

/obj/structure/fd/ladder_teleport/Initialize()
	. = ..()
	LAZYADD(AllFDTeleporters, src)

/obj/structure/fd/ladder_teleport/Destroy()
	LAZYREMOVE(AllFDTeleporters, src)
	return ..()

/obj/structure/fd/ladder_teleport/attack_hand(mob/living/AM)
	if(!ismob(AM))
		return
	if(!id_target)
		return

	for(var/obj/structure/fd/ladder_teleport/BT in AllFDTeleporters)
		if(BT.id == src.id_target)
			icon_state = "dasbunker_open"
			if(do_after(AM, 3 SECONDS, target = src))
				icon_state = "asbunker"
				AM.forceMove(BT.loc) //Teleport to location with correct id.

/obj/structure/fd/ladder_teleport/alt
	icon_state = "ladderup"
	icon = 'icons/obj/structures/structures.dmi'

/obj/structure/fd/ladder_teleport/alt/attack_hand(mob/living/AM)
	if(!ismob(AM))
		return
	if(!id_target)
		return

	for(var/obj/structure/fd/ladder_teleport/BT in AllFDTeleporters)
		if(BT.id == src.id_target)
			icon_state = "ladderup"
			if(do_after(AM, 3 SECONDS, target = src))
				icon_state = "ladderup"
				AM.forceMove(BT.loc) //Teleport to location with correct id.
