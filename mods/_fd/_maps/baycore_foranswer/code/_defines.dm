#define SPECIES_PILOT	"Pilot"
#define LANGUAGE_PILOT 	"Secret Channel"

#define SECONDS_LEFT(world_time, time) round((time - world_time) / 10)

#define MECH_STAT(text, color) FONT_NORMAL(SPAN_COLOR(color, text))
#define ABILITY_STAT(text, current, max, threshold) MECH_STAT(text, gradient(second_color, stat_color, round((current)/(max)/(1-(threshold)), 0.01)))

#define MECH_OVERHEATED "overheated"
#define MECH_CHAINED "chained"
#define MECH_MALFUNCTIONED "malfunctioned"
#define MECH_HACKED "hacked"
#define MECH_VULNERABLE "vulnerable"
