/obj/item/cell/nuclear_battery
	name = "Strange biological thing."
	desc = "It looks like a diona's piece. It is... Pulsating?"
	force = 3.0
	throwforce = 3.0
	throw_speed = 2
	throw_range = 3
	maxcharge = 1750
	charge = 0
	icon = 'mods/_fd/fd_customs/customs/krabinator3000/nuclear_battery.dmi'
	icon_state = "for_krab_from_ahmoq"
	var/inside = 0
	var/capacity = 50

/obj/item/cell/nuclear_battery/pre_use_item(obj/item/W, mob/user)
	if(istype(W, /obj/item/stack/material/uranium))
		var/obj/item/stack/material/uranium/B = W
		user.visible_message("Эта штука начинает втягивать в себя уран.")
		if(capacity - inside < B.amount * 10)
			B.amount = B.amount - (capacity - inside) / 10
			inside = capacity
			user.visible_message("И... Оно съело часть урана?")
		else
			inside = inside + B.amount * 10
			qdel(B)
			user.visible_message("И... Оно съело весь уран?")
		return 1
	return ..()

/obj/item/cell/nuclear_battery/post_use_item(obj/item/tool, mob/living/user, interaction_handled, use_call, click_params)
	if(inside > 0 && charge < maxcharge)
		set_light(2, 1, "#008000")
		while(inside > 0 && charge < maxcharge)
			inside -= 0.01
			charge += 2
			sleep(20)
		set_light(0)
	else
		return ..()

/mob/living/carbon/human/proc/diona_spawn_custom_item()
	set name = "Spawn cell"
	set desc = "Создаёт батарею холодного синтеза."
	set category = "Abilities"

	if(incapacitated())
		to_chat(src, "<span class='warning'>Вы не можете сейчас этого сделать!</span>")
		return

	var/target_path = /obj/item/cell/nuclear_battery

	var/obj/item/new_item = new target_path(src)
	if(put_in_hands(new_item))
		to_chat(src, "<span class='notice'>Вы сплетаете из своих лоз [new_item.name] прямо в руках.</span>")
	else
		new_item.forceMove(get_turf(src))
		to_chat(src, "<span class='warning'>Ваши руки заняты, поэтому [new_item.name] падает на пол.</span>")
