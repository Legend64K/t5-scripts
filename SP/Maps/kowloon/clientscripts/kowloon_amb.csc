//
// file: kowloon_amb.csc
// description: clientside ambient script for kowloon: setup ambient sounds, etc.
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
	
        	declareAmbientPackage( "outside" );
           		 //addAmbientElement( "outside", "null", 30, 90, 150, 2000 );	
	
	
	//************************************************************************************************
	//                                       ROOMS
	//************************************************************************************************

	//explicitly activate the base ambientpackage, which is used when not touching any ambientPackageTriggers
	//the other trigger based packages will be activated automatically when the player is touching them
	//the same pattern is followed for setting up ambientRooms
	
	//INDOOR
	
		declareAmbientRoom( "hallway_wide_room" );
		declareAmbientPackage( "hallway_wide_room" );
 			//setAmbientRoomTone( "hallway_wide_room", "null" );
 			setAmbientRoomReverb ("hallway_wide_room","kowloon_hallway_wide", 1, 1);
            setAmbientRoomContext( "hallway_wide_room", "ringoff_plr", "indoor" );
	
		declareAmbientRoom( "hallway_narrow_room" );
		declareAmbientPackage( "hallway_narrow_room" );
 			//setAmbientRoomTone( "hallway_narrow_room", "null" );
 			setAmbientRoomReverb ("hallway_narrow_room","kowloon_hallway_narrow", 1, 1);
            setAmbientRoomContext( "hallway_narrow_room", "ringoff_plr", "indoor" );	
	
		declareAmbientRoom( "small_room" );
		declareAmbientPackage( "small_room" );
 			//setAmbientRoomTone( "small_room", "null" );
 			setAmbientRoomReverb ("small_room","kowloon_smallroom", 1, 1);
            setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );	

		declareAmbientRoom( "large_room" );
		declareAmbientPackage( "large_room" );
 			//setAmbientRoomTone( "large_room", "null" );
 			setAmbientRoomReverb ("large_room","kowloon_largeroom", 1, 1);
            setAmbientRoomContext( "large_room", "ringoff_plr", "indoor" );	
      
		declareAmbientRoom( "stairwell_room" );
		declareAmbientPackage( "stairwell_room" );
 			//setAmbientRoomTone( "stairwell_room", "null" );
 			setAmbientRoomReverb ("stairwell_room","kowloon_stairwell", 1, 1);
            setAmbientRoomContext( "stairwell_room", "ringoff_plr", "indoor" );	
	
	//OUTDOOR
	
	//	default for open unsurrounded rooftop
		declareAmbientRoom( "outside" );
		declareAmbientPackage( "outside" );
 			setAmbientRoomTone( "outside", "amb_kowloon_cityscape" );
 			setAmbientRoomReverb ("outside","kowloon_outside", 1, 1);
            setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );
            addAmbientElement( "outside", "amb_siren_passby_dist", 5, 15, 100, 350 );
 
	//	for slightly surrounded but wide open rooftop     
		declareAmbientRoom( "wide_outside" );
		declareAmbientPackage( "wide_outside" );
 			setAmbientRoomTone( "wide_outside", "amb_kowloon_cityscape" );
 			setAmbientRoomReverb ("wide_outside","kowloon_wide_outside", 1, 1);
            setAmbientRoomContext( "wide_outside", "ringoff_plr", "outdoor" );
            addAmbientElement( "wide_outside", "amb_siren_passby_dist", 5, 15, 100, 350 );

	//	for rooftop more tightly surrounded but still with an opening         
		declareAmbientRoom( "open_top_outside" );
		declareAmbientPackage( "open_top_outside" );
 			setAmbientRoomTone( "open_top_outside", "amb_kowloon_cityscape" );
 			setAmbientRoomReverb ("open_top_outside","kowloon_open_top", 1, 1);
            setAmbientRoomContext( "open_top_outside", "ringoff_plr", "outdoor" );
            addAmbientElement( "open_top_outside", "amb_siren_passby_dist", 5, 15, 100, 350 );
 
 	//	for very surrounded boxed-in rooftop area     
		declareAmbientRoom( "surrounded_outside" );
		declareAmbientPackage( "surrounded_outside" );
 			setAmbientRoomTone( "surrounded_outside", "amb_kowloon_cityscape" );
 			setAmbientRoomReverb ("surrounded_outside","kowloon_surrounded", 1, 1);
            setAmbientRoomContext( "surrounded_outside", "ringoff_plr", "outdoor" );
            addAmbientElement( "surrounded_outside", "amb_siren_passby_dist", 5, 15, 100, 350 );
      
 	//	for narrow outdoor hallway type passage        
		declareAmbientRoom( "narrow_outside" );
		declareAmbientPackage( "narrow_outside" );
 			setAmbientRoomTone( "narrow_outside", "amb_kowloon_cityscape" );
 			setAmbientRoomReverb ("narrow_outside","kowloon_narrow", 1, 1);
            setAmbientRoomContext( "narrow_outside", "ringoff_plr", "outdoor" );    
            addAmbientElement( "narrow_outside", "amb_siren_passby_dist", 5, 15, 100, 350 );  
      
 	//	for very tight outdoor space such as the power line shaft area - note, NO ringoff        
		declareAmbientRoom( "tight_outside" );
		declareAmbientPackage( "tight_outside" );
 			setAmbientRoomTone( "tight_outside", "amb_kowloon_cityscape" );
 			setAmbientRoomReverb ("tight_outside","kowloon_tight", 1, 1);
   			setAmbientRoomContext( "tight_outside", "ringoff_plr", "indoor" ); 
   			addAmbientElement( "tight_outside", "amb_siren_passby_dist", 5, 15, 100, 350 );
    	  
 	//	for the tight canyon like space at the street level     
		declareAmbientRoom( "bottom_outside" );
		declareAmbientPackage( "bottom_outside" );
 			setAmbientRoomTone( "bottom_outside", "amb_kowloon_cityscape" );
 			setAmbientRoomReverb ("bottom_outside","kowloon_bottom", 1, 1);
     		setAmbientRoomContext( "bottom_outside", "ringoff_plr", "outdoor" ); 
     		addAmbientElement( "bottom_outside", "amb_siren_passby_close", 8, 25, 100, 350 );
     		
     		//	when the player is in the van and door is shut
		declareAmbientRoom( "van_int" );
		declareAmbientPackage( "van_int" );
 			//setAmbientRoomTone( "bottom_outside", "amb_kowloon_cityscape" );
 			setAmbientRoomReverb ("van_int","kowloon_bottom", 1, 0);
     		setAmbientRoomContext( "van_int", "ringoff_plr", "outdoor" ); 
     		//addAmbientElement( "bottom_outside", "amb_siren_passby_close", 8, 25, 100, 350 );
      
      
  		declareAmbientRoom ("time_slow_slide");
		setAmbientRoomTone ("time_slow_slide", "NULL");
		setAmbientRoomReverb( "time_slow_slide", "kowloon_slide", 1, 1 );
		setAmbientRoomContext( "time_slow_slide", "ringoff_plr", "outdoor" );
      
      	
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

 		activateAmbientPackage( 0, "outside", 0 );
 		activateAmbientRoom( 0, "outside", 0 );
 		
		declareMusicState ("INTRO");
			musicAliasloop("mus_ambient_loop", 0, 0.5);

		declareMusicState ("CLARK_SPEAKS");
			musicAlias ("mus_kowloon_intro_stg", 0.15);
			musicStinger ("mus_kowloon_intro_action_stg", 27 ,true);
			
		declareMusicState ("EARLY_ACTION");
			musicAliasloop("mus_early_action_loop", 0, 4);
			musicStinger ("mus_hallway_intro", 0, true);
			
		declareMusicState("HALLWAY");
			musicAlias ("mus_hallway_intro", 0);
			musicAliasloop("mus_hallway_loop", 0, 2);
			
		declareMusicState ("LIGHT_ACTION");
			musicAliasloop("mus_light_action_loop", 0, 0.5);
			musicStinger ("mus_light_action_STG", 0, true);
		
		declareMusicState ("ROOFTOPS_ONE");
			musicAliasloop("mus_heavy_action_loop", 0, 2);	
			musicStinger ("mus_heavy_action_STG", 16, true);
				
		declareMusicState ("PIPE_SLIDE_SECTION");
			musicAliasloop("mus_rooftops_tension_loop", 2, 1);
			musicStinger ("mus_slow_mo_slide", 22, true);
			
		declareMusicState ("SLO_MO_SLIDE");
			musicAlias ("mus_kowloon_chopper", 0);
			musicAliasloop("mus_post_slide_action", 0, 1);
			musicStinger ("mus_tunnel6_door_breach", 6, true);
			
		declareMusicState ("DOOR_BREACH");
			musicAliasloop("mus_hallway_loop", 0, 2);
			
		declareMusicState ("BACK_OUTSIDE");
			musicAliasloop("mus_light_action_loop", 1, 2); //NEED NEW MUSIC PIECE HERE.
		
			
		declareMusicState ("NONE");
			musicAliasloop ("NULL",0,2);
			
		declareMusicState ("SUPER_JUMP");
			musicAlias ("mus_hallway_intro",0);
			
		declareMusicState ("HEAVY_ACTION");
			musicAliasloop( "mus_heavy_lead_to_climax_end_loop", 0, 2);
			musicStinger ("mus_panthers_clark_scene", 18, true);
			
		declareMusicState ("CLARK_SCENE");			
			musicAliasloop( "mus_rooftops_tension_loop", 2, 0);
//			musicStinger ("mus_panthers_clark_scene", 14, true);
		
		declareMusicState ("FELL_DOWN");		
			musicAliasloop("mus_ambient_loop", 0, 1);
			musicStinger ("mus_tunnel4_van_stg", 8, true);
			
		declareMusicState ("VAN_INCOMING");		
			musicAliasloop("mus_ambient_loop", 0, 4);
		
		
		
		
		
		
			
			
//**********************
//  FUNCTIONS
//**********************			

	level thread gas_cough();				
	level thread start_raining();	
	level thread time_slo_slide();
	level thread time_slo_reverb();
	level thread time_slo_super_jump();
	level thread time_slo_super_jump_reverb();
	level thread van_ending();
	level thread jump_land_heavy_triggers();
	level thread clark_death();
	level thread number_looper(); 		
}

gas_cough()
{
    level waittill( "gassed" );
    playsound (0, "evt_gas_poison", (0,0,0));
}

//**********************
//  RAIN
//**********************

start_raining()
{
    //trigger_start1 = GetEnt( 0, "start_creek_raining_light", "targetname" );
    //trigger_start2 = GetEnt( 0, "start_creek_raining_heavy", "targetname" );
    //trigger_end1 = GetEnt( 0, "end_creek_raining_heavy", "targetname" );
    //trigger_end2 = GetEnt( 0, "end_creek_raining_light", "targetname" );
    
    //if( !IsDefined( trigger_start1 ) )
   // {
        //IPrintLnBold( "Your Rain Triggers Don't Exist" );
	  //  return;
		//}
	
	level.raining_audio = undefined;
	
	array_thread( ( getstructarray( "rain_structs", "targetname" ) ), ::creek_rain_3d_structs );

	level thread rain_tracker( "heavy" );

	//trigger_start2 thread rain_tracker( "heavy" );
	//trigger_end1 thread rain_tracker( "light" );
	//trigger_end2 thread rain_tracker( "end" );
	
}

rain_tracker( type )
{
    //IPrintLnBold( "AUDIO RAIN TRIGGER " + type + " WAITING" );
    //self waittill( "trigger" );
    //IPrintLnBold( "RAIN TRIGGER " + type + " HIT" );
    
    if( type == "end" )
    {
        level notify( "end_rain" );
        return;
    }
    
    level.raining_audio = type;
}

creek_rain_3d_structs()
{
    level endon( "end_rain" );
    
    wait( RandomFloatRange( .5, .75 ) );
    
    while(1)
    {
        while( IsDefined( level.raining_audio ) )
        {
            if( level.raining_audio == "heavy" )
            {
                PlaySound( 0, "amb_rain_on_heavy_" + self.script_sound, self.origin );
                wait(RandomFloatRange( .25,0.5 ) );
            }
            else if( level.raining_audio == "light" )
            {
                if( self.script_sound != "rock" )
                    PlaySound( 0, "amb_rain_on_light_" + self.script_sound, self.origin );
                
                wait(RandomFloatRange( 0.5,0.75 ) );
            }
        }
        wait(1);
    }
}


delete_rain_ent()
{
    level waittill( "end_rain" );
    self Delete();
}
time_slo_slide()
{
	time_slo_ent = Spawn( 0, (0,0,0), "script_origin" );
	
	level waittill ("tsg");
	snd_set_snapshot ("wmd_window_breach");
//	snd_set_snapshot ("wmd_window_breach"); // MOVED TO ALIAS
	
	time_slo_ent playloopsound ("evt_win_breach_bg");
	
	level waittill ("tss");
	
//	playsound (0, "evt_win_breach_come_out", (0,0,0));
	
	time_slo_ent stoploopsound(3);
	
	snd_set_snapshot ("default");
	
	time_slo_ent delete();

}
time_slo_reverb()
{
	level waittill ("tsg");  //timeslo reverb
	activateAmbientRoom( 0, "time_slow_slide", 60 );	
	
	level waittill("tss");
	deactivateAmbientRoom(0, "time_slow_slide", 60);	
	
}
time_slo_van()
{
	time_slo_ent = Spawn( 0, (0,0,0), "script_origin" );
	
	level waittill ("tsv");
	snd_set_snapshot ("wmd_window_breach");
//	snd_set_snapshot ("wmd_window_breach"); // MOVED TO ALIAS
	
	time_slo_ent playloopsound ("evt_win_breach_bg");
	
	level waittill ("tvs");
	
//	playsound (0, "evt_win_breach_come_out", (0,0,0));
	
	time_slo_ent stoploopsound(3);
	
	snd_set_snapshot ("default");
	
	time_slo_ent delete();

}
time_slo_van_reverb()
{
	level waittill ("tsv");  //timeslo reverb
	activateAmbientRoom( 0, "time_slow_slide", 60 );	
	
	level waittill("tvs");
	deactivateAmbientRoom(0, "time_slow_slide", 60);	
	
}

van_ending()
{
	level waittill( "plr_van" );
	wait 2;
	snd_set_snapshot( "kowloon_low_ambience" );
	level waittill( "van_door_close" );
	snd_set_snapshot( "kowloon_no_ambience" );
	activateAmbientRoom( 0, "van_int", 60 );
}

time_slo_super_jump()
{
	time_slo_ent = Spawn( 0, (0,0,0), "script_origin" );
	
	level waittill ("smsj");
	snd_set_snapshot ("kowloon_huge_jump");
//	snd_set_snapshot ("wmd_window_breach"); // MOVED TO ALIAS
	
	time_slo_ent playloopsound ("evt_win_breach_bg");
	
	level waittill ("smsjo");
	
//	playsound (0, "evt_win_breach_come_out", (0,0,0));
	
	time_slo_ent stoploopsound(3);
	
	snd_set_snapshot ("default");
	
	time_slo_ent delete();

}
time_slo_super_jump_reverb()
{
	level waittill ("smsj");  //timeslo reverb
	activateAmbientRoom( 0, "time_slow_slide", 60 );	
	
	level waittill("smsjo");
	deactivateAmbientRoom(0, "time_slow_slide", 60);	
	
}

jump_land_heavy_triggers()
{
    array_thread( GetEntArray( 0, "audio_jump_land_heavy", "targetname" ), ::play_jump_land_heavy );
}

play_jump_land_heavy()
{
    if( !IsDefined( self ) )
        return;
      
    self waittill( "trigger" );
    PlaySound( 0, "evt_jumpland_heavy_metal", self.origin );
}
clark_death()
{
	level waittill ("cds");
	playsound (0, "evt_time_slow_start", (0,0,0));
	time_slo_ent = Spawn( 0, (0,0,0), "script_origin" );
	time_slo_ent playloopsound ("evt_clark_bg");
	snd_set_snapshot("clark_death");
	wait (9.5);
	playsound (0, "evt_time_slow_stop", (0,0,0));
	snd_set_snapshot("default");
	
	
}

number_looper()
{

	num_ent = spawn (0, ((1806, 1212, 3490)), "script_origin");		
	num_ent playloopsound ("amb_num_12_d", .5);	

}