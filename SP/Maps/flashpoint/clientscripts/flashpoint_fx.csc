//
// file: flashpoint_fx.gsc
// description: clientside fx script for flashpoint: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 


// load fx used by util scripts
precache_util_fx()
{
}

// Scripted effects
precache_scripted_fx()
{
}


// Ambient effects
precache_createfx_fx()
{
	level._effect["fx_tunnel_end_steam"]							= loadfx("maps/flashpoint/fx_tunnel_end_steam");
	level._effect["fx_gantry_coolant_xlg"]						= loadfx("maps/flashpoint/fx_gantry_coolant_xlg");
	level._effect["fx_coolant_pool_cloud"]						= loadfx("maps/flashpoint/fx_coolant_pool_cloud");
	level._effect["fx_gantry_light"]									= loadfx("maps/flashpoint/fx_gantry_light");
	// level._effect["fx_clouds_rocket_cover"]						= loadfx("maps/flashpoint/fx_clouds_rocket_cover");
	
	level._effect["fx_sand_windy_heavy_md_drop"]			= loadfx("env/weather/fx_sand_windy_heavy_md_drop");
	level._effect["fx_distortion_heat_pipe_lg"]				= loadfx("env/distortion/fx_distortion_heat_pipe_lg");
	
	// Exploders
	// All full-speed ambient effects in diorama areas:																																 50
	level._effect["fx_heli_hover_os"]									= loadfx("maps/flashpoint/fx_heli_hover_os");									// 101, 210
	level._effect["fx_metal_dust_loosen_os"]					= loadfx("maps/flashpoint/fx_metal_dust_loosen_os");					// 101, 103
	level._effect["fx_pigeon_panic_flight_med"]				= loadfx("bio/animals/fx_crows_panic_flight_med_left");				// 102
	//level._effect["fx_sand_impact_sm"]								= loadfx("env/dirt/fx_sand_impact_sm");												// 105
	level._effect["fx_rocket_launch_base"]						= loadfx("maps/flashpoint/fx_rocket_launch_dist_smoke");			// 110
	level._effect["fx_rocket_launch_dist_shockwave"]	= loadfx("maps/flashpoint/fx_rocket_launch_dist_shockwave");	// 110
	level._effect["fx_clouds_rocket_cover_lit"]				= loadfx("maps/flashpoint/fx_clouds_rocket_cover_lit");				// 112
	level._effect["fx_gantry_light_flashing"]					= loadfx("maps/flashpoint/fx_gantry_light_flashing");					// 120
	level._effect["fx_tower_light_glow"]							= loadfx("maps/flashpoint/fx_tower_light_glow");							// 121
	// camera on Weaver is at (-3726 -2325 328) : 121 1, FOV is 2(?)
	level._effect["fx_distance_shimmer"]							= loadfx("maps/flashpoint/fx_helipad_shimmer");
	
	level._effect["fx_rocket_booster_condensation"]		= loadfx("maps/flashpoint/fx_rocket_booster_condensation");		// 201
	level._effect["fx_space_rocket_coolant"]					= loadfX("maps/flashpoint/fx_space_rocket_coolant");					// 201
	level._effect["fx_coolant_blastpad_cloud"]				= loadfx("maps/flashpoint/fx_coolant_blastpad_cloud");				// 201
	level._effect["fx_coolant_blastpad_cloud_spill"]	= loadfx("maps/flashpoint/fx_coolant_blastpad_cloud_spill");	// 201
	level._effect["fx_falling_debris_area_sm_ice"]		= loadfx("maps/flashpoint/fx_falling_debris_area_sm_ice");		// 201
	
	level._effect["fx_jet_dust_wake_2"]								= loadfx("maps/flashpoint/fx_jet_dust_wake_2");								// 320
	
	level._effect["fx_door_breach_kick"]							= loadfx("maps/flashpoint/fx_door_breach_kick");							// 501
	
	level._effect["fx_zipline_window_crash"]					= loadfx("maps/flashpoint/fx_zipline_window_crash");					// 601
	level._effect["fx_debris_papers_windy_os"]				= loadfx("env/debris/fx_debris_papers_windy_os");							// 601
	// sniper dust tell: 610-624
	level._effect["fx_exp_vehicle_gen"]								= loadfx("explosions/fx_exp_vehicle_gen");										// 701
	
	level._effect["fx_exp_control_room_wall"]					= loadfx("maps/flashpoint/fx_exp_control_room_wall");					// 800
	level._effect["fx_rocket_launch_trench_smoke"]		= loadfx("maps/flashpoint/fx_rocket_launch_trench_smoke");		// 801
	level._effect["fx_rocket_launch_dust"]						= loadfx("maps/flashpoint/fx_rocket_launch_dust");						// 801
	level._effect["fx_tower_light_exp"]								= loadfx("maps/flashpoint/fx_tower_light_exp");								// 804
	level._effect["fx_impact_dust_antenna_lg"]				= loadfx("maps/flashpoint/fx_impact_dust_antenna_lg");				// 805
	level._effect["fx_rocket_ground_exp_lg"]					= loadfx("maps/flashpoint/fx_rocket_booster_impact_exp");			// 808
	level._effect["fx_falling_debris_area_sm_dirt"]		= loadfx("maps/flashpoint/fx_falling_debris_area_sm_dirt");		// 808
	level._effect["fx_rocket_ground_exp_sm"]					= loadfx("maps/flashpoint/fx_rocket_top_impact_exp");					// 810
	level._effect["fx_rocket_debris_impact_dirt"]			= loadfx("maps/flashpoint/fx_rocket_debris_impact_dirt");			// 820
	level._effect["fx_rocket_debris_impact_fence"]		= loadfx("maps/flashpoint/fx_rocket_debris_impact_fence");		// 825
	level._effect["fx_rocket_debris_impact_wall"]			= loadfx("maps/flashpoint/fx_rocket_debris_impact_wall");			// 830
		// rocket_debris_fire_start																																										// 835
	level._effect["fx_falling_debris_single_lg"]			= loadfx("maps/flashpoint/fx_falling_debris_single_lg");	// 840-846
		// debris blocks path to rocket									// 840
		// debris hits entrance to launch pad						// 841
		// debris hits launch pad top										// 842
		// debris hits blast pad												// 843
		// debris hits near rocket_debris_fire_start		// 844
		// debris hits far side of flame trench					// 845
		// debris hits above bunker entrance to event 9	// 846
	// Elevator impact and smoke poof:																																								 910
	
	// Scene 1: somewhere around -11380 306 -94 221 7
	level._effect["fx_diorama_glass_shatter"]					= loadfx("maps/flashpoint/fx_diorama_glass_shatter");					// 1310
	level._effect["fx_diorama_tracer_group"]					= loadfx("maps/flashpoint/fx_diorama_tracer_group");
	level._effect["fx_diorama_tracer"]								= loadfx("maps/flashpoint/fx_diorama_tracer");
	level._effect["fx_diorama_blood_impact"]					= loadfx("maps/flashpoint/fx_diorama_blood_impact");
	// Scene 2: -4222 -2128 390 341 24
	level._effect["fx_diorama_windshield_impact"]			= loadfx("maps/flashpoint/fx_diorama_windshield_impact");			// 1320
	// Scene 3: Slide 3 -2860 -498 326.3
	level._effect["fx_diorama_veh_dust_cloud"]				= loadfx("maps/flashpoint/fx_diorama_veh_dust_cloud");				// 1330
	level._effect["fx_diorama_impact_dirt"]						= loadfx("maps/flashpoint/fx_diorama_impact_dirt");
	level._effect["fx_diorama_jet_trail"]							= loadfx("maps/flashpoint/fx_diorama_jet_trail");
	// Scene 4: 634.5 -4335 431
	level._effect["fx_diorama_launchpad_smk"]					= loadfx("maps/flashpoint/fx_diorama_launchpad_smk");					// 1340
	level._effect["fx_diorama_car_fire"]							= loadfx("maps/flashpoint/fx_diorama_car_fire");
	// Scene 5: 231 -6108.5 1594
	level._effect["fx_diorama_heli_dust"]							= loadfx("maps/flashpoint/fx_diorama_heli_dust");							// 1350
	
	level._effect["fx_sand_cloud_dist"]								= loadfx("maps/flashpoint/fx_sand_cloud_dist");
	level._effect["fx_sand_windy_fast_sm"]						= loadfx("env/weather/fx_sand_windy_fast_sm");
	level._effect["fx_sand_windy_fast_door_os"]				= loadfx("env/weather/fx_sand_windy_fast_door_os");
	level._effect["fx_sand_windy_heavy_sm"]						= loadfx("env/weather/fx_sand_windy_heavy_sm");
	level._effect["fx_sand_windy_heavy_md"]						= loadfx("env/weather/fx_sand_windy_heavy_md");
	// level._effect["fx_sand_windy_heavy"]							= loadfx("env/weather/fx_sand_windy_heavy");
	level._effect["fx_sand_shifting_distant"]					= loadfx("env/weather/fx_sand_shifting_distant");
	level._effect["fx_distortion_fumes_md"]						= loadfx("env/distortion/fx_distortion_fumes_md");
	level._effect["fx_smk_plume_md_wht_wispy"]				= loadfx("env/smoke/fx_smk_plume_md_wht_wispy");
	level._effect["fx_pipe_steam_md"]									= loadfx("env/smoke/fx_pipe_steam_md");
	level._effect["fx_water_spray_leak_md"]						= loadfx("env/water/fx_water_spray_leak_md");
	level._effect["fx_water_spray_leak_sm"]						= loadfx("env/water/fx_water_spray_leak_sm");
	level._effect["fx_sand_windy_lit"]								= loadfx("env/weather/fx_sand_windy_lit");
	level._effect["fx_steam_hallway_md"]							= loadfx("env/smoke/fx_steam_hallway_md");
	// level._effect["fx_pipe_steam_md_runner"]					= loadfx("env/smoke/fx_pipe_steam_md_runner");
	level._effect["fx_quinn_steam_blast_lg"]					= loadfx("maps/underwaterbase/fx_uwb_steam_blast_lg");
	level._effect["fx_elec_burst_heavy_os_int"]				= loadfx("env/electrical/fx_elec_burst_heavy_os_int");
	// level._effect["fx_elec_burst_shower_sm_os_int"]		= loadfx("env/electrical/fx_elec_burst_shower_sm_os_int");
	
	// level._effect["fx_fire_sm_fuel"]									= loadfx("env/fire/fx_fire_sm_fuel");
	level._effect["fx_fire_line_sm"]									= loadfx("env/fire/fx_fire_line_sm");
	level._effect["fx_fire_line_md"]									= loadfx("env/fire/fx_fire_line_md");
	level._effect["fx_fire_line_lg_dist"]							= loadfx("env/fire/fx_fire_line_lg_dist");
	level._effect["fx_fire_sm_smolder"]								= loadfx("env/fire/fx_fire_sm_smolder");
	// level._effect["fx_fire_md_smolder"]								= loadfx("env/fire/fx_fire_md_smolder");
	level._effect["fx_smk_plume_md_wht_wispy"]				= loadfx("env/smoke/fx_smk_plume_md_wht_wispy");
	level._effect["fx_smk_plume_xlg_wht"]							= loadfx("env/smoke/fx_smk_plume_xlg_wht");
	level._effect["fx_smk_plume_xlg_blk"]							= loadfx("env/smoke/fx_smk_plume_xlg_blk");
	
	level._effect["fx_smolder_mortar_crater"]					= loadfx("env/fire/fx_smolder_mortar_crater");
	// level._effect["fx_smk_fire_md_gray"]							= loadfx("env/smoke/fx_smk_fire_md_gray");
	level._effect["fx_smk_fire_md_black"]							= loadfx("env/smoke/fx_smk_fire_md_black");
	
	// level._effect["fx_light_floodlight_dim"]					= loadfx("env/light/fx_light_floodlight_dim");
	level._effect["fx_light_floodlight_bright"]				= loadfx("env/light/fx_light_floodlight_bright");
	level._effect["fx_light_overhead"]								= loadfx("env/light/fx_light_overhead");
	level._effect["fx_fluorescent_flare"]							= loadfx("env/light/fx_fluorescent_flare");
	level._effect["fx_ray_sm_1sd"]										= loadfx("env/light/fx_ray_sm_1sd");
	// level._effect["fx_ray_md_1sd"]										= loadfx("env/light/fx_ray_md_1sd");
	level._effect["fx_ray_spread_sm_1sd"]							= loadfx("env/light/fx_ray_spread_sm_1sd");
	level._effect["fx_ray_spread_md_1sd"]							= loadfx("env/light/fx_ray_spread_md_1sd");
	level._effect["fx_light_godray_overcast_sm"]			= loadfx("env/light/fx_light_godray_overcast_sm");
	level._effect["fx_light_dust_motes_xsm_short"]		= loadfx("env/light/fx_light_dust_motes_xsm_short");
	level._effect["fx_light_dust_motes_xsm"]					= loadfx("env/light/fx_light_dust_motes_xsm");
	level._effect["fx_light_dust_motes_sm"]						= loadfx("env/light/fx_light_dust_motes_sm");
	level._effect["fx_light_dust_motes_xsm_wide"]			= loadfx("env/light/fx_light_dust_motes_xsm_wide");
	level._effect["fx_smk_linger_lit"]								= loadfx("env/smoke/fx_smk_linger_lit");
	level._effect["fx_smk_linger_lit_fast"]						= loadfx("env/smoke/fx_smk_linger_lit_fast");

	level._effect["test_pulse_fx"] = LoadFX( "env/light/fx_light_gen_pulse_red" );
	level._effect["test_spin_fx"] = LoadFX( "env/light/fx_light_warning");
}

footsteps()
{
	clientscripts\_utility::setFootstepEffect( "asphalt",		LoadFx( "bio/player/fx_footstep_sand" ) );
	clientscripts\_utility::setFootstepEffect( "brick",			LoadFx( "bio/player/fx_footstep_sand" ) );
	clientscripts\_utility::setFootstepEffect( "concrete",	LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "dirt",			LoadFx( "bio/player/fx_footstep_sand_loose" ) );
	clientscripts\_utility::setFootstepEffect( "foliage",		LoadFx( "bio/player/fx_footstep_sand_loose" ) );
	clientscripts\_utility::setFootstepEffect( "gravel",		LoadFx( "bio/player/fx_footstep_sand" ) );
	clientscripts\_utility::setFootstepEffect( "grass",			LoadFx( "bio/player/fx_footstep_sand_loose" ) );
	clientscripts\_utility::setFootstepEffect( "metal",			LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "mud",				LoadFx( "bio/player/fx_footstep_sand_loose" ) );
	clientscripts\_utility::setFootstepEffect( "rock",			LoadFx( "bio/player/fx_footstep_sand" ) );
	clientscripts\_utility::setFootstepEffect( "sand",			LoadFx( "bio/player/fx_footstep_sand_loose" ) );
	//clientscripts\_utility::setFootstepEffect( "water",		LoadFx( "bio/player/fx_footstep_water" ) );
	clientscripts\_utility::setFootstepEffect( "wood",			LoadFx( "bio/player/fx_footstep_dust" ) );
}

main()
{	
	precache_util_fx();
	precache_createfx_fx();
	
	footsteps();
	clientscripts\createfx\flashpoint_fx::main();
	clientscripts\_fx::reportNumEffects();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}
