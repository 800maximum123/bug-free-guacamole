#if !defined(using_map_DATUM)

	#include "../../packs/deepmaint/_pack.dm"
	#include "../../packs/event_2022jul30/_pack.dm"
	#include "../../packs/infinity/_pack.dm"

	#include "../../packs/factions/commonwealth/_pack.dm"
	#include "../../packs/factions/fa/_pack.dm"
	#include "../../packs/factions/iccgn/_pack.dm"
	#include "../../packs/factions/scga/_pack.dm"
	#include "../../packs/factions/scgec/_pack.dm"

	// --- GAIA --- //
	#include "../gaia/gaia_areas.dm"
	#include "../gaia/gaia_ranks.dm"
	#include "../gaia/gaia_setup.dm"
	#include "../gaia/gaia_shuttles.dm"
	#include "../gaia/gaia_spawnpoints.dm"
	#include "../gaia/gaia_lobby.dm"
	#include "../gaia/gaia_procs.dm"
	#include "../gaia/ai_law_sets.dm"

	#include "../gaia/loadout/_defines.dm"
	#include "../gaia/loadout/loadout_accessories.dm"
	#include "../gaia/loadout/loadout_eyes.dm"
	#include "../gaia/loadout/loadout_gloves.dm"
	#include "../gaia/loadout/loadout_head.dm"
	#include "../gaia/loadout/loadout_misc.dm"
	#include "../gaia/loadout/loadout_shoes.dm"
	#include "../gaia/loadout/loadout_suit.dm"
	#include "../gaia/loadout/loadout_uniform.dm"
	#include "../gaia/loadout/loadout_xeno.dm"
	#include "../gaia/loadout/~defines.dm"

	#include "../gaia/effects/light.dm"
	#include "../gaia/effects/lock_helper.dm"

	#include "../gaia/language/human/euro.dm"
	#include "../gaia/language/human/iberian.dm"
	#include "../gaia/language/human/russian.dm"

	#include "../gaia/items/bell.dm"
	#include "../gaia/items/cards_ids.dm"
	#include "../gaia/items/clothes.dm"
	#include "../gaia/items/key.dm"
	#include "../gaia/items/shooting_range.dm"

	#include "../gaia/structures/barrier.dm"
	#include "../gaia/structures/gaiaflags.dm"
	#include "../gaia/structures/lockers.dm"
	#include "../gaia/structures/machinery.dm"
	#include "../gaia/structures/military.dm"
	#include "../gaia/structures/rubble.dm"
	#include "../gaia/structures/signs.dm"
	#include "../gaia/structures/truck.dm"

	#include "../gaia/turf/floor.dm"
	#include "../gaia/turf/moving.dm"
	#include "../gaia/turf/walls.dm"
	#include "../gaia/turf/mineral.dm"

	#include "../gaia/job/iccg_jobs.dm"
	#include "../gaia/job/scg_jobs.dm"
	#include "../gaia/job/gaia_jobs.dm"

	#include "../gaia/job/outfits/iccg_outfits.dm"
	#include "../gaia/job/outfits/misc_outfits.dm"
	#include "../gaia/job/outfits/scg_outfits.dm"

	#include "../gaia/gaia_scg_camp.dmm"
	#include "../gaia/gaia_iccg_camp.dmm"
	#include "../gaia/z4_admin.dmm"
	#include "../gaia/z5_transit.dmm"
	//CHANGE THIS DEPENDING ON THE MISSION!!
	#include "../gaia/area_of_op/shaftmines.dmm"
	//#include "../gaia/area_of_op/city.dmm"
	//#include "../gaia/area_of_op/outskirts.dmm"

	// --- MAP MAINTENANCE --- //
	#include "../torch/torch_areas.dm"
	#include "../torch/torch_events.dm"
	#include "../torch/torch_holodecks.dm"
	#include "../torch/torch_machinery.dm"
	#include "../torch/torch_presets.dm"
	#include "../torch/torch_setup.dm"
	#include "../torch/torch_submaps.dm"
	#include "../torch/torch_turfs.dm"
	#include "../torch/torch_simplemobs.dm"

	#include "../torch_fd/torch_decals.dm"


	// --- INCLUDES FROM ANOTHER MAPS --- //
	#include "../sierra/sierra_npcs.dm"

	// --- DATUMS SECTION --- //
	#include "../torch/datums/uniforms.dm"
	#include "../torch/datums/uniforms_expedition.dm"
	#include "../torch/datums/uniforms_fleet.dm"
	#include "../torch/datums/reports/command.dm"
	#include "../torch/datums/reports/corporate.dm"
	#include "../torch/datums/reports/exploration.dm"
	#include "../torch/datums/reports/medical.dm"
	#include "../torch/datums/reports/robotics.dm"
	#include "../torch/datums/reports/science.dm"
	#include "../torch/datums/reports/security.dm"
	#include "../torch/datums/reports/solgov.dm"
	#include "../torch/datums/reports/deck.dm"
	#include "../torch/datums/shackle_law_sets.dm"
	#include "../torch/datums/department_exploration.dm"

	#include "../torch/datums/uplink.dm"

	// --- ITEMS --- //
	#include "../torch_fd/items/agencylogo.dm"
	#include "../torch/items/cards_ids.dm"
	#include "../torch/items/coins.dm"
	#include "../torch/items/encryption_keys.dm"
	#include "../torch/items/selection.dm"
	#include "../torch/items/headsets.dm"
	#include "../torch/items/items.dm"
	#include "../torch/items/machinery.dm"
	#include "../torch/items/manuals.dm"
	#include "../torch/items/stamps.dm"
	#include "../torch/items/uniform_vendor.dm"
	#include "../torch/items/rigs.dm"
	#include "../torch/items/solbanner.dm"
	#include "../torch/items/explo_shotgun.dm"
	#include "../torch/items/mecha.dm"
	#include "../torch/items/memos.dm"

	#include "../torch/spawners.dm"

	#include "../torch/items/clothing/ec_skillbadges.dm"
	#include "../torch/items/clothing/solgov-accessory.dm"
	#include "../torch/items/clothing/solgov-armor.dm"
	#include "../torch/items/clothing/solgov-feet.dm"
	#include "../torch/items/clothing/solgov-hands.dm"
	#include "../torch/items/clothing/solgov-head.dm"
	#include "../torch/items/clothing/solgov-suit.dm"
	#include "../torch/items/clothing/solgov-under.dm"

	#include "../torch/items/wallets.dm"
	#include "../torch/items/weapons.dm"

	// --- JOB SECTION --- //
	#include "../torch/job/torch_access.dm"

	#include "../torch/outfits/scgec.dm"
	#include "../torch/robot/module_flying_surveyor.dm"


	// --- MACHINERY --- //
	#include "../torch/machinery/apc_shuttle.dm"
	#include "../torch/machinery/keycard authentication.dm"
	#include "../torch/machinery/suit_storage.dm"

	// --- STRUCTURES --- //
	#include "../torch/structures/closets.dm"
	#include "../torch/structures/closets/closet_appearances.dm"
	#include "../torch/structures/closets/command.dm"
	#include "../torch/structures/closets/engineering.dm"
	#include "../torch/structures/closets/medical.dm"
	#include "../torch/structures/closets/misc.dm"
	#include "../torch/structures/closets/research.dm"
//	#include "../torch/structures/closets/security.dm"
	#include "../torch/structures/closets/services.dm"
	#include "../torch/structures/closets/supply.dm"
	#include "../torch/structures/closets/exploration.dm"
	#include "../torch/structures/memorabilia.dm"
	#include "../torch/structures/posters.dm"
	#include "../torch/structures/signs.dm"

	// --- MAP FILES --- //

		// ~AWAY SITES~ //
	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/magshield/magshield.dm"
	// #include "../away/casino/casino.dm"
	#include "../away/yacht/yacht.dm"
	// #include "../away/blueriver/blueriver.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lar_maria/lar_maria.dm"
	#include "../away/voxship/voxship.dm"
	#include "../away/skrellscoutship/skrellscoutship.dm"
	#include "../away/meatstation/meatstation.dm"
	#include "../away/miningstation/miningstation.dm"
	#include "../away/mininghome/mininghome.dm"
	#include "../away/scavver/scavver_gantry.dm"
	#include "../away/sfv_warspite/code/core.dm"
	#include "../away/abandoned_hotel/abandoned_hotel.dm"

		// ~EVENT SHIPS~ //
	#include "../event/iccgn_ship/icgnv_hound.dm"
	#include "../event/sfv_arbiter/sfv_arbiter.dm"
	#include "../event/placeholders/placeholders.dm"
	#include "../event/empty/empty.dm"

	// USED MODS
	// Keep them in ascending alphabetical order, please

	#include "../../mods/antagonists/_antagonists.dme"
	// #include "../../mods/atmos_ret_field/_atm_ret_field.dme"
	// #include "../../mods/bluespace_kitty/_bluespace_kitty.dme"
	#include "../../mods/fancy_sofas/_fancy_sofas.dme"
	#include "../../mods/guns/_guns.dme"
	#include "../../mods/jukebox_tapes/_jukebox_tapes.dme"
	#include "../../mods/legalese_language/_legalese.dme"
	#include "../../mods/music_player/_music_player.dme"
	#include "../../mods/petting_zoo/_petting_zoo.dme"
	#include "../../mods/pixelshift/_pixelshift.dme"
	#include "../../mods/screentips/_screentips.dme"
	#include "../../mods/tajara/_tajara.dme"
	#include "../../mods/sauna_props/_sauna_props.dme"
	#include "../../mods/wyccbay_optimization/_wyccbay_optimization.dme"

		// ~NON-UPSTREAM MODS~ //

	#include "../../mods/_fd/fd_assets/_fd_assets.dme"
	#include "../../mods/_fd/fd_customs/_fd_customs.dme"
	#include "../../mods/_fd/fd_guns/_fd_guns.dme"
	#include "../../mods/_fd/fd_lore/_fd_lore.dme"
	#include "../../mods/_fd/fd_species/_fd_species.dme"
	#include "../../mods/_fd/old_space_cannons/_old_space_cannons.dme"
	#include "../../mods/_fd/runechat/_runechat.dme"

	#include "../../mods/_fd/fd_events/_fd_events.dme"
	#include "../../mods/_fd/fd_utilities/_fd_utilities.dme"

	#include "../../mods/_fd/accent_labels/_accent_labels.dme"
	#include "../../mods/_fd/additional_biomods/_additional_biomods.dme"
	#include "../../mods/_fd/ai_overmap_objects/_ai_overmap_objects.dme"
	#include "../../mods/_fd/ascent/_ascent.dme"
	#include "../../mods/_fd/backgrounds/_fd_backgrounds.dme"
	#include "../../mods/_fd/bruno_items/_bruno_items.dme"
	#include "../../mods/_fd/chem_furniture/_furniture.dme"
	#include "../../mods/_fd/combat_stances/_combat_stances.dme"
	#include "../../mods/_fd/complementary_xeno_ablities/_complementary_xeno_ablities.dme"
	#include "../../mods/_fd/conference_holopads/_conference_holopads.dme"
	#include "../../mods/_fd/cyberware_mayhem/_cyberware_mayhem.dme"
	#include "../../mods/_fd/expanded_traders/_expanded_traders.dme"
	#include "../../mods/_fd/export_to_dmi/_export_to_dmi.dme"
	#include "../../mods/_fd/hestia_missiles/_hestia_missiles.dme"
	#include "../../mods/_fd/immersive_overmap/_immersive_overmap.dme"
	#include "../../mods/_fd/immersive_sounds/_immersive_sounds.dme"
	#include "../../mods/_fd/junk_heaven/_junk_heaven.dme"
	#include "../../mods/_fd/landing_eye/_landing_eye.dme"
	#include "../../mods/_fd/marines_explosion/_marines_explosion.dme"
	#include "../../mods/_fd/mob_interactions/_mob_interactions.dme"
	#include "../../mods/_fd/multitile_vehicles/_multitile_vehicles.dme"
	#include "../../mods/_fd/polaris_portals/_polaris_portals.dme"
	#include "../../mods/_fd/random_rooms/_random_rooms.dme"
	#include "../../mods/_fd/resomi_fd/_resomi.dme"
	#include "../../mods/_fd/roll_dice/_roll_dice.dme"
	#include "../../mods/_fd/skrell_resprite/_skrell_resprite.dme"
	#include "../../mods/_fd/small_holopad/_small_holopad.dme"
	#include "../../mods/_fd/structure_storage/_structure_storage.dme"
	#include "../../mods/_fd/tajaran_stuff/_tajaran_stuff.dme"
	#include "../../mods/_fd/tartakans/_tartakans.dme"
	#include "../../mods/_fd/v_posters/_v_posters.dme"

	#include "../../mods/_fd/_maps/a_destroyer/_a_destroyer.dme"
	#include "../../mods/_fd/_maps/airfield/_airfield.dme"
	#include "../../mods/_fd/_maps/ares/_ares.dme"
	#include "../../mods/_fd/_maps/biodome/_biodome.dme"
	#include "../../mods/_fd/_maps/capsule/_capsule.dme"
	#include "../../mods/_fd/_maps/casino/_casino.dme"
	#include "../../mods/_fd/_maps/cascade/_cascade.dme"
	#include "../../mods/_fd/_maps/constructed_station/_constructed_station.dme"
	#include "../../mods/_fd/_maps/dead_sea/_dead_sea.dme"
	#include "../../mods/_fd/_maps/drone_carrier/_drone_carrier.dme"
	#include "../../mods/_fd/_maps/facility/_facility.dme"
	#include "../../mods/_fd/_maps/farfleet_fd/_map_farfleet.dme"
	#include "../../mods/_fd/_maps/fluffy_biscuit/_fluffy_biscuit.dme"
	#include "../../mods/_fd/_maps/gccv_ulyanovsk/_ulyanovsk.dme"
	#include "../../mods/_fd/_maps/khizriel/_khizriel.dme"
//	#include "../../mods/_fd/_maps/kitsune/_kitsune.dme" // Имеет звания которых нету у меня
	#include "../../mods/_fd/_maps/lighthouse/_lighthouse.dme"
	#include "../../mods/_fd/_maps/new_blueriver/_new_blueriver.dme"
//	#include "../../mods/_fd/_maps/new_year_house/_new_year_house.dme" // We don't need it for now
	#include "../../mods/_fd/_maps/prison_ship/_prison_ship.dme"
	#include "../../mods/_fd/_maps/providence/_providence.dme"
//	#include "../../mods/_fd/_maps/sentinel_fd/_sentinel.dme" // Имеет звания которых нету у меня
	#include "../../mods/_fd/_maps/sfv_dropship/_delman.dme"
//	#include "../../mods/_fd/_maps/sfv_manticore/_manticore.dme" // Имеет звания которых нету у меня
	#include "../../mods/_fd/_maps/small_exoplanet_1/_small_exoplanet_1.dme"
	#include "../../mods/_fd/_maps/smugglers_ship/_smugglers_ship.dme"
	#include "../../mods/_fd/_maps/snow_cage/_snow_cage.dme"
	#include "../../mods/_fd/_maps/tartakan/_tartakan.dme"
//	#include "../../mods/_fd/_maps/trader_ship/_trader_ship.dme" // Имеет звания которых нету у меня
//	#include "../../mods/_fd/_maps/yacht/_yacht.dme" // Имеет звания которых нету у меня

	#include "../../mods/_fd/_maps/torch_as_ruin/_torch_as_ruin.dme"
	#include "../../mods/_fd/_maps/iccgn_samosbor/_samosbor.dme"

	// --- CUTSCENES --- //
	#include "../torch_doh/cutscenes/cutscene_api_danilcus.dm"
	#include "../torch_doh/cutscenes/animations.dm"
	#include "../torch_doh/cutscenes/framework.dm"

	#define using_map_DATUM /datum/map/gaia

#elif !defined(MAP_OVERRIDE)

	#warn A Gaia map has already been included

#endif
