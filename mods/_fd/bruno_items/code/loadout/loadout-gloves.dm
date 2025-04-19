/datum/gear/gloves/fingerless
    display_name = "fingerless gloves, colour select"
    path = /obj/item/clothing/gloves/color/fingerless
    flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/gloves/oneglove
    display_name = "one glove, colour select"
    path = /obj/item/clothing/gloves/color/oneglove_right
    flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/gloves/oneglove/New()
    ..()
    var/oneglove = list()
    oneglove["Right glove"] = /obj/item/clothing/gloves/color/oneglove_right
    oneglove["Left glove"] = /obj/item/clothing/gloves/color/oneglove_left
    oneglove["Right fingerless glove"] = /obj/item/clothing/gloves/color/oneglove_fingerless_right
    oneglove["Left fingerless glove"] = /obj/item/clothing/gloves/color/oneglove_fingerless_left
    gear_tweaks += new/datum/gear_tweak/path(oneglove)
