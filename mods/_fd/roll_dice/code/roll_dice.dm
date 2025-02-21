/mob/verb/roll_d20()
    set name = "Roll D20"
    set category = "IC"

    // Запрашиваем описание действия для броска
    var/description = input("Describe the action accompanying the roll:", "Roll Description") as text|null
    if(!description)
        return

// Создаём оверлей с иконкой кубика
    var/image/dice_overlay = image('icons/obj/dice.dmi', src, "d62")
    dice_overlay.pixel_y = 24 // Смещение иконки на 24 пикселя вверх
    dice_overlay.layer = 4.1 // Устанавливаем слой выше игрока
    overlays += dice_overlay // Добавляем оверлей к игроку

    // Генерируем случайное число от 1 до 20
    var/roll = rand(1, 20)
    var/message = "[usr] [description] ([roll]/20)"

    // Определяем цвет текста в зависимости от результата броска
    var/color = (roll >= 11) ? "green" : "red"
    var/colored_message = "<span style='color: [color]; font-size: 16px;'>[message]</span>"

    // Отображаем сообщение для всех игроков в зоне видимости
    for(var/mob/M in viewers(usr))
        M.show_message(colored_message, 1)

    if(roll <= 10)
        playsound(usr, 'sound/machines/buzz-sigh.ogg', 50, 1) // Звук неудачи
    else
        playsound(usr, 'sound/machines/chime.ogg', 50, 1) // Звук успеха

// Удаляем оверлей через 5 секунд (50 тиков)
    spawn(50)
        overlays -= dice_overlay
        qdel(dice_overlay) // Освобождаем память
