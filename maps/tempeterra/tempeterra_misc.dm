/*#include "tempeterra_area.dm"
#include "tempeterra_shuttles.dm"
*/
/datum/map_template/ruin/sfv_tempeterra
	name = "SFV Tempe Terra"
	id = "sfv_tempeterra"
	description = "A small, fairly modern dagger-shaped Lexington-class corvette, broadcasting SCGF codes and the designation 'SFV Tempe-Terra, LXC-7, Battle Group Bravo'"
	suffixes = list("maps/event/sfv_tempeterra/tempeterra-1.dmm","maps/event/sfv_tempeterra/tempeterra-2.dmm","maps/event/sfv_tempeterra/tempeterra-3.dmm")
	shuttles_to_initialise = list()
	apc_test_exempt_areas = list(
//		/area/tempeterra/shuttle/airlock = NO_SCRUBBER|NO_VENT,
		/area/tempeterra/armaments/storage/port = NO_SCRUBBER|NO_VENT,
		/area/tempeterra/armaments/storage/starboard = NO_SCRUBBER|NO_VENT
	)
	apc_test_exempt_areas = list(
		/area/tempeterra/shuttle/airlock = NO_SCRUBBER|NO_VENT,
		/area/tempeterra/armaments/storage/port = NO_SCRUBBER|NO_VENT,
		/area/tempeterra/armaments/storage/starboard = NO_SCRUBBER|NO_VENT
	)

/obj/overmap/visitable/sector/sfv_tempeterra_jump
	name = "Jump Drive Signature"
	desc = "Sensors readings on this sector indicate a jump pattern consistant with that of a fast moving fleet vessel."
	icon_state = "event"
	hide_from_reports = TRUE
	sensor_visibility = 10

/obj/overmap/visitable/ship/sfv_tempeterra
	name = "SFV Tempe Terra"
	desc = "A small, fairly modern dagger-shaped Lexington-class corvette, broadcasting SCGF codes and the designation 'SFV Tempe-Terra, LXC-7, Battle Group Bravo'"
	fore_dir = WEST
	vessel_size = SHIP_SIZE_SMALL
	vessel_mass = 40000

	initial_generic_waypoints = list(
		"nav_tempeterra_one",
		"nav_tempeterra_two",
		"nav_tempeterra_three",
		"nav_tempeterra_four",
		"nav_tempeterra_five",
		"nav_tempeterra_six"
	)

	initial_restricted_waypoints = list(
		"SFC Wolfe" = list("nav_hangar_tempeterra")
	)

/obj/machinery/power/apc/tempeterra
//	req_access = list(access_fleet_engineering)

/obj/machinery/alarm/tempeterra
//	req_access = list(access_fleet_engineering)

/obj/machinery/alarm/tempeterra/cold
	target_temperature = T0C+4

/obj/structure/closet/secure_closet/weapon
	name = "weapon closet"
	desc = "It's a secure wall-mounted storage unit for weapon"
	closet_appearance = /singleton/closet_appearance/wall/bomb
	anchored = TRUE
	density = FALSE
	wall_mounted = TRUE
	storage_types = CLOSET_STORAGE_ITEMS
//	req_access = list(access_medical_equip)

/singleton/closet_appearance/wall/bomb
//	color = COLOR_DARK_GREEN_GRAY
	extra_decals = list(
		"stripes_closed" = COLOR_RED_GRAY
	)

/obj/machinery/door/airlock/hatch/maintenance
	name = "Maintenance Hatch"
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/hatch/medbay
	stripe_color = COLOR_CYAN

/obj/machinery/door/airlock/hatch/security
	stripe_color = "#9d2300"

/obj/machinery/door/airlock/hatch/civilian
	stripe_color = COLOR_CIVIE_GREEN

/area/turbolift/tempeterralift
	name = "Engineer Bay Lift"
	icon_state = "shuttle3"
	base_turf = /turf/simulated/open
	lighting_tone = AREA_LIGHTING_COOL

/datum/shuttle/autodock/ferry/tempeterralift
	name = "engineer lift controls"
	shuttle_area = /area/turbolift/medical_lift
	warmup_time = 3
	waypoint_station = "nav_tempeterra_lift_top"
	waypoint_offsite = "nav_tempeterra_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/obj/machinery/computer/shuttle_control/lift/tempeterra
	name = "engineer lift controls"
	shuttle_tag = "engineer lift controls"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = FALSE

/obj/shuttle_landmark/lift/tempeterralift_top
	name = "Top Deck"
	landmark_tag = "nav_tempeterra_lift_top"
	base_area = /area/tempeterra/engineering/reactor/fuel
	base_turf = /turf/simulated/open

/obj/shuttle_landmark/lift/tempeterralift_bottom
	name = "Lower Deck"
	landmark_tag = "nav_tempeterra_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/tempeterra/atmos
	base_turf = /turf/simulated/floor/plating

/obj/machinery/atmospherics/unary/engine/big
	icon = 'maps/!maps_stash/sfv_tempeterra/3x3_engine.dmi'
	icon_state = "huge_engine"
	moles_per_burn = 8.0
	boot_time = 70
	bound_width = 96
	bound_height = 96
	bound_y = -32
	pixel_y = -32

/obj/engine_exhaust/big
	bound_width = 96
	bound_height = 96
	bound_y = 32
	pixel_x = 32


/obj/placeholder/big
	name = "engine exhaust"
	icon = 'icons/obj/machines/ship_engine.dmi'
	icon_state = "nozzle_burn"
	light_color = "#00a2ff"
	anchored = TRUE

/obj/placeholder/big/New(turf/nloc, ndir)
	..(nloc)
	nloc.hotspot_expose(1000,125)
	set_light(4, 0.5)
	set_dir(ndir)
	SetTransform(3)
	bound_width = 96
	bound_height = 96

/obj/engine_exhaust/big/New(turf/nloc, ndir)
	..(nloc)
	nloc.hotspot_expose(1000,125)
	set_light(4, 0.5)
	set_dir(ndir)
	SetTransform(3)
	bound_width = 96
	bound_height = 96
//	spawn(20)
// 3 вправо
// 1 вверх
//		qdel(src)

/obj/machinery/atmospherics/unary/engine/big/check_blockage()
	blockage = FALSE


/obj/item/storage/backpack/dufflebag/sec/pcarrier
	name = "navy plate carrier's bag"
	desc = "A large bag for holding full armor kit."
	startswith = list(
		/obj/item/clothing/suit/armor/pcarrier/navy,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/accessory/storage/pouches/navy,
		/obj/item/clothing/accessory/armor_plate/tactical,
		/obj/item/clothing/accessory/helmet_cover/navy,
		/obj/item/clothing/accessory/leg_guards/navy,
		/obj/item/clothing/accessory/arm_guards/navy,
		/obj/item/clothing/glasses/ballistic
	)
	contents_allowed = list(
		/obj/item/clothing/suit/armor/pcarrier,
		/obj/item/clothing/head/helmet,
		/obj/item/clothing/accessory/storage/pouches,
		/obj/item/clothing/accessory/armor_plate,
		/obj/item/clothing/accessory/helmet_cover,
		/obj/item/clothing/accessory/leg_guards,
		/obj/item/clothing/accessory/arm_guards,
		/obj/item/clothing/glasses/ballistic
	)

/obj/item/folder/envelope/rtb
	desc = "A thick envelope. The 3th Fleet crest is stamped in the corner, along with 'DO NOT DISSEMINATE.'"

/obj/item/folder/envelope/rtb/Initialize()
	. = ..()
	new /obj/item/paper/rtb(src)

/obj/item/paper/rtb
	name = "Letter from Admiral Henry Lau"
	info = {"\
<center><h3>EXPEDITIONARY COMMAND - OBSERVATORY</h3>
<img src="eclogo.png" /></center>
<p><tt><tt><strong>FROM:</strong> Admiral Henry Lau, Observatory<br /><strong>TO:</strong> Expeditionary Corps Vessel #3, SEV Torch<br /><strong>CC:</strong> Flag Admiral Magny Khan, Commandant of the Expeditionary Corps<br /><strong>SUBJECT:</strong> Update to the SEV Torch<br /></tt></tt></p>
<hr />
<p>Good day, SEV Torch. For the purposes of reality this document can be disseminated to anyone within your retinue of Line Officers and support staff, but try to keep things secure, and need-to-know where applicable. And, please, most importantly, make sure this doesn't need to be scrubbed from the ship's systems again.</p>
<p>You'll pardon me for the colloquialisms, but things aren't in a particularly great state as it stands right now. The SEV Torch is at the center of a controversy in regards to what is happening within the governance right now, and doubly so within the Fleet. A lot of pressure is coming from the Senate and the Assembly both to put us in a tight spot.</p>
<p>It's been difficult for Admiral Khan to keep things running smoothly with other organizations due to this. And to do so, we've had to make some concessions in regards to how things are being ran for now. Particularly, the Fleet has to be placated rather heavily for us to continue operating in the way we are. For the time being this doesn't effect you, at least directly, and if this changes you will be informed via fax or direct report.</p>
<p>As always, we have staff on standby to answer your faxes and offer order clarification in the event it's required, and you should also remember to ask for clarifications&nbsp;<em>before&nbsp;</em>following orders you may view as strange, cruel or unusual. We are counting on you to be an example right now, do not let us down Torch.</p>
<p>Updates on the encroaching situation will be sent to you on a need-to-know basis with the approval of Admiral Khan. For the time being, continue operations as normal. Record the status of your bluespace drive regularly, report any fleet vessels that may contact you to us, and remember the oaths you all took. Avoid danger, but don't run away. Godspeed.</p>
<hr />
<p>&nbsp;<em>This paper has been stamped with the insignia of the Admiral Henry Lau.</em></p>
<hr /><center><img src="eclogo.png" /></center>
"}

/obj/item/paper/expcorpstatus
	name = "Classified Report: Status of the Fleets"
	info = {"\
<center><strong><span style="color: red;">ЗАСЕКРЕЧЕННЫЙ ОТЧЕТ. СЕКЦИЯ #314-E</span></strong>
<h3>MARSCOM - HIGH COMMAND OFFICES</h3>
<img src="fleetlogo.png"/></center>
<p><tt><tt><strong>ОТ:</strong> Контр-Адмирал <span style="background-color: #000000; color: #000000;">XXXXXXXX</span> <span style="color: #000000; background-color: #000000;">XXXXXXXXXXXX</span>, SFV <span style="color: #000000; background-color: #000000;">XXXXXXXXXXXXXXX</span> <br /><strongДЛЯ:</strong> Адмирал Флота Кристофер Гернандз<br /><strong>CC:</strong>Администрация Генерального Секретаря<br /><strong>ТЕМА:</strong> Отчет о Статусе Флота<br /></tt></tt></p>
<hr/>
<p>Адмирал Генри Лау и Адмирал <span style="color: #000000; background-color: #000000;">XXXXXXXXX XXXXX</span>&nbsp;,  осуществляющие надзор за действующими судами Проекта "Гелиос", подтвердили что Экспедиционный Корпус не намерен останавливать свои операции. Согласно отчетам, Проекты XXXXXXXXX</span>&nbsp; и XXXXXXXXX</span>&nbsp;, действуют согласно стандартным протоколам. Администрация Корпуса запросила приток новых инструкторов Флота для помощи в обучении своих сотрудников службы безопасности для предупреждения подобных инцидентов.</p>
<hr/>
<p>&nbsp;<em>This paper has been stamped with the stamp of MARSCOM - HIGH COMMAND OFFICES.</em></p>
<hr/><center><img src="fleetlogo.png"/></center>
"}

// Адмирал Генри Лау и Адмирал XXXXXXXXX XXXXX, которые осуществляют надзор за действующими судами Проекта "Гелиос", подтвердили что Экспедиционный Корпус не намерен останавливать свои операции. Согласно отчетам, Проекты XXXXXXXXX и XXXXXXXXX, действуют согласно стандартным протоколам. Администрация Корпуса запросила приток нового персонала Флота для помощи в обучении своих сотрудников службы безопасности для предупреждения подобных инцидентов.
// The Expeditionary Corps and their staffing have been confirmed to continue operations by Admiral Henry Lau, and Admiral XXXXXXXXX XXXXX who are keeping oversight of the active vessels of the Helios Project. XXXXXXXXX Project, and the XXXXXXXX Project continue to operate as standard by report.  The Expeditionary Administration has requested an influx of new Fleet personnel to assist in training for their security and engineering divisions in the event of further attack.
// <span style="color: #000000; background-color: #000000;">XXXXXXXXX</span>&nbsp;

/obj/item/paper/medbayregulations //Сделано Викиз
	name = "FLT-MED-01ac: Regulations"
	info = {"\
	<center> <img src="fleetlogo.png"/>
<span style=\"font-size: 10px\">
Офис Начальника Медицинской Службы, ГКФ <I>Темптерра</I></span>
<span style=\"font-size: 18px\"><B>FLT-MED-01ac</B></span>
<span style=\"font-size: 10px\"><B>Основные Процедуры Медицинской Службы</B></span>
<hr/><hr/>
<center>Следующие Основные Процедуры распространяются как на персонал медицинской службы, так и на присутствующий персонал на его территории, если это уместно исходя из контекста регуляции. Данные процедуры не являются полноценными корабельными регуляциями и могут быть игнорированы при наличии особых обстоятельств. Помните - контекст важнее</center>
<center><table border=1 cellspacing=0 cellpadding=3 style='border: 1px solid black;'><tr><td><center><span style=\"font-size: 18px\">
Основные Процедуры</span></center><center><span style=\"font-size: 10px\"><I>Все процедуры в этом разделе распространяются на все уровни угрозы, если не сказано иначе;</I></span></center>

<center>* Медицинский персонал не имеет права на личное хранение контролируемых субстанций (например, Трамадол, Оксикодон, Синаптизин и Гиперзин), все контролируемые субстанции должны находиться в холодильной камере фармацевтической лаборатории;
* Несмотря на то, что Перидаксон не является контролируемой субстанцией, он подвержен тем же процедурам; Допускается наличие перидаксона в операционных театрах в количестве до 30 единиц;
* Все экстренные вызовы должны сопровождаться оповещением о реагировании на таковой;
* Отделение Реанимации и Интенсивной Терапии (ОРИТ) обязательно должно быть снабжено как минимум двумя (2) автоматическими компрессорами; При отсутствии дополнительных, единственный имеющийся в наличии пакет нанокрови должен распологаться в пределах ОРИТ, врачам-хирургам запрещается снабжение им любых операционных;
* При отсутствии физиологических причин, персонал должен носить обувь закрытого типа; запрещается ношение юбок, шорт и иной другой одежды персоналом, оказывающим, в данный момент, прямую медицинскую помощь;
* Врачи-хирурги обязаны использовать предоставленные средства индивидуальной защиты: хирургические халаты, шапочки, стерильные перчатки, которые должны меняться каждую операцию, а также стерильные маски;
* Весь персонал, ассистирующий врачам-хирургам в соответствующих операционных театрах должен носить, как минимум, пару стерильных/нестерильных, в зависимости от контекста ситуации, перчаток, а также маску;
* Предотвращение шрамирования внутренних органов является основным приоритетом, должны быть предпочтены более долгие методы лечения, взамен скорости;

* Весь персонал, не требующийся на территории отдела, подлежит выведению с таковой. Существует ряд исключений, как например сопровождение заключённого одним (1) сотрудником службы безопасности, либо проведение модификаций оборудования персоналом отдела исследований и разработок;
* Кнопка вызова медицинских сотрудников, как и экстренный вход, должны использоваться только по их прямому назначению;
* Курение вне специализированных отсеков воспрещено;
* Медицинскому персоналу запрещается употребление алкогольных напитков в течение рабочей смены;</center>


<center><span style=\"font-size: 18px\">Основные Процедуры <U>Зелёного</U> Уровня Угрозы</span></center><center>
* Сенсоры мониторинга жизнедеятельности не обязательны для активации в каком-либо режиме, в соответствии с процедурами уровня угрозы;
* Дополнительные бронеэлементы (шлемы, бронежилеты, при наличии таковых) запрещены;


<center><span style=\"font-size: 18px\">Основные Процедуры <U>Синего</U> Уровня Угрозы</span></center><center>
* Сенсоры мониторинга жизнедеятельности обязательны для включения во второй или третий режим, в соответствии с процедурами уровня угрозы;
* Дополнительные броневые элементы (шлемы, бронежилеты, при наличии таковых) разрешаются для ношения;
* Скафандры рекомендуются для ношения персоналом производящим эвакуацию пострадавшего(-их);
* Врачи-хирурги обязаны находиться на территории отсека, либо в его близости;
* Экстренные медицинские техники и иной медицинский персонал, производящий эвакуацию пострадавшего(-их) должен сообщать их сортировочную группу в соответствии с их травмами (красная, жёлтая, зелёная, чёрная);


<center><span style=\"font-size: 18px\">Основные Процедуры <U>Фиолетового</U> Уровня Угрозы</span></center><center>
* Сенсоры мониторинга жизнедеятельности обязательны для включения во второй или третий режим, в соответствии с процедурами уровня угрозы;
* Весь медицинский персонал обязан соблюдать ношение костюмов биологической защиты или скафандров, в соответствии с процедурами уровня угрозы;
* Врачи-хирурги обязаны находиться на территории отдела, либо в его близости;


<center><span style=\"font-size: 18px\">Основные Процедуры <U>Оранжевого</U> Уровня Угрозы</span></center><center>
* Сенсоры мониторинга жизнедеятельности обязательны для включения, в соответствии с процедурами уровня угрозы;
* Персонал должен убедиться в наличии экстренных запасов кислорода и герметичности экстренной маски;


<center><span style=\"font-size: 18px\">Основные Процедуры <U>Красного</U> Уровня Угрозы</span></center><center>
* Процедуры эквивалентны таковым Синего уровня угрозы, изменения и исключения предоставлены ниже;
* Сенсоры мониторинга жизнедеятельности обязательны для включения в третий режим, в соответствии с процедурами уровня угрозы;
* Шрамирование внутренних органов, кроме мозга, допускается в случаях крайней необходимости, если задержки приведут к дальнейшим травмам среди экипажа;

</td></tr></table><hr/>
<hr/><span style=\"font-size: 10px\"><I>* Игнорирование данных процедур при отсутствии объективных причин может повлечь за собой дисциплинарные, финансовые и правовые взыскания, в том числе штрафы и увольнения без предварительных предупреждений о таковых. Весь персонал медицинской службы автоматически подчиняется указанным в данном документе процедурам независимо от степени ознакомленности с ними;</I></span><hr/>
	"}
