
GLOBAL_LIST_EMPTY(latejoin_barracks_scg)
GLOBAL_LIST_EMPTY(latejoin_officer_barracks_iccg)

GLOBAL_LIST_EMPTY(latejoin_officer_barracks_scg)
GLOBAL_LIST_EMPTY(latejoin_barracks_iccg)

// -- SCG Spawnpoints --
/datum/spawnpoint/scg_barracks
	display_name = "SCG Barracks"
	disallow_job = list("Commanding Officer", "Platoon Sergeant", "Squad Leader", "Komandir Vzvoda", "Nachalnik Shtaba", "Voyennyy Vrach", "Voyennyy Inzhener", "Voyennyy Politseyskiy", "Komandir Otdeleniya", "Pekhotinets")

/datum/spawnpoint/scg_barracks/New()
	..()
	turfs = GLOB.latejoin_barracks_scg

/datum/spawnpoint/scg_officer_barracks
	display_name = "SCG Officer Barracks"
	disallow_job = list("Field Engineer", "Trooper", "Komandir Vzvoda", "Nachalnik Shtaba", "Voyennyy Vrach", "Voyennyy Inzhener", "Voyennyy Politseyskiy", "Komandir Otdeleniya", "Pekhotinets")

/datum/spawnpoint/scg_officer_barracks/New()
	..()
	turfs = GLOB.latejoin_officer_barracks_scg

// -- ICCG Spawnpoints --
/datum/spawnpoint/iccg_barracks
	display_name = "ICCG Barracks"
	disallow_job = list("Commanding Officer", "Platoon Sergeant", "Squad Leader", "Field Engineer", "Field Medic", "Trooper", "Komandir Vzvoda", "Nachalnik Shtaba", "Voyennyy Vrach", "Komandir Otdeleniya")

/datum/spawnpoint/iccg_barracks/New()
	..()
	turfs = GLOB.latejoin_barracks_iccg

/datum/spawnpoint/iccg_officer_barracks
	display_name = "ICCG Officer Barracks"
	disallow_job = list("Commanding Officer", "Platoon Sergeant", "Squad Leader", "Field Engineer", "Field Medic", "Trooper", "Voyennyy Inzhener", "Voyennyy Politseyskiy", "Pekhotinets")

/datum/spawnpoint/iccg_officer_barracks/New()
	..()
	turfs = GLOB.latejoin_officer_barracks_iccg

// -- Wake up procedures --
// SCG
/datum/spawnpoint/scg_barracks/after_join(mob/living/victim)
	if(!istype(victim))
		return
	var/area/A = get_area(victim)
	var/list/spots = list()

	for(var/obj/structure/bed/C in A)
		if(!C.buckled_mob)
			spots += C

	if(!length(spots))
		to_chat(victim, "Вы проснулись чуть раньше остальных.")
		turfs -= get_turf(victim)
		return

	for(var/obj/structure/bed/C in shuffle(spots))
		if(!C.buckled_mob)
			C.buckle_mob(victim)
			to_chat(victim, SPAN_NOTICE("Вы пробуждаетесь от сна в казарме. Всё ещё в этом в огромном складе пахнущем потом и грязью."))

			if(!victim.isSynthetic())
				to_chat(victim, SPAN_NOTICE("Глаза открываются с трудом. Вы чувствуете себя разбитым, но это пройдет."))
			else
				to_chat(victim, SPAN_NOTICE("Получен сигнал к пробуждению. Батарея заряжена. Все системы в норме, в отличие от этого помещения."))

			break

/datum/spawnpoint/scg_officer_barracks/after_join(mob/living/victim)
	if(!istype(victim))
		return
	var/area/A = get_area(victim)
	var/list/spots = list()

	for(var/obj/structure/bed/C in A)
		if(!C.buckled_mob)
			spots += C

	if(!length(spots))
		to_chat(victim, "Вы проснулись чуть раньше остальных.")
		turfs -= get_turf(victim)
		return

	for(var/obj/structure/bed/C in shuffle(spots))
		if(!C.buckled_mob)
			C.buckle_mob(victim)
			to_chat(victim, SPAN_NOTICE("Вы пробуждаетесь от сна в офицерской казарме. Конечно не отдельная спальня, но здесь есть хоть какая-то тишина и порядок."))

			if(!victim.isSynthetic())
				to_chat(victim, SPAN_NOTICE("Глаза открываются с трудом. Вы чувствуете себя странно, но это пройдет."))
			else
				to_chat(victim, SPAN_NOTICE("Получен сигнал к пробуждению. Батарея заряжена. Все системы в норме. Начата процедура подготовки к службе."))

			break

// ICCG
/datum/spawnpoint/iccg_barracks/after_join(mob/living/victim)
	if(!istype(victim))
		return
	var/area/A = get_area(victim)
	var/list/spots = list()

	for(var/obj/structure/bed/C in A)
		if(!C.buckled_mob)
			spots += C

	if(!length(spots))
		to_chat(victim, "Вы проснулись чуть раньше остальных.")
		turfs -= get_turf(victim)
		return

	for(var/obj/structure/bed/C in shuffle(spots))
		if(!C.buckled_mob)
			C.buckle_mob(victim)
			to_chat(victim, SPAN_NOTICE("Вы пробуждаетесь от сна в казарме. Тесно и шумно, но это не важно. Вы здесь для дела."))
			to_chat(victim, SPAN_NOTICE("Вы открываете свои глаза. Надо собраться с силами и идти на службу."))

			break

/datum/spawnpoint/iccg_officer_barracks/after_join(mob/living/victim)
	if(!istype(victim))
		return
	var/area/A = get_area(victim)
	var/list/spots = list()

	for(var/obj/structure/bed/C in A)
		if(!C.buckled_mob)
			spots += C

	if(!length(spots))
		to_chat(victim, "Вы проснулись чуть раньше остальных.")
		turfs -= get_turf(victim)
		return

	for(var/obj/structure/bed/C in shuffle(spots))
		if(!C.buckled_mob)
			C.buckle_mob(victim)
			to_chat(victim, SPAN_NOTICE("Вы пробуждаетесь от сна в офицерской казарме. Как же хорошо, что здесь есть отдельная комната для офицеров. Тишина и порядок."))
			to_chat(victim, SPAN_NOTICE("Вы открываете свои глаза. Вот бы ещё кофе."))

			break
