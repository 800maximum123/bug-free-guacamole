/datum/mech_ability/intrusion
	name = "Вторжение"
	action_state = "35"
	stat_color = "#ec75fc"

	cooldown = 10 SECONDS
	charges_max = 6 // Нужно добавить реген зарядов, надеюсь не забуду

	var/stages_max = 5
	var/options_per_stage = 2

	var/qte_time = 2 SECONDS
	var/debuff_duration = 20 SECONDS

	var/list/debuff_types = list(MECH_OVERHEATED, MECH_MALFUNCTIONED, MECH_CHAINED, MECH_HACKED)

/// 1984 ЗДЕСЬ НИКОМУ НИХЕРА НИЧЕГО
/datum/mech_ability/intrusion/use(mob/living/simple_animal/fd/lancer/target, params)
	. = ..()
	if(!.)
		return FALSE

	if(!istype(target))
		return FALSE

	if(target.mech_stat != CONSCIOUS)
		return FALSE

	if(target.hacked)
		to_chat(SPAN_WARNING("Каналы [target] уже забиты другим вторжением!"))
		return FALSE

	hack(target, params)
	return TRUE

/datum/mech_ability/intrusion/proc/hack(mob/living/simple_animal/fd/lancer/target, params)
	set waitfor = FALSE

	var/stage
	for(stage in 1 to stages_max)
		target.Effect(MECH_HACKED, qte_time + 1 SECONDS)

		var/list/options = list()
		options["#FIX"] = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "31")

		for(var/difficulty in 1 to (stage * options_per_stage) + 1)
			options["#[rand(99,9999)]"] = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "19")

		playsound(target, 'packs/infinity/sound/mecha/UI_SCI-FI_Tone_10_stereo.ogg', 60, TRUE)

		var/chosen_option = show_radial_menu(target, target, shuffle(options), radius = 60, custom_check = new Callback(src, PROC_REF(qte_check), world.time), offset_x = 125, offset_y = 125)
		if(chosen_option != "#FIX")
			playsound(target, 'packs/infinity/sound/mecha/UI_SCI-FI_Tone_Deep_Wet_15_stereo_error.ogg', 60, TRUE, falloff = 4)
			break

		if(stage == stages_max)
			playsound(target, 'packs/infinity/sound/mecha/UI_SCI-FI_Tone_Deep_Wet_22_stereo_complite.ogg', 80, falloff = 4)
			target.AdjustEffect(MECH_HACKED, -qte_time)

	if(stage < stages_max)
		target.AdjustEffect(pick(debuff_types), debuff_duration)
		to_chat(target, SPAN_WARNING("Вам не удалось остановить вторжение в системы [target]!"))

		var/list/sounds = list(
			'mods/_fd/event_tools/sounds/atlas_beep1.ogg',
			'mods/_fd/event_tools/sounds/atlas_beep2.ogg',
			'mods/_fd/event_tools/sounds/atlas_beep3.ogg',
			)
		playsound(target, pick(sounds), 60, TRUE, falloff = 4)

/datum/mech_ability/intrusion/proc/qte_check(start_time)
	return (world.time < (start_time + qte_time))
