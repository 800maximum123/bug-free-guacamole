/obj/item/storage/box/claymore/black_box

	name = "spaceship black box"
	desc = "This is a spaceship device with a hard-drive within it, which stores important information about last moments of the vessel."
	icon = 'mods/_fd/_maps/gccv_ulyanovsk/icons/ulyanovsk.dmi'
	icon_state = "mine_packet"
	w_class = ITEM_SIZE_SMALL
	contents_allowed = list(/obj/item/paper/black_box)
	max_storage_space = ITEM_SIZE_SMALL * 1
	max_w_class = ITEM_SIZE_SMALL
	startswith = list(/obj/item/paper/black_box = 1)

/obj/item/paper/black_box

	name = "black box disk"
	desc = "It stores an information about events happend on a spaceship. MUST BE INSERTED IN A SLIDE PROJECTOR"
	icon = 'icons/obj/assemblies/electronic_tools.dmi'
	icon_state = "upgrade_disk"
	item_state = "upgrade_disk"
