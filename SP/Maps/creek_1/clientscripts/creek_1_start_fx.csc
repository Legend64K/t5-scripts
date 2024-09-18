//
// file: creek_1_start_fx.gsc
// description: clientside fx script for creek_1_start: setup, special fx functions, etc.
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
	level._effect["a_fire_lg_fuel"]									= loadfx("env/fire/fx_fire_lg_fuel");
}


main()
{
	precache_util_fx();
	precache_createfx_fx();
	
	clientscripts\createfx\creek_1_start_fx::main();
	clientscripts\_fx::reportNumEffects();
	
	disableFX = GetDvarInt( #"disable_fx" );
	if( !IsDefined( disableFX ) || disableFX <= 0 )
	{
		precache_scripted_fx();
	}
}

