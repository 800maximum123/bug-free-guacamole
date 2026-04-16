
/datum/interactive_note/nightmare/keys
	name = "Новые замки"
	note_info = {"Недавнее проникновение вышло мне в копейку. Так что, дабы избежать подобного в будущем, я распорядился поменять замки в съёмных комнатах. \
				Ключи, пока что, есть только у меня, сегодня <span style="color: yellow;">поеду</span> делать слепок. Не забудьте предупредить об этом клиентов. Если они <span style="color: yellow;">закроются внутри</span> - вы не откроете их без меня!"}

/obj/structure/fd/interactive/note/nightmare/keys
	name = "Для всех"
	attached_text = list(/datum/interactive_note/nightmare/keys)

/datum/interactive_note/nightmare/fred
	name = "Подонок Фред"
	note_info = {"Сижу я тут уже прилично. День или около того. Стены настолько плотные, что ребята даже не в курсе, что этот мудак меня здесь запер. И на вряд ли они найдут меня в ближайшее время. \
				Стоило мне только запреметить неладное, как от меня тут же избавились. Наверняка, он уже придумал 100 и 1 причину моего исчезновения. Забавно, не думал что закончу вот так. Из всех возможных вариантов. \
				Кто бы вам что не доказывал, прошу, запомните, <span style="color: yellow;">ФРЕД ИЗ 102-Й - ВАМ НЕ ДРУГ</span>. \
				Он готов продать что угодно и кого угодно, лишь бы выжить самому. Неудивительно, что поймал я его именно на краже еды. У него вся <span style="color: yellow;">комната</span> завалена ею! А ведь, если бы не эта сука, \
				мы бы могли целый день никого не посылать. Впрочем, в каком-то роде, это и моя вина тоже."}

/datum/interactive_note/nightmare/fred/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/maintext = new /obj/screen/player_message()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -250

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/datum/interactive_note/nightmare/fred_ending
	name = "Помогите"
	note_info = {"Не знаю, что пугает меня сильнее. Смерть от голода, или неизвестность, таящаяся за дверью. Может быть, меня просто забыли здесь? Всех спасли, а я, блять, застрял в этом персональном Аду навсегда? \
				Это несправедливо. Но такова жизнь. Мне стоит просто смириться, однако мозг всё крутит и крутит эти кадры в моей голове. Кадры того, что могло быть. А может и было. \
				Я схожу с ума. Я хочу пить. В туалет. Много чего хочу. Да только судьба распорядилась иначе. \
				Надеюсь, что для теней двери помехой не являются."}

/obj/structure/fd/interactive/note/nightmare/fred
	name = "Тем, кто остался"
	attached_text = list(/datum/interactive_note/nightmare/fred,/datum/interactive_note/nightmare/fred_ending)

/obj/effect/reality_tear
	name = "trap"
	desc = "trap"
	icon = 'mods/_fd/_maps/collective_nightmare/icons/effects.dmi'
	icon_state = "void_conduit"
	mouse_opacity = FALSE
	anchored = TRUE

/obj/effect/reality_tear/Initialize()
	. = ..()
	SetTransform(2)

/area/nightmare/
	adventure_mode = TRUE

/area/nightmare/streets
	name = "City Streets - Real World"
	requires_power = 0

/area/nightmare/bar_real
	name = "Bar - Real World"
	requires_power = 1

/area/nightmare/nightmare
	name = "Dark Abyss - Nightmare"
	requires_power = 0

/area/nightmare/bar_nightmare
	name = "Bar - Nightmare"
	requires_power = 1

/area/nightmare/bar_nightmare/storage_room
	name = "Bar (Storage) - Nightmare"

/obj/structure/fd/interactive/barricade
	name = "barricade"
	desc = "Wooden barricade."

	anchored = TRUE
	density = TRUE

	icon = 'mods/_fd/_maps/collective_nightmare/icons/trench_bridge.dmi'
	icon_state = "trench_bridge1"

/obj/structure/fd/interactive/barricade/interact_with(mob/living/user)

	var/obj/item/I = user.get_active_hand()
	if(!I)
		desc_special = {"Крепкая деревянная барикада. Я бы мог сломать её, будь у меня <span style="color: yellow;">лом</span>."}
		desc_special_show = TRUE
		. = ..()
		return TRUE
	if(!istype(I, /obj/item/crowbar))
		desc_special = {"Этим я её не сломаю. Мне нужен <span style="color: yellow;">лом</span>, или что-то на подобии."}
		desc_special_show = TRUE
		. = ..()
		return TRUE
	if(istype(I, /obj/item/crowbar))
		interactive = FALSE
		user.hide_hint(src)
		playsound(user, 'mods/_fd/_maps/collective_nightmare/sounds/woodhit.ogg', 100)
		throw_planks()
		if(do_after(user, 3 SECONDS, src, DO_PUBLIC_UNIQUE))
			qdel(src)
			return TRUE

/obj/structure/fd/interactive/barricade/proc/throw_planks()
	set waitfor = FALSE
	var/turf/T = get_turf(src)

	for(var/i=1; i <= 3; i++)
		var/obj/structure/fd/samosbor/table_decor12/planks = new /obj/structure/fd/samosbor/table_decor12(get_turf(src))
		planks.icon_state = "0,23"

		sleep(1 SECONDS)
		planks.throw_at(get_step(T, GLOB.alldirs),1,4)

/obj/screen/interactive_door
	name = "Дверь"
	desc = "Просто дверь..."
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "fancy"

	mouse_opacity = FALSE

	plane = HUD_PLANE
	layer = 5.3

	screen_loc = "CENTER-0.2,CENTER"

/obj/screen/interactive_door/Initialize()
	. = ..()
	SetTransform(6)

/obj/structure/fd/interactive/door
	name = "door"
	desc = "Simple door."

	anchored = TRUE
	density = TRUE
	opacity = TRUE

	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "fancy"

	var/opened = FALSE

	var/key_needed = FALSE
	var/locked = FALSE
	var/obj/item/door_key = null
	var/doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/wooden_door_open.wav'

	var/needs_power = FALSE
	var/powered = FALSE
	var/area/current_location

	var/obj/screen/interactive_door/door

/obj/structure/fd/interactive/door/Initialize()
	. = ..()

	door = new /obj/screen/interactive_door()
	door.icon = icon
	door.icon_state = icon_state

	if(needs_power)
		current_location = get_area(src)
		START_PROCESSING(SSobj,src)

/obj/structure/fd/interactive/door/Process()
	if(current_location.requires_power && powered)
		powered = FALSE

	if(!current_location.requires_power && !powered)
		powered = TRUE

/obj/structure/fd/interactive/door/interact_with(mob/living/user)
	if(!opened)
		if(needs_power)
			if(powered)
				open_door(user)
				return TRUE
			if(!powered)
				desc_special = {"К двери подведено множество проводов, но не похоже чтобы хотя бы по одному из них шло напряжение. Возможно, я смогу найти <span style="color: yellow;">источник питания</span> поблизости?"}
				desc_special_show = TRUE
				. = ..()
				return TRUE

		if(locked)
			if(key_needed)
				var/obj/item/I = user.get_active_hand()
				if(!I)
					desc_special = {"Дверь заперта. Я бы смог открыть её при помощи <span style="color: yellow;">[door_key.name]</span>."}
					desc_special_show = TRUE
					. = ..()
					return TRUE
				if(!istype(I, door_key))
					desc_special = {"Дверь заперта. Я бы смог открыть её, будь у меня <span style="color: yellow;">[door_key.name]</span>."}
					desc_special_show = TRUE
					. = ..()
					return TRUE
				if(istype(I, door_key))
					playsound(user, 'sound/items/metal_clicking_13.ogg', 50)
					locked = FALSE
					desc_special = {"<span style="color: green;">Дверь теперь открыта</span>."}
					desc_special_show = TRUE
					. = ..()
					return TRUE

			else
				desc_special = {"Дверь заперта. На вряд ли у меня получится её открыть."}
				desc_special_show = TRUE
				. = ..()
				return TRUE

		open_door(user)
		return TRUE

	if(opened)
		close_door(user)
		return TRUE

/obj/structure/fd/interactive/door/proc/open_door(mob/living/user)
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/cancel_interaction))
			user.client.screen -= T
	user.stunned = 99999

	user.reading = TRUE
	user.currently_interacting = src

	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)
	user.client.screen += door

	sleep(2 SECONDS)
	door.icon_state = "[initial(icon_state)]opening"
	playsound(user, doorsound, 100)
	sleep(1 SECONDS)
	density = FALSE
	opacity = FALSE

	opened = TRUE
	icon_state = "[initial(icon_state)]open"
	door.icon_state = "[initial(icon_state)]open"

	sleep(1 SECONDS)
	user.stunned = 0

	user.reading = FALSE
	user.currently_interacting = null

	user.clear_fullscreen("smallshade")
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/interactive_door))
			user.client.screen -= T

/obj/structure/fd/interactive/door/proc/close_door(mob/living/user)
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/cancel_interaction))
			user.client.screen -= T
	user.stunned = 99999

	user.reading = TRUE
	user.currently_interacting = src

	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)
	user.client.screen += door

	sleep(2 SECONDS)
	density = TRUE
	opacity = initial(opacity)

	playsound(user, 'mods/_fd/_maps/collective_nightmare/sounds/door_close.ogg', 100)

	opened = FALSE
	icon_state = "[initial(icon_state)]"
	door.icon_state = "[initial(icon_state)]"

	sleep(1 SECONDS)
	user.stunned = 0

	user.reading = FALSE
	user.currently_interacting = null

	user.clear_fullscreen("smallshade")
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/interactive_door))
			user.client.screen -= T

/obj/item/fd/door_key
	name = "key"
	desc = "This one has particular shape!"

	icon = 'mods/_fd/_maps/collective_nightmare/icons/item_access.dmi'
	icon_state = "key_alt"

	w_class = ITEM_SIZE_TINY

/obj/item/fd/door_key/test
	name = "квадратный ключ"

/obj/item/fd/door_key/kitchen
	name = "ключ от морозилки"
	icon_state = "key"

/obj/item/fd/door_key/outer
	name = "ключ от заведения"

/obj/item/fd/door_key/firstzerofirst
	name = "ключ от комнаты %^$##^#*!#"
	icon_state = "key_yellow"

/obj/structure/fd/interactive/door/test_locked

	key_needed = TRUE
	locked = TRUE
	door_key = /obj/item/fd/door_key/test

/obj/structure/fd/interactive/door/exterior
	icon_state = "exterior"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/grate
	opacity = FALSE
	icon_state = "grate"

/obj/structure/fd/interactive/door/wood
	icon_state = "wood"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/wood_alt
	icon_state = "wood_alt"

/obj/structure/fd/interactive/door/wood_old
	icon_state = "old"

/obj/structure/fd/interactive/door/wood_old2
	icon_state = "bold"

/obj/structure/fd/interactive/door/agrate
	opacity = FALSE
	icon_state = "agrate"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/fancy
	opacity = FALSE
	icon_state = "fancy_alt"

/obj/structure/fd/interactive/door/metal
	icon_state = "metal"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/metal_glass
	opacity = FALSE
	icon_state = "metal_glass"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/metal_train
	opacity = FALSE
	icon_state = "metal_train"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/nightmare/kitchen
	icon_state = "metal_glass"
	opacity = FALSE

	key_needed = TRUE
	locked = TRUE
	door_key = /obj/item/fd/door_key/kitchen
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/nightmare/outer
	icon_state = "fancy_alt"
	opacity = FALSE

	key_needed = TRUE
	locked = TRUE
	door_key = /obj/item/fd/door_key/outer

/obj/structure/fd/interactive/door/nightmare/firstzerofirst
	icon_state = "wood_alt"

	key_needed = TRUE
	locked = TRUE
	door_key = /obj/item/fd/door_key/firstzerofirst
