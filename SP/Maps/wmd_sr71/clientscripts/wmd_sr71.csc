// Test clientside script for wmd_sr71

#include clientscripts\_utility;
#include clientscripts\_filter;
main()
{

	
	
	// Keep this here for CreateFX
	clientscripts\wmd_sr71_fx::main();
	
	level._uses_crossbow = true;
	
	// _load!
	clientscripts\_load::main();
	
	level._extra_cam_active = false;
	
	register_clientflag_callback("scriptmover", 0, ::scriptmover_flag0_handler);
	register_clientflag_callback("scriptmover", 1, ::scriptmover_flag1_handler);
	register_clientflag_callback("scriptmover", 2, ::scriptmover_flag2_handler);
	register_clientflag_callback("scriptmover", 3, ::scriptmover_flag3_handler);
	register_clientflag_callback("scriptmover", 4, ::scriptmover_flag4_handler);
	register_clientflag_callback("scriptmover", 7, ::scriptmover_flag7_handler);
	register_clientflag_callback("scriptmover", 8, ::scriptmover_flag8_handler);
	register_clientflag_callback("scriptmover", 9, ::scriptmover_flag9_handler);


	//thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\wmd_sr71_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : wmd_sr71 running...");
	
	level thread set_ui3d();
	
	level thread setup_fullscreen_postfx();
	
	level thread update_fov_to_current();
	level thread update_fov_on_restart();
	
	clientscripts\_fx::exploder_is_glass_exploder(605, undefined, "amb_wind_window_gusts");
	clientscripts\_fx::exploder_is_glass_exploder(606, undefined, "amb_wind_window_gusts");
	clientscripts\_fx::exploder_is_glass_exploder(607, undefined, "amb_wind_window_gusts");
	clientscripts\_fx::exploder_is_glass_exploder(608, undefined, "amb_wind_window_gusts");
	
	// level thread handle_basejump_fov();
	
	// thread dyn_light_glow();
	// level thread handle_sr71_transition_fov();
	
	level thread superflare_handler();
}

superflare_handler()
{
	sf_0_max_sprites = 120;
	sf_0_pos_x = 2326;
	sf_0_pos_y = -9000;
	sf_0_pos_z = 1400;
	sf_0_intensity = 1.0;
	sf_0_size = -0.1;
	
	sf_1_max_sprites = 120;
	sf_1_pos_x = -1326;
	sf_1_pos_y = -10000;
	sf_1_pos_z = 600;
	sf_1_intensity = 1.0;
	sf_1_size = 20;

	init_filter_superflare( getlocalplayers()[0], "generic_filter_superflare" );
	
	level waittill("start_superflare");
	
	PrintLn("*** SUPERFLARE ON");
	
	enable_filter_superflare( getlocalplayers()[0], "generic_filter_superflare", 1, 0, sf_0_max_sprites, sf_0_pos_x, sf_0_pos_y, sf_0_pos_z, sf_0_intensity, sf_0_size );
	enable_filter_superflare( getlocalplayers()[0], "generic_filter_superflare", 1, 1, sf_1_max_sprites, sf_1_pos_x, sf_1_pos_y, sf_1_pos_z, sf_1_intensity, sf_1_size );

	level waittill("end_superflare");
	
	PrintLn("*** SUPERFLARE OFF");
	
	disable_filter_superflare( getlocalplayers()[0], "generic_filter_superflare", 1,0);
	disable_filter_superflare( getlocalplayers()[0], "generic_filter_superflare", 1,1);
	
}

scriptmover_flag0_handler(localClientNum, set, newEnt)
{
	if(set)
	{				
		self mapshaderconstant( localClientNum, 0, "scriptVector1" ); // <-- the '+' reticule
		self mapshaderconstant( localClientNum, 1, "scriptVector0" ); // <-- the background overlay
		//self mapshaderconstant( localClientNum, 2, "scriptVector2" ); // <-- the ( zoom( float ), origin (x ),origin(y), zoom brightness scaler( 0) )
		
		self setshaderconstant( localClientNum, 0, 1, 1, 1, 1 );
		self setshaderconstant( localClientNum, 1, 1, 1, 1, 1 ); 
		
	}
	else
	{
		self mapshaderconstant( localClientNum, 0, "scriptVector1" );
		//self mapshaderconstant( localClientNum, 1, "scriptVector0" );
		
		self setshaderconstant( localClientNum, 0, 1, .05, 0.05, 1 );
		//self setshaderconstant( localClientNum, 1, .8, .8, .8, .7 );

	}	
}

scriptmover_flag1_handler(localClientNum, set, newEnt)
{
	if(set)
	{
		wait(.05);
		StopExtraCam(0);
		self isExtraCam(0);
		if(IsDefined(level.extra_cam_cur_fov))
		{
			SetExtraCamFov( 0, level.extra_cam_cur_fov );
		}
		else
		{
			SetExtraCamFov( 0, 35 );
		}
		level._extra_cam_active = true;
	}
	else
	{
		StopExtraCam(0);
		level._extra_cam_active = false;
	}	
}

scriptmover_flag2_handler(localClientNum, set, newEnt)
{
	if(set)
	{
		self mapshaderconstant( localClientNum, 0, "scriptVector1" ); // <-- the '+' reticule
		self setshaderconstant( localClientNum, 0, .05, 1, .05, 1 );
	}
	else
	{
		self mapshaderconstant( localClientNum, 0, "scriptVector1" ); // <-- the '+' reticule
		self setshaderconstant( localClientNum, 0, .9, .9, .6, .9 );
	}	
}

scriptmover_flag3_handler(localClientNum, set, newEnt)
{
	if(set && level._extra_cam_active)
	{
		self notify("stop_fov_inc");
		self thread increase_fov();
	}
	else
	{
		self notify("stop_fov_inc");
	}	
}

scriptmover_flag4_handler(localClientNum, set, newEnt)
{
	if(set && level._extra_cam_active)
	{
		self notify("stop_fov_dec");
		self thread decrease_fov();
	}
	else
	{
		self notify("stop_fov_dec");
	}
}

scriptmover_flag7_handler(localClientNum, set, newEnt)
{
	if(set)
	{
		init_rso_focus();
	}
	else
	{
		//brightness_decrease();
	}	
}

scriptmover_flag8_handler(localClientNum, set, newEnt)
{
	if(set)
	{
		self mapshaderconstant( localClientNum, 2, "scriptVector2" ); // <-- the ( zoom( float ), origin (x ),origin(y), zoom brightness scaler( 0) )
		self setshaderconstant( 0, 2, 0, 0.75,0.25,0);
	}
}

scriptmover_flag9_handler(localClientNum, set, newEnt)
{
	if(set)
	{
		self mapshaderconstant( localClientNum, 2, "scriptVector2" );
		zoom_in_out_brightness();
	}
	else
	{
		self mapshaderconstant( localClientNum, 2, "scriptVector2" );
		self thread brightness_decrease();
	}	
}

set_ui3d()
{
	while (1)
	{
		waitforclient(0);
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

setup_fullscreen_postfx()
{
	waitforclient(0);
	
	init_filter_helmet( getlocalplayers()[0] );
	//init_filter_superflare( getlocalplayers()[0], "generic_filter_superflare" );
	//enable_filter_superflare( getlocalplayers()[0], "generic_filter_superflare", 1, 0, 120 );
			
	level thread flight_helmet_listener();
	// level thread jump_goggles_listener();
	// level thread frost_overlay();
}


flight_helmet_listener()
{
	level endon( "kill_flight_helmet" );
	
	level thread flight_helmet_cleanup();
	
	flight_helmet = false;
	while( 1 )
	{
		level waittill( "toggle_flight_helmet" );
		
		if( !flight_helmet )
		{
			PrintLn("*** No flight helmet - turning it on");
			enable_filter_helmet( getlocalplayers()[0], 0, 0 );
			flight_helmet = true;
		}
		else
		{
			PrintLn("*** Flight helmet - turning it off.");
			disable_filter_helmet( getlocalplayers()[0], 0, 0 );
			flight_helmet = false;
		}

	}
}

flight_helmet_cleanup()
{
	level waittill( "kill_flight_helmet" );
	
	disable_filter_helmet( getlocalplayers()[0], 0, 0 );
}

brightness_decrease()
{
	self endon("end_decrease");
	level endon("end_rts");
				
	if(!isDefined(self.is_decreasing ))
	{
		self.is_decreasing = 1;
		for(i=11;i>0;i--)
		{
			self mapshaderconstant( 0, 2, "scriptVector2" ); // <-- the ( zoom( float ), origin (x ),origin(y), zoom brightness scaler( 0) )
			val = i*.1;
			if(i * .1 < 0)
			{
				val = 0;
			}
			self setshaderconstant( 0, 2, 1, 0.75,0.25,val);
			wait(.05);
		}
		self.is_decreasing = undefined;
	}
}

brightness_set()
{
	level endon("end_rts");
	for(i=0;i<10;i++)
	{
		self mapshaderconstant( 0, 2, "scriptVector2" ); // <-- the ( zoom( float ), origin (x ),origin(y), zoom brightness scaler( 0) )
		self setshaderconstant( 0, 2, 1, 0.75,0.25,i * .1);
		wait(.05);
	}
}


zoom_in_out_brightness()
{
	self notify("end_decrease");
	self mapshaderconstant( 0, 2, "scriptVector2" ); // <-- the ( zoom( float ), origin (x ),origin(y), zoom brightness scaler( 0) )
	self setshaderconstant( 0, 2, 1, 0.75,0.25,.75);
}

init_rso_cam()
{
		self mapshaderconstant( 0, 2, "scriptVector2" );
		self setshaderconstant( 0, 2, 1, 1,1,0);
}


init_rso_focus()
{
	self mapshaderconstant( 0, 2, "scriptVector2" );
	
	for(i=20;i>-1;i--)
	{
		self setshaderconstant( 0, 2,(i*.05), 1,1,0);
		wait(.05);	
	}	
}

//-- This is used to update the FOV between RTS and FPS sequences
update_fov_to_current()
{
	while(1)
	{
		level waittill("update_rts_fov");
		
		while(!level._extra_cam_active)
		{
			wait(0.05);
		}
		
		if(IsDefined(level.extra_cam_cur_fov))
		{
			SetExtraCamFov(0, level.extra_cam_cur_fov);
		}
	}
}

update_fov_on_restart()
{
	while(1)
	{
		level waittill("save_restore");
		
		if(IsDefined(level._extra_cam_active) && level._extra_cam_active)
		{
			if (isdefined(level.extra_cam_cur_fov))
			{
				SetExtraCamFov(0, level.extra_cam_cur_fov);
			}
		}
	}
}

increase_fov()
{
	level endon("end_rts");
	self endon("stop_fov_inc");
	if(!isDefined(self.cur_fov))
	{
		if(IsDefined(level.extra_cam_cur_fov))
		{
			self.cur_fov = level.extra_cam_cur_fov;
		}
		else
		{
			self.cur_fov = 35;
			level.extra_cam_cur_fov = self.cur_fov;
		}
	}				

	while(1 )
	{
		if(self.cur_fov + .5 < 60)
		{
			self.cur_fov += .5;	
		}
			else
		{
			self.cur_fov = 60;
		}
		SetExtraCamFov( 0,self.cur_fov);
		level.extra_cam_cur_fov = self.cur_fov;
		wait(.01);
	}			
}

decrease_fov()
{
	self endon("stop_fov_dec");	
	level endon("end_rts");
		
	if(!isDefined(self.cur_fov))
	{
		if(IsDefined(level.extra_cam_cur_fov))
		{
			self.cur_fov = level.extra_cam_cur_fov;
		}
		else
		{
			self.cur_fov = 35;
			level.extra_cam_cur_fov = self.cur_fov;
		}
	}
				
	while(1)
	{
		if(self.cur_fov - .5 > 15)
		{
			self.cur_fov -= .5;
		}
		else
		{
			self.cur_fov = 15;
		}
		SetExtraCamFov( 0,self.cur_fov);
		level.extra_cam_cur_fov = self.cur_fov;
		wait(.01);
	}
}

