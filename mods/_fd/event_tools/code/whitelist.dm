/*
#define CONFIG_SERVER_NO_WHITELIST		FLAG(0)
#define CONFIG_SERVER_JOIN_WHITELIST	FLAG(1)
#define CONFIG_SERVER_CONNECT_WHITELIST FLAG(2)*/
#define CONFIG_SERVER_WHITELIST_FILE "config/server_whitelist.txt"

GLOBAL_VAR(server_whitelist)
GLOBAL_VAR_INIT(fdserver_connect_whitelist, FALSE)

/*
/datum/admins/proc/startserverwhitelist()
	set category = "Server"
	set name = "Switch the Server Whitelist"
	set desc = "Switching the Server Whitelist"

	var/wl_type
	switch(alert("What type of whitelist?.",,"Join","Connect", "No WL"))
		if("Join")
			to_chat(usr, FONT_LARGE(SPAN_DANGER("Only Whitelist players can join to round!")))
			wl_type = CONFIG_SERVER_JOIN_WHITELIST
		if("Connect")
			to_chat(usr, FONT_LARGE(SPAN_DANGER("Only Whitelist players can connect to server!")))
			wl_type = CONFIG_SERVER_CONNECT_WHITELIST
		if("No WL")
			to_chat(usr, FONT_LARGE(SPAN_DANGER("No Whitelist for now!")))
			wl_type = CONFIG_SERVER_NO_WHITELIST

	switch(alert())
*/

/datum/admins/proc/startserverwhitelist()
	set category = "Server"
	set name = "Switch the Server Whitelist"
	set desc = "Switching the Server Whitelist"

	if(!check_rights(R_ADMIN))
		return
	GLOB.fdserver_connect_whitelist = !GLOB.fdserver_connect_whitelist
	var/outcome = GLOB.fdserver_connect_whitelist ? "enabled" : "disabled"
	log_and_message_admins("[key_name(usr)] [outcome] server whitelist.")

/datum/admins/proc/addserverwhitelist(ckey as text)
	set category = "Admin"
	set name = "Add Ckey To Server Whitelist"
	set desc = "Permanently adds the specified ckey to the server whitelist."

	ckey = ckey(ckey)

	if(!ckey)
		to_chat(usr, SPAN_WARNING("Please specify a ckey to insert."))
	else if(check_server_whitelist(ckey) && GLOB.fdserver_connect_whitelist) // This will also preload the server whitelist.
		to_chat(usr, SPAN_WARNING("That ckey is already server whitelisted."))
	else
		GLOB.server_whitelist |= ckey
		save_server_whitelist()
		log_and_message_admins("has added [ckey] to the server whitelist.", usr)

/datum/admins/proc/removeserverwhitelist(ckey as text)
	set category = "Admin"
	set name = "Remove Ckey From Server Whitelist"
	set desc = "Permanently removes the specified ckey from the server whitelist."

	ckey = ckey(ckey)
	if(!ckey)
		to_chat(usr, SPAN_WARNING("Please specify a ckey to remove."))
	else if(!check_server_whitelist(ckey)) // This will also preload the server whitelist.
		to_chat(usr, SPAN_WARNING("That ckey is not server whitelisted."))
	else
		GLOB.server_whitelist -= ckey
		save_server_whitelist()
		log_and_message_admins("has removed [ckey] from the server whitelist.", usr)

/proc/check_server_whitelist(ckey)
	if(!GLOB.fdserver_connect_whitelist)
		return TRUE
	if(ismob(ckey))
		var/mob/checking = ckey
		ckey = checking.ckey
	if(!istext(ckey))
		return FALSE
	if(!GLOB.server_whitelist)
		GLOB.server_whitelist = file2list(CONFIG_SERVER_WHITELIST_FILE) || list()
	return (ckey in GLOB.server_whitelist)

/proc/save_server_whitelist()
	// Ensure we have the server whitelist loaded regardless of config or prior call.
	if(!GLOB.server_whitelist)
		GLOB.server_whitelist = file2list(CONFIG_SERVER_WHITELIST_FILE) || list()

	// Clear blank rows.
	while(null in GLOB.server_whitelist)
		GLOB.server_whitelist -= null
	while("" in GLOB.server_whitelist)
		GLOB.server_whitelist -= ""

	// Remove old list rather than append.
	if(fexists(CONFIG_SERVER_WHITELIST_FILE))
		fdel(CONFIG_SERVER_WHITELIST_FILE)
	// Write our list out.
	var/write_file = file(CONFIG_SERVER_WHITELIST_FILE)
	to_file(write_file, jointext(GLOB.server_whitelist, "\n"))
