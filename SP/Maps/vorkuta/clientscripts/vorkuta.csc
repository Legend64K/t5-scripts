// Test clientside script for vorkuta

#include clientscripts\_utility;

main()
{

	level.CLIENTFLAG_SERGEI = 15;
	level.CLIENTFLAG_JUGGERNAUT = 14;

	// _load!
	clientscripts\_load::main();

	clientscripts\vorkuta_fx::main();

	//thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\vorkuta_amb::main();
	
	// This also handles motorcycle audio and FOV changes while driving
	clientscripts\_driving_fx::init();

	// This needs to be called after all systems have been registered.
	thread waitforclient(0);
    
	register_clientflag_callback("actor", level.CLIENTFLAG_SERGEI, ::actor_flag_sergei_footstep_handler);
	register_clientflag_callback("actor", level.CLIENTFLAG_JUGGERNAUT, ::actor_flag_juggernaut_footstep_handler);


	println("*** Client : vorkuta running...");
	
	//thread e4_armory_siren();
	
	level thread tower_lights();
}

actor_flag_sergei_footstep_handler(localClientNum, set, newEnt)
{
	self.footstepPrepend = "fly_step_run_sergei_";
}

actor_flag_juggernaut_footstep_handler(localClientNum, set, newEnt)
{
	self.footstepPrepend = "fly_step_run_juggernaut_";
}

//attach glowfx to lights off of bridge
tower_lights()
{
	light = GetDynEnt( "omaha_light0" );
  PlayFXOnDynEnt( level._effect["light_glow_spot_1a"], light );
	light2 = GetDynEnt( "omaha_light2" );
  PlayFXOnDynEnt( level._effect["light_glow_spot_1a"], light2 );
}

e4_armory_siren()
{
	
	level endon ("rez_closed_door ");
	//level waittill ("player_arriving_2nd_floor_armory");	
	siren = GetEnt (0, "rotating_light", "targetname");
	
	while(1)
	{
		siren RotateYaw (360, 1);
		wait(1);	
	}
	
}	

/*	
	
e7_lerp_fov_with_speed()
{
	//self SetClientDvar( "cg_fov", level.base_fov );
	//fov remaimns unchanged from 0-50mph
	//from 50-60mph fov changes from 60-75
	//TODO: endon
	player = get_players()[0];
	level.player_speed =0;
	flag_wait ("player_on_bike");
	level.base_fov = 65;
	level.max_fov = 75;
	level.new_fov = 0;
	
	while(1)
	{
		if(level.player_speed < 50)
		{
			player SetClientDvar( "cg_fov", level.base_fov );
		}
		else if(level.player_speed > 60)
		{
			player SetClientDvar( "cg_fov", level.max_fov );
		}	
		else
		{
			base_speed = level.player_speed -50;
			base_speed = (base_speed * base_speed) /10;
			level.new_fov = level.base_fov + base_speed;
			player SetClientDvar( "cg_fov", level.new_fov );
			
		}
		wait(.016);
	}
	
}	

*/