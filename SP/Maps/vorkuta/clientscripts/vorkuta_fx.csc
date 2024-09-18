//
// file: vorkuta_fx.gsc
// description: clientside fx script for vorkuta: setup, special fx functions, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 


// load fx used by util scripts
precache_util_fx()
{	

}

precache_scripted_fx()
{
	level._effect["test_spin_fx"] = LoadFX( "env/light/fx_light_warning");
}


// --- QUINN'S SECTION ---//
precache_createfx_fx()
{
	level._effect["ash_cloud_1"]                           = LoadFX( "maps/vorkuta/fx_ash_cloud_1" );
	level._effect["ash_coal_dust_falling"]                 = LoadFX( "maps/vorkuta/fx_ash_coal_dust_falling" );		
	level._effect["ash_cloud_gush_indoor"]                 = LoadFX( "maps/vorkuta/fx_ash_cloud_gush_indoor" );		
  level._effect["ash_cloud_2"]                           = LoadFX( "maps/vorkuta/fx_ash_cloud_2" );
  level._effect["ash_cloud_2_dense"]                     = LoadFX( "maps/vorkuta/fx_ash_cloud_2_dense" );    
  level._effect["ash_cloud_3"]                           = LoadFX( "maps/vorkuta/fx_ash_cloud_3_spawner" );  
//  level._effect["snow_gust_1"]                           = LoadFX( "maps/vorkuta/fx_snow_gust_1" );  
  level._effect["snow_gust_2"]                           = LoadFX( "maps/vorkuta/fx_snow_gust_2" ); 
  level._effect["snow_gust_3"]                           = LoadFX( "maps/vorkuta/fx_snow_gust_3" );      
  level._effect["snow_gust_spot_1"]                      = LoadFX( "maps/vorkuta/fx_snow_gust_spot_1" );
  level._effect["snow_gust_spot_2"]                      = LoadFX( "maps/vorkuta/fx_snow_gust_spot_2" ); 
  level._effect["light_glow_spot_2group"]                = LoadFX( "maps/vorkuta/fx_light_glow_spot_2group" );   
  level._effect["snow_gust_spot_2distant"]               = LoadFX( "maps/vorkuta/fx_snow_gust_spot_2distant" );     
  level._effect["wind_lead_sm"]                          = LoadFX( "maps/vorkuta/fx_wind_lead_sm" ); 
  level._effect["wind_lead_sm_loop"]                     = LoadFX( "maps/vorkuta/fx_wind_lead_sm_loop" );      
  level._effect["wind_lead_md"]                          = LoadFX( "maps/vorkuta/fx_wind_lead_md" );         
//  level._effect["cloud_rolling_small"]                   = LoadFX( "maps/vorkuta/fx_cloud_rolling_sm" );  
  level._effect["cloud_rolling_medium"]                  = LoadFX( "maps/vorkuta/fx_cloud_rolling_md" ); 
  level._effect["cloud_rolling_medium_right"]            = LoadFX( "maps/vorkuta/fx_cloud_rolling_md_right" );   
  level._effect["cloud_rolling_glow_large"]              = LoadFX( "maps/vorkuta/fx_cloud_rolling_glow_lg" ); 
  level._effect["smoke_plume_distant_1"]                 = LoadFX( "maps/vorkuta/fx_smoke_plume_distant_1" );
  level._effect["smoke_stack_distant_1"]                 = LoadFX( "maps/vorkuta/fx_smoke_stack_distant_1" ); 
  level._effect["smoke_stack_close"]                     = LoadFX( "maps/vorkuta/fx_smoke_stack_close" );   
  level._effect["smoke_env_linger_mine"]                 = LoadFX( "maps/vorkuta/fx_smoke_env_linger_mine" ); 
  level._effect["smoke_env_linger_factory"]              = LoadFX( "maps/vorkuta/fx_smoke_env_linger_factory" );     
  level._effect["smoke_fire_runner_1"]                   = LoadFX( "maps/vorkuta/fx_smoke_fire_runner_1" );       
//  level._effect["fire_smoke_stack_distant_1"]            = LoadFX( "maps/vorkuta/fx_fire_smoke_stack_distant_1" );         
  level._effect["light_glow_spot_1"]                     = LoadFX( "maps/vorkuta/fx_light_glow_spot_1" ); 
  level._effect["light_glow_bulb_red"]                   = LoadFX( "maps/vorkuta/fx_light_glow_bulb_red" );  
  level._effect["light_glow_bulb_white"]                 = LoadFX( "maps/vorkuta/fx_light_glow_bulb_white" );    
  level._effect["light_glow_spot_1a"]                    = LoadFX( "maps/vorkuta/fx_light_glow_spot_1a" );   
  level._effect["light_glow_spot_2"]                     = LoadFX( "maps/vorkuta/fx_light_glow_spot_2" );  
  level._effect["light_glow_spot_3"]                     = LoadFX( "maps/vorkuta/fx_light_glow_spot_3" ); 
  level._effect["light_glow_spot_4"]                     = LoadFX( "maps/vorkuta/fx_light_glow_spot_4" );       
  level._effect["light_glow_lantern_1"]                  = LoadFX( "maps/vorkuta/fx_light_glow_lantern_1" ); 
  level._effect["god_rays_medium"]                       = LoadFX( "maps/vorkuta/fx_god_rays_md" );  
  level._effect["god_rays_medium_long"]                  = LoadFX( "maps/vorkuta/fx_god_rays_md_long" );   
  level._effect["god_rays_medium_long_mine"]             = LoadFX( "maps/vorkuta/fx_god_rays_md_long_mine" );    
  level._effect["god_rays_medium_long_wide"]             = LoadFX( "maps/vorkuta/fx_god_rays_md_long_wide" );     
  level._effect["god_rays_small"]                        = LoadFX( "maps/vorkuta/fx_god_rays_sm" ); 
  level._effect["god_rays_small_long"]                   = LoadFX( "maps/vorkuta/fx_god_rays_sm_long" );    
  level._effect["god_rays_door_open"]                    = LoadFX( "maps/vorkuta/fx_god_rays_door_open" ); 
  level._effect["god_rays_bloom"]                        = LoadFX( "maps/vorkuta/fx_god_rays_bloom" );        
  level._effect["fire_ceiling_1"]                        = LoadFX( "maps/vorkuta/fx_fire_ceiling_1" ); 
  level._effect["fire_wall_1"]                           = LoadFX( "maps/vorkuta/fx_fire_wall_1" ); 
  level._effect["fire_wall_2"]                           = LoadFX( "maps/vorkuta/fx_fire_wall_2" );  
  level._effect["fire_wall_2_light"]                     = LoadFX( "maps/vorkuta/fx_fire_wall_2_light" );        
  level._effect["fire_indoor_sm"]                        = LoadFX( "maps/vorkuta/fx_fire_fuel_indoor_sm" );  
  level._effect["fire_indoor_md"]                        = LoadFX( "maps/vorkuta/fx_fire_fuel_indoor_md" );  
  level._effect["fire_outdoor_sm"]                       = LoadFX( "maps/vorkuta/fx_fire_fuel_outdoor_sm" );   
  level._effect["fire_outdoor_md"]                       = LoadFX( "maps/vorkuta/fx_fire_fuel_outdoor_md" ); 
  level._effect["fire_outdoor_lg"]                       = LoadFX( "maps/vorkuta/fx_fire_fuel_outdoor_lg" );  
  level._effect["fire_embers_md"]                        = LoadFX( "maps/vorkuta/fx_fire_embers_md" );  
  level._effect["fire_residual_small"]                   = LoadFX( "maps/vorkuta/fx_fire_projectile_elem4_loop" ); 
  level._effect["fire_residual_small_6sec"]              = LoadFX( "maps/vorkuta/fx_fire_projectile_elem4" ); 
  level._effect["fire_residual_small_24sec"]             = LoadFX( "maps/vorkuta/fx_fire_projectile_elem4a" );       
  level._effect["fire_residual_large"]                   = LoadFX( "maps/vorkuta/fx_fire_projectile_elem5_loop" );   
  level._effect["shrimp_horde_right"]                    = LoadFX( "maps/vorkuta/fx_shrimp_horde_right" ); 
  level._effect["shrimp_horde_left"]                     = LoadFX( "maps/vorkuta/fx_shrimp_horde_left" );  
  level._effect["shrimp_horde_back1"]                    = LoadFX( "maps/vorkuta/fx_shrimp_horde_back1" ); 
  level._effect["shrimp_horde_back2"]                    = LoadFX( "maps/vorkuta/fx_shrimp_horde_back2" );     
  level._effect["dirt_falling_ceiling_1"]                = LoadFX( "maps/vorkuta/fx_dirt_falling_ceiling" );  
  level._effect["glass_shard_burst_lg"]                  = LoadFX( "maps/vorkuta/fx_glass_burst_large" ); 
  level._effect["glass_shard_burst_rappel"]              = LoadFX( "maps/vorkuta/fx_glass_burst_rappel" );    
  level._effect["steam_burst_1"]                         = LoadFX( "maps/vorkuta/fx_steam_burst_1_spawner" ); 
  level._effect["steam_flow_2"]                          = LoadFX( "maps/vorkuta/fx_steam_flow2" );     
  level._effect["water_drip_line"]                       = LoadFX( "env/water/fx_water_drip_xlight_line" );  
  level._effect["fog_low_mine"]                          = LoadFX( "maps/vorkuta/fx_smoke_env_low_fog_mine" ); 
  level._effect["fog_barrier_mine"]                      = LoadFX( "maps/vorkuta/fx_fog_barrier_mine" );     
  level._effect["sparks_burst_1"]                        = LoadFX( "maps/vorkuta/fx_sparks_burst_spawner" ); 
  level._effect["sparks_lock_burst"]                     = LoadFX( "maps/vorkuta/fx_sparks_lock_burst" );   
  level._effect["explosion_omaha_tower"]                 = LoadFX( "maps/vorkuta/fx_explosion_slingshot_1_omaha" ); 
  level._effect["explosion_starwars_charge"]             = LoadFX( "maps/vorkuta/fx_explosion_starwars_charge" );  
  level._effect["explosion_starwars_burst"]              = LoadFX( "maps/vorkuta/fx_explosion_starwars_burst" );   
  level._effect["explosion_starwars_gas"]                = LoadFX( "maps/vorkuta/fx_explosion_starwars_gas" ); 
  level._effect["explosion_armory_burst"]                = LoadFX( "maps/vorkuta/fx_explosion_armory_burst" ); 
  level._effect["explosion_helicopter"]                  = LoadFX( "maps/vorkuta/fx_explosion_helicopter" );  
  level._effect["explosion_helicopter2"]                 = LoadFX( "maps/vorkuta/fx_explosion_helicopter2" ); 
  level._effect["explosion_helicopter3"]                 = LoadFX( "maps/vorkuta/fx_explosion_helicopter3" );             
  level._effect["inclinator_dlight"]					           = LoadFX( "maps/vorkuta/fx_dlight_inclinator" );
  level._effect["omaha_muzzle_flash"]					           = LoadFX( "maps/vorkuta/fx_muzzleflash_distant" );  
  level._effect["slingshot_muzzle_flash"]					       = LoadFX( "maps/vorkuta/fx_tracer_large" );  
  level._effect["dust_door_burst"]					             = LoadFX( "maps/vorkuta/fx_dust_plume_door" );  
  level._effect["blowtorch_scorch_mark"]                 = LoadFX( "maps/vorkuta/fx_decal_blowtorch" );                            
                                                        
  
}

footsteps()
{
	clientscripts\_utility::setFootstepEffect( "dirt", LoadFx( "maps/vorkuta/fx_footstep_kickup_dust" ) );
	clientscripts\_utility::setFootstepEffect( "snow", LoadFx( "bio/player/fx_footstep_snow_ash" ) );
}

main()
{
	clientscripts\createfx\vorkuta_fx::main();
	clientscripts\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();

	footsteps();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

