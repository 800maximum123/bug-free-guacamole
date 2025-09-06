/singleton/hierarchy/mil_uniform
	name = "Master outfit hierarchy"
	hierarchy_type = /singleton/hierarchy/mil_uniform
	var/list/branches = null
	var/departments = 0
	var/min_rank = 0

	var/pt_under = null
	var/pt_shoes = null

	var/utility_under = null
	var/utility_shoes = null
	var/utility_hat = null
	var/utility_extra = null

	var/service_under = null
	var/service_skirt = null
	var/service_over = null
	var/service_shoes = null
	var/service_heels = null
	var/service_hat = null
	var/service_gloves = null
	var/service_extra = null

	var/dress_under = null
	var/dress_skirt = null
	var/dress_over = null
	var/dress_shoes = null
	var/dress_heels = null
	var/dress_hat = null
	var/dress_gloves = null
	var/dress_extra = null

/singleton/hierarchy/mil_uniform/ec
	name = "Master EC outfit"
	hierarchy_type = /singleton/hierarchy/mil_uniform/ec
	// branches = list(/datum/mil_branch/expeditionary_corps) ГАЙЯ

	pt_under = /obj/item/clothing/under/solgov/pt/expeditionary
	pt_shoes = /obj/item/clothing/shoes/black

	utility_under = /obj/item/clothing/under/solgov/utility/expeditionary
	utility_shoes = /obj/item/clothing/shoes/dutyboots
	utility_hat = /obj/item/clothing/head/soft/solgov/expedition
	utility_extra = list(/obj/item/clothing/head/beret/solgov/expedition, /obj/item/clothing/head/ushanka/solgov, /obj/item/clothing/suit/storage/hooded/wintercoat/solgov, /obj/item/clothing/shoes/jackboots/unathi)

	service_over = /obj/item/clothing/suit/storage/solgov/service/expeditionary
	service_hat = /obj/item/clothing/head/solgov/service/expedition

	dress_under = /obj/item/clothing/under/solgov/dress/expeditionary
	dress_skirt = /obj/item/clothing/under/solgov/dress/expeditionary/skirt
	dress_over = /obj/item/clothing/suit/storage/solgov/dress/expedition
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_hat = /obj/item/clothing/head/solgov/service/expedition
	dress_gloves = /obj/item/clothing/gloves/white

	dress_extra = list(/obj/item/clothing/accessory/solgov/ec_scarf)

/singleton/hierarchy/mil_uniform/fleet
	name = "Master fleet outfit"
	hierarchy_type = /singleton/hierarchy/mil_uniform/fleet
	branches = list(/datum/mil_branch/fleet)

	pt_under = /obj/item/clothing/under/solgov/pt/fleet
	pt_shoes = /obj/item/clothing/shoes/black

	utility_under = /obj/item/clothing/under/solgov/utility/fleet
	utility_shoes = /obj/item/clothing/shoes/dutyboots
	utility_hat = /obj/item/clothing/head/solgov/utility/fleet
	utility_extra = list(
		/obj/item/clothing/head/beret/solgov/fleet,
		/obj/item/clothing/head/ushanka/solgov/fleet,
		/obj/item/clothing/suit/storage/hooded/wintercoat/solgov/fleet,
		/obj/item/clothing/head/soft/solgov/fleet
	)

	service_under = /obj/item/clothing/under/solgov/service/fleet
	service_skirt = /obj/item/clothing/under/solgov/service/fleet/skirt
	service_over = /obj/item/clothing/suit/storage/solgov/service/fleet
	service_shoes = /obj/item/clothing/shoes/dress
	service_heels = /obj/item/clothing/shoes/dressheels
	service_hat = /obj/item/clothing/head/solgov/dress/fleet/garrison
	service_extra = list(/obj/item/clothing/suit/solgov/fleet_sweater)

	dress_under = /obj/item/clothing/under/solgov/service/fleet
	dress_skirt = /obj/item/clothing/under/solgov/service/fleet/skirt
	dress_over = /obj/item/clothing/suit/dress/solgov/fleet/sailor
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_heels = /obj/item/clothing/shoes/dressheels
	dress_hat = /obj/item/clothing/head/solgov/dress/fleet/garrison
	dress_gloves = /obj/item/clothing/gloves/white

/singleton/hierarchy/mil_uniform/civilian
	name = "Master civilian outfit"		//Basically just here for the rent-a-tux, ahem, I mean... dress uniform.
	hierarchy_type = /singleton/hierarchy/mil_uniform/civilian
	branches = list(/datum/mil_branch/civilian,/datum/mil_branch/solgov)

	utility_under = /obj/item/clothing/under/syndicate

	service_under = /obj/item/clothing/under/suit_jacket/really_black
	service_skirt = /obj/item/clothing/under/skirt_c/dress/black
	service_shoes = /obj/item/clothing/shoes/dress
	service_extra = list(/obj/item/clothing/under/skirt_c/dress/eggshell, /obj/item/clothing/shoes/heels/black, /obj/item/clothing/shoes/heels/red)

	dress_under = /obj/item/clothing/under/rank/internalaffairs/plain
	dress_skirt = /obj/item/clothing/under/skirt_c/dress/long/black
	dress_over = /obj/item/clothing/suit/storage/toggle/suit/black
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_extra = list(/obj/item/clothing/accessory/waistcoat/black, /obj/item/clothing/under/skirt_c/dress/long/eggshell, /obj/item/clothing/shoes/flats/black)

// ICCGN UNIFORMS FOR GAIA
/singleton/hierarchy/mil_uniform/iccgn
	name = "Master ICCGN outfit"
	hierarchy_type = /singleton/hierarchy/mil_uniform/iccgn
	branches = list(/datum/mil_branch/iccgn)

	pt_under = /obj/item/clothing/under/iccgn/pt
	pt_shoes = /obj/item/clothing/shoes/black

	utility_under = /obj/item/clothing/under/iccgn/utility
	utility_shoes = /obj/item/clothing/shoes/iccgn/utility
	utility_hat = /obj/item/clothing/head/iccgn/utility
	utility_extra = list(
		/obj/item/clothing/gloves/iccgn/duty,
		/obj/item/clothing/head/iccgn/beret,
		/obj/item/clothing/head/ushanka/gcc,
		/obj/item/clothing/suit/iccgn/utility,
		/obj/item/clothing/suit/storage/toggle/track/gcc,
		/obj/item/clothing/head/tank,
	)

	service_under = /obj/item/clothing/under/iccgn/service
	service_over = /obj/item/clothing/suit/iccgn/service_enlisted
	service_shoes = /obj/item/clothing/shoes/iccgn/service
	service_hat = /obj/item/clothing/head/iccgn/service

	dress_under = /obj/item/clothing/under/iccgn/service
	dress_over = /obj/item/clothing/suit/iccgn/dress_enlisted
	dress_shoes = /obj/item/clothing/shoes/iccgn/service
	dress_hat = /obj/item/clothing/head/iccgn/service
	dress_gloves = /obj/item/clothing/gloves/white

/singleton/hierarchy/mil_uniform/iccgn/com
	name = "ICCGN command"
	min_rank = 110

	utility_under = /obj/item/clothing/under/iccgn/utility/command

	service_over = /obj/item/clothing/suit/iccgn/service_officer

	dress_over = /obj/item/clothing/suit/iccgn/dress_officer

/singleton/hierarchy/mil_uniform/iccgn/com/seniorofficer
	name = "ICCGN senior command"
	min_rank = 150

	utility_under = /obj/item/clothing/under/iccgn/utility/command

	service_under = /obj/item/clothing/under/iccgn/service_command
	service_over = /obj/item/clothing/suit/iccgn/service_command
	service_hat = /obj/item/clothing/head/iccgn/service_command

	dress_under = /obj/item/clothing/under/iccgn/service_command
	dress_over = /obj/item/clothing/suit/iccgn/dress_command
	dress_hat = /obj/item/clothing/head/iccgn/service_command
	dress_extra = list(
		/obj/item/material/sword // ICCGN ain't fucking around, real deal
	)
