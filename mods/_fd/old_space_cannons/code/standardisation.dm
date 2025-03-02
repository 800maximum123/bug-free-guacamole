
//КОРАБЕЛЬНЫЕ ПУШКИ - ЧИСТЫЙ УРОН

	// Малый урон
#define CANNON_DMG_VERYLOW 50
#define CANNON_DMG_LOW 100
#define CANNON_DMGS_SLIGHTLYLOW 150

	// Средний урон
#define CANNON_DMG_MEDIUM 250

	// Высокий урон
#define CANNON_DMG_SLIGHTLYHIGH 300
#define CANNON_DMG_HIGH 400
#define CANNON_DMGS_VERYHIGH 500

	// ОЧЕНЬ высокий урон
#define CANNON_DMG_SLIGHTLYOVER 700
#define CANNON_DMG_OVERRATED 800
#define CANNON_DMGS_VERYOVER 900

	// НЕВОЗМОЖНЫЙ урон
#define CANNON_DMG_HELL 1000

//КОРАБЕЛЬНЫЕ ПУШКИ - ВЗРЫВЫ

#define EXPLOSION_FALLOFF_VERYHIGH 200
#define EXPLOSION_FALLOFF_HIGH 100
#define EXPLOSION_FALLOFF_MEDIUM 50
#define EXPLOSION_FALLOFF_LOW 20

#define EXPLOSION_POWER_LOW 150
#define EXPLOSION_POWER_MEDIUM 200
#define EXPLOSION_POWER_SLIGHTLYHIGH 300
#define EXPLOSION_POWER_HIGH 500

	// Слабенькие взрывы
// cell_explosion([цель], EXPLOSION_POWER_LOW, EXPLOSION_FALLOFF_HIGH)

	// Средненькие взрывы
// cell_explosion([цель], EXPLOSION_POWER_MEDIUM, EXPLOSION_FALLOFF_MEDIUM)

	// Чуть сильнее взрывы
// cell_explosion([цель], EXPLOSION_POWER_SLIGHTLYHIGH, EXPLOSION_FALLOFF_LOW)

	// Сильный взрыв, маленькая потенция
// cell_explosion([цель], EXPLOSION_POWER_HIGH, EXPLOSION_FALLOFF_HIGH)

	// Сильный взрыв, высокая потенция
// cell_explosion([цель], EXPLOSION_POWER_HIGH, EXPLOSION_FALLOFF_LOW)
