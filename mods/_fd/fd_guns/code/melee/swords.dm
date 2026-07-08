/obj/item/material/sword/katana/muramasa
	name = "katana muramasa"
	desc = "A polished ancient oriental sword with an ornate hilt, a wave-like edge pattern and an obscure seal on the base. Probably belongs in a museum - all the more fun slashing with it!"
	icon = 'mods/_fd/fd_guns/icons/melee_physical.dmi'
	icon_state = "muramasa"
	item_state = "katana"
	furniture_icon = "muramasa_handle"
	base_parry_chance = 20 //for style points


/obj/item/clothing/accessory/storage/holster/katana
	name = "katana sheath"
	desc = "A wooden sheath for an oriental sword with a long cord for attachment. Feels authentic, though a bit heavy."
	icon = 'mods/_fd/fd_guns/icons/holsters.dmi'
	icon_state = "holster_katana"
	can_holster = list(/obj/item/material/sword/katana)
	sound_in = 'sound/effects/holster/sheathin.ogg'
	sound_out = 'sound/effects/holster/sheathout.ogg'
	body_location = LEGS