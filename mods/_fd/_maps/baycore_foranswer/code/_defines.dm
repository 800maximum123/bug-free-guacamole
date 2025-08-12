#define SPECIES_PILOT	"Pilot"
#define LANGUAGE_PILOT 	"Secret Channel"

#define SECONDS_LEFT(time, world_time) (time - world_time) / 10

#define SPAN_ABILITY_STAT(text, color) FONT_LARGE(SPAN_COLOR(color, text))
#define SPAN_ABILITY_GRADIENT(text, percent) FONT_LARGE(SPAN_COLOR(gradient(second_color, stat_color, percent), text))

#define EFFECT_OVERHEAT FLAG(0)
#define EFFECT_CHAINED FLAG(2)
#define EFFECT_MALFUNCTIONED FLAG(3)
#define EFFECT_HACKED FLAG(1)
