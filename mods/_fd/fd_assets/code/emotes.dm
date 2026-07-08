/singleton/emote/audible/synth/whirr
	key = "whirr"
	emote_message_3p = "USER whirrs loudly!"
	emote_sound = list(
		'mods/_fd/fd_assets/sounds/voice/IPC_whirr1.ogg',
		'mods/_fd/fd_assets/sounds/voice/IPC_whirr2.ogg',
		'mods/_fd/fd_assets/sounds/voice/IPC_whirr3.ogg'
	)

/singleton/emote/audible/synth/whistle
	key = "whistle"
	emote_message_3p = "USER whistles robotically."
	emote_sound = 'mods/_fd/fd_assets/sounds/voice/IPC_shortwhistle.ogg'

/singleton/emote/audible/synth/whistle/wolf
	key = "wwhistle"
	emote_message_3p = "USER beeps inappropriately."
	emote_sound = 'mods/_fd/fd_assets/sounds/voice/IPC_wolfwhistle.ogg'

/singleton/emote/audible/synth/laugh
	key = "laugh"
	emote_message_3p = "USER смеётся."
	emote_sound = 'mods/_fd/fd_assets/sounds/voice/IPC_laugh.ogg'

/singleton/emote/audible/synth/scream
	key = "scream"
	emote_message_3p = "USER кричит!"
	emote_sound = 'mods/emote_panel/sound/scream_robot.ogg'

/datum/species/machine
	speech_chance = 25
	speech_sounds = list(
		'mods/emote_panel/sound/robot_talk_heavy_1.ogg',
		'mods/emote_panel/sound/robot_talk_heavy_2.ogg',
		'mods/emote_panel/sound/robot_talk_heavy_3.ogg',
		'mods/emote_panel/sound/robot_talk_heavy_4.ogg'
	)
	default_emotes = list(
		/singleton/emote/audible/synth/whirr,
		/singleton/emote/audible/synth/whistle,
		/singleton/emote/audible/synth/whistle/wolf,
		/singleton/emote/audible/synth/laugh,
		/singleton/emote/audible/synth/scream
	)
