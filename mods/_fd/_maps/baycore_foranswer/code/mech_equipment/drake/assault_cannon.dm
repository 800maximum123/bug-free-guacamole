/datum/mech_equipment/firearm/assault_cannon
	name = "Штурмовое орудие"
	action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi'
	action_state = "26"

	ammo = 1000
	max_ammo = 1000
	magazines = 1
	max_magazines = 1

	bullet_type = /obj/item/projectile/bullet/mech/assault_cannon
	burst_size = 12
	reload_time = 10 SECONDS

	cooldown = 6 SECONDS

/obj/item/projectile/bullet/mech/assault_cannon
	icon_state = "bolter"
	fire_sound = 'sound/weapons/gunshot/minigun.ogg'

	integrity_damage = 2 // Дамаг пока такой, ибо я всё ещё не знаю, планируем мы повышать урон, или наоборот понижать хп
	hull_damage = 20 // Гарантирует, что ты останешься без брони, но не убьёт
