//
// file: flashpoint_fx.gsc
// description: clientside fx script for Cuba: setup, special fx functions, etc.
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
  // Ambient Effects
	level._effect["fx_cuba_candle"]                       = LoadFX("maps/cuba/fx_cuba_candle");   
	level._effect["fx_cuba_candle_smoke_only"]            = LoadFX("maps/cuba/fx_cuba_candle_smoke_only");	
	level._effect["fx_cuba_cigar_smoke"]                  = LoadFX("maps/cuba/fx_cuba_cigar_smoke"); 
	level._effect["fx_cuba_smk_ambient_room"]             = LoadFX("maps/cuba/fx_cuba_smk_ambient_room");	
	level._effect["fx_cuba_smk_ambient_room_md"]          = LoadFX("maps/cuba/fx_cuba_smk_ambient_room_md");		
	level._effect["fx_cuba_dust_motes_interior"]          = LoadFX("maps/cuba/fx_cuba_dust_motes_interior");
	level._effect["fx_cuba_window_break_bar"]             = LoadFX("maps/cuba/fx_cuba_window_break_bar");					
	level._effect["fx_cuba_insect_swarm"]                 = LoadFX("maps/cuba/fx_cuba_insect_swarm");
	level._effect["fx_cuba_moths_light"]                  = LoadFX("maps/cuba/fx_cuba_moths_light");				
	level._effect["fx_cuba_water_fountain"]               = LoadFX("maps/cuba/fx_cuba_water_fountain");
//	level._effect["fx_cuba_water_fountain_tilt"]          = LoadFX("maps/cuba/fx_cuba_water_fountain_tilt");							
	level._effect["fx_cuba_tinhat_light"]                 = LoadFX("maps/cuba/fx_cuba_tinhat_light");
	level._effect["fx_cuba_tinhat_light_lrg"]             = LoadFX("maps/cuba/fx_cuba_tinhat_light_lrg");		
	level._effect["fx_cuba_tinhat_light_interior"]        = LoadFX("maps/cuba/fx_cuba_tinhat_light_interior");				
	level._effect["fx_cuba_street_light"]                 = LoadFX("maps/cuba/fx_cuba_street_light");	
	level._effect["fx_cuba_street_light_sml"]             = LoadFX("maps/cuba/fx_cuba_street_light_sml");		
	level._effect["fx_cuba_street_battle_wind"]           = LoadFX("maps/cuba/fx_cuba_street_battle_wind");		
	level._effect["fx_cuba_seagulls"]                     = LoadFX("maps/cuba/fx_cuba_seagulls");			
	level._effect["fx_cuba_leaves_falling"]               = LoadFX("maps/cuba/fx_cuba_leaves_falling");
	level._effect["fx_cuba_bomb_explo"]                   = LoadFX("maps/cuba/fx_cuba_bomb_explo");		
	level._effect["fx_cuba_aa_flak_ambient_low"]          = LoadFX("maps/cuba/fx_cuba_aa_flak_ambient_low");	
	level._effect["fx_cuba_aa_flak_ambient_high"]         = LoadFX("maps/cuba/fx_cuba_aa_flak_ambient_high");	
	level._effect["fx_cuba_smk_column_sm_os"]             = LoadFX("maps/cuba/fx_cuba_smk_column_sm_os");			
	level._effect["fx_cuba_smk_column_sm"]                = LoadFX("maps/cuba/fx_cuba_smk_column_sm");			
	level._effect["fx_cuba_smk_column_md"]                = LoadFX("maps/cuba/fx_cuba_smk_column_md");				
	level._effect["fx_cuba_smk_column_xlg"]               = LoadFX("maps/cuba/fx_cuba_smk_column_xlg");	
	level._effect["fx_cuba_explo_hanger_sm"]              = LoadFX("maps/cuba/fx_cuba_explo_hanger_sm");
	level._effect["fx_cuba_explo_hanger_out"]             = LoadFX("maps/cuba/fx_cuba_explo_hanger_out");
	level._effect["fx_cuba_god_ray_short_wide"]           = LoadFX("maps/cuba/fx_cuba_god_ray_short_wide");		
	level._effect["fx_cuba_god_ray_med"]                  = LoadFX("maps/cuba/fx_cuba_god_ray_med");
	level._effect["fx_cuba_god_ray_lrg"]                  = LoadFX("maps/cuba/fx_cuba_god_ray_lrg");		
	level._effect["fx_cuba_god_ray_xlg"]                  = LoadFX("maps/cuba/fx_cuba_god_ray_xlg");		
	level._effect["fx_cuba_fire_line_sm"]                 = LoadFX("maps/cuba/fx_cuba_fire_line_sm");								
	level._effect["fx_fire_sm"]                           = LoadFX("env/fire/fx_fire_sm");
	level._effect["fx_fire_line_xsm_thin"]				        = LoadFX("env/fire/fx_fire_line_xsm_thin");		
	level._effect["fx_fire_detail_sm_nodlight"]			      = LoadFX("env/fire/fx_fire_detail_sm_nodlight");
	level._effect["fx_cuba_fire_detail_sm"]               = LoadFX("maps/cuba/fx_cuba_fire_detail_sm");		
	level._effect["fx_fire_ceiling_md_slow"]			        = LoadFX("env/fire/fx_fire_ceiling_md_slow");
	level._effect["fx_fire_md"]			                      = LoadFX("env/fire/fx_fire_md");					
	level._effect["fx_ash_embers_light"]				          = LoadFX("env/fire/fx_ash_embers_light");			
	level._effect["fx_ks_smoldering_tree"]				        = LoadFX("maps/khe_sanh/fx_ks_smoldering_tree");		
	level._effect["fx_cuba_bomb_crater"]                  = LoadFX("maps/cuba/fx_cuba_bomb_crater");
//	level._effect["fx_cuba_shrimp_left"]                  = LoadFX("maps/cuba/fx_cuba_shrimp_left");
//	level._effect["fx_cuba_shrimp_right"]                 = LoadFX("maps/cuba/fx_cuba_shrimp_right");		
//	level._effect["fx_cuba_shrimp_forward_left"]          = LoadFX("maps/cuba/fx_cuba_shrimp_forward_left");
//	level._effect["fx_cuba_shrimp_forward_right"]         = LoadFX("maps/cuba/fx_cuba_shrimp_forward_right");										
	level._effect["fx_cuba_c130_explo_finale"]            = LoadFX("maps/cuba/fx_cuba_c130_explo_finale");	
	level._effect["fx_cuba_ceiling_collapse"]             = LoadFX("maps/cuba/fx_cuba_ceiling_collapse");
	level._effect["fx_cuba_btr_explo"]                    = LoadFX("maps/cuba/fx_cuba_btr_explo");
	level._effect["fx_cuba_hand_stab"]                    = LoadFX("maps/cuba/fx_cuba_hand_stab");				
	level._effect["fx_cuba_window_break"]                 = LoadFX("maps/cuba/fx_cuba_window_break");			
	level._effect["fx_cuba_dest_light_pole"]              = LoadFX("maps/cuba/fx_cuba_dest_light_pole");		
	level._effect["fx_cuba_zip_landing"]                  = LoadFX("maps/cuba/fx_cuba_zip_landing");						
	level._effect["fx_cuba_hall_collapse"]                = LoadFX("maps/cuba/fx_cuba_hall_collapse");		
	level._effect["fx_cuba_cliff_rappel"]                 = LoadFX("maps/cuba/fx_cuba_cliff_rappel");		
	level._effect["fx_cuba_tower_collapse"]               = LoadFX("maps/cuba/fx_cuba_tower_collapse");
	level._effect["fx_cuba_fidel_bed"]                    = LoadFX("maps/cuba/fx_cuba_fidel_bed");
	level._effect["fx_cuba_embers_field_sm"]              = LoadFX("maps/cuba/fx_cuba_embers_field_sm");	
	level._effect["fx_cuba_dest_barricade"]               = LoadFX("maps/cuba/fx_cuba_dest_barricade");						
																									 	
}


main()
{
	precache_util_fx();
	precache_createfx_fx();	
	
	clientscripts\createfx\cuba_fx::main();
	clientscripts\_fx::reportNumEffects();


	disableFX = GetDvarInt( "disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}

	// SUMEET - mansion effects for chandeliers
	play_chandelier_fx();
}


// --- SUMEET'S SECTION ---//

precache_chandelier_fx()
{
	// SUMEET - mansion effects for chandeliers
	level._effect["chandelier_fx"]	= LoadFX("maps/cuba/fx_cuba_chandelier_med");	
}

play_chandelier_fx()
{
	precache_chandelier_fx();

	// grab all the chandeliers
	chandeliers = [];

	for( i = 1; i < 4; i++ )
	{
		chandelier = GetDynEnt( "chandelier" + i, "targetname" );
		chandelier thread play_chandelier_fx_internal();
	}
}

play_chandelier_fx_internal() // self = chandelier
{
	PlayFXOnDynEnt( level._effect["chandelier_fx"], self );
}

