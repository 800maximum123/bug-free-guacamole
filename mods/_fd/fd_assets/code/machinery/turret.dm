/obj/machinery/porta_turret/ballistic
	name = "automatic turret"
	icon = 'mods/_fd/fd_assets/icons/machinery/turrets.dmi'
	icon_state = "syndie_off"
	raised = 1
	enabled = 1
	installation = /obj/item/gun/projectile/automatic/assault_rifle
	ailock = 1
	lethal = 0
	check_synth	 = 0
	check_access = 1
	check_arrest = 1
	check_records = 1
	check_weapons = 1
	check_anomalies = 1
	density = TRUE
	shot_delay = 10
	health_max = 130
	reqpower = 100
	idle_power_usage = 20
	active_power_usage = 80

/obj/machinery/porta_turret/ballistic/sniper
	installation = /obj/item/gun/projectile/heavysniper
	shot_delay = 30

/obj/machinery/porta_turret/ballistic/shotgun
	installation = /obj/item/gun/projectile/automatic/shotgun

/obj/machinery/porta_turret/ballistic/rocket // no way bro, what the fuck are you doing
	installation = /obj/item/gun/launcher/rocket
	health_max = 60
	shot_delay = 45

/obj/machinery/porta_turret/ballistic/railgun
	installation = /obj/item/gun/magnetic/railgun/automatic/mmi

/obj/machinery/porta_turret/ballistic/weapon_setup(guntype)
	switch(guntype)
		if(/obj/item/gun/projectile/automatic/assault_rifle)
			projectile = /obj/item/projectile/bullet/rifle/military
			eprojectile = /obj/item/projectile/bullet/rifle/military
			shot_sound = 'sound/weapons/gunshot/gunshot3.ogg'

		if(/obj/item/gun/projectile/heavysniper)
			projectile = /obj/item/projectile/bullet/rifle/shell
			eprojectile = /obj/item/projectile/bullet/rifle/shell
			shot_sound = 'sound/weapons/gunshot/sniper.ogg'

		if(/obj/item/gun/projectile/automatic/shotgun)
			projectile = /obj/item/projectile/bullet/shotgun
			eprojectile = /obj/item/projectile/bullet/shotgun
			shot_sound = 'sound/weapons/gunshot/shotgun.ogg'

		if(/obj/item/gun/launcher/rocket)
			projectile = /obj/item/missile
			eprojectile = /obj/item/missile
			shot_sound = 'sound/weapons/gunshot/shotgun.ogg' //PLACEHOLDER

		if(/obj/item/gun/magnetic/railgun/automatic/mmi)
			projectile = /obj/item/projectile/bullet/magnetic/slug
			eprojectile = /obj/item/projectile/bullet/magnetic/slug
			shot_sound = 'sound/weapons/gunshot/sniper.ogg' //PLACEHOLDER

/obj/machinery/porta_turret/ballistic/use_tool(obj/item/I, mob/living/user, list/click_params)
	if(MACHINE_IS_BROKEN(src))
		if(isCrowbar(I))
			//If the turret is destroyed, you can remove it with a crowbar to
			//try and salvage its components
			to_chat(user, "<span class='notice'>You begin prying the metal coverings off.</span>")
			if(do_after(user, 20, src))
				if(prob(100))
					to_chat(user, "<span class='notice'>You remove the turret but did not manage to salvage anything.</span>")
				qdel(src) // qdel

	else if(isWrench(I))
		if(enabled || raised)
			to_chat(user, SPAN_WARNING("You cannot unsecure an active turret!"))
			return TRUE
		else return ..()

/obj/machinery/porta_turret/ballistic/emag_act(remaining_charges, mob/user)
	to_chat(user, "<span class='notice'>You try to emag ballistic turret. So sad for you that I don't want that.</span>")
	return

/obj/machinery/porta_turret/ballistic/on_update_icon()
	if(MACHINE_IS_BROKEN(src))
		icon_state = "syndie_broken"
	else
		icon_state = "syndie_off"

/obj/machinery/porta_turret/ballistic/damage_health(damage, damage_type, damage_flags, severity, skip_can_damage_check)
	if(damage < 10)
		visible_message("Seems like [src] doesn't take any damage!")
		return

	if (!raised && !raising)
		damage = damage / 8
	. = ..()

/obj/machinery/porta_turret/ballistic/popUp()	//pops the turret up
	if(disabled)
		return
	if(raising || raised)
		return
	if(MACHINE_IS_BROKEN(src))
		return
	set_raised_raising(raised, 1)
	update_icon()
	set_raised_raising(1, 0)
	update_icon()

/obj/machinery/porta_turret/ballistic/popDown()	//pops the turret down // fuck you
	set waitfor = FALSE
	last_target = null
	if(disabled)
		return
	if(raising || !raised)
		return
	if(MACHINE_IS_BROKEN(src))
		return
	return
