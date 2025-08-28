#define SPECIES_PILOT	"Pilot"
#define LANGUAGE_PILOT 	"Secret Channel"

#define SECONDS_LEFT(world_time, time) round((time - world_time) / 10)

#define MECH_STAT(text, color) FONT_NORMAL(SPAN_COLOR(color, text))
#define ABILITY_STAT(text, current, max, threshold) MECH_STAT(text, gradient(second_color, stat_color, round((current)/(max)/(1-(threshold)), 0.01)))

///if it allows multiple instances of the effect
#define STATUS_EFFECT_MULTIPLE 0
///if it allows only one, preventing new instances
#define STATUS_EFFECT_UNIQUE 1
///if it allows only one, but new instances replace
#define STATUS_EFFECT_REPLACE 2
/// if it only allows one, and new instances just instead refresh the timer
#define STATUS_EFFECT_REFRESH 3
/// Изменяет длительность существующего эффекта такого-же типа
#define STATUS_EFFECT_ADJUST 4
/// Устанавливает дополнительный источник эффекта
#define STATUS_EFFECT_SOURCED 5
