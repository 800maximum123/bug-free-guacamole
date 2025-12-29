/obj/item/material/knife/ritual/aftik
	name = "ritual knife"
	desc = "An ancient silver bloodletting knife. Its blade is adorned with intricate serpent carvings and Assashite runes along the edge."
	var/tajaran_desc = "Within this blade, you recognize the Ether Fang. It is capable of tearing the fabric of reality to summon great spirits, yet it is bound by runes. The blade hungers for blood. To wield it is the right and the burden of the strongest shamans."
	icon_state = "ritualknife"
	item_state = "ritualknife"
	item_state_slots = list(
		slot_l_hand_str = "ritualknife-l",
		slot_r_hand_str = "ritualknife-r",
		)
	icon = 'aftik.dmi'
	item_icons = list(
		slot_l_hand_str = 'aftik.dmi',
		slot_r_hand_str = 'aftik.dmi'
		)

	lunge_delay = 10 SECONDS
	lunge_dist = 3
	melee_strikes = list(/singleton/combo_strike/precise_strike/fast_attacks,/singleton/combo_strike/swipe_strike/mixed_combo)

//

/obj/item/material/knife/ritual/aftik/examine(mob/user, distance, is_adjacent)
	. = ..()
	if(distance <= 3 && (user.is_species(SPECIES_TAJARA)) || user.skill_check(SKILL_SCIENCE, SKILL_HARD))
		to_chat(user, SPAN_NOTICE(tajaran_desc))

// Смешной ножик будет пассивно, словно паразит питаться напрямую от крови Афтика и его псионники, даруя большой бафф в момент Х,
// Однако высушивая его до дна в конце и выводя из боя.

// Больше оружие последнего шанса и получения превосходства, чем постоянный способ борьбы с чем либо. +ТЕМ БОЛЕЕ+ не предназначен для одиночного применения, иначе
// ну... обессиленного противника захуярят ногами


// ------

/obj/item/book/manual/autostopgalactic
	name = "A Freaking Big Space Encyclopedia About How to Live In XIV Century and Not To Be Stupid Moron"
	desc = "A Freaking Big Space Encyclopedia About How to Live In XIV Century and Not To Be Stupid Moron or FBSEAHWtLIXIVCaNTBSM to short is <i>really</i> thick book with azure-black cover"
	url = "https://teotr.miraheze.org/wiki/Заглавная_страница" // idk what to put here, so i put it
	icon = 'newyear.dmi'
	icon_state = "galacticbook"
	item_state_slots = list(
		slot_l_hand_str = "galacticbook-l",
		slot_r_hand_str = "galacticbook-r",
		)
	item_icons = list(
		slot_l_hand_str = 'newyear.dmi',
		slot_r_hand_str = 'newyear.dmi'
		)
	var/open = FALSE
	unique = TRUE
	author = "My Honest Hatred"

/obj/item/book/manual/autostopgalactic/attack_self(mob/user as mob)
	if(!open)
		icon_state += "-open"
		visible_message(SPAN_NOTICE("\The [user], with hands shaking from the effort, opens the book \the [src]."), range = 2)
		open = TRUE
		return TRUE
	if(open)
		icon_state = initial(icon_state)
		visible_message(SPAN_NOTICE("\The [user] closes the book with loud sound! \the [src]."), range = 4)
		playsound(src, 'bigbookclose.ogg', 50)
		open = FALSE
		return TRUE

/obj/item/book/manual/autostopgalactic/examine(mob/user, distance, is_adjacent)
	. = ..()
	if(!open)
		return

	if(src.dat)
		show_browser(user, dat, "window=book;size=1000x550")
		user.visible_message("[user] begins reading intently book titled \"[src.title]\".")
		onclose(user, "book")
	else
		to_chat(user, "This book is completely blank!")

/obj/item/book/manual/autostopgalactic/New()
	..()
	if(url)
		dat = {"
			<html>
				<head>
				</head>
				<body>
					<iframe width='100%' height='100%' src="[url]&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
				</body>
			</html>
			"}

// Linch jacket

/obj/item/clothing/suit/storage/jacket/solgov/fleet/linch //Попиздеть еще по душам, дабы получить доп.ТЗ на механ
	name = "engineering jacket"
	desc = "A worn-out engineer's jacket that has survived more than most people under the dome. The fabric has faded to a graphite shade, and the seams have been re-stitched by hand in places — roughly, but securely. On the right shoulder, there is a faded SCG/ENG marking, and on the left, a patch sewn on as if the owner had done it while travelling. The jacket smells of metal, ozone, and old machine oil. Looking closely, you can see a thin cable running under the sleeve and a small metal plate at the collar with a barely legible Latin inscription.."
	icon_state = "frog"
	item_state = "frog"
	icon = 'newyear.dmi'
	item_icons = list(
		slot_wear_suit_str = 'newyear.dmi',
		slot_l_hand_str = 'newyear.dmi',
		slot_r_hand_str = 'newyear.dmi',
		)
	item_state_slots = list(
		slot_wear_suit_str = "frog-onmob",
		slot_l_hand_str = "frog-l",
		slot_r_hand_str = "frog-r",
		)

	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA,ACCESSORY_SLOT_RANK, ACCESSORY_SLOT_ARMOR_M)
	allowed = list (
		/obj/item/pen,
		/obj/item/clothing/head/soft,
		/obj/item/clothing/head/beret,
		/obj/item/storage/fancy/smokable,
		/obj/item/flame/lighter,
		/obj/item/device/taperecorder,
		/obj/item/device/scanner/gas,
		/obj/item/device/radio,
		/obj/item/taperoll,
		/obj/item/device/scanner/gas,
		/obj/item/device/flashlight,
		/obj/item/device/multitool,
		/obj/item/device/radio,
		/obj/item/device/t_scanner,
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/tank/oxygen_emergency,
		/obj/item/tank/oxygen_emergency_extended,
		/obj/item/tank/nitrogen_emergency,
		/obj/item/clothing/mask/gas,
		/obj/item/taperoll/engineering,
		/obj/item/clothing/head/hardhat
	)

	accessories = list(
		/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e5,
		/obj/item/clothing/accessory/armor_tag/solgov,
		/obj/item/clothing/accessory/solgov/fleet_patch/fifth,
		/obj/item/clothing/accessory/ribbon/solgov/medal/bronze_heart
	)

//

/obj/item/gun/energy/revolver/secure/captaincustom
	name = "Sworn Protector"
	desc = "An extremely extravagant version of a personal defence weapon. The energy revolver was designed in the shape of a revolver, with the cylinder replaced by rotating capacitors and the batteries located around the ‘barrel’ of the revolver and in the handle. It was clearly created by a more skilled technician than the one who carries it. The handle is engraved with \"Ksrim from Rim.\"."
	icon = 'revolver.dmi'
	icon_state = "revolver100"
	item_icons = list(
		slot_l_hand_str = 'revolver.dmi',
		slot_r_hand_str = 'revolver.dmi',
		)
	item_state_slots = list(
		slot_l_hand_str = "l-hand",
		slot_r_hand_str = "l-hand",
		)
	modifystate = "revolver"
	item_state = null
	projectile_type = /obj/item/projectile/beam/stun
	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun),
		list(mode_name="shock", projectile_type=/obj/item/projectile/beam/stun/shock),
		list(mode_name="kill", projectile_type=/obj/item/projectile/beam)
		)
	req_access = list()
	authorized_modes = list(ALWAYS_AUTHORIZED, ALWAYS_AUTHORIZED, ALWAYS_AUTHORIZED)

/obj/item/clothing/suit/space/void/captaincustom
	icon_state = "sanityarmor"
	name = "military-grade skrell voidsuit"
	desc = "An advanced suit that protects against injuries during special operations."
	item_state_slots = list(
		slot_wear_suit_str = "sanityarmor-onmob",
		slot_l_hand_str = "syndicate-green-dark",
		slot_r_hand_str = "syndicate-green-dark",
	)
	icon = 'newyear.dmi'
	item_icons = list(
		slot_wear_suit_str = 'newyear.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_spacesuits.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_spacesuits.dmi',
		)
	w_class = ITEM_SIZE_LARGE
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
		)
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/melee/energy/sword,/obj/item/handcuffs)
	siemens_coefficient = 0.3
	species_restricted = list(SPECIES_SKRELL)

/obj/item/clothing/head/helmet/space/void/captaincustom
	name = "military-grade skrell voidsuit helmet"
	desc = "An advanced helmet designed for work in special operations."
	icon = 'newyear.dmi'
	item_icons = list(
		slot_head_str = 'newyear.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_hats.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_hats.dmi',
		)
	icon_state = "sanityhelmet"
	item_state_slots = list(
		slot_head_str = "sanityhelmet-onmob",
		slot_l_hand_str = "syndicate-helm-green",
		slot_r_hand_str = "ssyndicate-helm-green",
	)
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_MINOR
		)
	siemens_coefficient = 0.3
	species_restricted = list(SPECIES_SKRELL)
	light_overlay = "explorer_light"

//

/obj/item/clothing/glasses/welding/weldingrock // Допиздеца для развития механа
	name = "Prototype ZLG"
	desc = "These are special welding goggles, which were clearly either custom-made or simply an unsuccessful prototype of something. The goggles are covered with leather with rivets, although inside the leather lining there is a classic polymer frame. The lenses are similar to modern goggles, which have an improved viewing angle and visibility with the same light protection as older models of gas welding goggles. The frame has an almost completely worn-off emblem, apparently of some company, with only one letter legible on this covering."
	icon = 'newyear.dmi'
	icon_state = "weldingrock"
	item_icons = list(
		slot_glasses_str = 'weldrockonmob.dmi',
	)
/*	item_state_slots = list(
		slot_glasses_str = "weldingrock"
	)
*/
	attack_verb = list("made a sluggish swing with \'granny bag\'", "made a blow of a sore back")

//

/obj/item/clothing/suit/storage/slivacoat
	name = "winter coat"
	desc = "A heavy jacket made from 'synthetic' animal furs."
	icon = 'newyear.dmi'
	icon_state = "sliva"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	armor = list(
		bio = ARMOR_BIO_MINOR
		)
	item_icons = list(
		slot_wear_suit_str = 'newyear.dmi',
		slot_l_hand_str = 'newyear.dmi',
		slot_r_hand_str = 'newyear.dmi',
		)
	item_state_slots = list(
		slot_wear_suit_str = "sliva-onmob",
		slot_l_hand_str = "sliva-l",
		slot_r_hand_str = "sliva-r",
		)

//

/obj/item/knuckle
	name = "brass knuckles"
	desc = "Heavy gold-plated brass knuckles with an engraved Christian cross. By some miracle, the paint is still on it. Or maybe it's real gold?"
	icon = 'bioplan.dmi'
	icon_state = "brasskknuckles"
	item_icons = list(
		slot_l_hand_str = 'bioplan.dmi',
		slot_r_hand_str = 'bioplan.dmi',
	)
	item_state_slots = list(
		slot_l_hand_str = "brasskknuckles-l",
		slot_r_hand_str = "brasskknuckles-r",
	)

//

/obj/item/clothing/head/welding/techpriest
	name = "decorated welding mask"
	desc = "An old-style welding mask. Instead of paint, the metal itself was painted over. The black and red canvas is covered with small scratches, and in some places even small dents are visible. On the front side, two blood-coloured carp can be seen circling around the centre. At the bottom of the mask, you can see very small symbols that were laser-engraved there: ‘2295 | TORMENTRESS’."
	icon = 'tech.dmi'
	icon_state = "techhelm"
	item_icons = list(
		slot_head_str = 'tech_onmob.dmi'
	)
	item_state_slots = list(
		slot_head_str = "techhelm",
		slot_l_hand_str = "welding",
		slot_r_hand_str = "welding",
	)

//

/obj/item/material/sword/psysword // TODO: Впилить механ
	name = "Nemesis forse sword"
	desc = "An unusual long sword, resembling both a work of art and a sinister modification of an alien weapon, with an ancient ΨΔ7 logo carved on the guard and a strange button on the hilt."
	icon = 'nik.dmi'
	icon_state = "psysword"
	item_icons = list(
		slot_l_hand_str = 'nik.dmi',
		slot_r_hand_str = 'nik.dmi',
		)
	item_state_slots = list(
		slot_l_hand_str = "psysword-l",
		slot_r_hand_str = "psysword-r",
		)

//

/obj/item/clothing/suit/storage/hooded/sithshort
	name = "old tattered robe"
	desc = "A thick robe of black colour completely covering the body of the wearer. The same dark, barely visible patterns on the mantle do not identify the wearer, but are rather an element of the whole pattern."
	icon = 'newyear.dmi'
	icon_state = "item"
	item_state = "mantle_hidden"
	item_flags = ITEM_FLAG_WASHER_ALLOWED
	item_icons = list(
		slot_wear_suit_str = 'newyear.dmi'
		)

	hoodtype = /obj/item/clothing/head/sithmantlehood
	suittoggled = 0
	action_button_name = "Toggle Mantle Hood"

/obj/item/clothing/accessory/flag
	name = "UFH flag"
	desc = "A flag flown by the United Forces of Humanity in the war against the Ascent. This one specifically has a lot of crosses drawn out on the shield's center - one per each fallen colony, no doubt."
	var/attachmode = FALSE
	icon = 'newyear.dmi'
	icon_state = "flag"
	accessory_icons = list(
		slot_w_uniform_str = 'flagonmob.dmi',
		slot_wear_suit_str = 'flagonmob.dmi',
		slot_l_hand_str = 'flagonmob.dmi',
		slot_r_hand_str = 'flagonmob.dmi',
		)
	accessory_flags = ACCESSORY_REMOVABLE | ACCESSORY_HIGH_VISIBILITY

/obj/item/clothing/accessory/flag/use_after(atom/A, mob/living/user, click_parameters)
	..()
	if(!attachmode)
		return FALSE


	if(!in_range(user, A) || istype(A, /obj/machinery/door))
		return FALSE

	var/turf/target_turf = get_turf(A)
	var/turf/source_turf = get_turf(user)

	var/dir_offset = 0
	if(target_turf != source_turf)
		dir_offset = get_dir(source_turf, target_turf)
		if(!(dir_offset in GLOB.cardinal))
			to_chat(user, "You cannot reach that from here.")
			return TRUE

	if(!user.unEquip(src, source_turf))
		FEEDBACK_UNEQUIP_FAILURE(user, src)
		return TRUE

	playsound(src, 'sound/effects/tape.ogg',25)
	layer = ABOVE_WINDOW_LAYER
	anchored = TRUE

	if(click_parameters)
		if(click_parameters["icon-x"])
			pixel_x = text2num(click_parameters["icon-x"]) - 16
			if(dir_offset & EAST)
				pixel_x += 32
			else if(dir_offset & WEST)
				pixel_x -= 32
		if(click_parameters["icon-y"])
			pixel_y = text2num(click_parameters["icon-y"]) - 16
			if(dir_offset & NORTH)
				pixel_y += 32
			else if(dir_offset & SOUTH)
				pixel_y -= 32
	return TRUE

//

/obj/item/fd/crew_photo
	name = "Памятная фотография"
	desc = "Слегка потрёпанная фотография с последним зарегистрированным экипажем корабля ГЭК \"Факел\"."
	icon_state = "photo"
	icon = 'mods/_fd/fd_assets/icons/obj/items/items.dmi'
	w_class = ITEM_SIZE_TINY
/obj/item/fd/crew_photo/MouseEntered(location, control, params)
	var/content_of_tooltip = get_additional_info()
	openToolTip(user = usr, tip_src = src, params = params, title = name, content = content_of_tooltip)
	..()
/obj/item/fd/crew_photo/proc/get_additional_info() // Полностью оверрайдим на юните
	var/list/info = list()

	info += FONT_LARGE("[SPAN_COLOR("#ffffff","ОПИСАНИЕ:")]")
	info += FONT_NORMAL("<li>На фото изображена свора людей в весьма узнаваемой чёрно-фиолетовой форме Экспедиционного Корпуса, перемешавшаяся с другими, \
	более распущенными личностями в обычной гражданской одежде, или напротив - строгой парадке флота ЦПСС. Некоторые из присутствующих лиц перечёркнуты красным, \
	или зарисованы большим количеством вопросительных знаков, словно отмечая тех, с кем точно покончено, а кто ещё может быть жив. В самом низу есть подпись - [SPAN_COLOR("#ffffff","ГЭК \"Факел\", 2311-02-10")].</li>")
	info += FONT_SMALL("Заступая на пост, выполняя приказ, без права вернуться.")
	info += FONT_NORMAL("<br>")
	info += FONT_NORMAL("<br>")
	info += FONT_LARGE("[SPAN_COLOR("#ffffff","С ОБРАТНОЙ СТОРОНЫ:")]")
	info += FONT_NORMAL("<li>С обратной стороны фотографии находится удивительно большое количество ручных подписей, едва умещающихся на листке. Среди них...</li>")
	info += FONT_SMALL("</ul></li>")
	info += FONT_NORMAL("<br>")
	info += FONT_SMALL("<li>[SPAN_COLOR("#ffffff","Кристиана Райфлё, Август Менделеев, Нэнси Рузвельт, Алекс Смит")]</li>")
	info += FONT_SMALL("<li>[SPAN_COLOR("#ffffff","Во-Лей, Вильгельм Канарис, Анна Ортиз, Чичи, Мистер Мясо")]</li>")
	info += FONT_SMALL("<li>[SPAN_COLOR("#ffffff","Фёдор Яблочкин, Мия Триш, Рэймонд Датура, Алекс Рид, Иван Мантров")]</li>")
	info += FONT_SMALL("<li>[SPAN_COLOR("#ffffff","R-700-МC-Кейт, Декстер Бакстер, Майкл Браун, Мартин Эндсли,")]</li>")
	info += FONT_SMALL("<li>[SPAN_COLOR("#ffffff","Пьер Эндсли, Лира Шаттен, С.В.И.Ф.Т, Злата Савина")]</li>")
	info += FONT_SMALL("</ul></li>")

	return jointext(info, "")

//

/obj/item/clothing/accessory/wristwatch/nullwatch
	name = "expensive null-clock"
	desc = "An expensive-looking watch with a zero-glass dial. High-quality assembly ensures the mechanism is waterproof, and the dial under the glass is backlit for better time orientation at any time of day and for viewing dark corners of your bag. The Sanurian Manufactures logo is located in the centre of the dial."
	icon = 'addon.dmi'
	icon_state = "nullwatch"
	accessory_icons = list(
		slot_w_uniform_str = 'watchesonmob.dmi',
		slot_wear_suit_str = 'watchesonmob.dmi'
		)

//

/obj/item/handwatch
	name = "archaic pocket watches"
	desc = "Pocket watch, bronze, with the letter ‘V’ on the front. On the top of the case, there is a ring through which a chain was previously threaded, but it is now missing. You have bad feeling about them..."
	icon = 'mods/_fd/fd_customs/customs/newyear/addon.dmi'
	icon_state = "closed"
	var/open = FALSE

/obj/item/handwatch/attack_self(mob/user)
	open = !open
	update_icon()
	if(open)
		user.visible_message(SPAN_WARNING("\The [user] opens \the [src]."))
		playsound(user, 'sound/weapons/flipblade.ogg', 15, 1)
		icon_state = "open"
	else
		user.visible_message(SPAN_NOTICE("\The [user] closes \the [src]."))
		icon_state = initial(icon_state)
	add_fingerprint(user)

/obj/item/handwatch/examine(mob/user, distance)
	. = ..()
	if (distance > 1 || !open )
		return
	var/list/date = text2numlist(realtimewatch(), "-")
	var/year = date[1]
	var/month = GLOB.month_names[date[2]]
	var/day = date[3]
	var/time = stationtime2text()
	to_chat(user, "You check \the [src]. It is [time] on the [day]\th of [month], [year]. Strange. It must be broken")

/proc/realtimewatch(mob/user)
	var/update_time = FALSE
	if(station_time_in_ticks > next_station_date_change)
		next_station_date_change += 1 DAY
		update_time = TRUE
	if(!station_date || update_time)
		var/timeofday = world.timeofday
		station_date = "2025-[time2text(timeofday, "MM-DD", user.client.timezone)]"
	return station_date

//

/obj/item/luckycoin // CODE IT!!!!
	name = "Gref's Coin"
	desc = "An odd gold coin, with a clover on it. On the flip side there is a text ingraved on the gold surface \"Our final hope, our one more chance\""
	icon = 'addon.dmi'
	icon_state =  "coin"
	var/reroll = FALSE

/obj/item/storage/bible/bible
	name = "Humility"
	desc = "A Christian Bible with a hardcover binding. The cover features golden and coral patterns with a cross on its cover."
	icon = 'addon.dmi'
	icon_state = "holy_bible"
	item_icons = list(
		slot_l_hand_str = 'addon.dmi',
		slot_r_hand_str = 'addon.dmi',
		)
	item_state_slots = list(
		slot_l_hand_str = "onmob_book_l",
		slot_r_hand_str = "onmob_book_r",
		)

/obj/item/nullrod/holycross
	name = "Repentance"
	desc = "Repentance — an ornate Orthodox hand cross with gold and coral patterns, and the ends of the cross are decorated with small inlaid crystals that give off a strong blue glow."
	icon = 'addon.dmi'
	icon_state = "holy_cross"
	item_icons = list(
		slot_l_hand_str = 'addon.dmi',
		slot_r_hand_str = 'addon.dmi',
		)
	item_state_slots = list(
		slot_l_hand_str = "onmob_cross_l",
		slot_r_hand_str = "onmob_cross_r",
		)
