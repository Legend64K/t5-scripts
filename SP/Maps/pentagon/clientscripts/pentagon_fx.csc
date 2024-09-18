//
// file: pentagon_fx.gsc
// description: clientside fx script for pentagon: setup, special fx functions, etc.
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
	level._effect["fx_pent_helipad_red_light"]            = LoadFX("maps/pentagon/fx_pent_helipad_red_light");			
	level._effect["fx_pent_hwy_sign_light"]               = LoadFX("maps/pentagon/fx_pent_hwy_sign_light");	
	level._effect["fx_pent_cigar_smoke"]                  = LoadFX("maps/pentagon/fx_pent_cigar_smoke");
	level._effect["fx_pent_street_light"]                 = LoadFX("maps/pentagon/fx_pent_street_light");
	level._effect["fx_pent_street_wind"]                  = LoadFX("maps/pentagon/fx_pent_street_wind");		
	level._effect["fx_pent_helo_treadfx"]                 = LoadFX("maps/pentagon/fx_pent_helo_treadfx");					
	level._effect["fx_pent_flag_light"]                   = LoadFX("maps/pentagon/fx_pent_flag_light");		
	level._effect["fx_glo_studio_light"]                  = LoadFX("maps/pentagon/fx_glo_studio_light");
	level._effect["fx_pent_tinhat_light"]                 = LoadFX("maps/pentagon/fx_pent_tinhat_light");
	level._effect["fx_pent_water_cooler_bubbles"]         = LoadFX("maps/pentagon/fx_pent_water_cooler_bubbles");				
	level._effect["fx_pent_lamp_desk_light"]              = LoadFX("maps/pentagon/fx_pent_lamp_desk_light");
	level._effect["fx_pent_security_camera"]              = LoadFX("maps/pentagon/fx_pent_security_camera");									
	level._effect["fx_pent_globe_projector"]              = LoadFX("maps/pentagon/fx_pent_globe_projector");
	level._effect["fx_pent_globe_projector_blue"]         = LoadFX("maps/pentagon/fx_pent_globe_projector_blue");		
	level._effect["fx_pent_movie_projector"]              = LoadFX("maps/pentagon/fx_pent_movie_projector");
	level._effect["fx_pent_tv_glow"]                      = LoadFX("maps/pentagon/fx_pent_tv_glow");		
	level._effect["fx_pent_tv_glow_sm"]                   = LoadFX("maps/pentagon/fx_pent_tv_glow_sm");				
	level._effect["fx_pent_smk_ambient_room"]             = LoadFX("maps/pentagon/fx_pent_smk_ambient_room");	
	level._effect["fx_pent_smk_ambient_room_lg"]          = LoadFX("maps/pentagon/fx_pent_smk_ambient_room_lg");		
	level._effect["fx_pent_smk_ambient_room_sm"]          = LoadFX("maps/pentagon/fx_pent_smk_ambient_room_sm");									
}


main()
{
	precache_util_fx();
	precache_createfx_fx();
	
	clientscripts\createfx\pentagon_fx::main();
	clientscripts\_fx::reportNumEffects();

	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

