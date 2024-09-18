// Test clientside script for kowloon

#include clientscripts\_utility;
#include clientscripts\_filter;

main()
{
	level.CLIENT_FACE_BLEED_FLAG	= 2;	// Blood dripping from clarke's face.
	level.CLIENT_NOVA6_FLAG			= 3;	// Nova 6 gas shader on spetsnaz
	level.CLIENT_WET_FLAG			= 4;	// Player's/Actor's wetness
	//level.CLIENT_GAS_FLAG 			= 5;

	// Keep this here for CreateFx
	clientscripts\kowloon_fx::main();
	
	// _load!
	clientscripts\_load::main();

	register_clientflag_callback("actor", level.CLIENT_FACE_BLEED_FLAG, ::actor_flag_clark_bloody_face_handler);
	//register_clientflag_callback("actor", level.CLIENT_NOVA6_FLAG,		::actor_flag_nova6_death_handler);
	register_clientflag_callback("scriptmover", level.CLIENT_NOVA6_FLAG,  ::scriptmover_gassed_handler);
	register_clientflag_callback("actor", level.CLIENT_WET_FLAG,		::actor_flag_wet_handler);
	register_clientflag_callback("player", level.CLIENT_WET_FLAG,		::player_flag_wet_handler);

	//thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\kowloon_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	init_filter_infrared( getlocalplayers()[0] ); 
	init_filter_scope( getlocalplayers()[0] ); 

	println("*** Client : kowloon running...");

	thread setup_wristwatch();

	clientscripts\_zombiemode_weap_thundergun::init();
}

// Client flag handlers
actor_flag_clark_bloody_face_handler(localClientNum, set, newEnt)
{
	PrintLn("**** GPT BLOOD ON FACE HANDLER");
	self thread clarke_blood_on_face(localClientNum, set);	
}

actor_flag_nova6_death_handler(localClientNum, set, newEnt)
{
	PrintLn(" **** N6 death");
	self thread nova6_death(localClientNum, set);	
}

actor_flag_wet_handler(localClientNum, set, newEnt)
{
	self endon( "death" );

	PrintLn(" **** Actor Wet");
	self thread wetness(localClientNum, set, 0.7 );	
}

player_flag_wet_handler(localClientNum, set, newEnt)
{
	PrintLn(" **** Player Wet");
	self thread wetness(localClientNum, set, 1.0 );	
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
	self endon( "death" );

	self mapshaderconstant( localClientNum, 0, "scriptVector0", 0.0, 0.0, 0.0, 0.0 );

	bubbling_amount = 0.0;
	gas_amount = 0.0;
	not_used = 0;

	gas_vel = 0.075;
	bubble_vel = 0.5;

	while (gas_amount < 1.0)
	{
		gas_amount += gas_vel * 0.05;
		if (gas_amount > 1.0)
		{
			gas_amount = 1.0;
		}

		self setshaderconstant( localClientNum, 0, not_used, bubbling_amount, gas_amount, not_used );

		wait(0.05);
	}

//	self waittill("death");

	//wait(1.0);

	//while (bubbling_amount < 1.0)
	//{
	//	bubbling_amount += bubble_vel * 0.05;
	//	if (bubbling_amount > 1.0)
	//	{
	//		bubbling_amount = 1.0;
	//	}

	//	self setshaderconstant( localClientNum, 0, not_used, bubbling_amount, gas_amount, not_used );

	//	wait(0.05);
	//}
}

//
//	Make blood come down Clarke's face
clarke_blood_on_face(localClientNum, set)
{	
	self endon( "death" );

	self mapshaderconstant( localClientNum, 0, "ScriptVector0" ); // decay 0 to 0.83
	
	if(set)
	{
		PrintLn("*** BLOOD ON FACE");
		blood = 0;
		while( blood < 0.74)
		{
			blood += 0.01;
			PrintLn(blood);
			// Set the clientnum, bit set, param0, param1, param2, param3
			self setshaderconstant( localClientNum, 0, 0, blood, 0, 0 );
			wait(0.1);
		}			
	}
}


//
//	Spetsnaz hit with Nova6
nova6_death(localClientNum, set)
{	
	self endon( "death" );

	self mapshaderconstant( localClientNum, 0, "ScriptVector0" ); // decay 0 to 0.83
	
	if(set)
	{
		PrintLn(" **** In N6 death");
		decay = 0;
		while( decay < 0.8)
		{
			decay += 0.05;
			// Set the clientnum, bit set, param0, param1, param2, param3
			self setshaderconstant( localClientNum, 0, 0, 0, decay, 0 );
			wait(0.1);
		}			
	}
}


//
//	Make character get wet or dry off
wetness(localClientNum, set, max_wetness )
{
	self notify( "stop_wetness" );
	self endon( "stop_wetness" );
	self endon( "death" );

	self mapshaderconstant( localClientNum, 0, "ScriptVector0" ); // decay 0 to 1.0
	
	if ( !IsDefined( self.wetness ) )
	{
		self.wetness = 0;
		self setshaderconstant( localClientNum, 0, 0, self.wetness, 0, 0 );
	}

	if(set)
	{
		delta = 0.01;	// Get wet
	}
	else
	{
		delta = -0.002;	// dry off
	}

	PrintLn(" **** In Wetness");
	done = false;
	while( !done )
	{
		if( !IsDefined( self ) || !IsDefined( self.wetness ))
		{
			return;
		}

		self.wetness += delta;
		if ( self.wetness < 0 )
		{
			self.wetness = 0;
			done = true;
		}
		else if ( self.wetness > max_wetness )
		{
			self.wetness = max_wetness;
			done = true;
		}

		// Set the clientnum, bit set, param0, param1, param2, param3
		self setshaderconstant( localClientNum, 0, 0, self.wetness, 0, 0 );
		wait(0.05);
	}
}


instant_wetness(localClientNum, set)
{
	self setshaderconstant( localClientNum, 0, 0, 1.0, 0, 0 );
}


//
//
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
		getlocalplayers()[0] SetWatchStyle(1);
		level waittill("save_restore");
	}
}
