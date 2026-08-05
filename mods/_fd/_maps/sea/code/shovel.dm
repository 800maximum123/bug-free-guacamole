/obj/item/shovel/etool
	name = "SCG M61 entrenching tool"
	desc = "A trooper's best friend. Dually useful for digging foxholes and bashing in heads. Folds in half for easier storage."
	icon = 'mods/_fd/_maps/Sea/icons/marine-items.dmi'
	icon_state = "etool"
	item_state = "etool"
	force = 30
	throwforce = 2
	w_class = ITEM_SIZE_LARGE
	sharp = TRUE
	edge = TRUE
	puncture = TRUE
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("slashed", "stabbed", "bashed")

	var/folded = FALSE

/obj/item/shovel/etool/Initialize()
	. = ..()
	update_icon()
	if(folded)
		w_class = ITEM_SIZE_SMALL
		force = 5
		sharp = FALSE
		edge = FALSE
		puncture = FALSE
		hitsound = 'sound/weapons/genhit3.ogg'

/obj/item/shovel/etool/on_update_icon()
	if(folded)
		icon_state = "[initial(icon_state)]_c"
		item_state = "[initial(item_state)]_c"
	else
		icon_state = initial(icon_state)
		item_state = initial(item_state)
	..()


/obj/item/shovel/etool/attack_self(mob/user)
	folded = !folded
	if(folded)
		w_class = ITEM_SIZE_SMALL
		force = 5
		sharp = FALSE
		edge = FALSE
		puncture = FALSE
		hitsound = 'sound/weapons/genhit3.ogg'
	else
		w_class = ITEM_SIZE_LARGE
		force = 30
		sharp = initial(sharp)
		edge = initial(edge)
		puncture = initial(puncture)
		hitsound = initial(hitsound)
	update_icon()
	..()

/obj/item/shovel/etool/folded
	folded = TRUE
