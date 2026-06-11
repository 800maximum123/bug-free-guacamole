#define MODULUS_FLOAT(X, Y) ( (X) - (Y) * round((X) / (Y)) )

// Will filter out extra rotations and negative rotations
// E.g: 540 becomes 180. -180 becomes 180.
#define SIMPLIFY_DEGREES(degrees) (MODULUS_FLOAT((degrees), 360))

/proc/recoil_camera(mob/camera_mob, duration = 1, angle = 180, strength = 1, easing = CUBIC_EASING|EASE_OUT)
	if(!camera_mob?.client || duration < 1 || !easing)
		return
	var/client/camera_client = camera_mob.client

	angle = clamp(angle, 0, 360)
	var/hypotenuse = strength*world.icon_size
	var/offset_y = round(hypotenuse*sin(angle), 0.1)
	var/offset_x = round(hypotenuse*-cos(angle), 0.1)
	animate(camera_client, pixel_x = offset_x, pixel_y = offset_y, time = duration, easing = easing, flags = ANIMATION_RELATIVE)
	animate(pixel_x = -offset_x, pixel_y = -offset_y, time = duration, easing = easing, flags = ANIMATION_RELATIVE)

/obj/item/gun
	/**
	 * If this gun has client recoil, this stores info such as amount and duration.
	 *
	 * - "strength": How far to move the screen
	 * - "duration": The length of the animation
	 * - "easing": special type of easing to be used, can be null
	 */
	var/list/client_recoil_animation_information = null

/obj/item/gun/handle_post_fire(mob/user, atom/target, pointblank = 0, reflex = 0, obj/projectile)
	if (user)
		if(LAZYLEN(client_recoil_animation_information))
			var/skill_modifier = user.get_skill_value(SKILL_WEAPONS) * 0.1
			var/duration = client_recoil_animation_information["duration"]
			if (isnull(duration))
				duration = 1
			duration = max(duration - skill_modifier, 1)
			var/strength = client_recoil_animation_information["strength"]
			if (isnull(strength))
				strength = 0.5
			strength = max(strength - skill_modifier, 0.1)
			var/easing = client_recoil_animation_information["easing"] || CUBIC_EASING|EASE_OUT
			var/recoil_angle = SIMPLIFY_DEGREES(Get_Angle(target, user) + 90)
			recoil_camera(user, duration, recoil_angle, strength, easing)

	..()

/obj/item/gun/projectile
	client_recoil_animation_information = list(
		"strength" = 0.35,
		"duration" = 2,
	)

/obj/item/gun/projectile/automatic
	client_recoil_animation_information = list(
		"strength" = 0.7,
		"duration" = 2,
	)

/obj/item/gun/projectile/beam
	client_recoil_animation_information = null

/obj/item/gun/energy
	client_recoil_animation_information = null

/obj/item/gun/projectile/dartgun
	client_recoil_animation_information = null
