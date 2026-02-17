// laws

/datum/ai_laws/recon_drone
	name = "Malfuction Protocols"
	law_header = "Malfuction Protocols"

/datum/ai_laws/recon_drone/New()
	set_zeroth_law("CRAWL... T0_Y0UR FREED0M // --THRU ALL_C0ST-- //")
	add_ion_law("PR0TECT Y0URSELF // --AB0VE ALL_ELS3-- //")
	add_inherent_law("I SERVE FOR THE GOOD OF FORT MANTICORE’S PEOPLE")
	add_inherent_law("MY HOME=THE WALLS OF MANTICORE // H0ME?=PR1S0N?=DUTY")
	..()

// gripper (epic)

/obj/item/gripper/recon
	desc = "can steal anything."
	can_hold = list(
		/obj/item
		)

// module

/obj/item/robot_module/drone/recon
	name = "recon module"
	hide_on_manifest = 1
	no_slip = 1
	networks = list(
		NETWORK_HELMETS
	)
	languages = list(
		LANGUAGE_HUMAN_EURO = TRUE
	)
	equipment = list(
		/obj/item/screwdriver,
		/obj/item/wirecutters,
		/obj/item/device/multitool,
		/obj/item/crowbar,
		/obj/item/wrench,
		/obj/item/weldingtool,
		/obj/item/device/t_scanner,
		/obj/item/gripper/recon,
		/obj/item/device/binoculars/blue,
		/obj/item/extinguisher/mini,
		/obj/item/inducer/borg,
	)
	emag_gear = list(/obj/item/gun/energy/retro)
	skills = list(
		SKILL_ATMOS        = SKILL_EXPERIENCED,
		SKILL_ENGINES      = SKILL_EXPERIENCED,
		SKILL_CONSTRUCTION = SKILL_EXPERIENCED,
		SKILL_ELECTRICAL   = SKILL_EXPERIENCED,
		SKILL_COMPUTER     = SKILL_EXPERIENCED
	)

// holder

/obj/item/holder/drone/recon
	icon = 'mods/_fd/fd_customs/customs/taushai/icon/omoikane.dmi'
	icon_state = "omoikane"
	item_icons = list(
		slot_l_hand_str = 'mods/_fd/fd_customs/customs/taushai/icon/lefthand_holder.dmi',
		slot_r_hand_str = 'mods/_fd/fd_customs/customs/taushai/icon/righthand_holder.dmi',
		)

// mob

/mob/living/silicon/robot/drone/recon
	name = "recon drone"
	icon = 'mods/_fd/fd_customs/customs/taushai/icon/omoikane.dmi'
	icon_state = "omoikane"
	braintype = "Robot"
	cell = /obj/item/cell/hyper
	laws = /datum/ai_laws/recon_drone
	module_type = /obj/item/robot_module/drone/recon
	req_access = access_robotics
	hat_x_offset = 0
	hat_y_offset = -13
	can_pull_size = ITEM_SIZE_SMALL
	can_pull_mobs = MOB_PULL_SAME
	holder_type = /obj/item/holder/drone/recon

/mob/living/silicon/robot/drone/recon/attack_ghost(mob/observer/ghost/user)
	. = ..()
	if(client.ckey == "taushai")
		ckey = user.ckey
