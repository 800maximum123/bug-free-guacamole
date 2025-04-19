
/obj/item/gun/energy/laser/lasgun/kanarys
	name = "SLR-98"
	desc = "The SLR-98 (Sniper Laser Rifle) is an old, somewhat outdated, laser rifle that is heavily used by pirates and bounty hunters on Kabul. It has a shabby appearance, as well as desert camouflage, which is perfect for working on a desolate and godforsaken planet in the Pirx system. s."
	icon = 'mods/_fd/fd_assets/customs/kanaris/willheim.dmi'
	icon_state = "energy-rifle-s"
	item_state = "rifle-scope"
	item_icons = list(
		slot_l_hand_str = 'mods/_fd/fd_assets/customs/kanaris/onmob/lefthand.dmi',
		slot_r_hand_str = 'mods/_fd/fd_assets/customs/kanaris/onmob/righthand.dmi',
		slot_back_str = 'mods/_fd/fd_guns/icons/onmob/weapon_cpss_back.dmi'
		)
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	accuracy = 0
	force = 15
	screen_shake = 0
	one_hand_penalty = 4
	battery_changable = TRUE
	cell_type = /obj/item/cell/guncell/lasgun
	charge_cost = 200
	scope_zoom = 1.5
	scoped_accuracy = 3
	bulk = GUN_BULK_RIFLE
	projectile_type = /obj/item/projectile/lasbolt/lasgun
	wielded_item_state = "rifle-scope-w"
	firemodes = list(
			list(mode_name = "semiauto", burst=1, fire_delay=2, move_delay=2, accuracy=0, charge_cost=200, projectile_type = /obj/item/projectile/lasbolt),
			list(mode_name = "overcharge", burst=1, fire_delay=4, move_delay=6, accuracy=0, charge_cost=800, projectile_type = /obj/item/projectile/lasbolt/overcharge)
		)

/obj/item/gun/energy/laser/lasgun/kanarys/on_update_icon()
	..()
