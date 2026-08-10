/obj/item/grenade/smokebomb
	desc = "It is set to detonate in 2 seconds. Explodes into a cloud of screening and flammable white phosphorous."
	name = "WP smoke bomb"
	icon = 'icons/obj/weapons/grenade.dmi'
	icon_state = "smokeblue"
	det_time = 20
	item_state = "flashbang"
	slot_flags = SLOT_BELT
	var/datum/effect/smoke_spread/smoke = /datum/effect/smoke_spread/bad
	var/amount = 12

/obj/item/grenade/smokebomb/Destroy()
	QDEL_NULL(smoke)
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/grenade/smokebomb/detonate(mob/living/user)
	smoke = new smoke
	smoke.attach(src)
	smoke.set_up(amount, 0, get_turf(src))
	smoke.start(TRUE)

/obj/item/grenade/smokebomb/safe
	desc = "It is set to detonate in 2 seconds. Spits out safe screening smoke."
	name = "smoke bomb"
	icon_state = "smokewhite"
	smoke = /datum/effect/smoke_spread
	amount = 15

/obj/item/grenade/smokebomb/safe/yellow
	name = "smoke bomb (yellow)"
	icon_state = "smokeyellow"
	smoke = /datum/effect/smoke_spread/yellow

/obj/item/grenade/smokebomb/safe/blue
	name = "smoke bomb (blue)"
	icon_state = "smokeblue"
	smoke = /datum/effect/smoke_spread/blue

/obj/item/grenade/smokebomb/safe/red
	name = "smoke bomb (red)"
	icon_state = "smokered"
	smoke = /datum/effect/smoke_spread/red
