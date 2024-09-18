// Test clientside script for rebirth

#include clientscripts\_utility;
#include clientscripts\_filter;

main()
{
	// _load!
	clientscripts\_load::main();

	register_clientflag_callback("scriptmover", 0, ::scriptmover_gassed_handler);
	register_clientflag_callback("actor", 0, ::scriptmover_gassed_handler);

	clientscripts\rebirth_fx::main();

	//thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\rebirth_amb::main();

	thread clientscripts\_gasmask::init();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	init_filter_infrared( getlocalplayers()[0] );
	//init_filter_teargas( getlocalplayers()[0] );
	//enable_filter_teargas( getlocalplayers()[0], 0, 1.0 );
	//set_filter_teargas_amount( getlocalplayers()[0], 0, 1.0 );
	//disable_filter_teargas( getlocalplayers()[0], 0 );
	
	println("*** Client : rebirth running...");
	
	thread setup_wristwatch();
	
	player = getlocalplayers()[0];
	player SetInfraredVisionset( "infrared_rebirth" );
}

setup_wristwatch()
{
	while(1)
	{
		waitforclient(0);
		//setup the ui3d and wristwatch
		ui3dsetwindow( 0, 0, 0, 0.125, 0.25 );
		ui3dsetwindow( 1, 0.25, 0, 0.25, 0.5 );
		ui3dsetwindow( 2, 0.5, 0, 0.5, 0.5 );
		ui3dsetwindow( 3, 0, 0.5, 0.25, 0.5 );
		ui3dsetwindow( 4, 0.25, 0.5, 0.25, 0.5 );
		ui3dsetwindow( 5, 0.5, 0.5, 0.5, 0.5 );
		showUI(0, "WristWatch", 1);
		getlocalplayers()[0] SetWatchStyle(0);
		level waittill("save_restore");
	}
} 

scriptmover_gassed_handler(localClientNum, set, newEnt)	
{		   
	if (set)
	{
		self thread character_gets_gassed(localClientNum);
	}	
}

//------------------------------------
// Gas FX
character_gets_gassed(localClientNum)
{
	self mapshaderconstant( localClientNum, 0, "scriptVector0", 0.0, 0.0, 0.0, 0.0 );

	bubbling_amount = 0.0;
	gas_amount = 0.0;
	not_used = 0;

	gas_vel = 0.07;
	bubble_vel = 0.5;

	while ( IsDefined( self ) && gas_amount < 1.0 )
	{
		gas_amount += gas_vel * 0.03;
		if (gas_amount > 1.0)
		{
			gas_amount = 1.0;
		}

		self setshaderconstant( localClientNum, 0, not_used, bubbling_amount, gas_amount, not_used );

		wait(0.05);
	}

//	self waittill("death");

	wait(1.0);

	while ( IsDefined( self ) && bubbling_amount < 1.0 )
	{
		bubbling_amount += bubble_vel * 0.05;
		if (bubbling_amount > 1.0)
		{
			bubbling_amount = 1.0;
		}

		self setshaderconstant( localClientNum, 0, not_used, bubbling_amount, gas_amount, not_used );

		wait(0.05);
	}
}