/obj/item/reagent_containers/glass
	var/obj/item/inside = null

/obj/item/reagent_containers/glass/pre_use_item(obj/item/W, mob/user)
	if(istype(W, /obj/item/reagent_containers/food/snacks/grown) && !inside)
		if(src.reagents.maximum_volume - src.reagents.total_volume < W.reagents.total_volume)
			user.visible_message("[user] spills some liquid from [src] on the floor")
			src.reagents.trans_to_turf(get_turf(src), W.reagents.total_volume - (src.reagents.maximum_volume - src.reagents.total_volume))
		src.reagents.maximum_volume -= W.reagents.total_volume
		user.drop_item(W)
		W.forceMove(src)
		inside = W
		return 1

	if(istype(W, /obj/item/material/kitchen/utensil/spoon))
		user.visible_message("[user] stirs [src] with a spoon")
		if(inside)
			src.reagents.maximum_volume += inside.reagents.total_volume
			inside.reagents.trans_to(src, inside.reagents.total_volume)
			if(src.reagents.get_reagent_amount(/datum/reagent/water) > 0)
				var/swap = src.reagents.get_reagent_amount(/datum/reagent/water)
				src.reagents.del_reagent(/datum/reagent/water)
				src.reagents.add_reagent(/datum/reagent/water/cumpot, swap)
				QDEL_NULL(inside)
		return 1
	return ..()

/obj/item/reagent_containers/glass/MouseDrop(atom/over_atom)
	if(inside)
		var/mob/living/carbon/human/user = usr
		if(!istype(user) || user.incapacitated())
			return ..()
		if(!(src in user.contents) && !in_range(src, user))
			return ..()
		if(istype(over_atom, /obj/screen) && inside)
			var/obj/screen/S = over_atom
			if(S.name == "r_hand" || S.name == "l_hand")
				inside.forceMove(user.loc)
				if(user.put_in_hands(inside))
					src.reagents.maximum_volume += inside.reagents.total_volume
					inside = null
					return
				else
					src.reagents.maximum_volume += inside.reagents.total_volume
					inside.forceMove(src)
	return ..()

/obj/item/reagent_containers/food/drinks/pre_use_item(obj/item/W, mob/user)
	if(istype(W, /obj/item/reagent_containers/food/snacks/grown) && !inside)
		if(src.reagents.maximum_volume - src.reagents.total_volume < W.reagents.total_volume)
			user.visible_message("[user] spills some liquid from [src] on the floor")
			src.reagents.trans_to_turf(get_turf(src), W.reagents.total_volume - (src.reagents.maximum_volume - src.reagents.total_volume))
		src.reagents.maximum_volume -= W.reagents.total_volume
		user.drop_item(W)
		W.forceMove(src)
		inside = W
		return 1

	if(istype(W, /obj/item/material/kitchen/utensil/spoon))
		user.visible_message("[user] stirs [src] with a spoon")
		if(inside)
			src.reagents.maximum_volume += inside.reagents.total_volume
			inside.reagents.trans_to(src, inside.reagents.total_volume)
			if(src.reagents.get_reagent_amount(/datum/reagent/water) > 0)
				var/swap = src.reagents.get_reagent_amount(/datum/reagent/water)
				src.reagents.del_reagent(/datum/reagent/water)
				src.reagents.add_reagent(/datum/reagent/water/cumpot, swap)
				QDEL_NULL(inside)
		return 1
	return ..()

/obj/item/reagent_containers/food/drinks/MouseDrop(atom/over_atom)
	if(inside)
		var/mob/living/carbon/human/user = usr
		if(!istype(user) || user.incapacitated())
			return ..()
		if(!(src in user.contents) && !in_range(src, user))
			return ..()
		if(istype(over_atom, /obj/screen) && inside)
			var/obj/screen/S = over_atom
			if(S.name == "r_hand" || S.name == "l_hand")
				inside.forceMove(user.loc)
				if(user.put_in_hands(inside))
					src.reagents.maximum_volume += inside.reagents.total_volume
					inside = null
					return
				else
					src.reagents.maximum_volume += inside.reagents.total_volume
					inside.forceMove(src)
	return ..()
