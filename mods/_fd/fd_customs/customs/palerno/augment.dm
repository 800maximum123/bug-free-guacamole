/obj/item/organ/internal/augment/ibis
	name = "IBIS-C4-45"
	augment_slots = AUGMENT_CHEST
	icon = 'mods/_fd/fd_customs/customs/palerno/icon/implant.dmi'
	icon_state = "implant"
	item_state = "onmobimplant"
	desc = "An implant embedded in the CNS to enhance the efficiency of combat mech pilots. Its basis consists of a titanium frame with nanofibers and an unknown crystal-red substance for neural connections."
	augment_flags = AUGMENT_BIOLOGICAL | AUGMENT_SCANNABLE | AUGMENT_INSPECTABLE
	origin_tech = list(TECH_DATA = 2, TECH_POWER = 2, TECH_BIO = 2)
	surface_accessible = TRUE
	var/irremovable = TRUE


/obj/item/organ/internal/augment/ibis/cut_away(mob/living/user)
	if(irremovable)
		if(user)
			to_chat(user, SPAN_WARNING("[src] cannot be cut away! It is permanently fused with crystal-red strings to the nervous system."))
			return FALSE
	. = ..()

// /datum/sprite_accessory/marking/ibis // Временная заглушка, дабы не ебать себе мозги TODO: Сделать круто
/datum/sprite_accessory/marking/tattoo/chest/ibis
	name = "IBIS-C4-45"
	icon = 'mods/_fd/fd_customs/customs/palerno/icon/implant.dmi'
	icon_state = "onmobimplant"
//	draw_order = 60
//	species_allowed = list(SPECIES_HUMAN)
//	body_parts = list(BP_CHEST)
	do_coloration = 0
