//
// file: wmd_sr71_fx.gsc
// description: clientside fx script for wmd_sr71: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 


// load fx used by util scripts
precache_util_fx()
{	

}

precache_scripted_fx()
{
}


// --- Quinn's SECTION ---//
precache_createfx_fx()
{
  level._effect["a_sand_blowing_xlg"]					    = loadfx("env/dirt/fx_sand_blowing_xlg");
	level._effect["a_sand_blowing_xlg_direct"]		  = loadfx("env/dirt/fx_sand_blowing_xlg_direct");	
	level._effect["sand_windy_md"]		              = loadfx("env/weather/fx_sand_windy_md");	
  level._effect["scene_runway_dust"]              = loadfx("maps/wmd/fx_wmd_scene_dust_gust_runway"); 
  level._effect["scene_runway_lights"]            = loadfx("maps/wmd/fx_wmd_scene_lights_runway");     		
	level._effect["rocks_falling"]					        = loadfx("env/dirt/fx_rock_debris_ropebridge");
  level._effect["cloud_layer_speedvisual"] 				= loadfx("env/weather/fx_cloud_layer_speedvisual"); 
  level._effect["cloud_layer_speedvisual2"] 			= loadfx("env/weather/fx_cloud_layer_speedvisual2");  
  level._effect["cloud_layer_speedvisual3"] 			= loadfx("env/weather/fx_cloud_layer_speedvisual3"); 
  level._effect["cloud_layer_speedvisual4"] 			= loadfx("env/weather/fx_cloud_layer_speedvisual4");        
  level._effect["rts_cloud_layer1"] 				    	= loadfx("env/weather/fx_rts_cloud_layer");      
  
  level._effect["snow_tree_fall_big_spawner"] 		= loadfx("env/foliage/fx_snow_falling_tree_big_spawner");    
  level._effect["snow_flakes_windy_blizzard"] 		= loadfx("env/weather/fx_snow_blizzard_intense");
  level._effect["snow_flakes_windy_blizzard2"] 		= loadfx("env/weather/fx_snow_blizzard_intense2");   
  level._effect["snow_flakes_windy_sm"] 					= loadfx("env/weather/fx_snow_flakes_windy_small");
  level._effect["snow_ground_rolling_dist"] 			= loadfx("env/weather/fx_snow_ground_rolling_dist");
  level._effect["snow_gust_wind_burst"] 					= loadfx("env/weather/fx_snow_gust_wind_burst");
  level._effect["snow_windy_fast_door_os"] 				= loadfx("env/weather/fx_snow_windy_fast_door_os");
  level._effect["snow_windy_fast_sm_os"] 					= loadfx("env/weather/fx_snow_windy_fast_sm_os");
  level._effect["snow_windy_fast_lg_os"] 					= loadfx("env/weather/fx_snow_windy_fast_lg_os"); 
  level._effect["snow_windy_fast_xlg_os"] 				= loadfx("env/weather/fx_snow_windy_fast_xlg_os");    
  level._effect["snow_windy_heavy_md"] 			    	= loadfx("env/weather/fx_snow_windy_heavy_md");
  level._effect["snow_windy_heavy_md_rts"] 		   	= loadfx("env/weather/fx_snow_windy_heavy_md_rts");  
  level._effect["snow_windy_heavy_sm"] 						= loadfx("env/weather/fx_snow_windy_heavy_sm");
  level._effect["snow_windy_heavy_xsm"] 					= loadfx("env/weather/fx_snow_windy_heavy_xsm");    
  level._effect["snow_gust_ground_lg"] 					  = loadfx("env/weather/fx_snow_gust_ground_lg");
  level._effect["snow_gust_wind_dense"] 				  = loadfx("env/weather/fx_snow_gust_wind_dense"); 
  level._effect["snow_gust_wind_dense_rts"] 		  = loadfx("env/weather/fx_snow_gust_wind_dense_rts");    
  level._effect["snow_debris_plume_sm"] 			    = loadfx("env/weather/fx_snow_debris_plume_sm");
  level._effect["snow_debris_plume_md"] 			    = loadfx("env/weather/fx_snow_debris_plume_md");      
  level._effect["snow_gust_kickup1"] 					    = loadfx("env/weather/fx_snow_gust_kickup1");
	level._effect["snow_gust_kickup2"] 				  	  = loadfx("env/weather/fx_snow_gust_kickup2");	  
  level._effect["cloud_layer_earth"] 		        	= loadfx("maps/wmd/fx_cloud_layer_earth");  
  level._effect["cloud_layer_earth2"] 		       	= loadfx("maps/wmd/fx_cloud_layer_earth2");    
  level._effect["cloud_layer_earth_flash"] 		   	= loadfx("maps/wmd/fx_cloud_layer_earth_flash");      
  level._effect["ambience_swirling1"]             = loadfx("maps/wmd/fx_wmd_room_swirling_ambience" ); 
  level._effect["ambience_swirling2"]             = loadfx("maps/wmd/fx_wmd_room_swirling_ambience2" );    
  level._effect["ambience_swirling2a"]            = loadfx("maps/wmd/fx_wmd_room_swirling_ambience2a" );   
  level._effect["godray_md"]                      = loadfx("maps/wmd/fx_light_godray_wmd_md");  
  level._effect["godray_sm"]                      = loadfx("maps/wmd/fx_light_godray_wmd_sm_sr71");    
  level._effect["satellite_glint"]                = loadfx("maps/wmd/fx_satellite_glint");
  level._effect["rts_ghosting_elem"]              = loadfx("maps/wmd/fx_wmd_rts_ghosting_elem"); 
  level._effect["rts_ghosting"]                   = loadfx("maps/wmd/fx_wmd_rts_ghosting"); 
  level._effect["sr71_inst_lighting1"]            = loadfx("maps/wmd/fx_wmd_sr71_instrument_lights1"); 
  level._effect["sr71_inst_lighting2"]            = loadfx("maps/wmd/fx_wmd_sr71_instrument_lights2"); 
  level._effect["sr71_inst_lighting3"]            = loadfx("maps/wmd/fx_wmd_sr71_instrument_lights3");   
  level._effect["sr71_runway_lighting1"]          = loadfx("maps/wmd/fx_wmd_sr71_runway_lights1"); 
  level._effect["sr71_runway_lighting2"]          = loadfx("maps/wmd/fx_wmd_sr71_runway_lights2");
  level._effect["sr71_runway_lighting3"]          = loadfx("maps/wmd/fx_wmd_sr71_runway_lights3"); 
  level._effect["sr71_contrails"]                 = loadfx("maps/wmd/fx_wmd_sr71_contrails"); 
  level._effect["sr71_dressing"]                  = loadfx("maps/wmd/fx_wmd_sr71_dressing");        
  level._effect["light_runway_glow_red"]          = loadfx("maps/wmd/fx_wmd_runway_red_light_glow");    
  level._effect["light_lamp_glow_white"]          = loadfx("maps/wmd/fx_wmd_lamp_white_light_glow"); 
  level._effect["light_lamp_glow_red"]            = loadfx("maps/wmd/fx_wmd_lamp_red_light_glow");    
  level._effect["light_glow_red"]                 = loadfx("maps/wmd/fx_wmd_tower_red_light_glow");  
  level._effect["light_glow_green"]               = loadfx("maps/wmd/fx_wmd_tower_green_light_glow");  
  level._effect["light_glow_amber"]               = loadfx("maps/wmd/fx_wmd_tower_amber_light_glow"); 
  level._effect["fuel_tank_fire_lg"]              = loadfx("maps/wmd/fx_vehicle_fuel_tank_fire1");
  level._effect["fuel_tank_fire_sm"]              = loadfx("maps/wmd/fx_vehicle_fuel_tank_fire2");   
  level._effect["fuel_tank_fire_xsm"]             = loadfx("maps/wmd/fx_vehicle_fuel_tank_fire3"); 
  level._effect["snow_door_fallen_puff"]          = loadfx("maps/wmd/fx_snow_door_fallen_puff");     
  level._effect["breech_wind_gust_loop"]          = loadfx("maps/wmd/fx_wmd_breech_wind_gust"); 
  level._effect["snow_falling_drift_small"]       = loadfx("maps/wmd/fx_snow_falling_drift");  
  level._effect["light_flare_player"]             = loadfx("maps/wmd/fx_wmd_light_flare_player"); 
  level._effect["radar_wire_sparks"]              = loadfx("maps/wmd/fx_wmd_sparks_impact_burst2"); 
  level._effect["console_destroyed_sparks"]       = loadfx("maps/wmd/fx_wmd_sparks_impact_burst3");                                     
  level._effect["distortion_heat_field_lg"]       = loadfx("env/distortion/fx_distortion_heat_field_lg");
  level._effect["distortion_heat_field_sm"]       = loadfx("env/distortion/fx_distortion_heat_field_sm"); 
  level._effect["sr71_wind_speedvisual"]          = loadfx("env/weather/fx_wind_layer_speedvisual_sr71"); 
  level._effect["sr71_wind_speedvisual_elem"]     = loadfx("env/weather/fx_wind_layer_speedvisual_sr71_elem"); 
  level._effect["sr71_exhaust_smoke_burst"]       = loadfx("smoke/smoke_sr71_turbine_ignite_burst"); 
  level._effect["sparks_element1"]                = loadfx("env/electrical/fx_elec_burst_shower_sm_os");
  // level._effect["dyn_light_glow"]                 = loadfx("maps/wmd/fx_wmd_lamp_breech_light_glow");
  level._effect["rts_snow_blizzard_detail"]       = loadfx("maps/wmd/fx_snow_blizzard_detail_rts"); 
  level._effect["light_glow_spot_3"]              = LoadFX("maps/vorkuta/fx_light_glow_spot_3" );  
  level._effect["snow_gust_window"]               = LoadFX("maps/wmd/fx_snow_gust_window" );  
  level._effect["snow_gust_door"]                 = LoadFX("maps/wmd/fx_snow_gust_door" );  
	level._effect["barrel_fire"]                    = loadfx("env/fire/fx_fire_barrel_small");                  
  
  
}

footsteps()
{
	clientscripts\_utility::setFootstepEffect( "snow", LoadFx( "bio/player/fx_footstep_snow" ) );
}

main()
{
	clientscripts\createfx\wmd_sr71_fx::main();
	clientscripts\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( "disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

