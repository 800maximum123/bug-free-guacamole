#define CALIBER_SHIP_HMG "57mm"

/obj/item/ammo_magazine/ammobox/hmg
	name = "ammo box"
	desc = "Ammo box that contains 57mm rounds."
	icon_state = "crate_closed_ammo"
	caliber = CALIBER_SHIP_HMG
	max_ammo = 200
	ammo_type = /obj/item/ammo_casing/huge_caliber/hmg

/obj/item/ammo_magazine/ammobox/hmg/high_explosive
	name = "HE ammo box"
	desc = "Ammo box that contains 57mm high explosive rounds."
	ammo_type = /obj/item/ammo_casing/huge_caliber/hmg/high_explosive

/obj/item/ammo_casing/huge_caliber/hmg
	name = "heavy machine gun casing"
	desc = "A heavy machine gun round casing."
	caliber = CALIBER_SHIP_HMG
	projectile_type = /obj/item/projectile/bullet/huge_caliber/hmg_ship

/obj/item/ammo_casing/huge_caliber/hmg/high_explosive
	projectile_type = /obj/item/projectile/bullet/huge_caliber/hmg_ship/high_explosive

/obj/item/projectile/bullet/huge_caliber/hmg_ship
	name = "heavy machine gun bullet"
	icon_state = "bullet"
	damage = CANNON_DMG_MEDIUM
	armor_penetration = 30
	pew_spread = 20

	var/should_explode = FALSE

/obj/item/projectile/bullet/huge_caliber/hmg_ship/Bump(atom/A as mob|obj|turf|area, forced=0)

	if(!exploded && !should_explode)
		exploded = TRUE
	..()

/obj/item/projectile/bullet/huge_caliber/hmg_ship/high_explosive // А нужны нам вообще ХЕшки на пулемёт?...Может что-то другое добавить?
	should_explode = TRUE

	damage = CANNON_DMG_MEDIUM
	explosion_radius = EXPLOSION_FALLOFF_VERYHIGH
	explosion_max_power = EXPLOSION_POWER_SLIGHTLYHIGH

#undef CALIBER_SHIP_HMG
