//
// file: underwaterbase_fx.gsc
// description: clientside fx script for underwaterbase: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 


// load fx used by util scripts
precache_util_fx()
{	

}

precache_scripted_fx()
{
	//f4 phantom fx
	level._effect["jet_exhaust"]	            			= LoadFX( "vehicle/exhaust/fx_exhaust_jet_afterburner" );
	level._effect["jet_contrail"]             			= LoadFX( "trail/fx_geotrail_jet_contrail" );
}


// Ambient effects
precache_createfx_fx()
{
	// effects to eventually replace
	// level._effect["water_bubble_column"]							= LoadFX("env/water/fx_water_bubble_column");
	level._effect["fx_bubble_vent_large"]								= LoadFX("maps/underwaterbase/fx_uwb_bubble_vent_lg");
	level._effect["fx_light_glow_spot_uwater"]						= LoadFX("maps/sandbox_modules/module_4/fx_light_glow_spot_uwater");
	level._effect["fx_sea_particles_large"]							= LoadFX("maps/sandbox_modules/module_4/fx_sea_particles_large");

// Shared effects
	level._effect["fx_pipe_steam_md"]									= loadfx("env/smoke/fx_pipe_steam_md");
	level._effect["fx_pipe_steam_md_runner"]					= loadfx("env/smoke/fx_pipe_steam_md_runner");
	level._effect["fx_quinn_steam_blast_lg"]					= loadfx("maps/underwaterbase/fx_uwb_steam_blast_lg");
	level._effect["fx_steam_hallway_md"]							= loadfx("env/smoke/fx_steam_hallway_md");
	level._effect["fx_light_overhead"] 								= loadfx("env/light/fx_light_overhead_high");
	level._effect["fx_light_incandescent"]						= loadfx("maps/underwaterbase/fx_uwb_light_incandescent");
	level._effect["fx_light_glow_flourescent"]				= loadfx("maps/underwaterbase/fx_uwb_light_glow_flourescent");
	level._effect["fx_smk_linger_lit"]								= loadfx("env/smoke/fx_smk_linger_lit");

// Underwater effects
	level._effect["fx_elec_breaker_sparks_lg"]				= loadfx("maps/underwaterbase/fx_uwb_elec_breaker_sparks_lg");
	level._effect["fx_water_splash_detail_lg"]				= loadfx("maps/underwaterbase/fx_uwb_water_splash_detail_lg");
	// level._effect["fx_uwb_water_spill_sm_splash"]		= loadfx("maps/underwaterbase/fx_uwb_water_spill_sm_splash");
	// level._effect["fx_water_drips_line_100"]					= loadfx("maps/underwaterbase/fx_uwb_water_drips_line_100");
	level._effect["fx_water_drips_line_hvy_100"]			= loadfx("maps/underwaterbase/fx_uwb_water_drips_line_hvy_100");
	level._effect["fx_water_spill_sm"]								= loadfx("maps/underwaterbase/fx_uwb_water_spill_sm");
	level._effect["fx_water_sheet_line_md_100"]				= loadfx("maps/underwaterbase/fx_uwb_water_sheet_line_md_100");
	level._effect["fx_water_sheet_line_md_300"]				= loadfx("maps/underwaterbase/fx_uwb_water_sheet_line_md_300");
	level._effect["fx_water_sheeting_300"]						= loadfx("maps/underwaterbase/fx_uwb_water_sheeting_300");
	level._effect["fx_water_sheeting_100x300"]				= loadfx("maps/underwaterbase/fx_uwb_water_sheeting_100x300");
	level._effect["fx_water_fine_spray_sm"]						= loadfx("maps/underwaterbase/fx_uwb_water_fine_spray_sm");
	level._effect["fx_water_fine_spray_md"]						= loadfx("maps/underwaterbase/fx_uwb_water_fine_spray_md");
	// level._effect["fx_water_pipe_gush_lg"]						= loadfx("maps/underwaterbase/fx_uwb_water_pipe_gush_lg");
	// level._effect["fx_water_splash_gush_lg"]					= loadfx("maps/underwaterbase/fx_uwb_water_splash_gush_lg");
	level._effect["fx_water_spray_leak_sm"]						= loadfx("maps/underwaterbase/fx_uwb_water_spray_leak_sm");
	level._effect["fx_water_spray_leak_md"]						= loadfx("maps/underwaterbase/fx_uwb_water_spray_leak_md");
	// level._effect["fx_water_spray_leak_lg"]						= loadfx("maps/underwaterbase/fx_uwb_water_spray_leak_lg");
	level._effect["fx_water_pipe_spill_sm"]						= loadfx("maps/underwaterbase/fx_uwb_water_pipe_spill_sm");
	// level._effect["fx_water_pipe_spill_md"]						= loadfx("maps/underwaterbase/fx_uwb_water_pipe_spill_md");
	// level._effect["fx_water_pipe_spill_xlg"]					= loadfx("maps/underwaterbase/fx_uwb_water_pipe_spill_xlg");
	level._effect["fx_sea_caustics_lg"]								= loadfx("maps/underwaterbase/fx_uwb_sea_caustics_field");
	level._effect["fx_sea_caustics_xsm"]							= loadfx("maps/underwaterbase/fx_uwb_sea_caustics_field_xsm");
	// level._effect["fx_steam_bounce_1"]								= loadfx("maps/underwaterbase/fx_uwb_steam_bounce_1");
	level._effect["fx_light_glow_flood_sm"]						= loadfx("maps/underwaterbase/fx_uwb_light_glow_flood_sm");
	level._effect["fx_light_glow_flood_lg"]						= loadfx("maps/underwaterbase/fx_uwb_light_blue_flood_lg");
	level._effect["fx_quinn_light_blue_sm"]						= loadfx("maps/underwaterbase/fx_uwb_light_blue_flood_sm");
	level._effect["fx_quinn_light_red_sm"]						= loadfx("maps/underwaterbase/fx_uwb_light_red_sm");
	level._effect["fx_quinn_smoke_sm"]								= loadfx("maps/underwaterbase/fx_uwb_smoke_sm");
	// level._effect["fx_quinn_steam_exhaust_lg"]				= loadfx("maps/underwaterbase/fx_uwb_steam_exhaust_lg");
	// level._effect["fx_quinn_steam_exhaust_sm"]				= loadfx("maps/underwaterbase/fx_uwb_steam_exhaust_sm");
	level._effect["fx_umbilical_light_red"]					  	= loadfX("maps/underwaterbase/fx_umbilical_light_red_3_grp2");
	// level._effect["fx_buoy_light_red"]								= loadfx("maps/underwaterbase/fx_umbilical_light_red_3");
	level._effect["fx_flood_room_water_gush"]						= loadfx("maps/underwaterbase/fx_uwb_water_gush_door");
	level._effect["fx_uwb_explosion_console"]						= loadfx("maps/underwaterbase/fx_uwb_explosion_console");	
	level._effect["fx_uwb_water_plume_splash"]					= loadfx("maps/underwaterbase/fx_uwb_water_plume_splash");
	level._effect["fx_uwb_water_plume_splash_sm"]				= loadfx("maps/underwaterbase/fx_uwb_water_plume_splash_sm");	
	level._effect["fx_uwb_water_plume_splash_xsm"]			= loadfx("maps/underwaterbase/fx_uwb_water_plume_splash_xsm");			
	level._effect["fx_uwb_water_explosion"]					    = loadfx("maps/underwaterbase/fx_explosion_underwater_1_xlg");
	level._effect["fx_quinn_steam_blast_lg_rise"]			  = loadfx("maps/underwaterbase/fx_uwb_steam_blast_lg_rise");						
	
			

// Abovewater effects
	
	// Exploders
		// Smokestack smoke:	100
		// First Huey strafe damge, fore:	101
		// First Huey strafe damage, everything else:	102
		// Player Huey crash: 103
		// Damage effects during deck engagement:	104
		// Bullethole godrays:	105
		level._effect["fx_ship_bulletholes"]							= loadfx("maps/underwaterbase/fx_ship_bulletholes");
		// Smokestack explosion:	106
		level._effect["fx_ship_dest_smokestack"]					= loadfx("maps/underwaterbase/fx_ship_dest_smokestack");
		// Radar array explosion:	71001
		level._effect["fx_ship_dest_fore_radar"]					= loadfx("maps/underwaterbase/fx_ship_dest_fore_radar");
		// Ship interior ambient effects:	110
		
		level._effect["fx_ship_exp_hull_hole"]						= loadfx("maps/underwaterbase/fx_ship_exp_hull_hole");
		level._effect["fx_ship_exp_hull_hole_long"]				= loadfx("maps/underwaterbase/fx_ship_exp_hull_hole_long");
		
		// Crane base sparks:	120
		level._effect["fx_ship_dest_crane_base"]					= loadfx("maps/underwaterbase/fx_ship_dest_crane_base");
		
		// Crane rail smash: 121, level_notify: crane_hits_deck
		level._effect["fx_ship_dest_crane_rail"]					= loadfx("maps/underwaterbase/fx_ship_dest_crane_rail");
		
		// Aft wire tower impact: 123, level_notify: aft_wire_tower_start, notetrack: tower_hits_deck
		
		// Aft radio tower snap: 124, level_notify: aft_radio_tower_start, notetrack: n/a
		
		// Aft radio tower top impact: 125, notetrack: tower_impact01
		level._effect["fx_ship_dest_aft_radio_tower_1"]		= loadfx("maps/underwaterbase/fx_ship_dest_aft_radio_tower_1");
		
		// Aft radio tower body impact: 126, notetrack: tower_impact02
		level._effect["fx_ship_dest_aft_radio_tower_2"]		= loadfx("maps/underwaterbase/fx_ship_dest_aft_radio_tower_2");
		
		// Center mast01 snaps: 127, level_notify: dbl_mast_start, notetrack: n/a
		level._effect["fx_ship_dest_mast_snap"]						= loadfx("maps/underwaterbase/fx_ship_dest_mast_snap");
		
		// Center masts platform impact: 128, notetrack: platform_hits_deck
		level._effect["fx_ship_dest_mast_platform"]				= loadfx("maps/underwaterbase/fx_ship_dest_mast_platform");
		
		// Center mast01 impact: 129, notetrack: mast01_hits_deck
		level._effect["fx_ship_dest_dbl_mast01"]					= loadfx("maps/underwaterbase/fx_ship_dest_dbl_mast01");
		
		// Center mast02 snaps: 130, notetrack: n/a
		// Center mast02 impact: 131, notetrack: mast02_hits_deck
		
		// Forward radio tower snap: 132, level_notify: fwd_radio_tower_start, notetrack: n/a
		// Forward radio tower impact: 133, notetrack: tower_impact01
		
		// Forward wire tower B snap: 134, level_notify: fwd_wire_tower_b_start, notetrack: n/a
		// Forward wire tower B impact: 135, notetrack: fwd_wire_tower_hits_roof
		
		// Forward crow's nest snap: 136, level_notify: crows_nest_start
		// Forward crow's nest impact: 137, notetrack: NEEDS ONE!
		
		// Umbilical room: umbilical frame lights: 220
		level._effect["fx_umbilical_frame_light"]				= loadfx("maps/underwaterbase/fx_umbilical_frame_light");
		level._effect["fx_light_floodlight_bright"]			= loadfx("env/light/fx_light_floodlight_bright");
		level._effect["fx_umbilical_water_churn"]				= loadfx("maps/underwaterbase/fx_umbilical_water_churn");
		level._effect["fx_steam_ceiling_lg"]						= loadfx("env/smoke/fx_steam_ceiling_lg");
		
	level._effect["fx_ship_pipe_gush_sm"]							= loadfx("maps/underwaterbase/fx_ship_pipe_gush_sm");
	level._effect["fx_ship_pipe_gush_splash"]					= loadfx("maps/underwaterbase/fx_ship_pipe_gush_splash");

	// Smoke
	level._effect["fx_smk_stack_dist"]								= loadfx("env/smoke/fx_smk_stack_dist");
	level._effect["fx_ship_fire_smoke_column_xlg"]		= loadfx("maps/underwaterbase/fx_ship_fire_smoke_column_xlg");
	level._effect["fx_smk_fire_xlg_black"]						= loadfx("maps/underwaterbase/fx_ship_smk_fire_xlg_black");
	level._effect["fx_smk_fire_lg_black"]							= loadfx("maps/underwaterbase/fx_ship_smk_fire_lg_black");
	level._effect["fx_smk_smolder_rubble_md"]					= loadfX("maps/underwaterbase/fx_ship_smk_smolder");
	level._effect["fx_smk_smolder_sm"]								= loadfx("env/smoke/fx_smk_smolder_sm");
	// level._effect["fx_fumes_vent_sm"]									= loadfx("env/smoke/fx_fumes_vent_sm");

	// Fires
	// level._effect["fx_embers_falling_md"]							= loadfx("env/fire/fx_embers_falling_md");
	level._effect["fx_ship_fire_destruction"]					= loadfx("maps/underwaterbase/fx_ship_fire_destruction");
	level._effect["fx_fire_md_smolder"]								= loadfx("env/fire/fx_fire_md_smolder");
	level._effect["fx_ship_fire_smolder_area"]				= loadfx("maps/underwaterbase/fx_ship_fire_smolder_area");
	level._effect["fx_ship_fire_leak"]								= loadfx("maps/underwaterbase/fx_ship_fire_leak");
	level._effect["fx_fire_line_xsm"]									= loadfx("maps/underwaterbase/fx_ship_fire_line_xsm");
	level._effect["fx_fire_line_sm"]									= loadfx("maps/underwaterbase/fx_ship_fire_line_sm");
	level._effect["fx_fire_line_md"]									= loadfx("maps/underwaterbase/fx_ship_fire_line_md");
	level._effect["fx_fire_line_lg"]									= loadfx("maps/underwaterbase/fx_ship_fire_line_lg");
}

//footsteps()
//{
//	clientscripts\_utility::setFootstepEffect( "snow", LoadFx( "bio/player/fx_footstep_snow" ) );
//}

main()
{
	clientscripts\createfx\underwaterbase_fx::main();
	clientscripts\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}
