/obj/item/device/megaphone
	name = "megaphone"
	desc = "A device used to project your voice. Loudly."
	icon = 'icons/obj/tools/megaphone.dmi'
	icon_state = "megaphone"
	item_state = "radio"
	w_class = ITEM_SIZE_SMALL
	obj_flags = OBJ_FLAG_CONDUCTIBLE

	var/spamcheck = 0
	var/emagged = FALSE
	var/insults = 0
	var/list/insultmsg = list("FUCK EVERYONE!", "I'M A TATER!", "ALL SECURITY TO SHOOT ME ON SIGHT!", "I HAVE A BOMB!", "CAPTAIN IS A COMDOM!", "FOR THE SYNDICATE!")

/obj/item/device/megaphone/attack_self(mob/living/user as mob)
	if (user.client)
		if(user.client.prefs.muted & MUTE_IC)
			to_chat(src, SPAN_WARNING("You cannot speak in IC (muted)."))
			return
	if(user.silent)
		return
	if(spamcheck)
		to_chat(user, SPAN_WARNING("\The [src] needs to recharge!"))
		return

	var/message = sanitize(input(user, "Shout a message?", "Megaphone", null)  as text)
	if(!message)
		return
	message = capitalize(message)
	if ((src.loc == user && usr.stat == 0))
		if(emagged)
			if(insults)
				user.audible_message(message = SPAN_DANGER("<b>[user]</b> announces: ([FONT_GIANT("\"[pick(insultmsg)]\"")])"), runemessage = insultmsg)
				playsound(src, 'sound/items/megaphone.ogg', 100, TRUE)
				insults--
			else
				to_chat(user, SPAN_WARNING("*BZZZZzzzzzt*"))
		else
			user.audible_message(message = "<b>[user]</b> announces: [FONT_GIANT("\"[message]\"")]", runemessage = message)
			playsound(src, 'sound/items/megaphone.ogg', 50, TRUE)
		spamcheck = 1
		spawn(20)
			spamcheck = 0
		return

/obj/item/device/megaphone/emag_act(remaining_charges, mob/user)
	if(!emagged)
		to_chat(user, SPAN_WARNING("You overload \the [src]'s voice synthesizer."))
		emagged = TRUE
		insults = rand(1, 3)//to prevent dickflooding
		return 1
