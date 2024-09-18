// Test clientside script for flashpoint

#include clientscripts\_utility;
#include clientscripts\_filter;
//#include clientscripts\_gasmask;

main()
{
	// Keep this here for CreateFX
	clientscripts\flashpoint_fx::main();
	
	level._uses_crossbow = true;
	
	// _load!
	clientscripts\_load::main();
	
	init_flags();
	register_clientflag_callback("actor", level.ACTOR_CHARRING, ::actor_flag_charring_handler);


	//precache_scripted_fx(); // This is precached in flashpoint_fx.csc
	
	//thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\flashpoint_amb::main();
	
	//thread clientscripts\_gasmask::init();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : flashpoint running...");
	
	level thread setup_fullscreen_postfx();
	
	level thread setup_wristwatch();
	
	//level thread clientscripts\_driving_fx::init();
	
	level thread client_diorama_fx();
	
	level thread client_diorama_fx_3();
}



init_flags()
{
	// Client Flags -- Match these in level
	level.SCRIPTMOVER_CHARRING			= 1;
	level.ACTOR_CHARRING				= 2;
}

actor_flag_charring_handler(localClientNum, set, newEnt)
{
	self mapshaderconstant( localClientNum, 0, "ScriptVector0" ); 

	println("*** Client : flag callback good");
	self enable_charring(localClientNum, set);
}


enable_charring(localClientNum, set)
{
	self endon("death");
	println("*** Client : charring actor in progress");

	if( is_mature() )
	{
		if(set)
		{
			vec0_val0_specular = 0;
			vec0_val1_dummy = 0;
			vec0_val2_char = 0;
			vec0_val3_dummy = 0;

			while(vec0_val2_char < 0.85)
			{
				println("*** Client : character is burning");
				//vec0_val0_specular += 0.01;
				//vec0_val1_dummy += 0.01;
				vec0_val2_char += 0.28;
				//vec0_val3_dummy += 0.01;

				self setshaderconstant( localClientNum, 0, vec0_val0_specular, vec0_val1_dummy, vec0_val2_char, vec0_val3_dummy );
				
				wait(0.1);
			}
		}
	}
}


// This is precached in flashpoint_fx.csc
//precache_scripted_fx()
//{
//	level._effect["fx_diorama_launchpad_smk"]					= loadfx("maps/flashpoint/fx_diorama_launchpad_smk");					// 1340
//}

client_diorama_fx_3()
{
	level waittill( "start_diorama_fx_3" );
	
	// Jet trails
	position = ( 3653.93, 4036.48, 3452.28 );
	angle = ( 0, 216, 0 );
	forwardVec = VectorNormalize( AnglesToForward(angle) );
	upVec = VectorNormalize( AnglesToUp(angle) );
	PlayFx( 0, level._effect["fx_diorama_jet_trail"], position, forwardVec, upVec, -120 );
	
	position = ( 3925.52, 4921.48, 3400.74 );
	angle = ( 0, 216, 0 );
	forwardVec = VectorNormalize( AnglesToForward(angle) );
	upVec = VectorNormalize( AnglesToUp(angle) );
	PlayFx( 0, level._effect["fx_diorama_jet_trail"], position, forwardVec, upVec, -212 );
	
	// Dirt squibs
//	position = ( -2840.93, -498.58, 326.443 );
//	angle = ( 295.093, 19.4842, -0.600318 );
//	forwardVec = VectorNormalize( AnglesToForward(angle) );
//	upVec = VectorNormalize( AnglesToUp(angle) );
//	PlayFx( 0, level._effect["fx_diorama_impact_dirt"], position, forwardVec, upVec, 0 );
	
	// The second squib is an exploder.
	
	level waittill( "end_diorama_fx_3" );
	// how do you stop a PlayFX()?
}

client_diorama_fx()
{
	level waittill( "start_diorama_smoke" );
	
	position = ( -7144.55, 3909.52, 1068.89 );
	angle = ( 286.085, 262.154, -29.17 );
	forwardVec = VectorNormalize( AnglesToForward(angle) );
	upVec = VectorNormalize( AnglesToUp(angle) );
	PlayFx( 0, level._effect["fx_diorama_launchpad_smk"], position, forwardVec, upVec, -90 );
	
	position = ( -6076.94, 3432.09, 832.125 );
	angle = ( 270, 4.76364, -132.764 );
	forwardVec = VectorNormalize( AnglesToForward(angle) );
	upVec = VectorNormalize( AnglesToUp(angle) );
	PlayFx( 0, level._effect["fx_diorama_launchpad_smk"], position, forwardVec, upVec, -130 );
	
	level waittill( "end_diorama_smoke" );
	// how do you stop a PlayFX()?
}

setup_wristwatch()
{
	while (1)
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


setup_fullscreen_postfx()
{
	while (1)
	{
		waitforclient(0);
	
		// Still testing
		init_filter_tvguided( getlocalplayers()[0] );
		init_filter_binoculars( getlocalplayers()[0] );
		//init_filter_superflare( getlocalplayers()[0], "generic_filter_superflare" );
		//enable_filter_superflare( getlocalplayers()[0], "generic_filter_superflare", 1, 0, 120, 2326, -9000, 1400, 1.0, -0.1 );
		//enable_filter_superflare( getlocalplayers()[0], "generic_filter_superflare", 1, 1, 120, -1326, -10000, 600, 1.0, 20 );
		
		//init_filter_gasmask( getlocalplayers()[0] );
		
		level thread binoculars_listener();
		//level thread gasmask_listener();
		level waittill("save_restore");
	}	
}


binoculars_cleanup()
{
	level waittill_either( "kill_binoculars", "save_restore" );
	disable_filter_binoculars( getlocalplayers()[0], 0, 0 );
}

binoculars_listener()
{
	level endon( "kill_binoculars" );
	level endon( "save_restore" );
	
	level thread binoculars_cleanup();
	
	binoculars = false;
	while( 1 )
	{
		level waittill( "toggle_binoculars" );
		
		if( !binoculars )
		{
			enable_filter_binoculars( getlocalplayers()[0], 0, 0 );
			binoculars = true;
		}
		else
		{
			disable_filter_binoculars( getlocalplayers()[0], 0, 0 );
			binoculars = false;
		}
		
		wait( 0.05 );
	}
}


// gasmask_cleanup()
// {
// 	level waittill( "kill_gasmask" );
// 	disable_filter_gasmask( getlocalplayers()[0], 0, 0 );
// }
// 
// gasmask_listener()
// {
// 	level endon( "kill_gasmask" );
// 	
// 	level thread gasmask_cleanup();
// 	
// 	gasmask = false;
// 	while( 1 )
// 	{
// 		level waittill( "toggle_gasmask" );
// 		
// 		if( !gasmask )
// 		{
// 			enable_filter_gasmask( getlocalplayers()[0], 0, 0 );
// 			gasmask = true;
// 		}
// 		else
// 		{
// 			disable_filter_gasmask( getlocalplayers()[0], 0, 0 );
// 			gasmask = false;
// 		}
// 		
// 		wait( 0.05 );
// 	}
// }
