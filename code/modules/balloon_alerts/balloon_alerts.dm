#define BALLOON_TEXT_WIDTH 200
#define BALLOON_TEXT_SPAWN_TIME (0.2 SECONDS)
#define BALLOON_TEXT_FADE_TIME (0.1 SECONDS)
#define BALLOON_TEXT_FULLY_VISIBLE_TIME (0.7 SECONDS)
#define BALLOON_TEXT_TOTAL_LIFETIME(mult) (BALLOON_TEXT_SPAWN_TIME + BALLOON_TEXT_FULLY_VISIBLE_TIME*mult + BALLOON_TEXT_FADE_TIME)
/// The increase in duration per character in seconds
#define BALLOON_TEXT_CHAR_LIFETIME_INCREASE_MULT (0.05)
/// The amount of characters needed before this increase takes into effect
#define BALLOON_TEXT_CHAR_LIFETIME_INCREASE_MIN 10

/// Creates text that will float from the atom upwards to the viewer.
/atom/proc/balloon_alert(mob/viewer, text, color)
	SHOULD_NOT_SLEEP(TRUE)

	invoke_async(src, PROC_REF(balloon_alert_perform), viewer, text, color)

/// Create balloon alerts (text that floats up) to everything within range.
/// Will only display to people who can see.
/atom/proc/balloon_alert_to_viewers(message, self_message, color, range = world.view, list/ignored_mobs)
	SHOULD_NOT_SLEEP(TRUE)

	var/list/hearing_mobs = list()
	var/list/objs = list()
	get_mobs_and_objs_in_view_fast(get_turf(src), range, hearing_mobs, objs, checkghosts = FALSE)

	hearing_mobs -= ignored_mobs

	for (var/mob/hearer as anything in hearing_mobs)
		if (is_blind(hearer))
			continue

		balloon_alert(hearer, (hearer == src && self_message) || message, color)

// Do not use.
// MeasureText blocks. I have no idea for how long.
// I would've made the maptext_height update on its own, but I don't know
// if this would look bad on laggy clients.
/atom/proc/balloon_alert_perform(mob/viewer, text, color)
	var/client/viewer_client = viewer.client
	if (isnull(viewer_client))
		return

	var/bound_width = WORLD_ICON_SIZE
	if (ismovable(src))
		var/atom/movable/movable_source = src
		bound_width = movable_source.bound_width

	var/image/balloon_alert = image(loc = get_atom_on_turf(src), layer = ABOVE_HUMAN_LAYER)
	balloon_alert.plane = BALOON_CHAT_PLANE
	balloon_alert.alpha = 0
	balloon_alert.appearance_flags = RESET_ALPHA|RESET_COLOR|RESET_TRANSFORM
	balloon_alert.maptext = build_runechat_text(text, color, src, extra_styles = list("-dm-text-outline: 1px #0005"))
	balloon_alert.maptext_x = (BALLOON_TEXT_WIDTH - bound_width) * -0.5
	WXH_TO_HEIGHT(viewer_client?.MeasureText(balloon_alert.maptext, null, BALLOON_TEXT_WIDTH), balloon_alert.maptext_height)
	balloon_alert.maptext_width = BALLOON_TEXT_WIDTH

	viewer_client.images += balloon_alert

	var/duration_mult = 1
	var/duration_length = length(text) - BALLOON_TEXT_CHAR_LIFETIME_INCREASE_MIN

	if(duration_length > 0)
		duration_mult += duration_length*BALLOON_TEXT_CHAR_LIFETIME_INCREASE_MULT

	animate(
		balloon_alert,
		pixel_y = WORLD_ICON_SIZE * 1.2,
		time = BALLOON_TEXT_TOTAL_LIFETIME(1),
		easing = SINE_EASING | EASE_OUT,
	)

	animate(
		alpha = 255,
		time = BALLOON_TEXT_SPAWN_TIME,
		easing = CUBIC_EASING | EASE_OUT,
		flags = ANIMATION_PARALLEL,
	)

	animate(
		alpha = 0,
		time = BALLOON_TEXT_FULLY_VISIBLE_TIME * duration_mult,
		easing = CUBIC_EASING | EASE_IN,
	)

	addtimer(new Callback(src, PROC_REF(remove_balloon_alert), viewer_client, balloon_alert), BALLOON_TEXT_TOTAL_LIFETIME(duration_mult))

/atom/proc/remove_balloon_alert(client/client, image/balloon_alert)
	client.images -= balloon_alert

#undef BALLOON_TEXT_CHAR_LIFETIME_INCREASE_MIN
#undef BALLOON_TEXT_CHAR_LIFETIME_INCREASE_MULT
#undef BALLOON_TEXT_FADE_TIME
#undef BALLOON_TEXT_FULLY_VISIBLE_TIME
#undef BALLOON_TEXT_SPAWN_TIME
#undef BALLOON_TEXT_TOTAL_LIFETIME
#undef BALLOON_TEXT_WIDTH
