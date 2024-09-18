#include clientscripts\_utility; 

// load fx used by util scripts
precache_util_fx()
{
}

// Scripted effects
precache_scripted_fx()
{
	level._effect["body_splash"] 		= Loadfx("impacts/fx_water_hit_lg");
}

// Ambient effects
precache_createfx_fx()
{
	level._effect["fx_light_projector"]							= Loadfx("env/light/fx_light_projector");
	level._effect["fx_projector_motes"]							= Loadfx("env/light/fx_light_dust_motes_projector");

	level._effect["fx_sand_hue_windy_street"]				= Loadfx("maps/hue_city/fx_sand_hue_windy_street");
	level._effect["fx_tracers_flak_amb"]						= loadfx("weapon/tracer/fx_tracers_flak_amb_night");
	level._effect["fx_flak_field_flash"]						= loadfx("weapon/flak/fx_flak_field_flash");
	level._effect["fx_flak_around_huey"]						= loadfx("maps/hue_city/fx_flak_around_huey");

// Exploders
	// Napalm explosion: 11
		level._effect["fx_napalm_strike_area"]					= loadfx("maps/hue_city/fx_napalm_strike_area");
	// Huey explosion: 21
		level._effect["fx_exp_vehicle_gen_stage3"]			= loadfx("explosions/fx_exp_vehicle_gen_stage3");
		level._effect["fx_debris_papers_windy_os"]			= loadfx("env/debris/fx_debris_papers_windy_os");
		level._effect["fx_exp_hue_window_glass_embers"]	= loadfx("maps/hue_city/fx_exp_hue_window_glass_embers");
	// Guy falling on desk: 22
		level._effect["fx_dest_paper_pile"]						= loadfx("destructibles/fx_dest_paper_pile");
	// Mowdown room: 30-41
		level._effect["fx_exp_hue_window_glass"]				= loadfx("maps/hue_city/fx_exp_hue_window_glass");
	// Rappel glass break: 51
		level._effect["fx_skylight_break"]							= loadfx("maps/hue_city/fx_skylight_break");
	// Rappel skylight godrays: 52, 53
	// Molotov fire spread:	101
	// Balcony shot by rocket:	110
	// Streets building destruction: 2001-2004
		level._effect["fx_exp_window_fire"]							= loadfx("maps/hue_city/fx_exp_window_fire");
		level._effect["fx_exp_window_smoke"]						= loadfx("maps/hue_city/fx_exp_window_smoke");
		level._effect["fx_dest_hydrant_water"]					= loadfx("destructibles/fx_dest_hydrant_water");
	// 1st building collapsing balconies: 2051-2055
		level._effect["fx_dest_hue_balcony_collapse"]		= loadfx("maps/hue_city/fx_dest_hue_balcony_collapse");
		// Balcony 1: 2051
		// Balcony 2: 2052
		// Balcony 3: 2053
		// Balcony ground hit: 2054
		// Large chunk ground hit: 2055
	// 1st building sign fall: 2056-2058
		// sign start, sparks: 2056
		// 'N' breaks away from sign, sparks: 2057
		// 'N' hits ground, dust poof: 2058
	// 1st tank entrance: 2010-2016
		level._effect["fx_dust_hue_tank1_entrance"]			= loadfx("maps/hue_city/fx_dust_hue_tank1_entrance");	// 2010
		level._effect["fx_impact_hue_tree"]							= loadfx("maps/hue_city/fx_impact_hue_tree");	// 2011
		// Pole 1 start: 2012
		// Pole 1 impact: 2013
		// Pole 2 start: 2014
		// Pole 2 impact: 2015
		// Wire snap: 2016
		level._effect["fx_dust_hue_pole_impact"]				= loadfx("maps/hue_city/fx_dust_hue_pole_impact");	// 2013
		level._effect["fx_impact_hue_brick_crumble"]		= loadfx("maps/hue_city/fx_impact_hue_brick_crumble");	// 2015
		// 1st tank death: 2021-2034
		level._effect["fx_tank1death_car_exp"]					= loadfx("explosions/fx_grenadeexp_concrete");	// 2021
		// sign on right falls down: 2022
		// sign impacts ground, pole gets hit: 2023
		level._effect["fx_tank1death_tank_strafe"]			= loadfx("maps/hue_city/fx_impact_hue_huey");	// 2024
		// sign on left falls down: 2025
		// falling pole hits tank: 2026
		// RapHat sign gets hit: 2027
		// corrugated canopies get hit: 2028
		level._effect["fx_exp_hue_tank1"]								= loadfx("maps/hue_city/fx_exp_hue_tank1");	// 2029
		// pole hits ground: 2030
		// tank turret hits ground: 2031
		// RapHat sign snaps off theater: 2032
		// RapHat sign hits theater awning: 2033
		// RaphHat sign hits the ground: 2034
		// Fire hydrant busts open: 2035
		level._effect["fx_tank2_entrance_debris"]				= loadfx("maps/hue_city/fx_tank2_entrance_debris");		// 700
		level._effect["fx_dust_hue_tank2_entrance"]			= loadfx("maps/hue_city/fx_dust_hue_tank2_entrance");	// 701
		level._effect["fx_tank_car_hit"]								= loadfx("maps/hue_city/fx_exp_hue_huey");						// 702
		// Balcony strike ceiling dust																																				// 703
		level._effect["fx_impact_hue_balcony_land"]			= loadfx("maps/hue_city/fx_impact_hue_balcony_land");	// 704
		level._effect["fx_exp_c4_aagun"]								= loadfx("maps/hue_city/fx_exp_c4_aagun");						// 705
		level._effect["fx_impact_aagun"]								= loadfx("maps/hue_city/fx_impact_aagun");						// 706
	// Huey landing area
		level._effect["fx_hue_lz_smoke"]								= loadfx("maps/hue_city/fx_hue_lz_smoke");						// 720
		level._effect["fx_hue_lz_smoke_scattered"]			= loadfx("maps/hue_city/fx_hue_lz_smoke_scattered");	// 721
		level._effect["fx_hue_huey_defend_landing"]			= loadfx("maps/hue_city/fx_hue_huey_defend_landing");	// 723
		level._effect["fx_hue_huey_defend_idle"]				= loadfx("maps/hue_city/fx_hue_huey_defend_idle");		// 723
		level._effect["fx_hue_huey_defend_rising"]			= loadfx("maps/hue_city/fx_hue_huey_defend_rising");	// 724
	// Smoke grenades
		level._effect["fx_defend_smoke_grenades"]				= loadfx("maps/hue_city/fx_defend_smoke_grenades");		// 730
		level._effect["fx_defend_smoke_grenades_2"]			= loadfx("maps/hue_city/fx_defend_smoke_grenades_2");	// 731
	// Huey group flyover
		// AA fire																																														// 750
		level._effect["fx_huey_flyover_dust"]= loadfx("maps/hue_city/fx_huey_flyover_dust");									// 751-753
		// Huey 1																																															// 751
		// Huey 2																																															// 752
		// Huey 3																																															// 753
	// Blow the gate																																												// 780
		level._effect["fx_airstrike_exp1"]							= loadfx("explosions/fx_exp_bomb_huge");							// 800
		level._effect["fx_airstrike_exp2"]							= loadfx("weapon/rocket/fx_rocket_xtreme_exp_rock");	// 800
		level._effect["fx_airstrike_dust"]							= loadfx("maps/hue_city/fx_airstrike_dust");					// 800
	
// Papers
	level._effect["fx_debris_papers_windy_slow"]		= Loadfx("env/debris/fx_debris_papers_windy_slow");
	level._effect["fx_debris_papers_fall_burning"]	= Loadfx("env/debris/fx_debris_papers_fall_burning");
	level._effect["fx_debris_papers_obstructed"]		= Loadfx("env/debris/fx_debris_papers_obstructed");
	
// Dust crumbles
	level._effect["fx_dust_crumble_sm_runner"]			= LoadFX("env/dirt/fx_dust_crumble_sm_runner");
	level._effect["fx_dust_crumble_md_runner"]			= LoadFX("env/dirt/fx_dust_crumble_md_runner");
	level._effect["fx_dust_crumble_int_sm"]					= LoadFX("env/dirt/fx_dust_crumble_int_sm");
	
// Electric stuff
	level._effect["fx_elec_burst_heavy_os_int"]			= loadfx("env/electrical/fx_elec_burst_heavy_os_int");
	level._effect["fx_elec_burst_shower_sm_os_int"]	= loadfx("env/electrical/fx_elec_burst_shower_sm_os_int");
	level._effect["fx_elec_burst_shower_sm_os"]			= loadfx("env/electrical/fx_elec_burst_shower_sm_os");
	level._effect["fx_elec_burst_shower_lg_os"]			= loadfx("env/electrical/fx_elec_burst_shower_lg_os");
	
// Smoke
	level._effect["fx_smk_plume_md_wht_wispy"]			= loadfx("env/smoke/fx_smk_plume_md_wht_wispy_near");
	level._effect["fx_smk_plume_lg_wht"]						= loadfx("env/smoke/fx_smk_plume_lg_wht");
	level._effect["fx_smk_plume_xlg_tall_blk"]			= loadfx("env/smoke/fx_smk_plume_xlg_tall_blk_near");
	level._effect["fx_smk_column_black_bg"]					= loadfx("env/smoke/fx_smk_column_black_bg");
	
	level._effect["fx_smk_fire_md_gray_int"]				= loadfx("env/smoke/fx_smk_fire_md_gray_int");
	level._effect["fx_smk_fire_md_black"]						= loadfx("env/smoke/fx_smk_fire_md_black");
	level._effect["fx_smk_fire_lg_black"]						= loadfx("env/smoke/fx_smk_fire_lg_black");
	level._effect["fx_smk_fire_lg_white"]						= loadfx("env/smoke/fx_smk_fire_lg_white");
	level._effect["fx_smk_smolder_rubble_md"]				= LoadFX("env/smoke/fx_smk_smolder_rubble_md");
	level._effect["fx_smk_smolder_rubble_lg"]				= LoadFX("env/smoke/fx_smk_smolder_rubble_lg");
	level._effect["fx_smk_smolder_sm"]							= loadfx("env/smoke/fx_smk_smolder_sm");
	level._effect["fx_smk_smolder_sm_int"]					= LoadFX("env/smoke/fx_smk_smolder_sm_int");
	level._effect["fx_smk_hue_hallway_med"]					= LoadFX("maps/hue_city/fx_smk_hue_hallway_med");
	level._effect["fx_smk_hue_room_med"]						= LoadFX("maps/hue_city/fx_smk_hue_room_med");
	level._effect["fx_smk_hue_smolder_huge"]				= loadfx("maps/hue_city/fx_smk_hue_smolder_huge");
	level._effect["fx_smk_linger_lit"]							= loadfx("maps/hue_city/fx_smk_linger_lit_hue");
	level._effect["fx_smk_ceiling_crawl"]						= loadfx("env/smoke/fx_smk_ceiling_crawl");
	
// Fires
	level._effect["fx_ash_embers_heavy"]						= loadfx("env/fire/fx_ash_embers_heavy");
	level._effect["fx_embers_up_dist"]							= loadfx("env/fire/fx_embers_up_dist");
	level._effect["fx_embers_falling_sm"]						= loadfx("env/fire/fx_embers_falling_sm");
	level._effect["fx_embers_falling_md"]						= loadfx("env/fire/fx_embers_falling_md");
	level._effect["fx_fire_destruction_distant_xlg"]= loadfx("env/fire/fx_fire_destruction_distant_xlg");
	level._effect["fx_fire_column_creep_xsm"]				= loadfx("env/fire/fx_fire_column_creep_xsm");
	level._effect["fx_fire_column_creep_sm"]				= loadfx("env/fire/fx_fire_column_creep_sm");
	level._effect["fx_fire_wall_md"]								= loadfx("env/fire/fx_fire_wall_md");
	level._effect["fx_fire_ceiling_md"]							= loadfx("env/fire/fx_fire_ceiling_md");
	level._effect["fx_fire_sm_smolder"]							= loadfx("env/fire/fx_fire_sm_smolder");
	level._effect["fx_fire_md_smolder"]							= loadfx("env/fire/fx_fire_md_smolder");
	level._effect["fx_fire_hue_line_xsm"]						= loadfx("maps/hue_city/fx_fire_hue_line_xsm");
	level._effect["fx_fire_line_sm"]								= loadfx("env/fire/fx_fire_line_sm");
	level._effect["fx_fire_line_md"]								= loadfx("env/fire/fx_fire_line_md");
	level._effect["fx_fire_hue_line_lg"]						= loadfx("maps/hue_city/fx_fire_hue_line_lg");
	
	// Light effects
	level._effect["fx_light_hue_ray_md_wide"]				= loadfx("maps/hue_city/fx_light_hue_ray_md_wide");
	level._effect["fx_light_hue_ray_wide"]					= loadfx("maps/hue_city/fx_light_hue_ray_wide");
	level._effect["fx_light_hue_ray_sm"]						= loadfx("maps/hue_city/fx_light_hue_ray_sm");
	level._effect["fx_light_hue_ray_sm_thin"]				= loadfx("maps/hue_city/fx_light_hue_ray_sm_thin");
	level._effect["fx_light_hue_ray_street"]				= loadfx("maps/hue_city/fx_light_hue_ray_street");
	level._effect["fx_light_dust_motes_xsm_wide"]		= loadfx("env/light/fx_light_dust_motes_xsm_wide");
	level._effect["fx_light_dust_motes_xsm_short"]	= loadfx("env/light/fx_light_dust_motes_xsm_short");
}


main()
{
	precache_util_fx();
	precache_createfx_fx();
	precache_scripted_fx();
	clientscripts\createfx\hue_city_fx::main();
}
