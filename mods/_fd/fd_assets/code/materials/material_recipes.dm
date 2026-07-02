/material/fiber/generate_recipes(reinforce_material)
	. = list()
	if(reinforce_material)	//recipes below don't support composite materials
		return
	. += new/datum/stack_recipe/rope(src)
	. += new/datum/stack_recipe/strawhat(src)

/material/rope/generate_recipes(reinforce_material)
	. = list()
	if(reinforce_material)	//recipes below don't support composite materials
		return
	. += new/datum/stack_recipe/furniture/hammock(src)
