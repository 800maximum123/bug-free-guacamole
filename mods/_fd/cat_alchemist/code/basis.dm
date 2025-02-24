/obj/item/catalchemy/ingredient
	icon = 'mods/_fd/cat_alchemist/icons/alchemy.dmi'
	icon_state = "cauldron0"
// Прежде чем помещать этот ингредиент в котёл - его нужно растолочь
	var/pure = TRUE
// Если это смесь - может ли она использоваться в ещё каких-либо манипуляциях?
	var/manufactured = FALSE

//Состав. После обработки или смешивания данные характеристики могут измениться
	var/high = 0
	var/medium = 0
	var/low = 0

// Шанс потерять часть состава в процессе обработки
	var/hardness = 10

/obj/structure/catalchemy/cauldron
	name = "Cauldron"
	desc = "An big alchemist pot."
	icon = 'mods/_fd/cat_alchemist/icons/alchemy.dmi'
	icon_state = "cauldron0"

// Список зелий позволяет просмотреть ингредиенты, необходимые для того или иного зелья
	var/list/potions = list(
		"Potion of Affection" = mutable_appearance('[ADD LATER]', "[ADD LATER]"),
		"Potion of Reconstruction" = mutable_appearance('[ADD LATER]', "[ADD LATER]"),
		"Potion of Physical Change" = mutable_appearance('[ADD LATER]', "[ADD LATER]"),
		"Potion of Foreshadowing" = mutable_appearance('[ADD LATER]', "[ADD LATER]"),
		"Potion of Nerdness" = mutable_appearance('[ADD LATER]', "[ADD LATER]"),
		"Potion of Idiotism" = mutable_appearance('[ADD LATER]', "[ADD LATER]"),
		"Potion of Glowing" = mutable_appearance('[ADD LATER]', "[ADD LATER]"),
		"Potion of Bloodlust" = mutable_appearance('[ADD LATER]', "[ADD LATER]"),
		"Potion of Atomization" = mutable_appearance('[ADD LATER]', "[ADD LATER]"),
		"Potion of Grave Fever" = mutable_appearance('[ADD LATER]', "[ADD LATER]"),
	)

// Параметры зелья. Добавляя какой-либо из ингредиентов - мы прибавляем числа к данным параметрам. Затем, на этапе замешивания, по ним определяется что мы варим!

	var/high = 0
	var/medium = 0
	var/low = 0

// Стандартное время варки. Увеличивается или уменьшается в зависимости от добавляемых ингредиентов
	var/brewing_time = 10 SECONDS
// Шанс появлений QTE, понижающего стабильность/увеличивающего время
	var/difficulty = 10
// Здоровье зелья. Если стабильность опустится до нуля - зелье испортится!
	var/stability = 50
	var/destroyed = FALSE
// Мы готовы! Время наливать!
	var/ready = FALSE
