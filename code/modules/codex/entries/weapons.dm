/datum/codex_entry/baton
	associated_paths = list(/obj/item/melee/baton)
	mechanics_text = "If your intent is set to 'harm', you will inflict damage when using it. \
	If not you will safely subdue the person with it."

/datum/codex_entry/telescopic_baton
	associated_paths = list(/obj/item/melee/baton/telebaton)
	mechanics_text = "The baton needs to be turned on to be used. Use it in your hand to toggle it on or off. If your intent is \
	set to 'harm', you will inflict damage when using it."

/datum/codex_entry/stun_baton
	associated_paths = list(/obj/item/melee/baton/stun)
	mechanics_text = "The baton needs to be turned on to apply the stunning effect. Use it in your hand to toggle it on or off. If your intent is \
	set to 'harm', you will inflict damage when using it, regardless if it is on or not. Each stun reduces the baton's charge, which can be replenished by \
	putting it inside a weapon recharger."

/datum/codex_entry/energy_sword
	associated_paths = list(/obj/item/melee/energy/sword)
	antag_text = "The energy sword is a very strong melee weapon, capable of severing limbs easily, if they are targeted. It can also has a chance \
	to block projectiles and melee attacks while it is on and being held. The sword can be toggled on or off by using it in your hand. While it is off, \
	it can be concealed in your pocket or bag."

/datum/codex_entry/cultblade
	associated_paths = list(/obj/item/melee/cultblade)
	antag_text = "This sword is a powerful weapon, capable of severing limbs easily, if they are targeted. Nonbelivers are unable to use this weapon."

/datum/codex_entry/mine
	associated_paths = list(/obj/structure/mine, /obj/item/device/mine)
	lore_text = "Landmines are still very prelevant around space. Cheap and dangerous they are used to deteer people and vehicles from certain areas. There is no current regulations around the use of mines by humans."
	mechanics_text = "Mines are extremely deadly and explode when you cross them.<br/>\
	You can avoid a mine by walking around or jumping over it.<br/>\
	Projectiles, EMP, and other explosions can also trigger the mines.<br/>\
	You can defuse the mine with a Screwdriver.<br/>\
	The chances of succseful defuse depends on the mine type, Complex Devices skill, and whenever you're proned."
