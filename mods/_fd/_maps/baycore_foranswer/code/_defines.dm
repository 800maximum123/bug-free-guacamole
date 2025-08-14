#define SPECIES_PILOT	"Pilot"
#define LANGUAGE_PILOT 	"Secret Channel"

#define SECONDS_LEFT(time, world_time) (time - world_time) / 10

#define SPAN_ABILITY_STAT(text, color) FONT_NORMAL(SPAN_COLOR(color, text))
#define SPAN_ABILITY_GRADIENT(text, percent) FONT_NORMAL(SPAN_COLOR(gradient(second_color, stat_color, percent), text))

#define MECH_OVERHEATED "overheated"
#define MECH_CHAINED "chained"
#define MECH_MALFUNCTIONED "malfunctioned"
#define MECH_HACKED "hacked"
#define MECH_VULNERABLE "vulnerable"
