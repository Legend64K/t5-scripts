// Test clientside script for underwaterbase

#include clientscripts\_utility;
#include clientscripts\_filter;

main()
{
	
	// Keep this first for CreateFX!
	clientscripts\underwaterbase_fx::main();
	
	// _load!
	clientscripts\_load::main();

	// 
	set_player_viewmodel( "viewmodel_usa_ubase_arms" );

	// turn off dronwing for this map
	level._disable_drowning = true;
	
	clientscripts\_swimming::main();

//	thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\underwaterbase_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	// TOW missile filter/overlay
	init_filter_tvguided( getlocalplayers()[0] ); 
	init_filter_infrared( getlocalplayers()[0] );
	
	println("*** Client : underwaterbase running...");
	
	OnPlayerConnect_Callback( ::on_player_connect );

	thread setup_wristwatch();
	thread open_ocean_waterfog_settings();
	thread disable_drowning();
	thread enable_drowning();
	thread force_swim_anim();
	thread superflare_handler();
//	thread dynent_cleanup_monitor();
	thread dynent_cleanup();
	thread disable_swim_move_input();
}

open_ocean_waterfog_settings()
{
	// This one is used in the dive sequence
	start_dist = 0;
	half_dist = 1382.53;
	half_height = 28501.2;
	base_height = 0;
	fog_r = 0;
	fog_g = 0.0392157;
	fog_b = 0.0588235;
	fog_scale = 1;
	sun_col_r = 0.160784;
	sun_col_g = 0.34902;
	sun_col_b = 0.580392;
	sun_dir_x = 0.0415454;
	sun_dir_y = 0.301728;
	sun_dir_z = -0.952489;
	sun_start_ang = 0;
	sun_stop_ang = 17.4411;
	time = 0;
	max_fog_opacity = 0.875916;

	SetWaterFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, max_fog_opacity);     
}

on_player_connect(clientNum)
{
	self endon( "disconnect" );
	level endon("save_restore");
	
	// Wait until we've got the whole picture
	while ( !ClientHasSnapshot(clientNum) )
	{
		wait 0.05;
	}

	//self thread alternate_sun_light();
	
	//self thread open_ocean_waterfog_settings();
	self thread underwater_vision_set();
}

// hide_player_arms_underwater()
// {
// 	self waittill( "hide_swimming_arms" );
// 	if( isdefined( self._swimming_arms ) )
// 	{
// 		self._swimming_arms hide();
// 	}
// 	
// 	self waittill( "show_swimming_arms" );
// 	if( isdefined( self._swimming_arms ) )
// 	{
// 		self._swimming_arms show();
// 	}
// }

enable_drowning()
{
	while( 1 )
	{
		level waittill( "_enable_drowning" );
		
		// player can drown
		level._disable_drowning = false;
	}
}

disable_drowning()
{
	while( 1 )
	{
		level waittill( "_disable_drowning" );
		
		// turn off dronwing for this map
		level._disable_drowning = true;
	}
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
            getlocalplayers()[0] SetWatchStyle(0);
            level waittill("save_restore");
      }
}

force_swim_anim()
{
	// This one is when you are swimming up after the escape
	level waittill("rise_to_surface");
	level._swimming.is_overriding_swim_movement = true;
	level._swimming.override_swim_movement = (1,0,0);
	thread update_swim_anim_rate();
	
	//Make sure its blue light while swimming
	SetSunLight(0.818, 0.71, 0.59);

	//Get sky temp normal again before you hit surface
		SetSavedDvar( "r_skyColorTemp", (6500)); 
	
	//Fog
	start_dist = 0;
	half_dist = 1382.53;
	half_height = 28501.2;
	base_height = 0;
	fog_r = 0;
	fog_g = 0.0392157;
	fog_b = 0.0588235;
	fog_scale = 1;
	sun_col_r = 0.160784;
	sun_col_g = 0.34902;
	sun_col_b = 0.580392;
	sun_dir_x = 0;
	sun_dir_y = 0;
	sun_dir_z = 1;
	sun_start_ang = 0;
	sun_stop_ang = 90;
	time = 0;
	max_fog_opacity = 0.875916;
	
	SetWaterFog(start_dist, half_dist, half_height, base_height, fog_r, fog_g, fog_b, fog_scale,
		sun_col_r, sun_col_g, sun_col_b, sun_dir_x, sun_dir_y, sun_dir_z, sun_start_ang, 
		sun_stop_ang, max_fog_opacity);
}

update_swim_anim_rate()
{
	max_rate = 2.0;
	anim_rate = 1.0;
	vel = 0.05;

	while (anim_rate < max_rate)
	{
		anim_rate += 0.1 * 0.02;
		level._swimming.swim_anim_rate = anim_rate;
		wait(0.02);
	}
}

superflare_handler()
{
	sf_0_max_sprites = 120;
	sf_0_pos_x = 25000;
	sf_0_pos_y = 6367;
	sf_0_pos_z = 5000;
	sf_0_intensity = 0.65;
	sf_0_size = -0.1;

	init_filter_superflare( getlocalplayers()[0], "generic_filter_superflare" );
	
	level waittill("start_superflare");
	
	PrintLn("*** SUPERFLARE ON");
	
	enable_filter_superflare( getlocalplayers()[0], "generic_filter_superflare", 1, 0, sf_0_max_sprites, sf_0_pos_x, sf_0_pos_y, sf_0_pos_z, sf_0_intensity, sf_0_size );

	level waittill("end_superflare");
	
	PrintLn("*** SUPERFLARE OFF");
	
	disable_filter_superflare( getlocalplayers()[0], "generic_filter_superflare", 1,0);
}

dynent_cleanup_monitor()
{
	level endon("stop_dynent_monitor");

	while (1)
	{
		level waittill("start_dynent_cleanup");
		thread dynent_cleanup();
	}
}

dynent_cleanup()
{
	level notify( "stop_dynent_cleanup" );

	level endon("stop_dynent_cleanup");
	level waittill("start_dynent_cleanup");

	player = getlocalplayers()[0];

	// initialize all the dynamic entites
	dynents = GetDynEntArray();
	Print("Dyn Count: " + dynents.size);

	ents = [];

	// This will get all the dynents on the ship
	for (i = 0; i < dynents.size; i++)
	{
		waitforclient(0);
		dist = DistanceSquared(player.origin, dynents[i].origin);
		if (dist < 100000000)
		{
			// don't care about really far away dynents
			ents[ents.size] = dynents[i];
			// this was causing a variable leak for some reason.
			//	So since it's not really super important, we're not using it.
			//	There's a lot of other optimizations in here which will help performance.
//			ents[ents.size].near_player = false;	
		}
		dynents[i] = undefined;

		// Only process 50 per frame.
		if ( i % 10 == 0 )
		{
			wait( 0.01 );
		}
	}

	dynents = undefined;	// free up this array since we don't need it.

	Print("Close Dyn Count: " + ents.size);
	disable_dist = 256 * 256;

	while (1)
	{
		// loop all ents
		for (i = 0; i < ents.size; i++)
		{
			waitforclient(0);
			if (IsDefined(ents[i]))
			{
				waitforclient(0);
				// find out if we're in range
				dist = DistanceSquared(player.origin, ents[i].origin);
				if (dist > disable_dist)
				{
					// if we're out of range and were previous in range
//					if (ents[i].near_player)
					{
						// get a vector from the player to the ent
						dir = ents[i].origin - player.origin;

						// get the players forward vector
						forward = AnglesToForward(player GetPlayerAngles());

						// find out of if we're looking away from the ent
						dot = VectorDot(forward, dir);
						if (dot < 0.0)
						{
							SetDynEntEnabled( ents[i], 0 ); // This will hide the dyn ent and stop the physics
//							ents[i].near_player = false;
						}
					}
				}
			}

			// Process a few at a time for performance 
			if ( i % 20 == 0 )
			{
				wait( 0.05 );
			}
		}

		wait(0.05);
	}
}


//
//	Hacky function to disable input from the left stick during the dive
//	Prevents swimming arms from attempting forward/backward movement.
disable_swim_move_input()
{
	level waittill( "swim_move_stop" );

	level._swimming.is_overriding_swim_movement = true;	
	level._swimming.override_swim_movement = (0,0,0);

	level waittill( "swim_move_start" );

	level._swimming.is_overriding_swim_movement = false;
}


//
//	Hack function because the Underwater vision set isn't being saved.
//	So we have to initiate it before we want to use it.
underwater_vision_set()
{
	while (1)
	{
		self clientscripts\_swimming::set_swimming_vision_set("UWB_Dive");

		level waittill( "uwb_vs" );
	}
}
