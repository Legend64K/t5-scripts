// Test clientside script for int_escape

#include clientscripts\_utility;

main()
{
	// Keep this here for CreateFx
	clientscripts\int_escape_fx::main();
	
	level.CLIENT_REZNOV_PROJECTOR_ON_INTRO = 64;
	level.CLIENT_REZNOV_PROJECTOR_ON_MOVIE = 65;
	level.CLIENT_REZNOV_PROJECTOR_ON_OUTRO = 66;
	level.CLIENT_REZNOV_MOVIE_SMALL = 67;
	level.CLIENT_REZNOV_PROJETOR_OFF = 68;
	level.CLIENT_REZNOV_ROOM_INIT = 69;
	level.CLIENT_MORGUE_DOOR_STATIC				 = 70;
	level.CLIENT_MORGUE_DOOR_TWEAK  			 = 71;
	level.CLIENT_MORGUE_DOOR_LEFT_FLASHES = 72;
	level.CLIENT_MORGUE_DOOR_RIGHT_FLASHES = 73;
	
	level.CLIENT_RUSALKA_LETTERS_BINK = 200;
	level.CLIENT_RUSALKA_LETTERS_BINK_FADE = 201;
	
	level.small_reznov_movie_num = 0;
	// _load!
	clientscripts\_load::main();

	level._client_flagasval_callbacks["scriptmover"] = ::bink_monitor_handler;

	//thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\int_escape_amb::main();


	// This needs to be called after all systems have been registered.
	waitforclient(0);
	
	thread setup_ui3d();
	thread fov_lerps();

	PrintLn("*** Client : int_escape running...");
}

// self == ent that has the flag set or clear on it.
bink_monitor_handler(localClientNum, val) 
{
	if (val<level.CLIENT_REZNOV_PROJECTOR_ON_INTRO)
	{
		self mapshaderconstant( 0, 0, "scriptVector0" ); 
		self setshaderconstant( 0, 0, val, 0, 0, 0 );
	}
	else if (val == level.CLIENT_REZNOV_ROOM_INIT)
	{
		self mapshaderconstant( localClientNum, 0, "scriptVector0" );
		self mapshaderconstant( localClientNum, 1, "scriptVector1" );
	}
	else if (val == level.CLIENT_REZNOV_PROJECTOR_ON_INTRO)
	{
		self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
		self setshaderconstant( localClientNum, 1, 0.5, 0.75, 0.75, 1 );
	}
	else if (val == level.CLIENT_REZNOV_PROJECTOR_ON_MOVIE)
	{
		self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
		self setshaderconstant( localClientNum, 1, 0, 0, 0.5, 0.5  );
	}
	else if (val == level.CLIENT_REZNOV_PROJECTOR_ON_OUTRO)
	{
		self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
		self setshaderconstant( localClientNum, 1, 0, 0.5, 0.5, 1);
	}
	else if (val == level.CLIENT_REZNOV_MOVIE_SMALL)
	{
		self play_small_reznov_movie(localClientNum);
	}
	else if (val == level.CLIENT_REZNOV_PROJETOR_OFF)
	{
		self setshaderconstant( localClientNum, 0, 0, 0, 0, 0 );
	}
	else if (val == level.CLIENT_MORGUE_DOOR_LEFT_FLASHES)
	{
		self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
		self setshaderconstant( localClientNum, 1, 0, 0, 0.5, 0.5);  
	}
	else if (val == level.CLIENT_MORGUE_DOOR_RIGHT_FLASHES)
	{
		self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
		self setshaderconstant( localClientNum, 1, 0.5, 0, 1, 0.5);
	}
	else if (val == level.CLIENT_MORGUE_DOOR_STATIC)
	{
		self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
		self setshaderconstant( localClientNum, 1, 0, 0.5, 0.5, 1);  
	}
	else if (val == level.CLIENT_MORGUE_DOOR_TWEAK)
	{
		self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
		self setshaderconstant( localClientNum, 1, 0.5, 0.5, 1, 1);
	}
		
	else if ( val == level.CLIENT_RUSALKA_LETTERS_BINK)
	{
		self mapshaderconstant( localClientNum, 0, "scriptVector0" );
		//self setshaderconstant(localClientNum,  0, 1, 0, 0, 0.05 );
		self setshaderconstant(localClientNum,  0, 1, 1, 0.87, 0.8 );
		PrintLn("doing_rusala_bink");
		 
		self mapshaderconstant( localClientNum, 1, "scriptVector1" );
		//self setshaderconstant(localClientNum,  1, 1, 1, 1, 1 );
		self setshaderconstant(localClientNum,  1, 1, 1, 1, 0 );
	}
	
	else if ( val == level.CLIENT_RUSALKA_LETTERS_BINK_FADE)
	{
		for (i=1; i < 100; i++)
		{
			letter_alpha = 0.8 - (0.8*(i/100) );
			blue = 0.87 - (0.87*(i/100) );
			green = 1 - (i/100);
			//self mapshaderconstant( localClientNum, 0, "scriptVector0" );
			self setshaderconstant(localClientNum,  0, 1, green, blue, letter_alpha );
			bink_alpha = i/100;
			//self mapshaderconstant( localClientNum, 1, "scriptVector1" );
			self setshaderconstant(localClientNum,  1, 1, 0, 0, bink_alpha );
			wait 0.05;
		}
		self setshaderconstant(localClientNum,  0, 1, 0, 0, 0.05 );
		
		
	}
}	
	
play_small_reznov_movie(localClientNum)
{
	if (level.small_reznov_movie_num > 5)
	{
		level.small_reznov_movie_num = 0;
	}
	level.small_reznov_movie_num++;
	
	switch (level.small_reznov_movie_num )
	{
		case 1:
		{
			self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
			self setshaderconstant( localClientNum, 1, 0.5, 0, 0.75, 0.25 );
		}
		break;		
		case 2:
		{
			self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
			self setshaderconstant( localClientNum, 1, 0.75, 0, 1, 0.25 );
		}
		break;		
		case 3:
		{
			self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
			self setshaderconstant( localClientNum, 1, 0.5, 0.25, 0.75, 0.5 );
		}
		break;		
		case 4:
		{
			self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
			self setshaderconstant( localClientNum, 1, 0.75, 0.25, 1, 0.5 );
		}
		break;
		case 5:
		{
			self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
			self setshaderconstant( localClientNum, 1, 0.5, 0.5, 0.75, 0.75 );
		}
		break;
		case 6:
		{
			self setshaderconstant( localClientNum, 0, 1, 0, 0, 0 );
			self setshaderconstant( localClientNum, 1, 0.75, 0.5, 1, 0.75 );
		}
		break;
	}	
}
	

setup_ui3d()
{
	while(1)
	{
		waitforclient(0);
		ui3dsetwindow( 0, 0, 0, 1, 0.5 );
		ui3dsetwindow( 1, 0, 0.5, 1, 0.5 );
		ui3dsetwindow( 2, 0, 0, 0, 0 );
		ui3dsetwindow( 3, 0, 0, 0, 0 );
		ui3dsetwindow( 4, 0, 0, 0, 0 );
		ui3dsetwindow( 5, 0, 0, 0, 0 );
		showUI(0, "WristWatch", 0);
		level waittill("save_restore");
	}
}

fov_lerps()
{
	level waittill ("bring_in_brainwash_fov");
	thread lerp_fov_overtime( 1.4, 65 );
	
	level waittill ("e8_punch_fov_out");
	thread lerp_fov_overtime( 1.6, 160 );
	
	level waittill ("e8_bw_fov_in");
	thread lerp_fov_overtime( 2, 65 );
	
	level waittill ("e9_br_table_zoom_in");
	thread lerp_fov_overtime( 1, 65 );
	
	level waittill ("e9_rusalka_zoom_in");
	thread lerp_fov_overtime( 8, 35 );
	//thread sound_playloop_sound ();//Number Sounds Rusalka CDC
}
/*
=============
///ScriptDocBegin
"Name: lerp_fov_overtime( <time> , <destfov> )"
"Summary: lerps from the current cg_fov value to the destfov value linearly over time"
"Module: Player"
"CallOn: a player"
"MandatoryArg: <time>: time to lerp"
"OptionalArg: <destfov>: field of view to go to"
"Example: players[0] thread lerp_fov_overtime(2.0, 45);"
"SPMP: singleplayer"
///ScriptDocEnd
=============
*/
lerp_fov_overtime( time, destfov )
{
	level notify ("new_fov_lerp");
	level endon ("new_fov_lerp");
	
	basefov = GetDvarFloat( #"cg_fov" );
	incs = int( time/.017 );
	incfov = (  destfov  -  basefov  ) / incs ;
	currentfov = basefov;
	
	// AE 9-17-09: if incfov is 0 we should move on without looping
	if(incfov == 0)
	{
		return;
	}

	for ( i = 0; i < incs; i++ )
	{
		currentfov += incfov;
		SetClientDvar( "cg_fov", currentfov );
		wait .017;
	}
	//fix up the little bit of rounding error. not that it matters much .002, heh
	SetClientDvar( "cg_fov", destfov );
}


