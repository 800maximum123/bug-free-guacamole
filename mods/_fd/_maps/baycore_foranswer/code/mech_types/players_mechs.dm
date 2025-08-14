/mob/living/simple_animal/fd/lancer/drake/redguard
	name = "H-APU 'Krasnogvardeec'"
	desc = "Стена. Ваш верный щит, стена что не рухнет."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_redguard.dmi'
	icon_state = "redguard"

	pixel_x = -110
	default_pixel_x = -110
	pixel_y = -30
	default_pixel_y = -30
	wreck_type = /obj/structure/fd/mech_wreckage/big/redguard

/obj/structure/fd/mech_wreckage/big/redguard
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_redguard.dmi'
	icon_state = "redguard_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 256
	bound_height = 64

/obj/structure/fd/mech_wreckage/big/redguard/Initialize()
	. = ..()
	var/state = rand(1,7)
	icon_state = "redguard_death_[state]"



/mob/living/simple_animal/fd/lancer/goblintail/beer
	name = "L-APU 'Beer-Sake'"
	desc = "Модифицированный 'Atlas' от AzureDominion, имеет чуть ли не наименьший размер среди разведывательных APU. Даже в лёгкой категории!"
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_beer.dmi'
	icon_state = "beer"

	pixel_x = -108
	default_pixel_x = -108
	pixel_y = -82
	default_pixel_y = -82

	wreck_type = /obj/structure/fd/mech_wreckage/small/saladin



/mob/living/simple_animal/fd/lancer/goblintail/binak
	name = "L-APU 'Binak'"
	desc = "..."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_binak.dmi'
	icon_state = "binak"

	pixel_x = -108
	default_pixel_x = -108
	pixel_y = -82
	default_pixel_y = -82



/mob/living/simple_animal/fd/lancer/drake/vladimir
	name = "H-APU 'Vladimir'"
	desc = "Стандартная модель. Но выкрашенная в цвета флага ГКК."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_vladimir.dmi'
	icon_state = "vladimir"

	pixel_x = -110
	default_pixel_x = -110
	pixel_y = -30
	default_pixel_y = -30
	wreck_type = /obj/structure/fd/mech_wreckage/big/vladimir

/obj/structure/fd/mech_wreckage/big/vladimir
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_vladimir.dmi'
	icon_state = "vladimir_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 256
	bound_height = 64

/obj/structure/fd/mech_wreckage/big/vladimir/Initialize()
	. = ..()
	var/state = rand(1,7)
	icon_state = "vladimir_death_[state]"



/mob/living/simple_animal/fd/lancer/lancaster/marrot
	name = "SUPP-APU 'Marrot'"
	desc = "Грубоватый, но надёжный шестиногий тяжеловоз, переделанный из шахтёрского ремонтника. \
	Потрёпанная обшивка, небрежно окрашенная в тусклый серо-оранжевый с пятнами нагара и следами старых ремонтных заплат, \
	скрывает мощный плазменный резак и грузовую спину, способную нести даже искорёженных товарищей."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/engineer_marrot.dmi'
	icon_state = "marrot"

	pixel_x = -105
	default_pixel_x = -105
	pixel_y = -55
	default_pixel_y = -55



/mob/living/simple_animal/fd/lancer/lancaster/amaryllis
	name = "SUPP-APU 'Marrot'"
	desc = "Фактически, данный шагоход делит сознание с пилотом. \
	Взамен позитроник-пилот потерял способность производить практически всю остальную деятельность."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/engineer_amaryllis.dmi'
	icon_state = "amaryllis"

	pixel_x = -105
	default_pixel_x = -105
	pixel_y = -55
	default_pixel_y = -55



/mob/living/simple_animal/fd/lancer/saladin/enchanter
	name = "SUPP-APU 'Enchanter'"
	desc = "Эсперементальная модель меха, которая только жжёт и телепортируется. Нет, серьёзно - это буквально ВСЁ."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/experimental_enchanter.dmi'
	icon_state = "enchanter"

	pixel_x = -115
	default_pixel_x = -115
	pixel_y = -42
	default_pixel_y = -42



/mob/living/simple_animal/fd/lancer/nelson/jotunbreaker
	name = "APU 'Jotunbreaker'"
	desc = "Крушитель ледяных(кристаллических) великанов."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/breacher_jotunbreaker.dmi'
	icon_state = "jotunbreaker"

	pixel_x = -111
	default_pixel_x = -111
	pixel_y = -75
	default_pixel_y = -75

/mob/living/simple_animal/fd/lancer/nelson/jotunbreaker/set_dir()
	..()
	switch(dir)
		if(WEST, SOUTH)
			pixel_x = -111
			default_pixel_x = -111
		if(EAST, NORTH)
			pixel_x = -111
			default_pixel_x = -111



/mob/living/simple_animal/fd/lancer/napoleon/peacekeeper
	name = "APU 'Peacekeeper'"
	desc = "'Миротворец' - специальная модификация стандартных APU вооруженных сил ЦПСС, предназначенная для лидеров огневых групп. \
	Блок связи на его спине позволяет оперативно получать новую информацию и делиться ей с остальными."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_peacekeeper.dmi'
	icon_state = "peacekeeper"

	pixel_x = -111
	default_pixel_x = -111
	pixel_y = -66
	default_pixel_y = -66



/mob/living/simple_animal/fd/lancer/napoleon/oven
	name = "APU 'Oven'"
	desc = "Небрежно перекрашенный зачастую неподходящей, и от того порой сыпящейся, жёлтой краской монстр Франкенштейна. \
	Собран из относительно целых и подходящих запчастей с разных мехов."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_oven.dmi'
	icon_state = "oven"

	pixel_x = -111
	default_pixel_x = -111
	pixel_y = -66
	default_pixel_y = -66



/mob/living/simple_animal/fd/lancer/napoleon/wanderer
	name = "APU 'Wanderer'"
	desc = "'Скиталец' представитель мехов класса 'Страж', которые усилены дополнительными листами брони и ракетной установкой для оказания огневой поддержки штурмовым группам. \
	Данная единица выглядит потрёпанной, имеет множество следов небрежного ремонта и боевых отметин, кое-где слезла краска, а кое-где оплавилась."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_wanderer.dmi'
	icon_state = "wanderer"

	pixel_x = -111
	default_pixel_x = -111
	pixel_y = -66
	default_pixel_y = -66



/mob/living/simple_animal/fd/lancer/napoleon/siren
	name = "APU 'Lilac Siren'"
	desc = "'Сирена' представляет из себя прототип класса 'Калибан', расчитанный на устранение наземной техники и авиации противника. \
	К удивлению, но он хорошо зарекомендовал себя и в устранении своих старших братьев, благодаря мощи 155-мм двухствольного дробовика."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_siren.dmi'
	icon_state = "siren"

	pixel_x = -111
	default_pixel_x = -111
	pixel_y = -76
	default_pixel_y = -76



/mob/living/simple_animal/fd/lancer/goblintail/inquisitor
	name = "L-APU 'Inquisitor'"
	desc = "Модифицированная модель разведывательного меха класса 'Каратель', \
	который является стандартом для агентов отдела специальных операций кампании SAARE. \
	Дальнобойное орудие было заменено на лёгкое ПП, а огромное оружие ближнего боя - на энергетическую плеть, \
	которая питается от внутреннего реактора. Плащ хоть и выглядит как если бы был сделан из ткани, \
	но на деле состоит из множества эластичных пластинок, позволяющие меху скрывать себя за счёт создания оптических иллюзий."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_inquisitor.dmi'
	icon_state = "inquisitor"

	pixel_x = -220
	default_pixel_x = -220
	pixel_y = -52
	default_pixel_y = -52

	wreck_type = /obj/structure/fd/mech_wreckage/medium/napoleon

/mob/living/simple_animal/fd/lancer/goblintail/inquisitor/set_dir()
	..()
	switch(dir)
		if(WEST, SOUTH)
			pixel_x = -220
			default_pixel_x = -220
		if(EAST, NORTH)
			pixel_x = -50
			default_pixel_x = -50

/mob/living/simple_animal/fd/lancer/napoleon/barracuda
	name = "APU 'Goblin'"
	desc = "\"Барракуда\" от Гефеста - простой в эксплуатации и обслуживании, резвый и, главное, массовый. \
	Этот экземпляр - представитель ранней модели, местами проржавевший. На крашеном наспех корпусе \
	виднеется стёртая маркировка \"HI-BRC-827\"."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_barracuda2.dmi'
	icon_state = "barracuda"

	pixel_x = -140
	default_pixel_x = -140
	pixel_y = -46
	default_pixel_y = -46

	wreck_type = /obj/structure/fd/mech_wreckage/medium/napoleon

/mob/living/simple_animal/fd/lancer/napoleon/barracuda/set_dir()
	..()
	switch(dir)
		if(WEST, SOUTH)
			pixel_x = -140
			default_pixel_x = -140
		if(EAST, NORTH)
			pixel_x = -70
			default_pixel_x = -70
