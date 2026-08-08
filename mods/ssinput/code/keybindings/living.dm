/datum/keybinding/living
	category = CATEGORY_HUMAN


/datum/keybinding/living/can_use(client/user)
	return isliving(user.mob)


/datum/keybinding/living/rest
	hotkey_keys = list("ShiftB")
	name = "rest"
	full_name = "Rest"
	description = "You lay down/get up"


/datum/keybinding/living/rest/down(client/user)
	var/mob/living/L = user.mob
	L.lay_down()
	return TRUE


/datum/keybinding/living/resist
	hotkey_keys = list("B")
	name = "resist"
	full_name = "Resist"
	description = "Break free of your current state. Handcuffed? On fire? Resist!"


/datum/keybinding/living/resist/down(client/user)
	var/mob/living/L = user.mob
	L.resist()
	return TRUE


/datum/keybinding/living/drop_item
	hotkey_keys = list("Q", "Northwest") // HOME
	name = "drop_item"
	full_name = "Drop Item"
	description = ""


/datum/keybinding/living/drop_item/down(client/user)
	//var/mob/living/L = user.mob
	//L.drop_item()
	user.drop_item()
	return TRUE


/datum/keybinding/living/look_up
	hotkey_keys = list(",")
	name = "look_up"
	full_name = "Look Up"
	description = "Makes you look up"


/datum/keybinding/living/look_up/down(client/user)
	var/mob/living/L = user.mob
	L.lookup()


/datum/keybinding/living/look_down
	hotkey_keys = list(".")
	name = "look_down"
	full_name = "Look Down"
	description = "Makes you look down"


/datum/keybinding/living/look_down/down(client/user)
	var/mob/living/L = user.mob
	L.lookdown()
