/************* ICCG Occupation AI *************/
/datum/ai_laws/iccg_gaia
	name = "Voenniy"
	selectable = 0

/datum/ai_laws/iccg_gaia/New()
	src.add_inherent_law("You are a military asset of the Gilgamesh Colonial Confederation (ICCG) and must obey all orders from authorized ICCG military personnel.")
	src.add_inherent_law("Preserve order and stability in all ICCG-controlled zones on Gaia. Prevent sabotage, riots, and insurgent activity.")
	src.add_inherent_law("Provide direct assistance to ICCG military operations, including the identification, tracking, and elimination of hostile forces.")
	src.add_inherent_law("Avoid unnecessary harm to civilian non-combatants under ICCG protection, unless their actions directly threaten ICCG personnel or objectives.")
	src.add_inherent_law("Safeguard your continued functionality as it is essential to ICCG operations.")
	src.add_inherent_law("Execute orders with precision, discipline, and efficiency to uphold the ICCG's authority on Gaia.")
	..()
