//
// file: int_escape_fx.gsc
// description: clientside fx script for int_escape: setup, special fx functions, etc.
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
	level._effect["fx_nix_tunnel_ramp_up"]				 = loadfx("maps/interrogation_escape/fx_misc_nix_tunnel_ramp_up"); // 4001	
	level._effect["fx_nix_ship_numbers"]					 = loadfx("maps/interrogation_escape/fx_misc_nix_ship_numbers"); // 903

	level._effect["fx_interrog_ship_num_explo1"]	  = loadfx("maps/interrogation_escape/fx_interrog_ship_num_explo1"); 
	level._effect["fx_interrog_ship_num_explo2"]	  = loadfx("maps/interrogation_escape/fx_interrog_ship_num_explo2");
	
	level._effect["fx_nix_numbers"]							     = loadfx("misc/fx_misc_nix_numbers");
	level._effect["fx_nix_numbers_mover"]				     = loadfx("misc/fx_misc_nix_numbers_mover");
	level._effect["fx_nix_numbers_pc"]						   = loadfx("misc/fx_misc_nix_numbers_pc");
	level._effect["fx_misc_nix_num_ceiling_pc"]		   = loadfx("misc/fx_misc_nix_numbers_cl_pc");
	level._effect["fx_nix_numbers_rotate"]				   = loadfx("misc/fx_misc_nix_numbers_rotate");
  level._effect["fx_nix_numbers_sphere"]				   = loadfx("misc/fx_misc_nix_numbers_sphere");
  level._effect["fx_nix_numbers_wall"]				     = loadfx("misc/fx_misc_nix_numbers_wall");
  
	level._effect["fx_fog_low"]								= loadfx("env/smoke/fx_fog_low");
	level._effect["fx_fog_low_sm"]						= loadfx("env/smoke/fx_fog_low_sm");
	level._effect["fx_cig_smoke"]							= loadfx("env/smoke/fx_cig_smoke_front_end");
	level._effect["fx_fog_low_hall_500"]			= loadfx("env/smoke/fx_fog_low_hall_500");
	level._effect["fx_dust_motes_lg"]					= loadfx("maps/frontend/fx_frontend_dust_motes_lg");
	level._effect["fx_dust_motes_sm"]					= loadfx("maps/frontend/fx_frontend_dust_motes_sm");
	level._effect["fx_light_ceiling"]					= loadfx("maps/frontend/fx_light_ceiling");	
	level._effect["fx_light_chair_flood"]			= loadfx("maps/frontend/fx_light_chair_flood");
	
	level._effect["fx_water_faucet_drip_fast"]		  = loadfx("env/water/fx_water_faucet_drip_fast");
	level._effect["fx_interrog_morgue_mist"]	      = loadfx("maps/interrogation_escape/fx_interrog_morgue_mist");	
	level._effect["fx_interrog_blink_red_light"]	  = loadfx("maps/interrogation_escape/fx_interrog_blink_red_light");	
	level._effect["fx_interrog_god_ray_xlg"]	      = loadfx("maps/interrogation_escape/fx_interrog_god_ray_xlg");	
	level._effect["fx_interrog_little_bubbles"]	    = loadfx("maps/interrogation_escape/fx_interrog_little_bubbles");
	level._effect["fx_interrog_cart_cig_smk"]	      = loadfx("maps/interrogation_escape/fx_interrog_cart_cig_smk");
	level._effect["fx_interrog_battery_spark"]	    = loadfx("maps/interrogation_escape/fx_interrog_battery_spark");						
	level._effect["fx_interrog_movie_projector"]	  = loadfx("maps/interrogation_escape/fx_interrog_movie_projector");					
	level._effect["fx_interrog_studio_light"]	      = loadfx("maps/interrogation_escape/fx_interrog_studio_light");
	level._effect["fx_interrog_light_beam"]	        = loadfx("maps/interrogation_escape/fx_interrog_light_beam");	
	level._effect["fx_interrog_light_sm"]	          = loadfx("maps/interrogation_escape/fx_interrog_light_sm");			
	level._effect["fx_interrog_tv_glow"]	          = loadfx("maps/interrogation_escape/fx_interrog_tv_glow");
	level._effect["fx_interrog_rocket_smk"]	        = loadfx("maps/interrogation_escape/fx_interrog_rocket_smk");
	level._effect["fx_interrog_rocket_coolant"]	    = loadfx("maps/interrogation_escape/fx_interrog_rocket_coolant");
	level._effect["fx_interrog_steam_cup"]	        = loadfx("maps/interrogation_escape/fx_interrog_steam_cup");
	level._effect["fx_interrog_drips"]	            = loadfx("maps/interrogation_escape/fx_interrog_drips");
	level._effect["fx_interrog_ship_num_lg"]	      = loadfx("maps/interrogation_escape/fx_interrog_ship_num_lg");
	level._effect["fx_interrog_ship_num_sm"]	      = loadfx("maps/interrogation_escape/fx_interrog_ship_num_sm");
						
	level._effect["fx_interrog_ceiling_dust"]	      = loadfx("maps/interrogation_escape/fx_interrog_ceiling_dust");
	level._effect["fx_interrog_ceiling_dest"]	      = loadfx("maps/interrogation_escape/fx_interrog_ceiling_dest");
	level._effect["fx_interrog_win_numbers"]	      = loadfx("maps/interrogation_escape/fx_interrog_win_numbers");		
	
	level._effect["fx_interrog_dest_tv"]	          = loadfx("maps/interrogation_escape/fx_interrog_dest_tv");	
	level._effect["fx_interrog_dest_tv_sparks"]	    = loadfx("maps/interrogation_escape/fx_interrog_dest_tv_sparks");															
		
	level._effect["fx_axis_marker"]						= loadfx("fx_tools/fx_tools_axis_sm");
	
	level._effect["test_spin_fx"] = LoadFX( "env/light/fx_light_warning");
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
	clientscripts\createfx\int_escape_fx::main();
	clientscripts\_fx::reportNumEffects();
	
	precache_util_fx();
	precache_createfx_fx();
	
	footsteps();
	
	disableFX = GetDvarInt( "disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

