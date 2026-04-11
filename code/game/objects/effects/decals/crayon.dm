/obj/decal/cleanable/crayon
	name = "rune"
	desc = "A rune drawn in crayon."
	icon = 'icons/effects/crayondecal.dmi'

/obj/decal/cleanable/crayon/New(location, main = "#ffffff", shade = "#000000", type = "rune")
	..()
	name = type
	desc = "A [type] drawn in crayon."
	switch (type)
		if ("rune")
			type = "rune[rand(1, 6)]"
		if ("graffiti")
			type = pick("amyjon", "face", "matt", "revolution", "engie", "guy", "end", "dwarf", "uboa")
		if ("defector graffiti")
			type = pick("fleet", "fifthfleet", "deathtoterra", "downwithec", "kr514")
		// GAIA GRAFFITIS
		if ("gaia-protestor graffiti")
			type = pick(
					"deathtoterra", "end", "revolution", "tyrannes",
					"why", "indiegohome", "solsolgoaway", "peacekeepmyass",
					"gccshit", "indiecrossed", "solcrossed",
					"indieburn", "solburn", "soldierskull", "execution", "wheat",
					"nokingsnomasters", "resist", "freegaia", "gaiastar",
					)
	var/icon/mainOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]", 2.1)
	var/icon/shadeOverlay = new/icon('icons/effects/crayondecal.dmi',"[type]s", 2.1)
	mainOverlay.Blend(main,ICON_ADD)
	shadeOverlay.Blend(shade,ICON_ADD)
	AddOverlays(mainOverlay)
	AddOverlays(shadeOverlay)
	add_hiddenprint(usr)

// GAIA GRAFFITIS
/obj/decal/cleanable/crayon/random_gaia
	name = "random gaia graffiti"
	desc = "A random piece of anti-imperialist graffiti."
	icon_state = "GAIA GRAFFITIS"

/obj/decal/cleanable/crayon/random_gaia/New(location, main = "#ffffff", shade = "#000000", type = "gaia-protestor graffiti")
	if(type)
		type = "gaia-protestor graffiti"
		icon_state = ""
	if(main && shade)
		main = "#[num2hex(rand(64,255))]"
		shade = "#[num2hex(rand(64,255))]"
	..()
