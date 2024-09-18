// Test clientside script for creek_1

#include clientscripts\_utility;
#include clientscripts\_fx;
#include clientscripts\_filter;

main()
{
	level.CLIENT_SWIFT_BLEED			= 2;
	
	// Keep this first for CreateFX!
	clientscripts\creek_1_fx::main();
	
	//precache rumble for heli crash during blackscreen 
	PreCacheRumble( "grenade_rumble" );

	// _load!
	clientscripts\_load::main();

	set_player_viewmodel( "viewmodel_usa_jungmar_wet_arms" );

	//call meatshield client script for blood fx
	clientscripts\_meatshield::main();
	
	clientscripts\_swimming::main();
	//clientscripts\_swimming::set_default_vision_set("creek_1");

//	thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\creek_1_amb::main();
	
	register_clientflag_callback("actor", level.CLIENT_SWIFT_BLEED, ::_swift_death_flag_handler);
	
	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : creek_1 running...");

	OnPlayerConnect_Callback( ::on_player_connect );
  
	thread event1_heli_fog_change();
	
	waitforclient(0);
	init_filter_scope( getlocalplayers()[0] );
	
	wait( 2 );
	
	thread play_flashlight_fx();
}

intro_force_visionset_changes()
{
	thread intro_visionset_1();
	thread intro_visionset_2();
	thread intro_visionset_3();
	thread intro_visionset_4();
	thread intro_visionset_5();
}

intro_visionset_1()
{
	//level start
	level waittill( "use_helicopter_start_visionset" );
	clientscripts\_swimming::set_default_vision_set("creek_1_helicopter_start");
	clientscripts\_swimming::set_swimming_vision_set("creek_1_helicopter_start");
	VisionSetNaked(self GetLocalClientNumber(), "creek_1_helicopter_start", 0);
}
	
intro_visionset_2()
{
	// player has pistol
	level waittill( "use_helicopter_visionset" );
	clientscripts\_swimming::set_default_vision_set("creek_1_helicopter");
	clientscripts\_swimming::set_swimming_vision_set("creek_1_helicopter");
	VisionSetNaked(self GetLocalClientNumber(), "creek_1_helicopter", 0);
}

intro_visionset_3()
{
	//when going below for first time
	level waittill( "use_helicopter_water_visionset" );
	clientscripts\_swimming::set_default_vision_set("creek_1_helicopter_water");
	clientscripts\_swimming::set_swimming_vision_set("creek_1_helicopter_water");
	VisionSetNaked(self GetLocalClientNumber(), "creek_1_helicopter_water", 0);
}

intro_visionset_4()
{
	//exiting chopper door strength test
	level waittill( "huey_door_opens" );
	clientscripts\_swimming::set_default_vision_set("creek_1");
	clientscripts\_swimming::set_swimming_vision_set("creek_1_helicopter_water_exit");
	VisionSetNaked(self GetLocalClientNumber(), "creek_1", 0);
}

intro_visionset_5()
{
	level waittill( "beat_2_starts" );
	clientscripts\_swimming::set_default_vision_set("creek_1");
	clientscripts\_swimming::set_swimming_vision_set("creek_1_water");
	VisionSetNaked(self GetLocalClientNumber(), "creek_1", 3);
}

on_player_connect(clientNum)
{
	self endon( "disconnect" );
	level endon("save_restore");
	
	wait( 1 );

	self clientscripts\_swimming::set_swimming_vision_set("creek_1_water");
	
	self thread intro_force_visionset_changes();
	
	//self thread alternate_sun_light();
	
	self thread hide_player_arms_underwater();

	self thread force_set_creek_visionset();
	self thread force_set_creek_rain_visionset();
	self thread force_set_creek_ambush_path_visionset();
	self thread force_set_creek_village_visionset();
	self thread force_set_creek_warroom_visionset();
	
	self thread reset_visionset_to_tunnel_flashlight();
	self thread reset_visionset_to_tunnel_flashlight_off();


	self thread force_hide_swimming_arms();
	self thread force_show_swimming_arms();
}

force_hide_swimming_arms()
{
	while( 1 )
	{
		level waittill( "force_hide_swimming_arms" );
		if( isdefined( self._swimming_arms ) )
		{
			self._swimming_arms hide();
		}
	}
}

force_show_swimming_arms()
{
	while( 1 )
	{
		level waittill( "force_show_swimming_arms" );
		if( isdefined( self._swimming_arms ) )
		{
			self._swimming_arms show();
		}
	}
}

alternate_sun_light()
{
	self endon( "disconnect" );
	level endon("save_restore");
	
	self.sun_value_above_water_bright_r = 1.0;
	self.sun_value_above_water_bright_g = 1.0;
	self.sun_value_above_water_bright_b = 1.0;
	self.sun_value_above_water_dark_r = 1.0;
	self.sun_value_above_water_dark_g = 1.0;
	self.sun_value_above_water_dark_b = 1.0;
	
	self.sun_value_below_water_r = 0.7;
	self.sun_value_below_water_g = 0.7;
	self.sun_value_below_water_b = 0.7;
	
	self.sun_transition_time_bright_to_dark = 2.0;
	self.sun_transition_time_dark_to_bright = 2.0;
	self.sun_bright_duration_min = 10;
	self.sun_bright_duration_max = 14;
	self.sun_dark_duration_min = 4;
	self.sun_dark_duration_max = 6;
	
	player_in_water = true;
	while( 1 )
	{
		// player is under water
 		if( clientscripts\_swimming::get_swimming_depth() > 0 && player_in_water == false )
    {
    	self notify( "player_in_water" );
    	self thread sunlight_under_water( );
 			player_in_water = true;
    }
    
    // player is above water
    else if( clientscripts\_swimming::get_swimming_depth() <= 0 && player_in_water == true )
    {
    	self notify( "player_out_of_water" );
    	self thread sunlight_above_water();
 			player_in_water = false;
    }
    
    wait( 0.05 );
  }
}

sunlight_under_water()
{
	self endon( "disconnect" );
	level endon("save_restore");
	self endon( "player_out_of_water" );
  SetSunLight( self.sun_value_below_water_r, self.sun_value_below_water_g, self.sun_value_below_water_b );
}

sunlight_above_water()
{
	self endon( "disconnect" );
	level endon("save_restore");
	self endon( "player_in_water" );
	while( 1 )
	{
    SetSunLight( self.sun_value_above_water_bright_r, self.sun_value_above_water_bright_g, self.sun_value_above_water_bright_b );
    duration = self.sun_bright_duration_min + randomfloat( self.sun_bright_duration_max - self.sun_bright_duration_min );
    wait( duration );

    intervals = self.sun_transition_time_bright_to_dark / 0.05;
    change_in_interval_r = ( self.sun_value_above_water_dark_r - self.sun_value_above_water_bright_r ) / intervals;
    change_in_interval_g = ( self.sun_value_above_water_dark_g - self.sun_value_above_water_bright_g ) / intervals;
    change_in_interval_b = ( self.sun_value_above_water_dark_b - self.sun_value_above_water_bright_b ) / intervals;
    current_r = self.sun_value_above_water_bright_r;
    current_g = self.sun_value_above_water_bright_g;
    current_b = self.sun_value_above_water_bright_b;
    for( i = 0; i < intervals; i++ )
    {
    	current_r += change_in_interval_r;
    	current_g += change_in_interval_g;
    	current_b += change_in_interval_b;
      SetSunLight( current_r, current_g, current_b );
      wait( 0.05 );
    }

    SetSunLight( self.sun_value_above_water_dark_r, self.sun_value_above_water_dark_g, self.sun_value_above_water_dark_b );
    
    duration = self.sun_dark_duration_min + randomfloat( self.sun_dark_duration_max - self.sun_dark_duration_min );
    wait( duration );

		intervals = self.sun_transition_time_dark_to_bright / 0.05;
    current_r = self.sun_value_above_water_dark_r;
    current_g = self.sun_value_above_water_dark_g;
    current_b = self.sun_value_above_water_dark_b;
    for( i = 0; i < intervals; i++ )
    {
    	current_r -= change_in_interval_r;
    	current_g -= change_in_interval_g;
    	current_b -= change_in_interval_b;
      SetSunLight( current_r, current_g, current_b );
      wait( 0.05 );
    }
  }
}


///CScriptDocBegin
//"Name: SetWaterFog(<startDist>, <halfwayDist>, <halfwayHeight>, <baseHeight>, <red>, <green>, <blue>)\n"
//"Summary: Set the fog parameters for the underwater views.\n"
//"MandatoryArg: <startDist> The distance, in world units, at which the fog begins.\n"
//"MandatoryArg: <halfwayDist> The distance at which the scene will be 50% fogged.\n"
//"MandatoryArg: <halfwayHeight> The height at which the scene will be 50% fogged.\n"
//"MandatoryArg: <baseHeight> The ground-level Z position at which the fog will start from.\n"
//"MandatoryArg: <red> The red component of the fog as a value between 0.0 and 1.0\n"
//"MandatoryArg: <green> The green component of the fog as a value between 0.0 and 1.0\n"
//"MandatoryArg: <blue> The blue component of the fog as a value between 0.0 and 1.0\n"
//"Example: setwaterfog( -100, 83, 100, -900, 255/255, 64/255, 80/255 );\n"

// These fog settings are for water in meatshield event. 
event1_heli_fog_change()
{
	// fog when inside heli	
//	setwaterfog( 100, 1000, 105, 421, 0.63, 0.47, 0.29 );

/*
	SetWaterFog(
	0, //start dist 
	119.8, //halfway dist 
	0, //halfway height
	-70.13,//base height
	0.149, //red
	0.145, //green 
	0.118, //blue
	1.33, //fog scale
	0.212, //sun red
	0.2, //sun green
	0.157, //sun blue
	-0.269, //sun dir x 
	-0.506, //sun dir y 
	0.82, //sun dir z 
	0, //sun fog start angle
	91.86, //sun fog end angle 
	0.994 //max opacity
	);

	level waittill("change_heli_water_fog");
	*/

	// start lerping water fog settings
	//level thread event1_lerp_water_fog();

	//level waittill( "switch_water_for_rest_of_creek" );

//	setwaterfog( 0, 307, 105, 20, 0.63, 0.47, 0.29 ); 
/#	
//	println( "setting final waterfog vals****************************************" );
#/
	//FINAL LEVEL VALS
	level thread event1_lerp_water_fog();

	// This notify is not being sent yet, but if we need to switch back to default, just add this in to level gsc.
	level waittill("switch_water_to_default");

	// default water fog when done with event 1
	clientscripts\_swimming::set_default_water_for_settings();
}

event1_lerp_water_fog()
{
	//level endon( "switch_water_for_rest_of_creek" );
	
	// START ( This is the values for when player is still in huey)
	level.fov_lerper = spawnStruct();
	level.fov_lerper.startDist	= 0;
	level.fov_lerper.halfwayDist	= 9; 
	level.fov_lerper.halfwayHeight	= 177;
	level.fov_lerper.baseHeight	= -175;
	level.fov_lerper.red	= 0.32549;
	level.fov_lerper.green	=0.254902;
	level.fov_lerper.blue	= 0.0235294;
	level.fov_lerper.fogColorScale	= 1.0;
	level.fov_lerper.sunColorR	= 1;
	level.fov_lerper.sunColorG	= 0.968628;
	level.fov_lerper.sunColorB	= 0.827451;
	level.fov_lerper.sunDirX	= -0.0437616;
	level.fov_lerper.sunDirY	= -0.788082;
	level.fov_lerper.sunDirZ	= 0.614013;
	level.fov_lerper.sunFogStartAng	= 0;
		// This vlaue below is commented out because it created water sorting issues, if thats fixed we could pottentially use it
		//level.fov_lerper.sunFogEndAng	= 147.587;
	level.fov_lerper.sunFogEndAng	= 0;
	level.fov_lerper.maxFogOpacity	= 1;
	
	//NEW	(This is the normal water fog after exiting the chopper)
	startDist_new = 0;
	halfwayDist_new	= 57.34;
	halfwayHeight_new	= 171.204;
	baseHeight_new	= -170.489;
	red_new	= 0.415686;
	green_new	= 0.356863;
	blue_new	= 0.113725;
	fogColorScale_new	= 1.0;
	sunColorR_new	= 0.780392;
	sunColorG_new	= 0.85098;
	sunColorB_new	= 0.721569;
	sunDirX_new	= 0.105674;
	sunDirY_new	= -0.325286;
	sunDirZ_new	= 0.939693;	
	sunFogStartAng_new	= 50.0994;
	sunFogEndAng_new	= 94.4085;
	maxFogOpacity_new	= 1;	
	

	level thread keep_setting_water_fog();
	
	level waittill( "huey_door_opens" );
	
	lerp_time	 = 4;
	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.startDist, startDist_new, "startDist" );
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.halfwayDist, halfwayDist_new, "halfwayDist" );
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.halfwayHeight, halfwayHeight_new, "halfwayHeight" );
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.baseHeight, baseHeight_new, "baseHeight" );	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.red , red_new, "red" );	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.green, green_new, "green" );
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.blue, blue_new, "blue" );	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.fogColorScale, fogColorScale_new, "fogColorScale" );		
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.sunColorR, sunColorR_new, "sunColorR" );	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.sunColorG, sunColorG_new, "sunColorG" );	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.sunColorB, sunColorB_new, "sunColorB" );	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.sunDirX, sunDirX_new, "sunDirX" );	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.sunDirY, sunDirY_new, "sunDirY" );	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.sunDirZ, sunDirZ_new, "sunDirZ" );	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.sunFogStartAng, sunFogStartAng_new, "sunFogStartAng" );	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.sunFogEndAng, sunFogEndAng_new, "sunFogEndAng" );	
	level.fov_lerper thread lerp_value_over_time( lerp_time, level.fov_lerper.maxFogOpacity, maxFogOpacity_new, "maxFogOpacity" );		

	// lerp fog when outside heli	

	
	while( lerp_time > 0 )
	{
		SetWaterFog(
		level.fov_lerper.startDist, 
		level.fov_lerper.halfwayDist, 
		level.fov_lerper.halfwayHeight, 
		level.fov_lerper.baseHeight, 
		level.fov_lerper.red, //red
		level.fov_lerper.green, //green 
		level.fov_lerper.blue, //blue
		level.fov_lerper.fogColorScale, //fog scale
		level.fov_lerper.sunColorR, //sun red
		level.fov_lerper.sunColorG, //sun green
		level.fov_lerper.sunColorB, //sun blue
		level.fov_lerper.sunDirX, //sun dir x 
		level.fov_lerper.sunDirY, //sun dir y 
		level.fov_lerper.sunDirZ, //sun dir z 
		level.fov_lerper.sunFogStartAng, //sun fog start angle
		level.fov_lerper.sunFogEndAng, //sun fog end angle 
		level.fov_lerper.maxFogOpacity //max opacity	
		);
		
		wait(0.1);
		lerp_time -= 0.1;
	}

	SetWaterFog(
	startDist_new,
	halfwayDist_new, //halfway dist 
	halfwayHeight_new, //halfway height
	baseHeight_new,//base height
	red_new, //red
	green_new, //green 
	blue_new, //blue
	fogColorScale_new, //fog scale
	sunColorR_new, //sun red
	sunColorG_new, //sun green
	sunColorB_new, //sun blue
	sunDirX_new, //sun dir x 
	sunDirY_new, //sun dir y 
	sunDirZ_new, //sun dir z 
	sunFogStartAng_new, //sun fog start angle
	sunFogEndAng_new, //sun fog end angle 
	maxFogOpacity_new //max opacity
	);
	
	// now we wait for the river walk area and change it again
	level waittill( "river_walk_underwater_fog" );
	
	SetWaterFog(
		0,
		107.169, //halfway dist 
		177.258, //halfway height
		-168.783,//base height
		0.411765, //red
		0.356863, //green 
		0.113725, //blue
		1, //fog scale
		0.772549, //sun red
		0.854902, //sun green
		0.729412, //sun blue
		-0.0300537, //sun dir x 
		-0.340697, //sun dir y 
		0.939693, //sun dir z 
		38.9605, //sun fog start angle
		86.3508, //sun fog end angle 
		1 //max opacity
	);

	// now we wait for the c4 area
	level waittill( "c4_underwater_fog" );
	
	SetWaterFog(
		0,
		62.7479, //halfway dist 
		298.269, //halfway height
		-274.239,//base height
		0.415686, //red
		0.356863, //green 
		0.129412, //blue
		1, //fog scale
		0.713726, //sun red
		0.764706, //sun green
		0.54902, //sun blue
		-0.154093, //sun dir x 
		-0.604857, //sun dir y 
		0.781283, //sun dir z 
		0, //sun fog start angle
		80.7086, //sun fog end angle 
		0.93 //max opacity
	);
}

keep_setting_water_fog()
{
	level endon( "huey_door_opens" );
	
	while( 1 )
	{
		SetWaterFog(
			level.fov_lerper.startDist, //
			level.fov_lerper.halfwayDist, //halfway dist 
			level.fov_lerper.halfwayHeight, //halfway height
			level.fov_lerper.baseHeight,//base height
			level.fov_lerper.red, //red
			level.fov_lerper.green, //green 
			level.fov_lerper.blue, //blue
			level.fov_lerper.fogColorScale, //fog scale
			level.fov_lerper.sunColorR, //sun red
			level.fov_lerper.sunColorG, //sun green
			level.fov_lerper.sunColorB, //sun blue
			level.fov_lerper.sunDirX, //sun dir x 
			level.fov_lerper.sunDirY, //sun dir y 
			level.fov_lerper.sunDirZ, //sun dir z 
			level.fov_lerper.sunFogStartAng, //sun fog start angle
			level.fov_lerper.sunFogEndAng, //sun fog end angle 
			level.fov_lerper.maxFogOpacity //max opacity
		);
		wait( 0.1 );
	}
}

lerp_value_over_time( time, original_value, new_value, modify_param )
{
	incs = int( time/.1 );
	inc_value = ( new_value  -  original_value ) / incs;
	current_value = original_value;

	for ( i = 0; i < incs; i++ )
	{
		current_value += inc_value;
		
		switch ( modify_param )
		{
			case "startDist":
				level.fov_lerper.startDist = current_value;
				break;
			case "halfwayDist":
				level.fov_lerper.halfwayDist = current_value;
				break;
			case "halfwayHeight":
				level.fov_lerper.halfwayHeight = current_value;
				break;
			case "baseHeight":
				level.fov_lerper.baseHeight = current_value;
				break;
			case "red":
				level.fov_lerper.red = current_value;
				break;
			case "green":
				level.fov_lerper.green = current_value;
				break;
			case "blue":
				level.fov_lerper.blue = current_value;
				break;
			case "fogColorScale":
				level.fov_lerper.fogColorScale = current_value;
				break;
			case "sunColorR":
				level.fov_lerper.sunColorR = current_value;
				break;
			case "sunColorG":
				level.fov_lerper.sunColorG = current_value;
				break;
			case "sunColorB":
				level.fov_lerper.sunColorB = current_value;
				break;
			case "sunDirX":
				level.fov_lerper.sunDirX = current_value;
				break;
			case "sunDirY":
				level.fov_lerper.sunDirY = current_value;
				break;
			case "sunDirZ":
				level.fov_lerper.sunDirZ = current_value;
				break;																												
			case "sunFogStartAng":
				level.fov_lerper.sunFogStartAng = current_value;
				break;
			case "sunFogEndAng":
				level.fov_lerper.sunFogEndAng = current_value;
				break;
			case "maxFogOpacity":
				level.fov_lerper.maxFogOpacity = current_value;
				break;																								
			default:
				Assert("parameterer is not supprted");
		}
		
		wait .1;
	}
}

play_flashlight_fx()
{
		players = GetLocalPlayers();
		players[0] thread play_flashlight_fx_player( 0 );
}

play_flashlight_fx_player( localclientnum )
{
	self endon( "disconnect" );
	self.flashlight_enabled = false;
	self.flashlight_on = false;
	self thread flashlight_enabled();
	self thread flashlight_on();
	self thread flashlight_off();
	self thread flashlight_melee_handle();
	
	/*
	light_on = false;
	level.flash_light_fx = undefined;
	
	while( 1 )
	{
		currentweapon = GetCurrentWeapon( localclientnum ); 
		if( currentweapon == "creek_flashlight_shotgun_sp" && light_on == false )
		{
			wait( 1 );
			//level.flash_light_fx = PlayViewmodelFx( localclientnum, level._effect["rpg_explosion"], "TAG_LIGHT" );
			level.flash_light_fx = PlayViewmodelFx( localclientnum, level._effect["flashlight_cone"], "TAG_LIGHT" );
			light_on = true;
		}
		else if( currentweapon != "creek_flashlight_shotgun_sp" && light_on == true )
		{
			deletefx( localclientnum, level.flash_light_fx );
			light_on = false;
		}
		wait( 0.1 );
	}
	*/
}

flashlight_enabled()
{
	level waittill( "flahslight_start" );
	self.flashlight_enabled = true;
}

flashlight_on()
{
	while( self.flashlight_enabled == false )
	{
		wait( 0.05 );
	}

	while( 1 )
	{
		level waittill( "flahslight_on" );
		
		if( self.flashlight_on == false )
		{
			level.flash_light_fx = PlayViewmodelFx( 0, level._effect["flashlight_cone"], "TAG_LIGHT" );
			self.flashlight_on = true;
		}
	}
}

flashlight_off()
{
	while( self.flashlight_enabled == false )
	{
		wait( 0.05 );
	}

	while( 1 )
	{
		level waittill( "flahslight_off" );
		
		if( self.flashlight_on == true )
		{
			deletefx( 0, level.flash_light_fx );
			self.flashlight_on = false;
		}
	}
}


flashlight_melee_handle()
{
	while( 1 )
	{
		// wait for the end of a melee
		level waittill( "melee_end" );
		
		// restore light if necessary
		if( self.flashlight_on == true )
		{
			level.flash_light_fx = PlayViewmodelFx( 0, level._effect["flashlight_cone"], "TAG_LIGHT" );
		}
	}
}

hide_player_arms_underwater()
{
	self waittill( "hide_swimming_arms" );
	if( isdefined( self._swimming_arms ) )
	{
		self._swimming_arms hide();
	}
	
	self waittill( "show_swimming_arms" );
	if( isdefined( self._swimming_arms ) )
	{
		self._swimming_arms show();
	}
}


_swift_death_flag_handler(localClientNum, set, newEnt)
{
	init_shaderconstants(localClientNum);
	
	self _swift_death_enable_blood(localClientNum, set);
}

init_shaderconstants(localClientNum)
{
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); // x = dimSpecular and y = wetness 0 to 0.83
}

_swift_death_enable_blood(localClientNum, set)
{	
	dimSpecular = 0;
	
	if(set)
	{
		wetness = 0;
		while(wetness < 0.8)
		{
			wetness += 0.01;
			self setshaderconstant( localClientNum, 0, dimSpecular, wetness, 0, 0 ); // dimSpecular should be 0 always for now
			wait(0.1);
		}			
	}
}

force_set_creek_visionset()
{
	while( 1 )
	{
		level waittill( "set_creek_visionset" );
		clientscripts\_swimming::set_default_vision_set( "creek_1" );
		VisionSetNaked( self GetLocalClientNumber(), "creek_1", 0 );
	}
}

force_set_creek_rain_visionset()
{
	while( 1 )
	{
		level waittill( "set_creek_rain_visionset" );
		clientscripts\_swimming::set_default_vision_set( "creek_1_rain" );
		VisionSetNaked( self GetLocalClientNumber(), "creek_1_rain", 4 );
	}
}

force_set_creek_ambush_path_visionset()
{
	while( 1 )
	{
		level waittill( "set_creek_ambush_visionset" );
		clientscripts\_swimming::set_default_vision_set( "creek_1_ambush_path" );
		VisionSetNaked( self GetLocalClientNumber(), "creek_1_ambush_path", 3 );
	}
}

force_set_creek_village_visionset()
{
	while( 1 )
	{
		level waittill( "set_creek_village_visionset" );
		clientscripts\_swimming::set_default_vision_set( "creek_1_village" );
		VisionSetNaked( self GetLocalClientNumber(), "creek_1_village", 3 );
	}
}

force_set_creek_warroom_visionset()
{
	while( 1 )
	{
		level waittill( "set_creek_warroom_visionset" );
		clientscripts\_swimming::set_default_vision_set( "creek_1_war_room" );
		VisionSetNaked( self GetLocalClientNumber(), "creek_1_war_room", 2 );
	}
}

reset_visionset_to_default()
{
	while( 1 )
	{
		level waittill( "reset_visionset_to_default" );
		clientscripts\_swimming::set_default_vision_set( "default" );
		VisionSetNaked( self GetLocalClientNumber(), "default", 0 );
	}
}

reset_visionset_to_tunnel_flashlight()
{
	while( 1 )
	{
		level waittill( "flashlight_visionset" );
		VisionSetNaked( self GetLocalClientNumber(), "creek_1_tunnel", 0 );
	}
}

reset_visionset_to_tunnel_flashlight_off()
{
	while( 1 )
	{
		level waittill( "flashlight_visionset_off" );
		VisionSetNaked( self GetLocalClientNumber(), "creek_1_tunnel_off", 0 );
	}
}
