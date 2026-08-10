/obj/item/grenade/smokebomb
	desc = "It is set to detonate in 2 seconds. Quickly explodes into a cloud of screening and flammable white phosphorous."
	name = "WP smoke bomb"
	icon = 'icons/obj/weapons/grenade.dmi'
	icon_state = "flashbang"
	det_time = 20
	item_state = "flashbang"
	slot_flags = SLOT_BELT
	var/datum/effect/smoke_spread/smoke

/obj/item/grenade/smokebomb/Destroy()
	QDEL_NULL(smoke)
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/grenade/smokebomb/detonate(mob/living/user)
	smoke = new smoke
	smoke.attach(src)
	smoke.set_up(10, 0, get_turf(src))
	smoke.start()

/obj/item/grenade/smokebomb/safe
	desc = "It is set to detonate in 2 seconds. Spits out safe screening smoke.."
	name = "smoke bomb"
