/obj/item/reagent_containers/food/drinks/bottle/cognac/clover
	icon = 'mods/_fd/fd_customs/customs/protossdelta/birthday_bottle.dmi'
	icon_state = "cognacbottle"
	center_of_mass = "x=16;y=6"
	volume = 250
	name = "Super Premium Cognac Deluxe edition"
	desc = "A sweet and strongly alchoholic drink, made after numerous distillations and years of maturing. This particular bottle is in a semi-frozen state.\n\nOn the front of the bottle, there is a small clover icon right on top of the original label. Underneath that icon, there is text that says \"Juliet Lamb's property. Do not touch or you will know why they call me Mr. Blue!\" and it is fiercely crossed out with some kind of marker."

/obj/item/reagent_containers/food/drinks/bottle/cognac/clover/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/ethanol/cognac, 200)
	reagents.add_reagent(/datum/reagent/drink/ice, 50)

/obj/item/reagent_containers/food/drinks/bottle/cognac/clover/smash_check(distance)
	return FALSE
