//
// file: river_fx.gsc
// description: clientside fx script for river: setup, special fx functions, etc.
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


// --- BARRY'S SECTION ---//
precache_createfx_fx()
{
//	level._effect["fx_fire_sm"]                          = LoadFX("env/fire/fx_fire_sm");
	level._effect["fx_fire_sm"]                       = LoadFX("maps/river/fx_river_campfire_sm");	
	level._effect["fx_river_woodbridge_explo"]        = LoadFX("maps/river/fx_river_woodbridge_explo");
	level._effect["fx_river_woodbridge_splash"]       = LoadFX("maps/river/fx_river_woodbridge_splash");	
//	level._effect["fx_cloud_layer"]                   = loadfx("maps/in_country/fx_cloud_layer_treetop_invert");	
	level._effect["fx_cloud_layer_glow"]                 = loadfx("maps/in_country/fx_cloud_layer_fire_close");			
	level._effect["fx_water_river_wash_mild"]		    	= loadfx("maps/in_country/fx_water_wash_mild");		
	level._effect["fx_water_splash_waterfall"]		   	= loadfx("maps/in_country/fx_water_splash_waterfall_loop");		
	level._effect["fx_ambient_fog_lg"]					      = loadfx("maps/in_country/fx_ambient_fog_lg");
	level._effect["fx_ambient_fog_lg_2"]					      = loadfx("maps/in_country/fx_ambient_fog_lg");	
	
	level._effect["fx_bats_circling"]						 	   	= loadfx("maps/in_country/fx_bats_circling");	
//	level._effect["fx_birds_circling"]						 	  = loadfx("maps/in_country/fx_birds_circling");	
//	level._effect["fx_insects_ambient"]								= loadfx("maps/creek/fx_insect_swarm");	
	level._effect["fx_insects_dragonflies_ambient"]		= loadfx("bio/insects/fx_insects_dragonflies_ambient");

	level._effect["fx_river_fire_embers_distant"]     = LoadfX("maps/river/fx_river_fire_embers_distant");	
	level._effect["fx_river_fire_outdoor_line_sm"]    = LoadfX("maps/river/fx_river_fire_outdoor_line_sm");		
	level._effect["fx_river_fire_lg"]                 = LoadfX("maps/river/fx_river_fire_outdoor_md");		
	level._effect["fx_river_fire_outdoor_sm"]         = LoadfX("maps/river/fx_river_fire_outdoor_sm");	
	level._effect["fx_river_campfire_sm"]             = LoadfX("maps/river/fx_river_campfire_sm");		
	level._effect["fx_river_smoke_fire_distant"]      = LoadfX("maps/river/fx_river_smoke_fire_distant");	
	level._effect["fx_river_smoke_fire_distant_sm"]   = LoadfX("maps/river/fx_river_smoke_fire_distant_sm");	
	level._effect["fx_river_smoke_fire_distant_xsm"]  = LoadfX("maps/river/fx_river_smoke_fire_distant_xsm");			
	level._effect["fx_river_water_wash_med"]          = LoadfX("maps/river/fx_river_water_wash_med");	
	level._effect["fx_river_water_wash_lg"]           = LoadfX("maps/river/fx_river_water_wash_lg");			
	level._effect["fx_river_sparks_small_loop"]       = LoadfX("maps/river/fx_river_sparks_small_loop");	
	level._effect["fx_river_fireflies"]               = LoadfX("maps/river/fx_river_insects_fireflies_ambient");
	level._effect["fx_dlight_red"]                    = LoadfX("maps/river/fx_river_dlight_red");		
  level._effect["fx_flare_sky_red"]                 = LoadfX("maps/river/fx_river_flare_red");	
  level._effect["fx_waterfall_xsm"]                 = LoadfX("maps/river/fx_river_waterfall_xsm");	  
  level._effect["fx_waterfall_med"]                 = LoadfX("maps/river/fx_river_waterfall_med");	 
  level._effect["fx_waterfall_sm"]                  = LoadfX("maps/river/fx_river_waterfall_sm");	
  level._effect["fx_godrays_xlg"]                   = LoadfX("maps/river/fx_river_godrays_xlg");	   
  level._effect["fx_godrays_lg"]                    = LoadfX("maps/river/fx_river_godrays_lg");	
  level._effect["fx_godrays_sm"]                    = LoadfX("maps/river/fx_river_godrays_sm");	 
  level._effect["fx_godrays_xsm"]                   = LoadfX("maps/river/fx_river_godrays_xsm");	   
  level._effect["fx_dust_falling"]                  = LoadfX("maps/river/fx_river_dust_falling");	 
  level._effect["fx_dust_kickup"]                   = LoadfX("maps/river/fx_river_dust_kickup");	  
  level._effect["fx_fog_mountain"]                  = LoadfX("maps/river/fx_river_fog_mountain");	
  level._effect["fx_glow_lamp"]                     = LoadfX("maps/river/fx_river_glow_lamp");	 
  
  
	level._effect["fx_boat_drop_splash"]                 = LoadFX("vehicle/water/fx_wake_pbr_boat_drop_splash"); 
	
 	level._effect["fx_river_fire_line_sm_nosmk"]      = LoadfX("maps/river/fx_river_fire_line_sm_nosmk");
 	level._effect["fx_river_fire_sm_nosmk"]           = LoadfX("maps/river/fx_river_fire_sm_nosmk");	
 	level._effect["fx_river_fire_lg_nosmk"]           = LoadfX("maps/river/fx_river_fire_lg_nosmk"); 	          					
				
}


main()
{
	clientscripts\createfx\river_fx::main();
	clientscripts\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
	
	level._customVehicleCBFunc = clientscripts\river_fx::vehicle_callback;
}


vehicle_callback( localClientNum )
{
	if( self.vehicletype == "boat_pbr_player" )
	{
		self thread player_boat_collision_thread( localClientNum );
	}
}


player_boat_collision_thread( localClientNum )
{
	self endon( "entityshutdown" );
	
	while( 1 )
	{
		self waittill( "veh_collision", hip, hitn, hit_intensity, stype, hitent );
		
		PrintLn( "veh_collision! type = " + stype );

		if( IsDefined(hitent) && hitent.type == "vehicle" )
		{
			//PrintLn( "veh_collision - hit vehicle! type = " + hitent.vehicletype );
			
			if( hitent.vehicletype == "boat_pbr" )  // friendly pbrs
			{
				PlaySound( localClientNum, "evt_boat_hit_metal", ( 0, 0, 0 ) );
			}
			else if( hitent.vehicletype == "boat_sampan_physics" ) // sampans
			{
				PlaySound( localClientNum, "evt_boat_hit_wood", ( 0, 0, 0 ) );
			}
			else if( hitent.vehicletype == "boat_patrol_nva" )  // boss boat
			{
				PlaySound( localClientNum, "evt_boat_hit_metal", ( 0, 0, 0 ) );
			}
		}
		else if( stype == "wood" )
		{
			PlaySound( localClientNum, "evt_boat_hit_wood", ( 0, 0, 0 ) );
		}
		
		//self GetLocalClientOnVehicle( localClientNum );
		
		player = getlocalplayer( localClientNum );
		
		if( IsDefined( player ) )
		{
			// todo - play sound here also
			if( hit_intensity > 15 )
			{
				player PlayRumbleOnEntity( localClientNum, "damage_heavy" );
			}
			else
			{
				player PlayRumbleOnEntity( localClientNum, "damage_light" );
			}
		}
	}
}