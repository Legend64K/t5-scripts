//
// file: wmd_sr71_amb.csc
// description: clientside ambient script for wmd_sr71: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;
#include clientscripts\_busing;
#include clientscripts\_audio;

main()
{
	//************************************************************************************************
	//                                              Ambient Packages
	//************************************************************************************************

	//declare an ambientpackage, and populate it with elements
	//mandatory parameters are <package name>, <alias name>, <spawnMin>, <spawnMax>
	//followed by optional parameters <distMin>, <distMax>, <angleMin>, <angleMax>
	
	
	//************************************************************************************************
	//                                       ROOMS
	//************************************************************************************************

	//explicitly activate the base ambientpackage, which is used when not touching any ambientPackageTriggers
	//the other trigger based packages will be activated automatically when the player is touching them
	//the same pattern is followed for setting up ambientRooms
	
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

//		activateAmbientPackage( 0, "_pkg", 0 );
//		activateAmbientRoom( 0, "_room", 0 );		

		declareAmbientRoom( "wmd_sr71_outside_high" );			
			//setAmbientRoomTone( "wmd_sr71_outside_high", "bgt_outdoor_wind_high" );
			setAmbientRoomReverb( "wmd_sr71_outside_high", "wmdsr_sr71", 1, 1 );
			setAmbientRoomContext( "wmd_sr71_outside_high", "ringoff_plr", "outdoor" );
			
		//ECKERT: med - lrg room with low celing, med diffuse, metal and cement surfaces
		declareAmbientRoom( "wmd_sr71_safe_house" );			
			setAmbientRoomTone( "wmd_sr71_safe_house", "bgt_computer_room" );
			setAmbientRoomReverb( "wmd_sr71_safe_house", "wmdsr_safehouse", 1, 1 );
			setAmbientRoomContext( "wmd_sr71_safe_house", "ringoff_plr", "indoor" );

		declareAmbientRoom( "garage" );			
			setAmbientRoomTone( "garage", "bgt_garage_room" );
			setAmbientRoomReverb( "garage", "wmdsr_garage", 1, 1 );
			setAmbientRoomContext( "garage", "ringoff_plr", "indoor" );
					
		declareAmbientRoom( "barracks" );			
			setAmbientRoomTone( "barracks", "bgt_computer_room" );
			setAmbientRoomReverb( "barracks", "wmdsr_barracks", 1, 1 );
			setAmbientRoomContext( "barracks", "ringoff_plr", "indoor" );
	
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

//		activateAmbientPackage( 0, "_pkg", 0 );
		activateAmbientRoom( 0, "wmd_sr71_outside_high", 0 );		
		



// MUSIC STATES

	declareMusicstate("INTRO_SR71");
		musicAliasLoop("mus_sr71_intro_loop", 0, 4);
		
	declareMusicstate("SR71_RUNWAY");
		musicAlias("null", 1);	
		
	declareMusicState("SR71_GLOBE");
		musicAlias ("mus_sr71_hard_target", 1);
		musicwaittilldone();

	declareMusicstate("SR71_RTS");
		musicAliasLoop("mus_sr71_rts_intro", 2, 3);
		
	declareMusicState ("SAFEHOUSE");
		musicAliasLoop ("mus_ground_building_one", 0, 2);
		musicStinger ("mus_building_safehouse_fight", 8, true);
		
	declareMusicState ("SAFEHOUSE_FIGHT");
		musicAliasLoop ("mus_building_safehouse_loop", 1, 0.5);
		
	declareMusicState ("BACK_IN_PLANE");
		musicAliasLoop("mus_sr71_rts_ext", 0, 6);

	declareMusicState ("GO_PRONE");
		musicAliasLoop("mus_snow_hide", 0, 2);
		
	declareMusicstate("SR71_RTS_SECOND_STATE");
		musicAliasLoop("mus_sr71_rts_intro", 2, 0);
		musicStinger ("mus_building_two_fight_intro", 24, true);
		
	declareMusicState("BARRACKS_BREECH");		
		musicAliasLoop ("mus_ground_building_two", 0, 2);
		musicStinger ("mus_ground_building_postfight", 50, true);
		musicwaittillstingerdone();
	
	declareMusicState("POST_FIGHT_STINGER");
		musicAliasLoop("null", 0, 2);	

	declareMusicstate("ON_THE_GROUND");
		musicAliasLoop("mus_snow_hide", 3, 3);

	declareMusicstate("ON_THE_GO");
		musicAliasLoop("mus_stealth_rapel", 1, 2);

	declareMusicstate("WINDOW_BREACH");
			musicAlias ("mus_breach_stinger", 10);
			musicAliasLoop("mus_post_breech", 0, 2);

	declareMusicstate("FIGHT");
			musicAliasLoop("mus_radar_battle", 0, 2);
			musicStinger("mus_radar_battle_stg");

	declareMusicstate("RADAR_FIGHT_DONE");
		musicAlias("null", 1);	

	declareMusicstate("AVALANCH");
			musicAliasLoop("mus_avalanch_run", 0, 2);
			musicStinger("mus_avalanch_run_stg");

	declareMusicstate("FALLING");
			musicAliasLoop("NULL", 4, 2);
		
// Start radar sounds running

	thread snd_radar_groan_loop();
	thread snd_radar_engine_loop();

// set up wind sounds for when guys come crashing in

	thread snd_window_wind_1();
	thread snd_window_wind_2();
	thread snd_window_wind_3();
	
	
// set up sounds for computer room

//	thread lower_door_breach();
//	thread basejump_functions();
	
// Start SR71 sounds
	
	thread sr71_sound_start();
	thread sr71_start_up();
	thread sr71_wait_for_x();
	thread sr71_external_before_launch();
	thread sr71_fire_thrusters();
	thread sr71_second_cut();
	thread sr71_by_cut();
	thread sr71_back_in_cockpit();
	thread sr71_fade_to_space();
	thread sr71_space_snap_to_cockpit();
	thread sr71_space_go_outside();
	thread sr71_space_backin();
	thread sr71_go_to_ground();
	thread screen_loops();
	// thread window_breach_functions();
	
	// thread avalanch_snapshot();
	// thread base_jump_snapshot();
	// thread window_breech_reverb();


}





snd_radar_groan_loop()
{
	level waittill("start_base_sounds");
	radar_groan_ent = getent (0, "dish_groan" , "targetname");
	//TODO isDefine check for ent
	if (IsDefined(radar_groan_ent))
	{
			radar_groan_ent playloopsound ("amb_radar_creak_loop", 1 );
			level waittill ("radar_disabled");
			radar_groan_ent stoploopsound (0.5);
			playsound (0, "evt_radar_groan_stop", radar_groan_ent.origin );
	}
	else 
	{
//		iprintlnbold ("Could not find sound groan entity");
	}


}

snd_radar_engine_loop()
{
	level waittill("start_base_sounds");
	radar_engine_ent = getent (0, "dish_engine" , "targetname");
	//TODO isDefine check for ent
	if (IsDefined(radar_engine_ent))
	{
		radar_engine_ent playloopsound ("amb_radar_engine_loop", 1 );
		level waittill ("radar_disabled");
		
		//iprintlnbold ("HERE!");
		radar_engine_ent stoploopsound ( 0.5 );

		playsound (0, "evt_radar_engine_stop", radar_engine_ent.origin );
	}
	else 
	{
		/#
		iprintlnbold ("Could not find engine entity");
		#/
	}

}

snd_window_wind_1()
{
	level waittill("start_base_sounds");
	window_1_ent = getent (0, "window_1", "targetname");
	if (IsDefined(window_1_ent))
	{
		level waittill ("window_1");
		window_1_ent playloopsound ("evt_window_wind", 0.25);
		
		
	}
	else 
	{
		/#
		iprintlnbold ("Could not find window_1 entity");
		#/
	}
	
	
}

snd_window_wind_2()
{
	level waittill("start_base_sounds");
		window_2_ent = getent (0, "window_2", "targetname");
	if (IsDefined(window_2_ent))
	{
		level waittill ("window_2");
		window_2_ent playloopsound ("evt_window_wind", 0.25);
		
		
	}
	else 
	{
		/#
		iprintlnbold ("Could not find window_2 entity");
		#/
	}	
	
}


snd_window_wind_3()
{
	level waittill("start_base_sounds");
	window_3_ent = getent (0, "window_3", "targetname");
	if (IsDefined(window_3_ent))
	{
		level waittill ("window_3");
		window_3_ent playloopsound ("evt_window_wind", 0.25);
		
		
	}
	else 
	{
		/#
		iprintlnbold ("Could not find window_3 entity");
		#/
	}
	
}






//********SR71 Section******************

//actual sound starts server side in level gsc

sr71_sound_start()
{
	
	breathingent = Spawn( 0, (0,0,0), "script_origin" );
	level thread sr71_close_canopy(breathingent);
	level waittill("first_snap_on");
	Radioent = Spawn( 0, (0,0,0), "script_origin" );
	level thread sr71_lift_off(radioent);
	Radioent PlayLoopSound( "evt_tower_radio", 0 );
	breathingent PlayLoopSound( "veh_sr71_breathing", 0 );
	snd_set_snapshot ("wmd_sr71_ext");

}

sr71_close_canopy(breathingent)
{
	level waittill ("canopy_shut_start");
	playsound (0, "veh_sr71_canopy_close", (0,0,0));
	snd_set_snapshot ("wmd_sr71_close_canopy");
	breathingent StopLoopSound(6);
	level waittill ("canopy_shut_end");
	playsound (0, "veh_sr71_canopy_latch", (0,0,0));
}
	
sr71_start_up()
{
	level waittill ("clear_for_takeoff");
	playsound (0, "veh_sr71_start_lr", (0,0,0));
}
	
	
	
sr71_wait_for_x()
{
	level waittill ("wait_for_x");
	playsound (0, "veh_sr71_wait_for_x", (0,0,0) );
	
}

sr71_external_before_launch()
{
	level waittill ("external_before_launch");
	snd_set_snapshot ("wmd_sr71_takeoff_sequence_ext");
}
	
	
sr71_fire_thrusters()
{
	//start engine rolling oneshot sounds
	players =  getlocalplayers();
	player = players[0];
	level waittill ("thrusters_on");
	playsound (0, "veh_sr71_roll_int", player.origin );
	playsound (0, "veh_sr71_fire_main", (0,0,0) );
		
}
	
sr71_second_cut()
{
	level waittill ("second_cut");
	playsound (0, "veh_sr71_boost", (0,0,0) );
	
}
	
sr71_by_cut()	
{
	level waittill ("by_cut");
	playsound (0, "veh_sr71_by", (0,0,0) );
	
}
	
sr71_back_in_cockpit()
{
	level waittill ("get_back_in_cockpit");
	snd_set_snapshot ("wmd_sr71_takeoff_seqence_int");
	
}
	
sr71_lift_off(radioent)
{	
	level waittill ("lift_off");
	playsound (0, "veh_sr71_lift_off_int", (0,0,0) );
	radioent stoploopsound(8);
	
}
	
sr71_fade_to_space()	
{
	while(1)
	{	
		level waittill ("white_fade_post_liftoff");
		snd_set_snapshot ("wmd_sr71_first_into_space");
	}
	
}
	
sr71_space_snap_to_cockpit()
{
	while(1)
	{
		level waittill ("sic");
		snd_set_snapshot ("wmd_sr71_space_into_cockpit");
	}
	
}
	
sr71_space_go_outside()	
{
	while(1)
	{
		level waittill ("space_go_outside");
		snd_set_snapshot ("wmd_sr71_cockpit_into_space");
	}
	
}
sr71_space_backin()
{
	while(1)
	{
		level waittill ("space_backin");
		snd_set_snapshot ("wmd_sr71_back_into_cockpit");
	}
	
}
sr71_go_to_ground()
{
	while(1)
	{
		level waittill ("gtg");
		snd_set_snapshot ("default");
	}

}
	
screen_loops()
{
	sound_ent_screen_a = spawn (0, (-71148, 61318, 19345), "script_origin");
	sound_ent_screen_b = spawn (0, (-71148, 61318, 19345), "script_origin");

	sound_ent_screen_a playloopsound ("veh_sr71_static_loop", 1.5);	
	sound_ent_screen_b playloopsound ("veh_sr71_tech_loop", 1.5);	
}

	/*
window_breach_functions()
{
	breach_bg_ent = Spawn( 0, (0,0,0), "script_origin" );


	
	level waittill ("breach_sound_go");
//	snd_set_snapshot ("wmd_window_breach"); // MOVED TO ALIAS
	
	breach_bg_ent playloopsound ("evt_win_breach_bg");
	
	
	playsound (0, "evt_win_breach_push", (0,0,0));
	
	level waittill ("breach_window_break");
//	playsound (0, "evt_win_breach_glass_shatter", (0,0,0));
	
	level waittill ("Breach_sound_stop");
	
//	playsound (0, "evt_win_breach_come_out", (0,0,0));
	
	breach_bg_ent stoploopsound(3);
	
	snd_set_snapshot ("default");
	
	breach_bg_ent delete();
	
	


}
 */
/*
lower_door_breach()
{
	level waittill ("breach_begin");
	playsound (0, "evt_door_kick", (0,0,0));

}
*/



//********BASEJUMP STUFF BELOW HERE******************
/*
basejump_functions()
{
	level.para = false;       
	level.point = true;
	level.jump = false;
	//For WIND sounds during freefall
	level thread update_player_vel();
	level thread wind_sounds();
	
	//For HEARTBEAT and BREATH sounds Pre-Jump
	level thread distance_check();
	level thread levelstart_moment_sounds();
	//level thread levelstart_heartbeat_rumble();
	
	level thread end_sounds();
}
*/
/*

end_sounds()
{
	level waittill( "jump" );
	level.jump = true;
	level waittill( "para" );
	level.para = true;
}
*/
/*
update_player_vel()
{
	
	WaitForClient( 0 );
	
	for(;;)
	{
		if(level.para)
			return;
		
		players = getlocalplayers();	

		for(i=0; i<players.size; i++)
		{
			player = players[i];
			
			if(!isdefined(player.vel))
			{
				player.vel = (0,0,0);
				player.old_origin = player.origin;
			}
			else
			{
				player.vel = player.origin - player.old_origin;
				player.old_origin = player.origin;
			}
		}	
		wait(.05);

	}
}
*/

/*
wind_sounds()
{
	wait(1);
	
	trigger = GetEnt( 0, "start_wind_sounds", "targetname" );
	
	if(!IsDefined(trigger))
		return;
		
	trigger waittill( "trigger" );
	

	
	freefall0_wind_ent = spawnfakeent(0);
	freefall1_wind_ent = spawnfakeent(0);
	freefall2_wind_ent = spawnfakeent(0);
	
	clothflap_wind_ent = spawnfakeent(0);
	
	forward0_wind_ent = spawnfakeent(0);
	forward1_wind_ent = spawnfakeent(0);
	forward2_wind_ent = spawnfakeent(0);
	
	left0_wind_ent = spawnfakeent(0);
	left1_wind_ent = spawnfakeent(0);
	
	right0_wind_ent = spawnfakeent(0);
	right1_wind_ent = spawnfakeent(0);
	
	freefall_wind0_id = playloopsound( 0, freefall0_wind_ent, "evt_basejump_freefall_fnt", 1 );
	freefall_wind1_id = playloopsound( 0, freefall1_wind_ent, "evt_basejump_freefall_rear", 1 );
	freefall_wind2_id = playloopsound( 0, freefall2_wind_ent, "evt_basejump_freefall_clfe", 1 );
	
	clothflap_wind_id = playloopsound( 0, clothflap_wind_ent, "evt_clothflap_st", 1 );
	
	forward_wind0_id = playloopsound( 0, forward0_wind_ent, "evt_basejump_forward_fnt", 1 );
	forward_wind1_id = playloopsound( 0, forward1_wind_ent, "evt_basejump_forward_rear", 1 );
	forward_wind2_id = playloopsound( 0, forward2_wind_ent, "evt_basejump_forward_clfe", 1 );
	
	left_wind0_id = playloopsound( 0, left0_wind_ent, "evt_basejump_left_lls", 1 );
	left_wind1_id = playloopsound( 0, left1_wind_ent, "evt_basejump_left_rrs", 1 );
	
	right_wind0_id = playloopsound( 0, right0_wind_ent, "evt_basejump_right_lls", 1 );
	right_wind1_id = playloopsound( 0, right1_wind_ent, "evt_basejump_right_rrs", 1 );
	

	
	max_speed_z = 50;
	min_speed_z = 5;
	max_speed_x = 10;
	max_speed_y = 10;
	
	players = getlocalplayers();
	player = players[0];

	//player thread print_my_position();
	
	for(;;)
	{
		if(level.para)
		{
			StopLoopSound( 0, freefall0_wind_ent, 1);
			StopLoopSound( 0, freefall1_wind_ent, 1);
			StopLoopSound( 0, freefall2_wind_ent, 1);
			StopLoopSound( 0, clothflap_wind_ent, 1);
			StopLoopSound( 0, forward0_wind_ent, 1);
			StopLoopSound( 0, forward1_wind_ent, 1);
			StopLoopSound( 0, forward2_wind_ent, 1);
			StopLoopSound( 0, left0_wind_ent, 1);
			StopLoopSound( 0, left1_wind_ent, 1);
			StopLoopSound( 0, right0_wind_ent, 1);
			StopLoopSound( 0, right1_wind_ent, 1);
			wait(.05);
			playloopsound( 0, freefall0_wind_ent, "evt_para_float_wind", 1 );
			level waittill( "land" );
			StopLoopSound( 0, freefall0_wind_ent, 1);
			return;
		}
		
		freefall_wind_vol = get_freefall_volume( player.vel[2], max_speed_z,min_speed_z );
		forward_wind_vol = get_freefall_volume( player.vel[1], max_speed_y, 0 );
	
		if(player.vel[0] < 0)
			left_wind_vol = get_freefall_volume( player.vel[0], max_speed_x, 0 );
		else
			left_wind_vol	= 0;
		
		if(player.vel[0] > 0)
			right_wind_vol = get_freefall_volume( player.vel[0], max_speed_x, 0 );
		else
			right_wind_vol	= 0;
		
		setsoundvolume(freefall_wind0_id, freefall_wind_vol);
		setsoundvolume(freefall_wind1_id, freefall_wind_vol);
		setsoundvolume(freefall_wind2_id, freefall_wind_vol);
		setsoundvolume(clothflap_wind_id, freefall_wind_vol);
		setsoundvolume(forward_wind0_id, forward_wind_vol);
		setsoundvolume(forward_wind1_id, forward_wind_vol);
		setsoundvolume(forward_wind2_id, forward_wind_vol);
		setsoundvolume(left_wind0_id, left_wind_vol);
		setsoundvolume(left_wind1_id, left_wind_vol);
		setsoundvolume(right_wind0_id, right_wind_vol);
		setsoundvolume(right_wind1_id, right_wind_vol);
		
		//IPrintLnBold( "Freefall: " + freefall_wind_vol + " Forward: " + forward_wind_vol + " Left: " + left_wind_vol + " Right: " + right_wind_vol );
		
		wait(.05);
	}
}
*/

/*
get_freefall_volume( velocity, max_speed, min_speed )
{
	volume = 0;
	
	if( velocity < 0 )
		volume = (velocity + min_speed)/(max_speed*-1);
	else if( velocity > 0 )
		volume = (velocity - min_speed)/max_speed;
	else if( velocity == 0 )
		volume = 0;
	
	if( volume > 1 )
		volume = 1;
		
	return volume;
}
*/
/*
print_my_position()
{
	//x - left/right
	//y - faster/slower
	//z - up/down
	//pos - right, up, faster
	while(true)
	{
		if(isdefined(self.vel))
		{
			/#
			iPrintLnBold( "My Velocity: " + self.vel[0] + " " + self.vel[1] + " " + self.vel[2] );
			#/
		}
		wait(0.5);
	}
}
*/
/*
//Checks distance Player is from edge of cliff
distance_check()
{
	point = GetEnt( 0, "distance_check", "targetname" );
	if(!IsDefined(point))
	{
		level.point = false;
		return;
	}
	
	while(1)
	{
		players = getlocalplayers();
		if(!isdefined(players) || !isdefined(players[0]))
		{
			wait(.05);			
			continue;
		}
		else
		{
			break;
		}
		wait(.05);
	}
	wait(5);
	
	
	
	for(;;)
	{
		if(level.para)
			return;
			
		players = getlocalplayers();
		
		if(!isdefined(players) || !isdefined(players[0]))
		{
			wait(.01);
			continue;
		}
		
		for(i=0; i<players.size; i++)
		{
			player = players[i];
			player.dist = Distance( player.origin, point.origin );
		}	
		wait(.01);
	}
}
*/
/*
levelstart_heartbeat_rumble()
{
	wait(1);
	
	max_dist = 800;
	min_dist = 75;	
	
	while(1)
	{
		players = getlocalplayers();
		if(!isdefined(players) || !isdefined(players[0]))
		{
			wait(.05);			
			continue;
		}
		else
		{
			break;
		}
		wait(.05);
	}
	wait(5);
	
	players = getlocalplayers();
	player = players[0];
	
	for(;;)
	{
		if( level.para || !level.point || level.jump)
		{
			return;
		}
		
		heartbeat_str = get_levelstart_volume(player.dist, max_dist, min_dist);
		
		if( heartbeat_str < .2 )
		{
			//-- no heartbeat, strength is too weak
			wait(1.2);
		}
		else if(heartbeat_str < .45)
		{
			player PlayRumbleOnEntity( 0, "damage_light");
			wait(1.2);
		}
		else if(heartbeat_str < .7)
		{
			player PlayRumbleOnEntity( 0, "damage_heavy");
			wait(0.9);
		}
		else if(heartbeat_str <= 1)
		{
			player PlayRumbleOnEntity( 0, "damage_heavy");
			wait(0.5);
		}
	}
	
}
*/
/*
levelstart_moment_sounds()
{
	level waittill("start_heartbeat");
	wait(1);
	
	max_dist = 800;
	min_dist = 75;
	
	levelstart_heartbeat_ent = spawnfakeent(0);
	levelstart_breath_ent = spawnfakeent(0);
	
	levelstart_heartbeat_id = playloopsound( 0, levelstart_heartbeat_ent, "evt_player_heartbeat", 1 );
	levelstart_breath_id = playloopsound( 0, levelstart_breath_ent, "evt_player_breath", 1 );
	
	players = getlocalplayers();
	player = players[0];
	
	for(;;)
	{
		if( level.para )
			return; 
		if( !level.point || level.jump )
		{
			StopLoopSound( 0, levelstart_heartbeat_ent, 1 );  
			StopLoopSound( 0, levelstart_breath_ent, 1 ); 
			return;
		}
			
		levelstart_vol = get_levelstart_volume( player.dist, max_dist, min_dist );
		
		setsoundvolume(levelstart_heartbeat_id, levelstart_vol);
		setsoundvolume(levelstart_breath_id, levelstart_vol);
		
		//IPrintLnBold( "Volume is " + levelstart_vol );
		wait(.05);
	}
} */

/* 
get_levelstart_volume( dist, max_dist, min_dist )
{
	volume = 0;
	
	if( dist > max_dist )
		volume = 0;
	else if( dist < max_dist )
		volume = (dist - max_dist)/max_dist*(-1);
	else if( dist < min_dist )
		volume = 1;
	
	if( volume > 1 )
		volume = 1;
		
	return volume;
}
*/
/*
avalanch_snapshot()
{
	level waittill ("avalanch");	
	activateAmbientRoom( 0, "avalanch", 60 );	
	
	snd_set_snapshot( "wmd_avalanch" );	
	
}
*/
/*
base_jump_snapshot()
{
	level waittill ("falling");	
	snd_set_snapshot( "wmd_base_jump" );	
	
}
*/
/*
window_breech_reverb()
{
	level waittill ("wbr");  //window breach reverb
	activateAmbientRoom( 0, "window_breach", 60 );	
	
	level waittill("Breach_sound_stop");
	deactivateAmbientRoom(0, "window_breach", 60);	
	
}
*/