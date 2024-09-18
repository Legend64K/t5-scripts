//
// file: flashpoint_amb.csc
// description: clientside ambient script for flashpoint: setup ambient sounds, etc.
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
		declareAmbientRoom( "flashpoint_outside" );
		
			setAmbientRoomTone( "flashpoint_outside", "bgt_outdoor_wind", 1, 1 );
			setAmbientRoomReverb( "flashpoint_outside", "flashpoint_outside", 1, 1 );
			setAmbientRoomContext( "flashpoint_outside", "ringoff_plr", "outdoor" );
			
		declareAmbientRoom( "flashpoint_opening_trail" );		
			
			setAmbientRoomTone( "flashpoint_opening_trail", "bgt_outdoor_wind", 1, 1 );
			setAmbientRoomReverb( "flashpoint_opening_trail", "flashpoint_outside", 1, 1 );
			setAmbientRoomContext( "flashpoint_opening_trail", "ringoff_plr", "outdoor" );	
			setAmbientRoomSnapshot( "flashpoint_opening_trail", "creek_hut_rain_dip" );
					
		declareAmbientRoom( "flashpoint_compound" );
			setAmbientRoomTone( "flashpoint_compound", "bgt_indoor_wind" );
			setAmbientRoomReverb( "flashpoint_compound", "flashpoint_compound", 1, 1 );
			setAmbientRoomContext( "flashpoint_compound", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "flashpoint_drainage_room" );
			setAmbientRoomTone( "flashpoint_drainage_room", "amb_flashpoint_drainage_room" );
			setAmbientRoomReverb( "flashpoint_drainage_room", "flashpoint_drainage_room", 1, 1 );
			setAmbientRoomContext( "flashpoint_drainage_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "flashpoint_rocket_pad" );
					
//			setAmbientRoomTone( "flashpoint_rocket_pad", "amb_gantry_roomf" );
			setAmbientRoomReverb( "flashpoint_rocket_pad", "flashpoint_rocket_pad", 1, 1 );
			setAmbientRoomContext( "flashpoint_rocket_pad", "ringoff_plr", "indoor" );
	
	
		declareAmbientRoom( "flashpoint_outside_alley" );					
//			setAmbientRoomTone( "flashpoint_outside_alley", "amb_gantry_roomf" );
			setAmbientRoomReverb( "flashpoint_outside_alley", "flashpoint_alley", 1, 1 );
			setAmbientRoomContext( "flashpoint_outside_alley", "ringoff_plr", "outdoor" );
	
		declareAmbientRoom( "flashpoint_facility_office_room" );					
			setAmbientRoomTone( "flashpoint_facility_office_room", "amb_computer_roomf" );
			setAmbientRoomReverb( "flashpoint_facility_office_room", "flashpoint_office_room", 1, 1 );
			setAmbientRoomContext( "flashpoint_facility_office_room", "ringoff_plr", "indoor" );
	
		declareAmbientRoom( "flashpoint_facility_stairs" );					
			setAmbientRoomTone( "flashpoint_facility_stairs", "amb_computer_roomf" );
			setAmbientRoomReverb( "flashpoint_facility_stairs", "flashpoint_stairs", 1, 1 );
			setAmbientRoomContext( "flashpoint_facility_stairs", "ringoff_plr", "indoor" );
	
			
		declareAmbientRoom( "flashpoint_computer_room" );
			setAmbientRoomTone( "flashpoint_computer_room", "amb_computer_roomf" );
			setAmbientRoomReverb( "flashpoint_computer_room", "flashpoint_computer_room", 1, 1 );
			setAmbientRoomSnapshot("flashpoint_computer_room", "flashpoint_gantry");
			setAmbientRoomContext( "flashpoint_computer_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "flashpoint_compound_room" );
			setAmbientRoomTone( "flashpoint_compound_room", "amb_computer_roomf", 2, 2 );
			setAmbientRoomReverb( "flashpoint_compound_room", "flashpoint_compound_room", 1, 1 );
			setAmbientRoomContext( "flashpoint_compound_room", "ringoff_plr", "indoor" );
			
			
		declareAmbientRoom( "flashpoint_compound_stairs" );
			setAmbientRoomTone( "flashpoint_compound_stairs", "amb_gantry_roomf" );
			setAmbientRoomReverb( "flashpoint_compound_stairs", "flashpoint_compound_stairs", 1, 1 );
			setAmbientRoomContext( "flashpoint_compound_stairs", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "flashpoint_compound_stair" );
			setAmbientRoomTone( "flashpoint_compound_stair", "amb_gantry_roomf" );
			setAmbientRoomReverb( "flashpoint_compound_stair", "flashpoint_compound_stair", 1, 1 );
			setAmbientRoomContext( "flashpoint_compound_stair", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "flashpoint_gantry_platform" );					
//			setAmbientRoomTone( "flashpoint_gantry_platform", "amb_gantry_roomf" );
			setAmbientRoomReverb( "flashpoint_gantry_platform", "flashpoint_gantry_platform", 1, 1 );
			setAmbientRoomContext( "flashpoint_gantry_platform", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "flashpoint_facility_room_small" );					
			setAmbientRoomTone( "flashpoint_facility_room_small", "amb_computer_roomf" );
			setAmbientRoomReverb( "flashpoint_facility_room_small", "flashpoint_facility_small_a", 1, 1 );
			setAmbientRoomContext( "flashpoint_facility_room_small", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "flashpoint_facility_small_room" );					
			setAmbientRoomTone( "flashpoint_facility_small_room", "amb_gantry_roomf" );
			setAmbientRoomReverb( "flashpoint_facility_small_room", "flashpoint_facility_small_b", 1, 1 );
			setAmbientRoomContext( "flashpoint_facility_small_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "flashpoint_facility_large_concrete_room  " );					
			setAmbientRoomTone( "flashpoint_facility_large_concrete_room  ", "amb_gantry_roomf" );
			setAmbientRoomReverb( "flashpoint_facility_large_concrete_room  ", "flashpoint_concrete_room", 1, 1 );
			setAmbientRoomContext( "flashpoint_facility_large_concrete_room  ", "ringoff_plr", "indoor" );
			
			
		declareAmbientRoom( "flashpoint_facility_room_large" );					
			setAmbientRoomTone( "flashpoint_facility_room_large", "amb_gantry_roomf" );
			setAmbientRoomReverb( "flashpoint_facility_room_large", "flashpoint_facility_room_large", 1, 1 );
			setAmbientRoomContext( "flashpoint_facility_room_large", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "flashpoint_facility_room_tunnel" );					
			setAmbientRoomTone( "flashpoint_facility_room_tunnel", "amb_gantry_roomf" );
			setAmbientRoomReverb( "flashpoint_facility_room_tunnel", "flashpoint_facility_tunnel", 1, 1 );
			setAmbientRoomContext( "flashpoint_facility_room_tunnel", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "flashpoint_facility_tunnel_high_celing" );					
			setAmbientRoomTone( "flashpoint_facility_tunnel_high_celing", "amb_gantry_roomf" );
			setAmbientRoomReverb( "flashpoint_facility_tunnel_high_celing", "flashpoint_facility_high", 1, 1 );
			setAmbientRoomContext( "flashpoint_facility_tunnel_high_celing", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "flashpoint_facility_large_concrete_room" );					
			setAmbientRoomTone( "flashpoint_facility_large_concrete_room", "amb_gantry_roomf" );
			setAmbientRoomReverb( "flashpoint_facility_large_concrete_room", "flashpoint_large_concrete", 1, 1 );
			setAmbientRoomContext( "flashpoint_facility_large_concrete_room", "ringoff_plr", "indoor" );
			
		declareAmbientRoom ("window_breach");
			setAmbientRoomTone ("window_breach", "NULL");
			setAmbientRoomReverb( "window_breach", "wmd_window_breach", 1, 1 );
			setAmbientRoomContext( "window_breach", "ringoff_plr", "outdoor" );
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

//		activateAmbientPackage( 0, "_pkg", 0 );
		activateAmbientRoom( 0, "flashpoint_outside", 0 );		


// MUSIC STATES ********************************

		declareMusicState("INTRO"); 
			musicAliasloop("mus_flashpoint_underscore", 0, 4);
			
		declareMusicState ("EYE_SCENE");
			musicAliasloop("mus_eyes_binoculars", 2, 4);
			
		declareMusicState ("MASON_BINOCULARS");
			musicAlias("mus_eyes_mason_binoculars", 2);
			musicwaittilldone();

		declareMusicState ("END_BINOCULAR_SCENE");
			musicAliasloop("mus_flashpoint_run_pipe", 0.5, 2);
			musicStinger ("mus_eagleclaw_melee_guard_STG", 10);
			
		declareMusicState ("MELEE_GUARD");
			musicAliasloop ("mus_flashpoint_underscore_pipe", 2, 2);
			
		declareMusicState ("BASE_WALK");
			musicaliasloop ("mus_flashpoint_base_underscore", 0, 2);
			musicStinger ("mus_flashpoint_base_enter_STG", 5);
		
		declareMusicState ("BASE_ALERT");
			musicalias ("mus_flashpoint_base_alert", 1);
			musicwaittilldone();
		
		declareMusicState ("BASE_UNDERSCORE");
			musicAliasloop ("mus_flashpoint_base_underscore", 2, 2);
			musicStinger ("mus_flashpoint_base_melee_STG", 3, true);
			
		declareMusicState ("BASE_MELEE");
			musicAliasloop ("mus_flashpoint_base_underscore", 2, 2);
			
		declareMusicState ("BASE_FIGHT");			
			musicAliasloop ("mus_flashpoint_base_stairs", 0, 4);
			
		declareMusicState ("POST_BASE_FIGHT");
			musicAliasloop ("mus_flashpoint_base_underscore", 2, 2);
					
		declareMusicState ("ACQUIRE_CROSSBOW");
			musicAliasloop ("mus_punchthrough_base_prefight", 0.5, 0.5);
			
		declareMusicState ("WINDOW_BREACH");
		    musicAlias("mus_flamingresurrection_breach_STG");
		    musicAliasloop ("mus_flashpoint_base_underscore", 2, 2);
		
		declareMusicState ("GANTRY_FIGHT");			
			musicAliasloop ("mus_flashpoint_base_stairs", 0, 4);
			
		declareMusicState ("POST_GANTRY_FIGHT");
			musicAliasloop ("mus_flashpoint_underscore_pipe", 2, 2);		

		declareMusicState ("KILL_ROCKET");
			musicAliasloop ("mus_bo10_kill_rocket_loop", 0, 0);
			musicStinger ("mus_redglare_kill_rocket_STG", 0, true);
		
		declareMusicState ("ROCKET_DESTROYED");	
			musicAliasloop ("NULL", 0, 0);
			//musicStinger("mus_redglare_post_rocket", 86, true);
		
		declareMusicState ("INFILTRATE_BASE");				
			musicAliasloop ("mus_redglare_post_rocket", 2, 2);
		
		declaremusicstate ("IN_BASE");
			musicAliasloop ("mus_flashpoint_base_stairs_b", 2, 4);
		
		declareMusicState ("SLIDES");				
			musicAliasloop ("mus_thewall_slides", 2, 0);
		
	
	///FUNCS			
		thread computer_data_audio();
		thread window_breech_reverb();
		thread window_breach_functions();
		thread e3_end_snapshot();
		thread snd_fx_create();
		thread snd_rocket_notify();
		thread snapshot_slides();
		thread force_play_ambient_sound_intro();
}

computer_data_audio()
{
	terminal = getstructarray( "terminal" , "targetname" );
	
	if( isdefined( terminal ) )
	{
		for( i=0; i<terminal.size; i++ )
		{
			terminal[i] thread data_audio();
			//terminal[randomIntRange(0,terminal.size)] thread data_audio(randomIntRange(5,10),randomIntRange(1,10));
			//level waittill( "data_done" );
		}
	}
}

data_audio()//self is the struct that is chosen in computer_data_audio()
{
	while(1)
	{
		cycle = randomIntRange(5,10);
		repetition = randomIntRange(1,10);
		
		for( r=0; r<repetition; r++ )
		{
			//iprintlnbold( "repetition" + repetition );
			for( c=0; c<cycle; c++ )
			{
				//iprintlnbold( "cycle" + cycle );
				playsound( 0 , "amb_computer_data" , self.origin );
				wait .048;//These are one shots that I cut from a file.  The file has them playing around this interval but I made it .048 because that is the script rate.
			}
			//iprintlnbold( "waiting");
			wait .144;//a multiple of .016
		}
		//level notify( "data_done" );
	}
}
window_breech_reverb()
{
	level waittill ("wbr");  //window breach reverb
	activateAmbientRoom( 0, "window_breach", 60 );	
	
	level waittill("Breach_sound_stop");
	deactivateAmbientRoom(0, "window_breach", 60);	
	
}
window_breach_functions()
{
	breach_bg_ent = Spawn( 0, (0,0,0), "script_origin" );


	
	level waittill ("breach_sound_go");
//	snd_set_snapshot ("wmd_window_breach"); // MOVED TO ALIAS
	
	breach_bg_ent playloopsound ("evt_win_breach_bg");
	
	
	//playsound (0, "evt_win_breach_push", (0,0,0));
	
	//level waittill ("breach_window_break");
//	playsound (0, "evt_win_breach_glass_shatter", (0,0,0));
	
	level waittill ("Breach_sound_stop");
	
//	playsound (0, "evt_win_breach_come_out", (0,0,0));
	
	breach_bg_ent stoploopsound(3);
	
	//snd_set_snapshot ("default");
	
	breach_bg_ent delete();
	
	


}

e3_end_snapshot()
{
	level waittill( "window_snapshot" );
	snd_set_snapshot ("special_event");
	
}
snd_fx_create()
{
        // TODO make the audio init happen after FX and put snd_play_auto_fx in _audio
          
        wait (1);
        clientscripts\_audio::snd_play_auto_fx( "fx_fire_line_sm", "amb_fire_sm");         
        clientscripts\_audio::snd_play_auto_fx( "fx_fire_line_md", "amb_fire_md");        
        clientscripts\_audio::snd_play_auto_fx( "fx_tunnel_end_steam", "amb_steam_hiss");         
        clientscripts\_audio::snd_play_auto_fx( "fx_steam_hallway_md", "amb_steam_hiss");   
        clientscripts\_audio::snd_play_auto_fx( "fx_pipe_steam_md", "amb_steam_hiss");  
        clientscripts\_audio::snd_play_auto_fx( "fx_water_spray_leak_md", "amb_water_spray");  
        clientscripts\_audio::snd_play_auto_fx( "fx_water_spray_leak_sm", "amb_water_spray");  
        clientscripts\_audio::snd_play_auto_fx( "fx_tunnel_end_steam", "amb_hiss");              
  		clientscripts\_audio::snd_play_auto_fx( "fx_quinn_steam_blast_lg", "amb_hiss");              
  
  
}
snd_rocket_notify()
{
	level waittill("rocket_destroyed");
	wait(2);
	thread snd_fx_create();
	wait(1);
	thread force_play_ambient_sound();
	
}
force_play_ambient_sound()
{
	steam_small_1 = clientscripts\_audio::playloopat(0, "amb_steam_hiss", (-9708, 4359, 180));
	steam_small_2 = clientscripts\_audio::playloopat(0, "amb_steam_hiss", (-10639,4471,180));
	steam_small_3 = clientscripts\_audio::playloopat(0, "amb_steam_hiss", (-10790,4472,160));
	steam_large_1 = clientscripts\_audio::playloopat(0, "amb_hiss", (-9906,4359,180));
	
	water_body_1 = clientscripts\_audio::playloopat(0, "amb_water_spray_body", (-9663.5,4463,180));
	
	alarm_1 = clientscripts\_audio::playloopat(0, "amb_alarm_low_pulse", (-9285,4415,372));
	alarm_2 = clientscripts\_audio::playloopat(0, "amb_alarm_low_pulse", (-11021,4419,258));
	alarm_3 = clientscripts\_audio::playloopat(0, "amb_alarm_low_pulse", (-10139,3467,-7.1));
	alarm_4 = clientscripts\_audio::playloopat(0, "amb_alarm_low_pulse", (-10152,1943,-17.3));
	alarm_5 = clientscripts\_audio::playloopat(0, "amb_alarm_low_pulse", (-11458,1084,-9.6));
	alarm_6 = clientscripts\_audio::playloopat(0, "amb_alarm_low_pulse", (-12741,1091,-12.0));
	alarm_7 = clientscripts\_audio::playloopat(0, "amb_alarm_low_pulse", (-12780,-447,-15.3));
}
snapshot_slides()
{
	level waittill ("slides");
	snd_set_snapshot ("alloff_except_voice_music");	
	
}
force_play_ambient_sound_intro()
{
	rocket_ice_1 = clientscripts\_audio::playloopat(0, "amb_rocket_ice", (-6449,4458,584));
	rocket_ice_2 = clientscripts\_audio::playloopat(0, "amb_rocket_ice", (-6697,4012,534));
	rocket_ice_3 = clientscripts\_audio::playloopat(0, "amb_rocket_ice", (-6983,4346,521));
	rocket_ice_4 = clientscripts\_audio::playloopat(0, "amb_rocket_ice", (-6715,4652,514));
		
	
}