//
// file: rebirth_fx.gsc
// description: clientside fx script for rebirth: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 


// load fx used by util scripts
precache_util_fx()
{
	
}

// scripted effects go here
precache_scripted_fx()
{
	
}

// ambient effects go here
precache_createfx_fx()
{
	
// Smoke
	level._effect["fx_smk_plume_xlg_blk"]						= loadfx("env/smoke/fx_smk_plume_xlg_blk");
	level._effect["fx_smk_plume_md_wht_wispy"]			= loadfx("env/smoke/fx_smk_plume_md_wht_wispy");
	level._effect["fx_smk_fire_md_gray_int"]				= loadfx("env/smoke/fx_smk_fire_md_gray_int");
	level._effect["fx_smk_fire_lg_white"]						= loadfx("env/smoke/fx_smk_fire_lg_white");
	level._effect["fx_smk_smolder_rubble_md"]				= loadfX("env/smoke/fx_smk_smolder_rubble_md");
	level._effect["fx_smk_smolder_sm_int"]					= loadfX("env/smoke/fx_smk_smolder_sm_int");
	level._effect["fx_smk_linger_lit"]							= loadfx("env/smoke/fx_smk_linger_lit");
	level._effect["fx_smk_hallway_med"]							= loadfx("env/smoke/fx_smk_hallway_med");
	level._effect["fx_smk_ceiling_crawl"]						= loadfx("env/smoke/fx_smk_ceiling_crawl");
	level._effect["fx_fog_water_lg"]								= loadfx("env/smoke/fx_fog_water_lg");
	level._effect["fx_fog_rolling_md"]							= loadfx("env/smoke/fx_fog_rolling_md");
	level._effect["fx_fog_dropdown_lg"]							= loadfx("env/smoke/fx_fog_dropdown_lg");
	level._effect["fx_steam_hallway_md"]						= loadfx("env/smoke/fx_steam_hallway_md");
	
// Fires
	level._effect["fx_ash_embers_heavy"]						= loadfx("env/fire/fx_ash_embers_heavy");
	level._effect["fx_embers_falling_md"]						= loadfx("env/fire/fx_embers_falling_md");
	level._effect["fx_fire_column_creep_xsm"]				= loadfx("env/fire/fx_fire_column_creep_xsm");
	level._effect["fx_fire_column_creep_sm"]				= loadfx("env/fire/fx_fire_column_creep_sm");
	level._effect["fx_fire_wall_md"]								= loadfx("env/fire/fx_fire_wall_md");
	level._effect["fx_fire_ceiling_md"]							= loadfx("env/fire/fx_fire_ceiling_md");
	level._effect["fx_fire_sm_smolder"]							= loadfx("env/fire/fx_fire_sm_smolder");
	level._effect["fx_fire_md_smolder"]							= loadfx("env/fire/fx_fire_md_smolder");
	level._effect["fx_fire_line_xsm"]								= loadfx("env/fire/fx_fire_line_xsm");
	level._effect["fx_fire_line_sm"]								= loadfx("env/fire/fx_fire_line_sm");
	level._effect["fx_fire_line_md"]								= loadfx("env/fire/fx_fire_line_md");
	
// Exploders
	//level._effect["fx_falling_guy_impact_blood"]		= loadfx("impacts/fx_flesh_hit_body_fatal_exit");	//120
	level._effect["fx_dust_impact_body"]						= loadfx("env/dirt/fx_dust_impact_body");	// 121
	level._effect["fx_nova6_gas_leak"]							= loadfx("maps/rebirth/fx_nova6_gas_leak");	// 230
	level._effect["fx_gas_fog_thick_sm_os"]					= loadfx("maps/rebirth/fx_gas_fog_thick_sm_os");	// 230
	level._effect["fx_hip_crash_rotor_car"]					= loadfx("maps/rebirth/fx_hip_crash_rotor_car");	// 321
	level._effect["fx_hip_crash_rotor_ground"]			= loadfx("maps/rebirth/fx_hip_crash_rotor_ground");	// 322
	level._effect["fx_hip_crash_exp"]								= loadfx("explosions/fx_exp_vehicle_gen_stage3");	// 323
	level._effect["fx_hip_crash_ground_impact"]			= loadfx("maps/rebirth/fx_hip_crash_ground_impact");	// 324
	level._effect["fx_exp_gen_window"]							= loadfx("explosions/fx_exp_gen_window");	// 370
	level._effect["fx_steiner_console_smack"]				= loadfx("env/electrical/fx_elec_panel_spark_md");	// 380
	
	// Gas: 400, 410, 420, 430, 440, 450
	level._effect["fx_gas_fog_thick"]								= loadfx("maps/rebirth/fx_gas_fog_thick");
	level._effect["fx_gas_fog_thick_sm"]						= loadfx("maps/rebirth/fx_gas_fog_thick_sm");
	level._effect["fx_gas_fog_thick_hall"]					= loadfx("maps/rebirth/fx_gas_fog_thick_hall");
	level._effect["fx_nova6_detail_md"]							= loadfx("maps/rebirth/fx_nova6_detail_md");
	level._effect["fx_nova6_detail_lg"]							= loadfx("maps/rebirth/fx_nova6_detail_lg");
	level._effect["fx_nova6_door_exit"]							= loadfx("maps/rebirth/fx_nova6_door_exit");
	level._effect["fx_nova6_window_exit"]						= loadfx("maps/rebirth/fx_nova6_window_exit");
	level._effect["fx_nova6_dropdown"]							= loadfx("maps/rebirth/fx_nova6_dropdown");
	level._effect["fx_nova6_gas_lit"]								= loadfx("maps/rebirth/fx_nova6_gas_lit");
	// Hip Fires: 470
	level._effect[ "fx_decontamination_spray" ] 		= loadfx("maps/rebirth/fx_decontamination_spray");	// 480
// Steiner window break
	level._effect["fx_steiner_window_hit"]					= loadfx("maps/rebirth/fx_steiner_window_hit");			// 501
	level._effect["fx_steiner_window_smash"]				= loadfx("maps/rebirth/fx_steiner_window_smash");		// 502
	level._effect["fx_blood_drip"]									= loadfx("bio/blood/fx_blood_drip");	// Scripted!
	// Ending sequence: 570
	level._effect["fx_exp_bomb_huge"]								= loadfx("explosions/fx_exp_bomb_huge");
	
// Lights
	level._effect["fx_light_overhead"]							= loadfx("env/light/fx_light_overhead_amber");
	level._effect["fx_light_overhead_int_amber"]		= loadfx("env/light/fx_light_overhead_int");
	level._effect["fx_light_overhead_sm_amber"]			= loadfx("env/light/fx_light_overhead_sm_amber");
	level._effect["fx_fog_lit_overhead_amber"]			= loadfx("env/smoke/fx_fog_lit_overhead_amber");
	level._effect["fx_light_floodlight_bright"]			= loadfx("env/light/fx_light_floodlight_bright");
	level._effect["fx_light_floodlight_bright_dist"]= loadfx("env/light/fx_light_floodlight_bright_dist");
	level._effect["fx_street_light_green"]					= loadfx("env/light/fx_street_light");
	//level._effect["fx_light_dust_motes_sm"]					= loadfx("env/light/fx_light_dust_motes_sm");
	level._effect["fx_light_dust_motes_xsm"]				= loadfx("env/light/fx_light_dust_motes_xsm");
	level._effect["fx_lab_light_quad"]							= loadfx("maps/rebirth/fx_lab_light_quad");
	level._effect["fx_light_tinhat_cage"]						= loadfx("env/light/fx_light_tinhat_cage");
	level._effect["fx_ray_spread_md_1sd"]						= loadfx("env/light/fx_ray_spread_md_1sd");
	level._effect["fx_light_map_glow"]							= loadfx("maps/flashpoint/fx_light_map_glow");
	level._effect["fx_light_fluorescent_tubes"]			= loadfx("env/light/fx_light_fluorescent_tubes");
	level._effect["fx_light_med_overhead"]					= loadfx("env/light/fx_light_med_overhead");
	
	level._effect["test_spin_fx"] = LoadFX( "env/light/fx_light_warning");

// Water
	level._effect["fx_water_pipe_gush_lg_dirty"]		= loadfx("env/water/fx_water_pipe_gush_lg_dirty");
	level._effect["fx_water_splash_lg_dirty"]				= loadfx("env/water/fx_water_splash_lg_dirty");
	level._effect["fx_pipe_steam_md"]								= loadfx("env/smoke/fx_pipe_steam_md");
	level._effect["fx_pipe_steam_md_runner"]				= loadfx("env/smoke/fx_pipe_steam_md_runner");
	
// Other
	level._effect["fx_seagulls_shore_distant"]			= loadfx("bio/animals/fx_seagulls_shore_distant");
	level._effect["fx_seagulls_near"]								= loadfx("bio/animals/fx_seagulls_near");
}


main()
{
	precache_util_fx();
	precache_createfx_fx();
	
	clientscripts\createfx\rebirth_fx::main();
	clientscripts\_fx::reportNumEffects();

	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

