/obj/item/device/tape/prerecorded
	icon_state = "tape_blue"

#define SPEECH(text) list("speech", "", text)           // просто речь
#define SPEECH_BY(who, text) list("speech", who, text)  // речь с указанием говорящего
#define EMOTE(text) list("emote", "", text)             // просто эмоция
#define EMOTE_BY(who, text) list("emote", who, text)    // эмоция с указанием кто делает
#define NOISE(text) list("noise", "", text)             // звук
#define PAUSE(seconds) list("pause", "", seconds)       // пауза/тишина

/obj/item/device/tape/prerecorded/Initialize()
	. = ..()

	var/list/script = list(
		// Время в секундах, действие (См. выше)
		list(0,   SPEECH_BY("Анна", "Привет, это тестовое сообщение.")),
		list(3,   EMOTE_BY("Анна", "кашляет в микрофон")),
		list(5,   SPEECH_BY("Борис", "А я Борис, приятно познакомиться.")),
		list(8,   NOISE("*звук печатающей машинки*")),
		list(10,  EMOTE_BY("Анна", "смеётся")),
		list(12,  SPEECH("Это просто речь без указания говорящего.")),
		list(15,  EMOTE("хлопает в ладоши")),
		list(17,  SPEECH_BY("Борис", "Всё работает отлично!")),
		list(20,  PAUSE(3)),  // 3 секунды тишины
		list(23,  SPEECH_BY("Анна", "И это финальное сообщение.")),
		list(26,  NOISE("*щелчок выключения*"))
	)

	var/current_time = 0
	for(var/entry in script)
		var/list/data = entry
		var/time = data[1]
		var/list/action = data[2]
		var/action_type = action[1]
		var/who = action[2]
		var/action_text = action[3]

		if(action_type == "pause")
			current_time = time
			used_capacity = current_time
			continue

		while(current_time < time)
			current_time++

		var/record_text = ""
		switch(action_type)
			if("speech")
				if(who)
					record_text = "[who] says, \"[action_text]\""
				else
					record_text = action_text
				record_speech(record_text)

			if("emote")
				if(who)
					record_text = "*[who] [action_text]*"
				else
					record_text = "*[action_text]*"
				record_speech(record_text)

			if("noise")
				record_noise(action_text)

		current_time = time
		used_capacity = current_time

	max_capacity = current_time + 1  // +1 секунда тишины в конце чтобы у нас кассета не выключалась сразу
	used_capacity = max_capacity

#undef SPEECH
#undef SPEECH_BY
#undef EMOTE
#undef EMOTE_BY
#undef NOISE
#undef PAUSE
