#define ANNOUNCER_NAME "Automated Announcement System"

/////// ANNOUNCEMENT PROCS VIA RADIO ///////
/datum/announcement/proc/FormRadioMessage(message as text, message_title as text, zlevel, channel)
	GLOB.global_announcer.autosay(SPAN_BOLD(FONT_LARGE("[SPAN_WARNING("[title]:")] [message]")), announcer ? announcer : ANNOUNCER_NAME, channel, zlevel)

/datum/announcement/minor/FormRadioMessage(message as text, message_title as text, zlevel, channel)
	GLOB.global_announcer.autosay(message, ANNOUNCER_NAME,, zlevel)

/datum/announcement/priority/FormRadioMessage(message as text, message_title as text, zlevel, channel)
	GLOB.global_announcer.autosay(SPAN_BOLD(FONT_LARGE("[SPAN_WARNING("[message_title]:")] [message]")), announcer ? announcer : ANNOUNCER_NAME, channel, zlevel)

/datum/announcement/priority/command/FormRadioMessage(message as text, message_title as text, zlevel, channel)
	GLOB.global_announcer.autosay(SPAN_BOLD(FONT_LARGE("[SPAN_WARNING("[GLOB.using_map.boss_name] Update[message_title ? " — [message_title]" : ""]:")] [message]")), ANNOUNCER_NAME, channel, zlevel)

/datum/announcement/priority/security/FormRadioMessage(message as text, message_title as text, zlevel, channel)
	GLOB.global_announcer.autosay(SPAN_BOLD(FONT_LARGE("[SPAN_WARNING("[message_title]:")] [message]")), ANNOUNCER_NAME, channel, zlevel)

/////// ANNOUNCEMENT PROCS ///////
/datum/announcement/proc/Message(message as text, message_title as text, channel)
	GLOB.global_announcer.autosay(FONT_LARGE("[SPAN_WARNING("[title]:")] [message]"), announcer ? announcer : ANNOUNCER_NAME)

/datum/announcement/minor/Message(message as text, message_title as text, channel)
	GLOB.global_announcer.autosay(message, ANNOUNCER_NAME)

/datum/announcement/priority/Message(message as text, message_title as text, channel)
	GLOB.global_announcer.autosay(FONT_LARGE("[SPAN_CLASS("alert", "[message_title]:")] [message]"), announcer ? announcer : ANNOUNCER_NAME, channel)

/datum/announcement/priority/command/Message(message as text, message_title as text, channel)
	GLOB.global_announcer.autosay(FONT_LARGE("[SPAN_WARNING("[GLOB.using_map.boss_name] [message_title]:")] [message]"), ANNOUNCER_NAME, channel)

/datum/announcement/priority/security/Message(message as text, message_title as text, channel)
	GLOB.global_announcer.autosay(FONT_LARGE("[SPAN_COLOR("red", "[message_title]:")] [message]"), ANNOUNCER_NAME, channel)

#undef ANNOUNCER_NAME
