// CALIBERS
// Pistol calibers
#define CALIBER_PISTOL 				"10mm"
#define CALIBER_PISTOL_SMALL 		"7mm"
#define CALIBER_PISTOL_MAGNUM 		"15mm"
#define CALIBER_PISTOL_FLECHETTE	"4mm"
#define CALIBER_PISTOL_ANTIQUE		"~10mm"
#define CALIBER_PISTOL_FAST	 		"5.7mmP"
// Rifle calibers
#define CALIBER_RIFLE				"5mmR"
#define CALIBER_RIFLE_CASELESS		"6mmC"
#define CALIBER_RIFLE_MILITARY		"7mmR"
#define CALIBER_ANTIMATERIAL		"15mmR"
// Misc calibers
#define CALIBER_SHOTGUN				"12g"
#define CALIBER_GYROJET				"20mmG"
#define CALIBER_CAPS				"caps"
#define CALIBER_DART				"darts"
#define CALIBER_ROCKET				"rocket"

// Casings action flags
#define HOLD_CASINGS	0	/// Do not do anything after firing. Manual action, like pump shotguns, or guns that want to define custom behaviour
#define CLEAR_CASINGS	1	/// Clear chambered so that the next round will be automatically loaded and fired, but don't drop anything on the floor
#define EJECT_CASINGS	2	/// Drop spent casings on the ground after firing
#define CYCLE_CASINGS	3	/// Cycle casings, like a revolver. Also works for multibarrelled guns

// Gun loading types
#define SINGLE_CASING 	1	/// The gun only accepts ammo_casings. ammo_magazines should never have this as their mag_type.
#define SPEEDLOADER 	2	/// Transfers casings from the mag to the gun when used.
#define MAGAZINE 		4	/// The magazine item itself goes inside the gun

// Weapons bulks
// For more information read bulk variable on /obj/item/gun
#define GUN_BULK_LIGHT_PISTOL	-1	/// Holdout pistols, SMGs, anything designed to run-n-gun
#define GUN_BULK_PISTOL			0	/// Pistols, revolvers, normal-sized guns
#define GUN_BULK_HEAVY_PISTOL	3	/// Magnum pistosl, heavy revolvers
#define GUN_BULK_LIGHT_RIFLE	4	/// Carbines, light bullpups
#define GUN_BULK_RIFLE			5	/// Assault rifles
#define GUN_BULK_HEAVY_RIFLE	6	/// DMRs, bolt-action rifles, heavy bullpups
#define GUN_BULK_MACHINE_GUN 	7	/// Light machine guns
#define GUN_BULK_ANTI_TANK		8	/// Anti-material rifles, RPGs

// Weapons one hand penalty
// For more information read one_hand_penalty variable on /obj/item/gun
#define GUN_OHP_MOUNTED			0
#define GUN_OHP_PISTOL			0
#define GUN_OHP_HEAVY_PISTOL	2
#define GUN_OHP_LIGHT_RIFLE		3	/// Threshold for one-handed reload
#define GUN_OHP_RIFLE			6
#define GUN_OHP_HEAVY_RIFLE		8
#define GUN_OHP_MACHINE_GUN		12
#define GUN_OHP_ANTI_TANK		14
#define GUN_OHP_MINIGUN			20

// BULLET IMPACT SOUNDS
// Bullet impact flags
#define BULLET_IMPACT_NONE		"none"
#define BULLET_IMPACT_METAL		"metal"
#define BULLET_IMPACT_MEAT		"meat"
// Bullet impact sounds lists
#define SOUNDS_BULLET_MEAT  list('sound/effects/projectile_impact/bullet_meat1.ogg', 'sound/effects/projectile_impact/bullet_meat2.ogg', 'sound/effects/projectile_impact/bullet_meat3.ogg', 'sound/effects/projectile_impact/bullet_meat4.ogg')
#define SOUNDS_BULLET_METAL  list('sound/effects/projectile_impact/bullet_metal1.ogg', 'sound/effects/projectile_impact/bullet_metal2.ogg', 'sound/effects/projectile_impact/bullet_metal3.ogg')
#define SOUNDS_LASER_MEAT  list('sound/effects/projectile_impact/energy_meat1.ogg','sound/effects/projectile_impact/energy_meat2.ogg')
#define SOUNDS_LASER_METAL  list('sound/effects/projectile_impact/energy_metal1.ogg','sound/effects/projectile_impact/energy_metal2.ogg')
