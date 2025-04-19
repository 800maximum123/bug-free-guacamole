/mob/verb/roll_d20()
    set name = "Roll D20"
    set category = "IC"

    var/description = input("Describe your action:", "Roll Description") as text|null
    if(!description)
        return

    var/roll = rand(1, 20)
    var/message = "<img src=\ref['mods/_fd/roll_dice/icons/d20.dmi']>| [roll]/20 |  [usr] [description]"

    var/color = get_roll_color(roll)
    var/colored_message = "<span style='color: [color]; font-size: 13px;'>[message]</span>"

    var/icon_state = "d20[roll]"
    var/image/dice_overlay = image('icons/obj/dice.dmi', src, icon_state)
    dice_overlay.pixel_y = 26
    dice_overlay.layer = 4.1
    overlays += dice_overlay

    for(var/mob/M in viewers(usr))
        M.show_message(colored_message, 1)

    playsound(usr, 'sound/effects/ding2.ogg', 50, 1)

    spawn(50)
        overlays -= dice_overlay
        qdel(dice_overlay)

/proc/get_roll_color(roll)
    var/r, g, b
    if(roll <= 10)
        r = 255
        g = round(255 * (roll - 1) / 9)
        b = 0
    else
        r = round(255 * (20 - roll) / 10)
        g = 255
        b = 0
    return rgb(r, g, b)
