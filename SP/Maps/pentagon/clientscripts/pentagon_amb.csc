#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;
#include clientscripts\_audio;

main()
{
	 thread heli_room();
	 thread limo_room();
	 thread alarm_sound();
	 thread pool_sound();
	 thread war_room_sound();
	 thread elevator_move();
	 thread elevator_open();
	 thread elevator_open_2();
	
	
	declareAmbientRoom( "inside_heli" );
	 		//setAmbientRoomTone ( "inside_heli", " ", .5, 2);
 			setAmbientRoomReverb ("inside_heli", "pentagon_inside_heli", 1, 1);  
 			
 	declareAmbientRoom( "heli_tarmac" );
	 		//setAmbientRoomTone ( "heli_tarmac", " ", .5, 2);
 			setAmbientRoomReverb ("heli_tarmac", "pentagon_heli_tarmac", 1, 1);  
 			
 	declareAmbientRoom( "limo" );
	 		//setAmbientRoomTone ( "limo", " ", .5, 2);
 			setAmbientRoomReverb ("limo", "pentagon_inside_limo", 1, 1);  

	 declareAmbientRoom( "lobby" );
	 		setAmbientRoomTone ( "lobby", "amb_lobby_tone", .5, 2);
 			setAmbientRoomReverb ("lobby", "pentagon_lobby", 1, 1);              
 			
 	 declareAmbientRoom( "office" );
	 		//setAmbientRoomTone ( "office", "amb_vest_tone", 1, 1);
 			setAmbientRoomReverb ("office", "pentagon_office", 1, 1);       
 		
 //long corridor leading from office pool to elevator			
 	 declareAmbientRoom( "corridor" );
	 		//setAmbientRoomTone ( "corridor", "amb_lobby_tone", 1, 1);
 			setAmbientRoomReverb ("corridor", "pentagon_hallway", 1, 1);  
 			
 	 declareAmbientRoom( "elevator" );
	 		setAmbientRoomTone ( "elevator", "amb_elevator_tone", 1, .5);
 			setAmbientRoomReverb ("elevator", "pentagon_elivator", 1, 1);  
 			
 	 declareAmbientRoom( "war_room" );
 	 		setAmbientRoomTone ( "war_room", "amb_war_room_bg", 1, 1);
 			setAmbientRoomReverb ("war_room", "pentagon_war_room", 1, 1);  
 			
 	 declareAmbientRoom( "war_hall" );
 	 		setAmbientRoomTone ( "war_hall", "amb_vest_tone", 1, 1);
 			setAmbientRoomReverb ("war_hall", "pentagon_stairwell", 1, 1);  		
 			
 	 declareAmbientRoom( "conference" );
	 		setAmbientRoomTone ( "conference", "amb_vest_tone", 1, 1);
 			setAmbientRoomReverb ("conference", "pentagon_conference", 1, 1);      


	 activateAmbientRoom( 0, "inside_heli", 0 );
	 snd_set_snapshot ("pent_lobby");
	
	
	declareMusicstate("HELI_LAND");
		musicAlias("mus_pent_sync", 4);	
		musicwaittilldone();

	 
	 
//	declareMusicstate("INTRO");
//		musicAliasLoop("mus_intro_loop", 1, 4);	
//		musicAliasLoop("amb_office_loop", 1, 4);
		
		
//	declareMusicstate("JFK_LOOP");
//		musicAliasLoop("mus_jfk_loop", 1, 4);	
		
//	declareMusicstate("JFK_EPIC");
//		musicAliasLoop("mus_jfk_epic", 1, 4);	
		
		//activateAmbientPackage( 0, "outside", 0 );
//		activateAmbientRoom( 0, "log_cabins_room", 0 );	
}


heli_room()
{
	level waittill ("tarmac_room");
	activateAmbientRoom (0,"heli_tarmac", 0);
	//iprintlnbold ("tarmac room active");
}

limo_room()
{
	level waittill ("in_limo");
	activateambientroom (0, "limo", 0);
	//iprintlnbold ("limo room active");
}


alarm_sound()
{
	level waittill ("play_alarm");
	PlaySound (0, "evt_metal_dtct", (0, 0, 0) );
	wait .2;
	PlaySound (0, "evt_metal_dtct", (0, 0, 0) );
	wait .2;
	PlaySound (0, "evt_metal_dtct", (0, 0, 0) );
}

pool_sound()
{
	level waittill ("open_pool_door");
	snd_set_snapshot ("pent_office");
	//iprintlnbold ("pent office snpshot on");
}


elevator_open()
{
	level waittill ("open_door");
	wait (3.75);
	door = GetEnt (0, "door_open", "targetname");
	elv = GetEnt (0, "elv_loop", "targetname");
	door PlaySound (0, "evt_door_open_1");
	//iprintlnbold ("open elev");
	elv PlayLoopSound ("amb_elv_loop", 2);
	//iprintlnbold ("looping");
	wait (7);
	door PlaySound (0, "evt_door_close");
	//iprintlnbold ("close eleva");
}

elevator_open_2()
{
	level waittill ("open_door_2");
	door = GetEnt (0, "door_open_2", "targetname");
	door PlaySound (0, "evt_door_open_1");
}


elevator_move()
{
	level waittill ("elevator_moving");
	playsound (0, "evt_fast_forward_2");
	PlaySound (0, "evt_elev_start");
	//iprintlnbold ("start elevator");
	elv_snd = spawn(0, (0, 0, 0), "script.origin");
	elv_snd PlayLoopSound ("evt_elev_run", 1.1);	
	//iprintlnbold ("run elevator");	
	level waittill ("elevator_stop");
	elv_snd thread elevator_stop();
	elv_snd Stoploopsound (1);
}
	
elevator_stop()	
{
	self PlaySound (0, "evt_elev_stop");
	//iprintlnbold ("stop elevator");
	wait (2);
	self Delete();
}


war_room_sound()
{
	level waittill ("elevator_open");
	snd_set_snapshot ("pent_warroom");
	thread meeting_sound();
	thread conf_door();
	thread war_door();
}

war_door()
{
	level waittill ("close_war");
	wait (1.5);
	playsound (0, "evt_close_warroom");
}


meeting_sound()
{
	level waittill ("meeting_start");
	snd_set_snapshot ("pent_lobby");
}


conf_door()
{
	level waittill ("close_conference");
	conf_door = getent (0, "conf_door", "targetname");
	if( IsDefined( conf_door ) )
	{
		conf_door playsound (0, "evt_door_shut");
	}
}	