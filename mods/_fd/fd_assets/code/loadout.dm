/datum/map
	loadout_blacklist = list(
		/datum/gear/head/informalhat
	)

/datum/gear/uniform/rippedpunk
	display_name = "ripped punk clothes"
	path = /obj/item/clothing/under/rippedpunk

/datum/gear/uniform/punk
	display_name = "punk clothes"
	path = /obj/item/clothing/under/punk

/datum/gear/uniform/victoriandressblack
	display_name = "black victorian dress"
	path = /obj/item/clothing/under/victoriandressblack

/datum/gear/uniform/victoriandressred
	display_name = "red victorian dress"
	path = /obj/item/clothing/under/victoriandressred

/datum/gear/uniform/revealingdress
	display_name = "futuristic neon dress"
	path = /obj/item/clothing/under/revealingdress

/datum/gear/uniform/pentagram
	display_name = "dress with pentagram"
	path = /obj/item/clothing/under/pentagram

/datum/gear/uniform/ghoticdress
	display_name = "black ghotic dress"
	path = /obj/item/clothing/under/ghoticdress

/datum/gear/uniform/formalreddress
	display_name = "formal red dress"
	path = /obj/item/clothing/under/formalreddress

/datum/gear/uniform/officeformalred
	display_name = "office red dress"
	path = /obj/item/clothing/under/officereddress

/datum/gear/uniform/veryrevealingdress
	display_name = "very revealing dress"
	path = /obj/item/clothing/under/veryrevealingdress
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/utility/umbrella
	display_name = "umbrella"
	path = /obj/item/melee/umbrella
	cost = 1
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/buckethat
	display_name = "hat, bucket"
	path = /obj/item/clothing/head/buckethat
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/informalhat_fd
	display_name = "informal hat selection"
	path = /obj/item/clothing/head

/datum/gear/head/informalhat_fd/New()
	..()
	var/informalhats = list()
	informalhats["cowboy hat"] = /obj/item/clothing/head/cowboy_hat
	informalhats["dark cowboy hat"] = /obj/item/clothing/head/cowboy
	informalhats["light cowboy hat"] = /obj/item/clothing/head/cowboy/light
	informalhats["ushanka"] = /obj/item/clothing/head/ushanka
	informalhats["straw hat"] = /obj/item/clothing/head/straw
	gear_tweaks += new/datum/gear_tweak/path(informalhats)

/datum/gear/uniform/harness
	display_name = "gear harness"
	path = /obj/item/clothing/under/harness
	sort_category = "Xenowear"
