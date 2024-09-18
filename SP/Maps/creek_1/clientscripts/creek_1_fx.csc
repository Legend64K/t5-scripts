//
// file: creek_1_fx.gsc
// description: clientside fx script for creek_1: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 


// fx used by util scripts
precache_util_fx()
{
	
}

// Scripted effects
precache_scripted_fx()
{
	
	// Beat 2:
	level._effect["flashlight_cone"]							= LoadFX("env/light/fx_spotlight_flashlight");	

	// Beat 4:
	level._effect["muzzle_flash"]									= LoadFX("weapon/muzzleflashes/fx_50cal_view");
	level._effect["water_bullet_hit"] 						= Loadfx("impacts/fx_small_waterhit");
	level._effect["dirt_bullet_hit"] 							= Loadfx("impacts/fx_small_dirt");
	level._effect["rpg_trail"]										= LoadFX("weapon/grenade/fx_trail_rpg");
	level._effect["water_rpg_hit"] 								= Loadfx("explosions/fx_mortarExp_water");

	level._effect["rocket_launch"] 								= Loadfx("weapon/rocket/fx_LCI_rocket_ignite_launch");
	level._effect["big_explosion"]								= LoadFX("explosions/fx_mortarExp_dirt");

	//precache effects
	level._effect["explosion"] 										= Loadfx("temp_effects/fx_tmp_exp_midair_large");
	level._effect["smoke"] 												= Loadfx("env/smoke/fx_smoke_plume_xlg_slow_blk");
	level._effect["water_splash"] 								= Loadfx("explosions/fx_mortarExp_water");

	// setup fx for defend mission
	level._effect["bullet_impact"]								= LoadFX("impacts/fx_large_dirt");
	level._effect["rpg_trail"]										= LoadFX("weapon/rocket/fx_LCI_rocket_geotrail");
	level._effect["rpg_explosion"]								= LoadFX("explosions/fx_mortarExp_dirt");
	level._effect["rpg_explosion_water"]					= LoadFX("explosions/fx_mortarExp_water");
	level._effect["flare"]												= LoadFX("misc/fx_flare_sky_white_10sec");
	level._effect["open_rat_door"]								= LoadFX("impacts/fx_large_mud");
	level._effect["battle_smoke"]									= LoadFX("env/smoke/fx_smoke_plume_xlg_slow_blk");

	// for village mission
	level._effect["water_splash"]									= LoadFX("vehicle/water/fx_wake_lvt_churn");
	level._effect["napalm_drop"]									= LoadFX("temp_effects/fx_tmp_exp_midair_large");
	level._effect["village_fire"]									= LoadFX("env/fire/fx_static_fire_md_ndlight");
}

// Ambient effects
precache_createfx_fx()
{

// Ambient
	level._effect["fx_fog_low"]												= loadfx("env/smoke/fx_fog_low");
	level._effect["fx_fog_low_sm"]										= loadfx("env/smoke/fx_fog_low_sm");

	level._effect["fx_rain_splash_detail"]						= loadfx("env/weather/fx_rain_splash_detail");
	level._effect["fx_rain_mist"]											= loadfx("env/weather/fx_rain_mist");
	level._effect["fx_rain_mist_sm"]									= loadfx("env/weather/fx_rain_mist_sm");
	level._effect["fx_rain_heavy_looping"]						= loadfx("env/weather/fx_rain_heavy_looping");
	level._effect["fx_rain_light_looping"]						= loadfx("env/weather/fx_rain_light_looping");
	level._effect["fx_rain_xlight_oneshot"]						= loadfx("env/weather/fx_rain_xlight_oneshot");
	level._effect["fx_rain_xlight_looping"]						= loadfx("env/weather/fx_rain_xlight_looping");
	level._effect["fx_rain_splash_swimming_xlg"]			= loadfx("env/weather/fx_rain_splash_swimming_xlg");	
	level._effect["fx_rain_splash_swimming_lg"]				= loadfx("env/weather/fx_rain_splash_swimming_lg");	
	
	level._effect["fx_water_drip_tree_xlight"]				= loadfx("env/water/fx_water_drip_tree_xlight");
	level._effect["fx_water_drip_xlight_line"]				= loadfx("env/water/fx_water_drip_xlight_line");
	level._effect["fx_water_drip_hvy_long"]						= loadfx("env/water/fx_water_drip_hvy_long");	
	
	level._effect["fx_water_wake_sanpan"]							= loadfx("maps/creek/fx_water_wake_sanpan");	
	level._effect["fx_water_wake_sanpan_med"]					= loadfx("maps/creek/fx_water_wake_sanpan_med");	
	level._effect["fx_water_wake_sanpan_sm"]					= loadfx("maps/creek/fx_water_wake_sanpan_sm");	

	level._effect["fx_water_wake_creek"]							= loadfx("env/water/fx_water_wake_creek");		
	level._effect["fx_water_wake_creek_mouth"]				= loadfx("env/water/fx_water_wake_creek_mouth");
	level._effect["fx_water_wake_creek_mouth_froth"]	= loadfx("env/water/fx_water_wake_creek_mouth_froth");
	level._effect["fx_water_splash_creek_rocks"]			= loadfx("maps/creek/fx_water_splash_creek_rocks");	
	level._effect["fx_water_splash_creek_rocks_sm"]		= loadfx("maps/creek/fx_water_splash_creek_rocks_sm");
	level._effect["fx_water_fall_sm"]									= loadfx("maps/creek/fx_water_fall_sm");	
	level._effect["fx_water_fall_xsm"]								= loadfx("maps/creek/fx_water_fall_xsm");
	level._effect["fx_water_fall_mist"]								= loadfx("maps/creek/fx_water_fall_mist");	
	level._effect["fx_water_wake_creek_flow"]					= loadfx("maps/creek/fx_water_wake_creek_flow");	
	
	level._effect["fx_water_river_shore"]							= loadfx("maps/creek/fx_water_river_shore");
	
	level._effect["fx_water_bubble_column"]						= loadfx("env/water/fx_water_bubble_column");
	level._effect["fx_water_bubble_column_thin_sm"]		= loadfx("env/water/fx_water_bubble_column_thin_sm");	
	
	level._effect["fx_insects_ambient_lg"]						= loadfx("maps/creek/fx_insect_swarm_lg");
	level._effect["fx_insects_dragonflies_ambient"]		= loadfx("bio/insects/fx_insects_dragonflies_ambient");
	level._effect["fx_pigeon_panic_flight_med"]				= loadfx("bio/animals/fx_pigeon_panic_flight_med");
	
	level._effect["fx_leaves_falling_lite"]						= loadfx("env/foliage/fx_leaves_falling_lite");
	
	// tunnel effects
	level._effect["fx_fog_tunnel_sm"]									= loadfx("maps/creek/fx_fog_tunnel_sm");
	level._effect["fx_fog_tunnel_md"]									= loadfx("maps/creek/fx_fog_tunnel_md");
	level._effect["fx_water_drips_tunnel"]						= loadfx("maps/creek/fx_water_drips_tunnel");
	level._effect["fx_water_drips_wtr_tunnel"]				= loadfx("maps/creek/fx_water_drips_wtr_tunnel");
	level._effect["fx_tunnel_fight_vc_drown"]					= loadfx("maps/creek/fx_tunnel_fight_vc_drown");				// 3011
	level._effect["fx_tunnel_fight_vc_blood_cloud"]		= loadfx("maps/creek/fx_tunnel_fight_vc_blood_cloud");	// 3012
	level._effect["fx_tunnel_fight_vc_splash"]				= loadfx("maps/creek/fx_tunnel_fight_vc_splash");				// 3010
	level._effect["fx_tunnel_roach_scurry"]						= loadfx("maps/creek/fx_tunnel_roach_scurry");					// 3020-3022,3024-3031
	level._effect["fx_tunnel_light_exit"]							= loadfx("maps/creek/fx_tunnel_light_exit");
	level._effect["fx_tunnel_godray_exit"]						= loadfx("maps/creek/fx_tunnel_godray_exit");
	level._effect["fx_tunnel_water_foam"]							= loadfx("maps/creek/fx_tunnel_water_foam");
	level._effect["fx_tunnel_reznov_impact"]					= loadfx("maps/creek/fx_tunnel_reznov_impact");					// 3009
	
	// exploder 4500 plays ceiling dust before main room explosions  
	level._effect["fx_exp_war_room"]									= loadfx("maps/creek/fx_exp_war_room"); // 4501-4506
	level._effect["fx_dirt_tunnel_collapse"]					= loadfx("maps/creek/fx_dirt_tunnel_collapse"); // 5010-
	level._effect["fx_cave_pillar_crush"]							= loadfx("maps/creek/fx_cave_pillar_crush"); // 5010-plays with above effect
	level._effect["fx_cave_rock_hit"]									= loadfx("maps/creek/fx_cave_rock_hit"); // 5020
	level._effect["fx_dirt_tunnel_collapse_blast"]		= loadfx("maps/creek/fx_dirt_tunnel_collapse_blast"); // 5021

	level._effect["fx_lantern_smoke_corona"]					= loadfx("props/fx_lantern_smoke_corona");
	
	level._effect["fx_light_incandescent"]					= loadfx("env/light/fx_light_incandescent");
	level._effect["fx_light_dust_motes_md"]					= loadfx("env/light/fx_light_dust_motes_md");
	
	level._effect["fx_godray_crk_overcast_sm_thin"]		= loadfx("maps/creek/fx_light_godray_crk_overcast_sm_thin");
	level._effect["fx_godray_crk_overcast_lg"]				= loadfx("maps/creek/fx_light_godray_crk_overcast_lg");

	level._effect["fx_smk_plume_hut_sm_white"]				= loadfx("env/smoke/fx_smk_plume_hut_sm_white");		
	level._effect["fx_smk_plume_hut_md_white"]				= loadfx("env/smoke/fx_smk_plume_hut_md_white");	
	level._effect["fx_smk_plume_hut_lg_white"]				= loadfx("env/smoke/fx_smk_plume_hut_lg_white");

	level._effect["fx_fire_ember_column_lg"]					= loadfx("env/fire/fx_fire_ember_column_lg");
	level._effect["fx_ash_embers_light"]							= loadfx("env/fire/fx_ash_embers_light");

	level._effect["fx_fire_hut_wall_xsm"]							= loadfx("env/fire/fx_fire_hut_wall_xsm");
	level._effect["fx_fire_detail_nodlight"]					= loadfx("env/fire/fx_fire_detail_nodlight");
	level._effect["fx_fire_detail_sm_nodlight"]				= loadfx("env/fire/fx_fire_detail_sm_nodlight");	
	
	level._effect["fx_fire_column_creep_xsm"]					= loadfx("env/fire/fx_fire_column_creep_xsm");
	level._effect["fx_fire_column_xsm_thin"]					= loadfx("env/fire/fx_fire_column_xsm_thin");
	level._effect["fx_fire_column_sm_thin"]						= loadfx("env/fire/fx_fire_column_sm_thin");	
	level._effect["fx_fire_line_xsm_thin"]						= loadfx("env/fire/fx_fire_line_xsm_thin");
	level._effect["fx_fire_line_sm_thin"]							= loadfx("env/fire/fx_fire_line_sm_thin");
	level._effect["fx_fire_wall_back_sm"]							= loadfx("env/fire/fx_fire_wall_back_sm");	
	
	// MG Event
	level._effect["fx_large_woodhit"]									= loadfx("impacts/fx_large_woodhit");	
	level._effect["fx_exp_mg_nest"]										= loadfx("maps/creek/fx_exp_mg_nest");		
	
	level._effect["fx_explosion_satchel_hut"]					= loadfx("maps/creek/fx_exp_satchel_hut");
	level._effect["fx_explosion_satchel_hut_core"]		= loadfx("maps/creek/fx_exp_satchel_hut_core");
	level._effect["fx_explosion_tunnel_hatch_core"]		= loadfx("explosions/fx_exp_tunnel_mouth");
	level._effect["fx_explosion_hut_water"]						= loadfx("maps/creek/fx_exp_hut_water");
	
	// Helicopter Intro
	level._effect["fx_water_heli_spill_sm"]						= loadfx("maps/creek/fx_water_heli_spill_sm");	
	level._effect["fx_water_heli_spill_sm_froth"]			= loadfx("maps/creek/fx_water_heli_spill_sm_froth");	
	level._effect["fx_bullet_hole_gray_heli"]					= loadfx("maps/creek/fx_bullet_hole_gray_heli");		
	level._effect["fx_water_heli_pcloud"]							= loadfx("maps/creek/fx_water_heli_pcloud");		
	level._effect["fx_light_huey_dome"]								= loadfx("maps/creek/fx_light_huey_dome");
	level._effect["fx_sparks_heli_mid_pnl_fxr"]				= loadfx("maps/creek/fx_sparks_heli_mid_pnl_fxr");
	level._effect["fx_sparks_heli_mid_pnl"]						= loadfx("maps/creek/fx_sparks_heli_mid_pnl");	
	level._effect["fx_sparks_heli_mid_pnl_smk"]				= loadfx("maps/creek/fx_sparks_heli_mid_pnl_smk");
	level._effect["fx_sparks_heli_upper_pnl_fxr"]			= loadfx("maps/creek/fx_sparks_heli_upper_pnl_fxr");	
	level._effect["fx_cigarette_floating"]						= loadfx("props/fx_cigarette_floating");	
	level._effect["fx_cigarette_pack_floating"]			= loadfx("props/fx_cigarette_pack_floating");	
	level._effect["fx_heli_insulation_floating_sm"]		= loadfx("props/fx_heli_insulation_floating_sm");	
	level._effect["fx_heli_cloth_floating_sm"]				= loadfx("props/fx_heli_cloth_floating_sm");	
	level._effect["fx_player_water_knee_ripple"]			= loadfx("bio/player/fx_player_water_knee_ripple");		
	level._effect["fx_water_heli_gun_grab"]						= loadfx("maps/creek/fx_water_heli_gun_grab");
	level._effect["fx_small_waterhit"]								= loadfx("impacts/fx_small_waterhit");	
	level._effect["fx_glass_heli_break"]							= loadfx("maps/creek/fx_glass_heli_break");		
	level._effect["fx_player_underwater_bubbles_drowning"]= loadfx("bio/player/fx_player_underwater_bubbles_drowning");		

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
	
	footsteps();
	clientscripts\createfx\creek_1_fx::main();
	clientscripts\_fx::reportNumEffects();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

