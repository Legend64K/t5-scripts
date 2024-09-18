//[ceng]

//Clientside stuff for Pentagon (borrowed from pow.csc).

#include clientscripts\_utility;
#include clientscripts\_filter;

main()
{


	//init flag for hudson glasses
	level.CLIENT_SWITCH_GLASSES	= 2;
	level.CLIENT_SWITCH_GLASSES_BINK = 3;
	
	level.CLIENT_JFK_MON1 = 4;
	level.CLIENT_JFK_MON2 = 5;
	level.CLIENT_JFK_MON3 = 6;
	level.CLIENT_JFK_MON4 = 7;
	level.CLIENT_JFK_MON5 = 8;
	level.CLIENT_JFK_MON6 = 9;
	level.CLIENT_JFK_MON7 = 10;
	level.CLIENT_JFK_MON8 = 11;
	level.CLIENT_JFK_MON9 = 12;
	level.CLIENT_JFK_MON10 = 13;
	level.CLIENT_JFK_MON11 = 14;
	
	//level.CLIENT_SWITCH_GLASSES_LIMO = 4;
	//level.CLIENT_SWITCH_GLASSES_LIMO_BINK = 5;
	
	
	clientscripts\pentagon_fx::main();

	// _load!
	clientscripts\_load::main();


	//init callback for hudson glasses
	register_clientflag_callback("scriptmover", level.CLIENT_SWITCH_GLASSES, ::actor_glasses_change);
	register_clientflag_callback("scriptmover", level.CLIENT_SWITCH_GLASSES_BINK, ::actor_glasses_change_bink);

	register_clientflag_callback("scriptmover", level.CLIENT_JFK_MON1, ::jfk_mon1);
	register_clientflag_callback("scriptmover", level.CLIENT_JFK_MON2, ::jfk_mon2);
	register_clientflag_callback("scriptmover", level.CLIENT_JFK_MON3, ::jfk_mon3);
	register_clientflag_callback("scriptmover", level.CLIENT_JFK_MON4, ::jfk_mon4);
	register_clientflag_callback("scriptmover", level.CLIENT_JFK_MON5, ::jfk_mon5);
	register_clientflag_callback("scriptmover", level.CLIENT_JFK_MON6, ::jfk_mon6);
	register_clientflag_callback("scriptmover", level.CLIENT_JFK_MON7, ::jfk_mon7);
	register_clientflag_callback("scriptmover", level.CLIENT_JFK_MON8, ::jfk_mon8);
	register_clientflag_callback("scriptmover", level.CLIENT_JFK_MON9, ::jfk_mon9);
	register_clientflag_callback("scriptmover", level.CLIENT_JFK_MON10, ::jfk_mon10);
	register_clientflag_callback("scriptmover", level.CLIENT_JFK_MON11, ::jfk_mon11);
	

	//	thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);
	thread clientscripts\pentagon_amb::main();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : pentagon running...");

	//Borrowed from Interrogation Escape.
	//level thread manage_extra_cam();

	//level thread skyline_shot();
	//level thread vietnam_shot();




	//init shader for pentagon
	init_filter_pentagon_fullscreen( getlocalplayers()[0] );
	init_filter_pentagon_multicam1( getlocalplayers()[0] );
	init_filter_pentagon_multicam2( getlocalplayers()[0] );
	init_filter_pentagon_bulgeblur(getlocalplayers()[0] );



	//triple camera cut during landing
	level thread start_triple_cam();
	level thread start_triple_cam_warroom();
	level thread start_fullscreen_glasses_bink();
	level thread start_jfk_bulging();

	level thread end_fullscreen_glasses_bink();

}
start_jfk_bulging()
{
	
	while(1)
	{
		level waittill("start_bulging");
		enable_filter_pentagon_bulgeblur(getlocalplayers()[0], 0, 0 );
		ramp = 0.0;
		timer = 0;
		while(1)
		{
			set_filter_pentagon_bulgeblur_amount( getlocalplayers()[0], 0, ramp );
	
			ramp += 0.02;
	
			if(ramp >= 1)
				break;
	
			wait(0.01);
	
	
		}
		ramp = 1;
		disable_filter_pentagon_bulgeblur( getlocalplayers()[0], 0 );
	}


}


start_fullscreen_glasses_bink()
{
	level waittill("start_glasses_bink");
	enable_filter_pentagon_fullscreen(getlocalplayers()[0], 0, 0 );

	ramp = 0.0;
	timer = 0;
	while(1)
	{
		ramp += 0.05;
		set_filter_pentagon_fullscreen_amount( getlocalplayers()[0], 0, ramp );

		if(ramp >= 1)
		{
			ramp = 1;
			break;
		}
		timer += 0.01;
		wait(0.01);
	}
}


end_fullscreen_glasses_bink()
{
	level waittill("end_glasses_bink");
	disable_filter_pentagon_fullscreen( getlocalplayers()[0], 0 );
}


start_triple_cam()
{

	level waittill("start_triple_cam");

	enable_filter_pentagon_multicam1( getlocalplayers()[0], 0, 0.0 );
	level thread start_binks();
	ramp = 0.0;
	timer = 0;
	while(1)
	{
		set_filter_pentagon_multicam1_amount( getlocalplayers()[0], 0, ramp );

		ramp += 0.01;

		if(ramp >= 1)
		{		
			level notify("start_bink");		
			ramp = 1;
		}

		timer += 0.01;
		wait(0.01);

	

		if(timer >= 3.2)
			break;
	}
	ramp = 1;
	set_filter_pentagon_multicam1_amount( getlocalplayers()[0], 0, ramp );
	disable_filter_pentagon_multicam1( getlocalplayers()[0], 0 );
}
start_binks()
{
	level waittill("start_bink");

	set_filter_pentagon_multicam1_bink1( getlocalplayers()[0], 0, 1 );
	wait(0.5);
	set_filter_pentagon_multicam1_bink2( getlocalplayers()[0], 0, 1 );
}

start_triple_cam_warroom()
{

	level waittill("start_triple_cam_warroom");
	level thread start_warroom_bink();
	enable_filter_pentagon_multicam2( getlocalplayers()[0], 0, 0.0 );
	set_filter_pentagon_multicam2_bink1( getlocalplayers()[0], 0, 0 );
	set_filter_pentagon_multicam2_bink2( getlocalplayers()[0], 0, 0 );

	ramp = 0.0;
	timer = 0;
	while(1)
	{
		

		ramp += 0.01;
		set_filter_pentagon_multicam2_amount( getlocalplayers()[0], 0, ramp );
		if(ramp >= 1)
		{
			level notify("start_warroom_bink");
			ramp = 1;
			break;
		}
		timer += 0.01;
		wait(0.01);

		
	}
	ramp = 1;
	level waittill("kill_warroom_bink");
	set_filter_pentagon_multicam2_amount( getlocalplayers()[0], 0, 1 );
	disable_filter_pentagon_multicam2( getlocalplayers()[0], 0 );
}
start_warroom_bink()
{
	level waittill("start_warroom_bink");

	set_filter_pentagon_multicam2_bink1( getlocalplayers()[0], 0, 1 );
	wait(0.5);
	set_filter_pentagon_multicam2_bink2( getlocalplayers()[0], 0, 1 );


}

actor_glasses_change_bink(localClientNum, set, newEnt)
{
	//PrintLn("turn on bink glasses!!!!!!!!!!!!!!!!!!!");
	self mapshaderconstant( localClientNum, 0, "ScriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0, 1, 0, 0 );
}

actor_glasses_change(localClientNum, set, newEnt)
{
	self thread turn_off_hudson_glasses(localClientNum, set);	
}

turn_off_hudson_glasses(localClientNum, set)
{	
	self mapshaderconstant( localClientNum, 0, "ScriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0, 0, 0, 0 );

}

jfk_mon1(localClientNum, set, newEnt)
{
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0.0, 0.0, 0.25, 0.25);  // UVs ( MinX, MinY, MaxX, MaxY ) ?all from 0,0-1,1 meaning TopLeft-BottomRight

}
jfk_mon2(localClientNum, set, newEnt)
{
	 // wait(.025);
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0.25, 0, 0.5, 0.25 );  // UVs ( MinX, MinY, MaxX, MaxY ) ?all from 0,0-1,1 meaning TopLeft-BottomRight

}
jfk_mon3(localClientNum, set, newEnt)
{
	 // wait(.05);
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0.5, 0.0, 0.75, 0.25 );  // UVs ( MinX, MinY, MaxX, MaxY ) ?all from 0,0-1,1 meaning TopLeft-BottomRight

}
jfk_mon4(localClientNum, set, newEnt)
{
	 // wait(.075);
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0.75, 0.0, 1, 0.25 );  // UVs ( MinX, MinY, MaxX, MaxY ) ?all from 0,0-1,1 meaning TopLeft-BottomRight

}
jfk_mon5(localClientNum, set, newEnt)
{
	 // wait(.1);
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0.0, 0.25, 0.25, 0.5 );  // UVs ( MinX, MinY, MaxX, MaxY ) ?all from 0,0-1,1 meaning TopLeft-BottomRight

}
jfk_mon6(localClientNum, set, newEnt)
{
	 // wait(.125);
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0.25, 0.25, 0.5, 0.5 );  // UVs ( MinX, MinY, MaxX, MaxY ) ?all from 0,0-1,1 meaning TopLeft-BottomRight

}
jfk_mon7(localClientNum, set, newEnt)
{
		// wait(.15);
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0.5, 0.25, 0.75, 0.5 );  // UVs ( MinX, MinY, MaxX, MaxY ) ?all from 0,0-1,1 meaning TopLeft-BottomRight

}
jfk_mon8(localClientNum, set, newEnt)
{
		 // wait(.175);
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0.75, 0.25, 1, 0.5 );  // UVs ( MinX, MinY, MaxX, MaxY ) ?all from 0,0-1,1 meaning TopLeft-BottomRight

}
jfk_mon9(localClientNum, set, newEnt)
{
		 // wait(.2);
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0.0, 0.5, 0.25, 0.75 );  // UVs ( MinX, MinY, MaxX, MaxY ) ?all from 0,0-1,1 meaning TopLeft-BottomRight

}
jfk_mon10(localClientNum, set, newEnt)
{
		 // wait(.225);
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0.25, 0.5, 0.5, 0.75 );  // UVs ( MinX, MinY, MaxX, MaxY ) ?all from 0,0-1,1 meaning TopLeft-BottomRight

}
jfk_mon11(localClientNum, set, newEnt)
{
		 // wait(.25);
	self mapshaderconstant( localClientNum, 0, "scriptVector0" ); 
	self setshaderconstant( localClientNum, 0, 0.5, 0.75, 0.75, 0.75 );  // UVs ( MinX, MinY, MaxX, MaxY ) ?all from 0,0-1,1 meaning TopLeft-BottomRight
}



/*skyline_shot() //self == level
{
//Wait until the server says go.
level waittill( "start_skyline_shot" );

//Since I cannot link to an animated ent, just approximate the path it would have traveled.
start_struct = getStruct( "struct_skyline_align", "targetname" );
end_origin = (-54136.9, -20794, 3890);

//Spawn the camera_ent and point it the correct direction.
camera_ent = spawn( 0, start_struct.origin, "script_origin" );
startToEnd = vectorNormalize( end_origin - start_struct.origin );
camera_ent.angles = vectorToAngles( startToEnd );

//Activate the camera_ent.
camera_ent isExtraCam( 0 );

//Approximate the Skyline camera animation.
camera_ent moveTo( end_origin, 7.0 );

//Deactivate extracam once the movement is complete.
camera_ent waittill( "movedone" );	
stopExtraCam( 0 );
}*/

/*vietnam_shot() //self == level
{
//Wait until the server says go.
level waittill( "start_vietnam_camera" );

//Get the Vietnam room camera and activate it.
camera_ent = getEnt( 0, "org_pool_vietnam_camera", "targetname" );
camera_ent isExtraCam( 0 );

//Wait to deactivate the camera.
level waittill( "stop_vietnam_camera" );
stopExtraCam( 0 );
}*/

/*manage_extra_cam()
{
level.extraCamActive = false;	
level thread start_extra_cam();	
level thread stop_extra_cam();
}

start_extra_cam()
{
while(1)
{
level waittill("camera_start");
if( level.extraCamActive == false )
{
level.extraCamActive = true;
level.cameraEnt = getEnt( 0, "org_security_extracam", "targetname" );
level.cameraEnt isExtraCam( 0 );

level rotate_extra_cam();
}
}		
}

rotate_extra_cam()
{
level endon( "camera_stop" );

l_angles = level.cameraEnt.angles + (0, 20, 0);
r_angles = level.cameraEnt.angles - (0, 20, 0); 

while( true )
{
level.cameraEnt rotateTo( l_angles, 3.0 );
level.cameraEnt waittill( "rotatedone" );
wait 3.0;

level.cameraEnt rotateTo( r_angles, 3.0 );
level.cameraEnt waittill( "rotatedone" );
wait 3.0;
}
}

stop_extra_cam()
{
while(1)
{
level waittill("camera_stop");

if( level.extraCamActive == true && isdefined( level.cameraEnt ) )
{
stopextracam( 0 );
level.extraCamActive = false;
}		
}		
}*/