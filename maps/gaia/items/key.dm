// Lpckpick to pick the locks
/obj/item/screwdriver/lockpick
	name = "lockpick"
	desc = "A set of lockpicks perfect for 'hacking' more primitive doors with."
	icon = 'icons/obj/keys.dmi'
	icon_state = "lockpick"
	lock_picking_level = 10
	build_from_parts = FALSE

// KEYS
/obj/item/key/gaia
	name = "Gaia key"
	desc = "Some say its the key from every door on the Gaia, other say its the key to Gaia itself! But the smartest of all know this is just a base item."
	key_data = "GAIA_BASE_KEY"

// FACTION HQ KEYS
/obj/item/key/gaia/scg
	name = "SCG master key"
	desc = "The master key from the SCG base. Reserved for the highest ranks."
	key_data = "GAIA_SCG_MASTER_KEY"
	color = COLOR_BLUE_GRAY

/obj/item/key/gaia/iccg
	name = "ICCG master key"
	desc = "The master key from the ICCG base. Reserved for the highest ranks."
	key_data = "GAIA_ICCG_MASTER_KEY"
	color = COLOR_RED_GRAY

// CIVILIAN KEYS
/obj/item/key/gaia/mayor
	name = "town hall key"
	desc = "A key that opens the doors to the Town Hall."
	key_data = "GAIA_TOWN_HALL_KEY"
	color = COLOR_GREEN_GRAY

/obj/item/key/gaia/police
	name = "police key"
	desc = "A key that opens the doors to the Police Station."
	key_data = "GAIA_POLICE_KEY"
	color = COLOR_DARK_BLUE_GRAY

/obj/item/key/gaia/firefighter
	name = "firefighter key"
	desc = "A key that opens the doors to the Fire Station."
	key_data = "GAIA_FIREFIGHTER_KEY"
	color = COLOR_RED_LIGHT

/obj/item/key/gaia/medical
	name = "medical key"
	desc = "A key that opens the doors to the Hospital."
	key_data = "GAIA_MEDICAL_KEY"
	color = COLOR_PALE_BLUE_GRAY

/obj/item/key/gaia/engineering
	name = "engineering key"
	desc = "A key that opens the doors to the Engineering & Maintenance stations across the city, including sewage."
	key_data = "GAIA_ENGINEERING_KEY"
	color = COLOR_YELLOW_GRAY

/obj/item/key/gaia/church
	name = "church key"
	desc = "A key that opens the doors to the Church."
	key_data = "GAIA_CHURCH_KEY"
	color = COLOR_GRAY

// KEYCHAINS
// MAYOR KEYCHAIN
/obj/item/storage/keychain/mayor
	name = "Mayor's keychain"
	desc = "A keychain for the Mayor's keys."
	color = COLOR_GREEN_GRAY
	startswith = list( // Every key except the church key, since the church is separate from the city government
	/obj/item/key/gaia/mayor,
	/obj/item/key/gaia/police,
	/obj/item/key/gaia/firefighter,
	/obj/item/key/gaia/medical,
	/obj/item/key/gaia/engineering,
		)
