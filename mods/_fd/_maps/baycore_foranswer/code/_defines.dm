#define SPECIES_PILOT	"Pilot"
#define LANGUAGE_PILOT 	"Secret Channel"

#define SECONDS_LEFT(world_time, time) round((time - world_time) / 10)

#define ABILITY_STAT(text, color) FONT_NORMAL(SPAN_COLOR(color, text))
#define ABILITY_STAT_GRADIENT(text, min, max) FONT_NORMAL(SPAN_COLOR(gradient(second_color, stat_color, min/max), text))

#define MECH_OVERHEATED "overheated"
#define MECH_CHAINED "chained"
#define MECH_MALFUNCTIONED "malfunctioned"
#define MECH_HACKED "hacked"
#define MECH_VULNERABLE "vulnerable"
