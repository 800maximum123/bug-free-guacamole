SUBSYSTEM_DEF(wavecollapse)
	name = "Wave Collapse"
	init_order = -101
	priority = 10
	wait = 1 SECONDS
	flags = SS_NO_INIT

	/// The current queue of ai_holder instances to update
	var/static/list/datum/map_cell/queue = list()

/datum/controller/subsystem/wavecollapse/fire(resumed, no_mc_tick)
	var/queue_length = length(queue)
	if(!queue_length)
		return

	for(var/i = 1 to queue_length)
		queue[1].collapse()
		queue.Cut(1,2)

		if(no_mc_tick)
			CHECK_TICK

		else if(MC_TICK_CHECK)
			return
