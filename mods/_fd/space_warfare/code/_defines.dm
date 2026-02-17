#define PPS /32/5 // Unit of overmap speed, stands for Pixels Per Second
#define pixels_to_pos(P) ((16 + P) / 16 - 1)

#define SW_MAX_COORD world.maxx - TRANSITIONEDGE - 3
#define SW_MIN_COORD TRANSITIONEDGE + 3

/// Projectile bitflags
#define SW_FLAG_HIT_PLANET		FLAG(0)
#define SW_FLAG_HIT_SECTOR		FLAG(1)
#define SW_FLAG_HIT_SHIP		FLAG(2)
#define SW_FLAG_HIT_ALL			(SW_FLAG_HIT_PLANET|SW_FLAG_HIT_SECTOR|SW_FLAG_HIT_SHIP)
