/obj/item/trash/cigbutt/cigarbutt/black
	icon = 'mods/_fd/fd_customs/customs/slivka/icon/masks.dmi'
	name = "cigar butt"
	desc = "A manky old cigar butt."
	icon_state = "bcigbutt"

/obj/item/clothing/mask/smokable/cigarette/blackwish
	brand = "\improper blackwish"
	icon = 'mods/_fd/fd_customs/customs/slivka/icon/masks.dmi'
	icon_state = "bcigoff"
	icon_on = "bcigon"
	smoketime = 500
	filling = list(/datum/reagent/tobacco/fine = 5)
	type_butt = /obj/item/trash/cigbutt/cigarbutt/black
	item_icons = list(
			slot_wear_mask_str = 'mods/_fd/fd_customs/customs/slivka/onmob/ciga.dmi')


/obj/item/storage/fancy/smokable/phopsor
	name = "pack of Blue Wish"
	desc = "These cigarettes are the height of luxury. They're smooth, they're cool, and they smell like victory... and cigarette smoke."
	icon = 'mods/_fd/fd_customs/customs/slivka/icon/cigarettes.dmi'
	icon_state = "blackpacket"
	item_state = "blackpacket"
	startswith = list(
		/obj/item/clothing/mask/smokable/cigarette/blackwish = 6
	)
