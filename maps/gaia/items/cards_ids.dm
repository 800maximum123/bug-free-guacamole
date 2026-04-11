//Gaia ID Cards

/obj/item/card/id/gaia
	name = "identification card"
	desc = "A national identification card issued by Gaian Republic."
	job_access_type = DEFAULT_JOB_TYPE

/obj/item/card/id/gaia/mayor
	name = "identification card"
	desc = "A national identification card issued by the Gaian Republic."
	job_access_type = /datum/job/mayor

/obj/item/card/id/gaia/cop
	name = "identification card"
	desc = "A national identification card issued by the Gaian Republic."
	job_access_type = /datum/job/policeman

/obj/item/card/id/gaia/firefighter
	name = "identification card"
	desc = "A national identification card issued by the Gaian Republic."
	job_access_type = /datum/job/firefighter

/obj/item/card/id/gaia/paramedic
	name = "identification card"
	desc = "A national identification card issued by the Gaian Republic."
	job_access_type = /datum/job/paramedic

// SCG
/obj/item/card/id/gaia/scg
	name = "military identification card"
	desc = "A military identification card issued by SolGov Defense Forces"
	job_access_type = /datum/job/scg_trooper
	color = COLOR_SOL

/obj/item/card/id/gaia/scg/co
	desc = "An ornament military identification card issued to officers by SolGov Defense Forces"
	job_access_type = /datum/job/scg_co
	extra_details = list("goldstripe")

/obj/item/card/id/gaia/scg/ps
	desc = "An ornament military identification card issued to second-in-commands by SolGov Defense Forces"
	job_access_type = /datum/job/scg_ps
	extra_details = list("goldstripe")

/obj/item/card/id/gaia/scg/squad_leader
	desc = "A military identification card issued to lesser command personnel by SolGov Defense Forces"
	job_access_type = /datum/job/scg_squad_leader
	extra_details = list("goldstripe")

/obj/item/card/id/gaia/scg/medic
	desc = "A military identification card issued to medical personnel by SolGov Defense Forces"
	job_access_type = /datum/job/scg_medic
	detail_color = COLOR_BLUE_GRAY

/obj/item/card/id/gaia/scg/engineer
	desc = "A military identification card issued to engineering personnel by SolGov Defense Forces"
	job_access_type = /datum/job/scg_engineer
	detail_color = COLOR_YELLOW_GRAY

// ICCG
/obj/item/card/id/gaia/iccg
	name = "confederate identification card"
	desc = "A military identification card issued by Independent Colonial Confederation of Gilgamesh Navy"
	job_access_type = /datum/job/iccg_trooper
	color = COLOR_GUNMETAL

/obj/item/card/id/gaia/iccg/co
	desc = "An ornament military identification card issued to officers by Independent Colonial Confederation of Gilgamesh Navy"
	job_access_type = /datum/job/iccg_co
	extra_details = list("goldstripe")

/obj/item/card/id/gaia/iccg/xo
	desc = "An ornament military identification card issued to second-in-commands by Independent Colonial Confederation of Gilgamesh Navy"
	job_access_type = /datum/job/iccg_xo
	extra_details = list("goldstripe")

/obj/item/card/id/gaia/iccg/squad_leader
	desc = "A military identification card issued to lesser command personnel by Independent Colonial Confederation of Gilgamesh Navy"
	job_access_type = /datum/job/iccg_squad_leader
	extra_details = list("goldstripe")

/obj/item/card/id/gaia/iccg/mp
	desc = "A military identification card issued to military police personnel by Independent Colonial Confederation of Gilgamesh Navy"
	job_access_type = /datum/job/iccg_mp
	detail_color = COLOR_RED_GRAY

/obj/item/card/id/gaia/iccg/medic
	desc = "A military identification card issued to medical personnel by Independent Colonial Confederation of Gilgamesh Navy"
	job_access_type = /datum/job/iccg_medic
	detail_color = COLOR_BLUE_GRAY

/obj/item/card/id/gaia/iccg/engineer
	desc = "A military identification card issued to engineering personnel by Independent Colonial Confederation of Gilgamesh Navy"
	job_access_type = /datum/job/iccg_engineer
	detail_color = COLOR_YELLOW_GRAY
