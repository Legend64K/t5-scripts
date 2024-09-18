// Test clientside script for river

#include clientscripts\_utility;
#include clientscripts\_ambientpackage;

main()
{
	 clientscripts\river_fx::main();
	// _load!
	clientscripts\_load::main();

	// set up swimming
	clientscripts\_swimming::main();
	set_player_viewmodel( "viewmodel_usa_jungmar_wet_arms" );
//	thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\river_amb::main();



	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : river running...");
	
//	activateAmbientPackage( 0, "default", 0 );
//	activateAmbientRoom( 0, "default", 0 );		
}
