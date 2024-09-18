//
// file: kowloon_fx.gsc
// description: clientside fx script for kowloon: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 


// load fx used by util scripts
precache_util_fx()
{	

}

precache_scripted_fx()
{
	level._effect["fx_rain_sys_heavy_windy_1"]				= loadfx("env/weather/fx_rain_sys_heavy_windy_1");
	level._effect["fx_rain_sys_heavy_windy_2"]				= loadfx("env/weather/fx_rain_sys_heavy_windy_2");
	level._effect["fx_rain_sys_heavy_windy_3"]				= loadfx("env/weather/fx_rain_sys_heavy_windy_3");
	level._effect["fx_gas_nova6_spray"]								= loadfx("maps/kowloon/fx_gas_nova6_canister_spray");
}

// Ambient effects
precache_createfx_fx()
{
	level._effect["fx_fog_low"]												= loadfx("env/smoke/fx_fog_low");
	level._effect["fx_fog_low_sm"]										= loadfx("env/smoke/fx_fog_low_sm");
	
//level._effect["fx_rain_downpour_looping_md"]			= loadfx("env/weather/fx_rain_downpour_looping_md");

  level._effect["fx_rain_splash_detail"]						= loadfx("env/weather/fx_rain_splash_detail");
	level._effect["fx_rain_mist"]											= loadfx("env/weather/fx_rain_mist");
	level._effect["fx_rain_mist_sm"]									= loadfx("env/weather/fx_rain_mist_sm");
	level._effect["fx_rain_heavy_looping"]						= loadfx("env/weather/fx_rain_heavy_looping");
	level._effect["fx_rain_light_looping"]						= loadfx("env/weather/fx_rain_light_looping");
	level._effect["fx_rain_xlight_oneshot"]						= loadfx("env/weather/fx_rain_xlight_oneshot");
	level._effect["fx_rain_xlight_looping"]						= loadfx("env/weather/fx_rain_xlight_looping");	


	level._effect["fx_water_drip_tree_xlight"]				= loadfx("env/water/fx_water_drip_tree_xlight");
	level._effect["fx_water_drip_xlight_line"]				= loadfx("env/water/fx_water_drip_xlight_line");
	level._effect["fx_water_drip_hvy_long"]						= loadfx("env/water/fx_water_drip_hvy_long");	

	level._effect["fx_fog_low_hall_500"]						= loadfx("env/smoke/fx_fog_low_hall_500");		
	level._effect["fx_fog_low_hall_1000"]						= loadfx("env/smoke/fx_fog_low_hall_1000");	
	
	level._effect["fx_fire_cooking"]								= loadfx("env/fire/fx_fire_cooking_kowloon");
	level._effect["fx_water_spill_sm"]							= loadfx("env/water/fx_water_spill_sm");
	level._effect["fx_water_spill_md"]							= loadfx("env/water/fx_water_roof_spill_md");
	level._effect["fx_water_spill_lg"]							= loadfx("env/water/fx_water_roof_spill_lg");
	level._effect["fx_water_spill_sm_int"]					= loadfx("env/water/fx_water_spill_sm_int");
	level._effect["fx_water_spill_sm_thin"]					= loadfx("env/water/fx_water_spill_sm_thin");
	level._effect["fx_water_spill_sm_splash"]				= loadfx("env/water/fx_water_spill_sm_splash");

	level._effect["fx_pipe_steam_md"]						    = loadfx("env/smoke/fx_pipe_steam_md");
	level._effect["fx_smk_chimney_wht_kow"]		      = loadfx("maps/kowloon/fx_smk_chimney_wht_kow");
	
	level._effect["fx_water_roof_spill_lg_hvy"]		    = loadfx("env/water/fx_water_roof_spill_lg_hvy");	
	level._effect["fx_water_roof_spill_md_hvy"]		    = loadfx("env/water/fx_water_roof_spill_md_hvy");	
	level._effect["fx_water_spill_md_spray"]		      = loadfx("env/water/fx_water_spill_md_spray");
	level._effect["fx_water_sheeting_md_hvy"]					= loadfx("env/water/fx_water_sheeting_md_hvy");
	level._effect["fx_water_sheeting_lg_hvy"]					= loadfx("env/water/fx_water_sheeting_lg_hvy");
	level._effect["fx_water_roof_spill_lg_hvy_grav"]	= loadfx("env/water/fx_water_roof_spill_lg_hvy_grav");	
	level._effect["fx_rain_splash_area_100_hvy_lp"]		= loadfx("env/weather/fx_rain_splash_area_100_hvy_lp");	
	level._effect["fx_rain_splash_area_200_hvy_lp"]		= loadfx("env/weather/fx_rain_splash_area_200_hvy_lp");	
	level._effect["fx_rain_splash_area_300_hvy_lp"]		= loadfx("env/weather/fx_rain_splash_area_300_hvy_lp");
	level._effect["fx_rain_splash_area_400_hvy_lp"]		= loadfx("env/weather/fx_rain_splash_area_400_hvy_lp");	
	level._effect["fx_rain_splash_area_500_hvy_lp"]		= loadfx("env/weather/fx_rain_splash_area_500_hvy_lp");
						
		// Lights and godrays - DustMotes
	level._effect["fx_light_kow_ray_md_wide"]				= loadfx("maps/kowloon/fx_light_kow_ray_md_wide");
	level._effect["fx_light_kow_ray_wide"]					= loadfx("maps/kowloon/fx_light_kow_ray_wide");
	level._effect["fx_light_kow_ray_sm"]						= loadfx("maps/kowloon/fx_light_kow_ray_sm");
	level._effect["fx_light_kow_ray_sm_thin"]				= loadfx("maps/kowloon/fx_light_kow_ray_sm_thin");
	level._effect["fx_light_kow_ray_street"]				= loadfx("maps/kowloon/fx_light_kow_ray_street");
	
	level._effect["fx_ray_lampost_white"]						= loadfx("env/light/fx_ray_lampost_white");
	level._effect["fx_light_incandescent"]					= loadfx("env/light/fx_light_incandescent");
	level._effect["fx_light_fluorescent"]				 		= loadfx("env/light/fx_light_fluorescent");
	level._effect["fx_light_fluorescent_tubes"]			= loadfx("env/light/fx_light_fluorescent_tubes");
	level._effect["fx_light_fluorescent_tubes_flkr"] = loadfx("env/light/fx_light_fluorescent_tubes_flkr");
	level._effect["fx_light_dust_motes_xsm"]				= loadfx("env/light/fx_light_dust_motes_xsm");
	level._effect["fx_light_dust_motes_xsm_short"]	= loadfx("env/light/fx_light_dust_motes_xsm_short");
	level._effect["fx_light_dust_motes_sm"]					= loadfx("env/light/fx_light_dust_motes_sm");
	level._effect["fx_light_dust_motes_md"]					= loadfx("env/light/fx_light_dust_motes_md");
	
	level._effect["fx_light_glow_spot_flare"] 			= loadfx("maps/kowloon/fx_light_glow_spot_flare");
	level._effect["fx_light_overhead"] 							= loadfx("env/light/fx_light_overhead");
	
	level._effect["fx_sign_glow1"] 							= loadfx("maps/kowloon/fx_light_sign1_glow");
	level._effect["fx_sign_glow2"] 							= loadfx("maps/kowloon/fx_light_sign2_glow");
	level._effect["fx_sign_glow3"] 							= loadfx("maps/kowloon/fx_light_sign3_glow");
	level._effect["fx_sign_glow4"] 							= loadfx("maps/kowloon/fx_light_sign4_glow");
	level._effect["fx_sign_glow5"] 							= loadfx("maps/kowloon/fx_light_sign5_glow");
	level._effect["fx_sign_glow6"] 							= loadfx("maps/kowloon/fx_light_sign6_glow");
	level._effect["fx_sign_glow7"] 							= loadfx("maps/kowloon/fx_light_sign7_glow");
	level._effect["fx_sign_glow8"] 							= loadfx("maps/kowloon/fx_light_sign8_glow");
	
	// Exploders Kowloon
	level._effect["fx_glass_elbow_smash"]			        = loadfx("maps/kowloon/fx_glass_elbow_smash"); // 1001
	level._effect["fx_kow_glass_glint"]		      		  = loadfx("maps/kowloon/fx_kow_glass_glint");	// 10051
	
	level._effect["fx_glass_impact_int_room"]		      = LoadFx("maps/kowloon/fx_glass_impact_int_room");	// 1101,clarkdeath8501
	level._effect["fx_large_metalhit"]		     				= LoadFx("impacts/fx_large_metalhit"); // 1101,clarkdeath8501
	level._effect["fx_small_concrete"]		     				= LoadFx("impacts/fx_small_concrete"); // 1101,clarkdeath8501	
	level._effect["fx_tracer_fake_concrete"]		     	= LoadFx("maps/kowloon/fx_tracer_fake_md_concrete"); // 1101,clarkdeath8501
	level._effect["fx_tracer_fake_metal"]		     			= LoadFx("maps/kowloon/fx_tracer_fake_md_metal"); // 1101,clarkdeath8501
	level._effect["fx_tracer_fake_glass"]		     			= LoadFx("maps/kowloon/fx_tracer_fake_sm_glass"); // 1101,clarkdeath8501
	
	level._effect["fx_breach_wall_start"]			        = loadfx("maps/kowloon/fx_breach_wall_start"); // 1201
	level._effect["fx_breach_door_wood"]			        = loadfx("maps/kowloon/fx_breach_door_wood"); // 1301-1302
  level._effect["fx_gas_nova6_room_filler"]			    = loadfx("maps/kowloon/fx_gas_nova6_room_filler"); // 2001
  level._effect["fx_ladder_ladder_light"]			      = loadfx("maps/kowloon/fx_light_kow_ray_md_wide"); // 2101
	level._effect["fx_awning_jump_collapse"]			    = loadfx("maps/kowloon/fx_awning_jump_collapse"); // 3101
	level._effect["fx_debris_mattress_impact"]			  = loadfx("maps/kowloon/fx_debris_mattress_impact"); // 3102
	level._effect["fx_debris_frig_push"]			        = loadfx("maps/kowloon/fx_debris_frig_push"); // 3103
	level._effect["fx_glass_rappel_window_smash"]			= loadfx("maps/kowloon/fx_glass_rappel_window_smash"); // 3501
	level._effect["fx_debris_sliding_slow_mo"]		  	= loadfx("maps/kowloon/fx_debris_sliding_slow_mo"); // 5001
	level._effect["fx_exp_heli_roof_explosion"]			  = loadfx("maps/kowloon/fx_exp_heli_roof_explosion"); // 5501
	level._effect["fx_elec_sign_sparks_huge"]			    = loadfx("maps/kowloon/fx_elec_sign_sparks_huge"); // 5551
	level._effect["fx_glass_impact_heli_building"]	  = loadfx("maps/kowloon/fx_glass_impact_heli_building"); // 5601
	level._effect["fx_exp_heli_ground_explosion"]	    = loadfx("maps/kowloon/fx_exp_heli_roof_explosion"); // 5701
	level._effect["fx_breach_door_metal"]			        = loadfx("maps/kowloon/fx_breach_door_metal"); // 6001
	level._effect["fx_breach_ceiling_collapse"]			  = loadfx("maps/kowloon/fx_breach_ceiling_collapse"); // 6101
	level._effect["fx_debris_flour_room_fill"]				= loadfx("maps/kowloon/fx_debris_flour_room_fill");
	level._effect["fx_debris_sliding_roof"]			    	= loadfx("maps/kowloon/fx_debris_sliding_roof"); // 8101
	level._effect["fx_elec_burst_shower_lg_os"]			  = loadfx("env/electrical/fx_elec_burst_shower_lg_os"); // 8201
	level._effect["fx_awning_slide_collapse"]			    = loadfx("maps/kowloon/fx_awning_slide_collapse"); // 9001
	level._effect["fx_van_garage_impact"]			      	= loadfx("maps/kowloon/fx_van_garage_impact"); // 9101
	level._effect["fx_lightning_flash_single_lg"]			= loadfx("env/weather/fx_lightning_flash_single_lg"); // 7001-7004
	level._effect["fx_light_tv_flicker"]		      		= loadfx("maps/kowloon/fx_light_tv_flicker");	// 10001-

	// PLACEHOLDERS
  level._effect["fx_dust_crumble_sm_runner"]			= LoadFX("env/dirt/fx_dust_crumble_sm_runner");
	level._effect["fx_dust_crumble_md_runner"]			= LoadFX("env/dirt/fx_dust_crumble_md_runner");
	level._effect["fx_dust_crumble_int_sm"]					= LoadFX("env/dirt/fx_dust_crumble_int_sm");
	level._effect["fx_projector_motes"]							= Loadfx("props/fx_projector_motes");

	level._effect["fx_debris_papers"]								= Loadfx("env/debris/fx_debris_papers");
	level._effect["fx_debris_papers_windy_slow"]		= Loadfx("env/debris/fx_debris_papers_windy_slow");
	level._effect["fx_debris_papers_fall_burning"]	= Loadfx("env/debris/fx_debris_papers_fall_burning");
	level._effect["fx_debris_papers_obstructed"]		= Loadfx("env/debris/fx_debris_papers_obstructed");
	
// Electric stuff
	level._effect["fx_elec_burst_heavy_os"]					= loadfx("env/electrical/fx_elec_burst_heavy_os");
	level._effect["fx_elec_burst_shower_sm_os_int"]	= loadfx("env/electrical/fx_elec_burst_shower_sm_os_int");
	level._effect["fx_elec_burst_shower_sm_os"]			= loadfx("env/electrical/fx_elec_burst_shower_sm_os");
	level._effect["fx_elec_burst_shower_lg_os"]			= loadfx("env/electrical/fx_elec_burst_shower_lg_os");
	
// Smoke
	level._effect["fx_smk_plume_md_wht_wispy"]			= loadfx("env/smoke/fx_smk_plume_md_wht_wispy");
	level._effect["fx_smk_plume_xsm_blk"]						= LoadFX("env/smoke/fx_smk_plume_xsm_blk");
	level._effect["fx_smk_plume_lg_wht"]						= loadfx("env/smoke/fx_smk_plume_lg_wht");
	level._effect["fx_smk_plume_xlg_wht"]						= loadfx("env/smoke/fx_smk_plume_xlg_wht");
	level._effect["fx_smk_plume_xlg_blk"]						= loadfx("env/smoke/fx_smk_plume_xlg_blk");
	level._effect["fx_smk_plume_xlg_tall_blk"]			= loadfx("env/smoke/fx_smk_plume_xlg_tall_blk");
	
	level._effect["fx_smk_fire_md_gray_int"]				= loadfx("env/smoke/fx_smk_fire_md_gray_int");
	level._effect["fx_smk_fire_md_black"]						= loadfx("env/smoke/fx_smk_fire_md_black");
	level._effect["fx_smk_fire_lg_black"]						= loadfx("env/smoke/fx_smk_fire_lg_black");
	level._effect["fx_smk_fire_lg_white"]						= loadfx("env/smoke/fx_smk_fire_lg_white");
	level._effect["fx_smk_smolder_rubble_md"]				= LoadFX("env/smoke/fx_smk_smolder_rubble_md");
	level._effect["fx_smk_smolder_rubble_lg"]				= LoadFX("env/smoke/fx_smk_smolder_rubble_lg");
	level._effect["fx_smk_smolder_sm_int"]					= LoadFX("env/smoke/fx_smk_smolder_sm_int");
	level._effect["fx_smk_hue_hallway_med"]					= LoadFX("maps/hue_city/fx_smk_hue_hallway_med");
	level._effect["fx_smk_hue_room_med"]						= LoadFX("maps/hue_city/fx_smk_hue_room_med");
	level._effect["fx_smk_haze_lg_os"]							= LoadFX("env/smoke/fx_smk_haze_lg_os");
	level._effect["fx_smk_hue_smolder_huge"]				= loadfx("maps/hue_city/fx_smk_hue_smolder_huge");
	level._effect["fx_smk_field_xsm_int"]						= LoadFX("env/smoke/fx_smk_field_xsm_int");
	level._effect["fx_smk_field_sm_int"]						= LoadFX("env/smoke/fx_smk_field_sm_int");
	level._effect["fx_smk_linger_lit"]							= loadfx("env/smoke/fx_smk_linger_lit");
	level._effect["fx_smk_ceiling_crawl"]						= loadfx("env/smoke/fx_smk_ceiling_crawl");	
	
// Fires
	level._effect["fx_fire_destruction_distant_xlg"]= loadfx("env/fire/fx_fire_destruction_distant_xlg");
	level._effect["fx_fire_detail_sm_nodlight"]			= loadfx("env/fire/fx_fire_detail_sm_nodlight");
	level._effect["fx_fire_column_creep_xsm"]				= loadfx("env/fire/fx_fire_column_creep_xsm");
	level._effect["fx_fire_column_creep_sm"]				= loadfx("env/fire/fx_fire_column_creep_sm");
	level._effect["fx_fire_wall_md"]								= loadfx("env/fire/fx_fire_wall_md");
	level._effect["fx_fire_ceiling_md"]							= loadfx("env/fire/fx_fire_ceiling_md");
	level._effect["fx_fire_sm_smolder"]							= loadfx("env/fire/fx_fire_sm_smolder");
	level._effect["fx_fire_md_smolder"]							= loadfx("env/fire/fx_fire_md_smolder");
	level._effect["fx_fire_sm"]											= loadfx("env/fire/fx_fire_sm");
	level._effect["fx_fire_md"]											= loadfx("env/fire/fx_fire_md");
	level._effect["fx_fire_lg"]											= loadfx("env/fire/fx_fire_lg");

}

footsteps()
{
	clientscripts\_utility::setFootstepEffect( "asphalt", LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "brick", LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "carpet", LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "cloth", LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "concrete", LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "dirt", LoadFx( "bio/player/fx_footstep_sand" ) );
	clientscripts\_utility::setFootstepEffect( "foliage", LoadFx( "bio/player/fx_footstep_sand" ) );
	clientscripts\_utility::setFootstepEffect( "gravel", LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "grass", LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "metal", LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "mud", LoadFx( "bio/player/fx_footstep_mud" ) );
	clientscripts\_utility::setFootstepEffect( "paper", LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "plaster", LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "rock", LoadFx( "bio/player/fx_footstep_dust" ) );
	clientscripts\_utility::setFootstepEffect( "water", LoadFx( "bio/player/fx_footstep_water" ) );
	clientscripts\_utility::setFootstepEffect( "wood", LoadFx( "bio/player/fx_footstep_dust" ) );
}

main()
{
	precache_util_fx();
	precache_createfx_fx();
	
	clientscripts\createfx\kowloon_fx::main();
	clientscripts\_fx::reportNumEffects();
	
	footsteps();
		
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
	
//	level thread start_lightning();

}

//start_lightning()
//{
//	while(1)
//	{
//		level waittill("lightning");
//		do_a_lightning_1();
//	}
//}
//
//
//lightning_normal_func()
//{
//	realWait( 0.05 );
//	ResetSunLight();
//	//setVolFog( 0, 86, 32, fog_value, 0.860, 0.810, 0.316, .05 );
//}
//
//lightning_flash_func()
//{
//	//SetSunLight( sun_value_below_water_r, sun_value_below_water_g, sun_value_below_water_b );
//
//	SetSunLight( 1, 1, 1.5 ); 
//	realWait( 0.014 );              
//	SetSunLight( 1.5, 1.5, 2 );
//	realWait( 0.0010 ); 
//	SetSunLight( 5, 5, 5.5 );
//	realWait( 0.0011 ); 
//	SetSunLight( 1, 1, 1.5 );
//	realWait( 0.0015 ); 
//	SetSunLight( 2.5, 2.5, 3 ); 
//	realWait(0.0010);
//}
//
//do_a_lightning_1()
//{
//	//setVolFog( 0, 86, 32, fog_value, 0.860, 0.810, 0.316, .0.5 );
//	
//	//SOUND - Shawn J * NOTE - this needs to be at the top of this function or the sound is too late!
//	Playsound (0, "amb_thunder_clap", (-1912, -1786, 4911) );
//		
//	lightning_flash_func();
//	lightning_flash_func();
//	wait(0.05);
//	lightning_flash_func();
//	lightning_flash_func();
//	lightning_flash_func();
//	wait(0.1);
//	lightning_flash_func();
//	lightning_normal_func();
//
//}



