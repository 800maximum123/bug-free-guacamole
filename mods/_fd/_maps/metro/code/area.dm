// Так называемая База
/area/metro/

// Тунель до овощебазы
/area/metro/main_tunel
	name = "Tunel F"
	requires_power = 0

// Теееехнические помещения
/area/metro/maintain
	name = "Technical Area"

// Технические тунели (Так ещё и безопасная зона, безопасна пока работает генератора)
/area/metro/maintain/tunnel
	name = "Tehcnical Tunnels"

/area/metro/maintain/south
	name = "South Tunnels"

/area/metro/maintain/south/blast_door

/area/metro/maintain/south/chasm1
	name = "Shaft"
	unbreathable = TRUE
	icon_state = "green"

/area/metro/maintain/south/kpp
	name = "South KPPs"


// Западное крыло
/area/metro/maintain/west
	name = "West Wing"




// Восточное крыло
/area/metro/maintain/east
	name = "East Wing"

// Задымлённый коридор (низя дышать)
/area/metro/maintain/gas
	name = "Techinal Area"
	icon_state = "green"
	unbreathable = TRUE

//Первый генератор
/area/metro/maintain/gen1
	name = "First Reserve Generators"

//Второй генератор
/area/metro/maintain/gen2
	name = "Second Reserve Generators"
	unbreathable = TRUE

//Третий генератор
/area/metro/maintain/gen3
	name = "Third Reserve Generators"
