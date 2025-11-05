/obj/item/organ/internal/augment/ibis
	name = "IBIS-C4-45"
	augment_slots = AUGMENT_CHEST
	icon = 'mods/_fd/fd_customs/customs/palerno/icon/cns_implant.dmi'
	icon_state = "cns_implant"
	desc = "A compact device with red strings attached directly to the nerves. It's alive"
	augment_flags = AUGMENT_BIOLOGICAL | AUGMENT_SCANNABLE
	origin_tech = list(TECH_DATA = 2, TECH_POWER = 2, TECH_BIO = 2)
	var/irremovable = TRUE


/obj/item/organ/internal/augment/ibis/cut_away(mob/living/user)
	if(irremovable)
		if(user)
			to_chat(user, SPAN_WARNING("[src] cannot be cut away! It is permanently fused with the nervous system."))
			return FALSE
	. = ..()
