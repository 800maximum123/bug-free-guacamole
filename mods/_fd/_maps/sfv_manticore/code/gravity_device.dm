/obj/machinery/gravity_device
    name = "small gravity generator"
    desc = "A small machine which helps to support normal gravity level in a small secluded area."
    icon = 'mods/_fd/fd_assets/icons/structures/holopad.dmi'
    icon_state = "holopad2"
    anchored = 1
    use_power = 2
    density = 0
    active_power_usage = 25000
    var/active = TRUE

/obj/machinery/gravity_device/New()
    ..()
    update_gravity()

/obj/machinery/gravity_device/attack_hand(mob/user)

    active = !active
    update_gravity()
    to_chat(user, "Вы [active ? "активировали" : "деактивировали"] генератор гравитации.")

/obj/machinery/gravity_device/power_change()
    ..()
    update_gravity()

/obj/machinery/gravity_device/proc/update_gravity()
    if(active)
        use_power = 2
        icon_state = "holopad2"
    else
        use_power = 0
        icon_state = "holopad0"
    var/area/A = get_area(src)
    if(A)
        A.has_gravity = (active && powered()) ? 1 : 0
