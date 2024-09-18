//
// file: vorkuta_amb.csc
// description: clientside ambient script for vorkuta: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;
#include clientscripts\_busing;
#include clientscripts\_audio;

main()
{
	//**AMBIENT PACKAGES**\\
	
	    //Mine
		    declareAmbientRoom( "default" );
		    declareAmbientPackage( "default" );
		        setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
			    setAmbientRoomReverb ("default","vorkuta_deafult", 1, 1);
			    //setAmbientRoomTone( "default", "amb_ext_cold_wind", .5, .5 );
			    addAmbientElement( "default", "amb_wind_dirty_gust", 4, 13, 50, 1100 );
			    
	    //Mine
		    declareAmbientRoom( "mine" );
		    declareAmbientPackage( "mine" );
		        setAmbientRoomContext( "mine", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("mine","vorkuta_mine", 1, 1);
			    setAmbientRoomTone( "mine", "amb_mine_bg_looper", 1, 10 );
			    //addAmbientElement( "mine", "", .1, .6, 50, 150 );
			    
        //Upper_mine
		    declareAmbientRoom( "upper_mine" );
		    declareAmbientPackage( "upper_mine" );
		        setAmbientRoomContext( "upper_mine", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("upper_mine","vorkuta_upper_mine", 1, 1);
			    //setAmbientRoomTone( "upper_mine", "amb_mine_bg_looper", 1, 3 );
			    //addAmbientElement( "upper_mine", "", .1, .6, 50, 150 );
		
		//building_small
		    declareAmbientRoom( "building_small" );
		    declareAmbientPackage( "building_small" );
		        setAmbientRoomContext( "building_small", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("building_small","vorkuta_building_small", 1, 1);
			    //setAmbientRoomTone( "building_small", "amb_mine_bg_looper", 1, 3 );
			    //addAmbientElement( "building_small", "", .1, .6, 50, 150 );
			  
		//Building_Large
		    declareAmbientRoom( "building_large" );
		    declareAmbientPackage( "building_large" );
		        setAmbientRoomContext( "building_large", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("building_large","vorkuta_building_large", 1, 1);
			    //setAmbientRoomTone( "building_large", "amb_mine_bg_looper", 1, 3 );
			    //addAmbientElement( "building_large", "", .1, .6, 50, 150 );	  

        //armory
		    declareAmbientRoom( "armory" );
		    declareAmbientPackage( "armory" );
		        setAmbientRoomContext( "armory", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("armory","vorkuta_armory", 1, 1);
			    //setAmbientRoomTone( "armory", "amb_mine_bg_looper", 1, 3 );
			    //addAmbientElement( "armory", "", .1, .6, 50, 150 );
			    
		//armory_control_room
		    declareAmbientRoom( "armory_control_room" );
		    declareAmbientPackage( "armory_control_room" );
		        setAmbientRoomContext( "armory_control_room", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("armory_control_room","vorkuta_armory_control_room", 1, 1);
			    //setAmbientRoomTone( "armory_control_room", "amb_mine_bg_looper", 1, 3 );
			    //addAmbientElement( "armory_control_room", "", .1, .6, 50, 150 );	    

        //armory_walkway
		    declareAmbientRoom( "armory_walkway" );
		    declareAmbientPackage( "armory_walkway" );
		        setAmbientRoomContext( "armory_walkway", "ringoff_plr", "outdoor" );
			    setAmbientRoomReverb ("armory_walkway","vorkuta_armory_walkway", 1, 1);
			    //setAmbientRoomTone( "armory_walkway", "amb_mine_bg_looper", 1, 3 );
			    //addAmbientElement( "armory_walkway", "", .1, .6, 50, 150 );

        //armory_garage
		    declareAmbientRoom( "armory_garage" );
		    declareAmbientPackage( "armory_garage" );
		        setAmbientRoomContext( "armory_garage", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("armory_garage","vorkuta_armory_garage", 1, 1);
			    //setAmbientRoomTone( "armory_garage", "amb_mine_bg_looper", 1, 3 );
			    //addAmbientElement( "armory_garage", "", .1, .6, 50, 150 );
    
        //warehouse
		    declareAmbientRoom( "warehouse" );
		    declareAmbientPackage( "warehouse" );
		        setAmbientRoomContext( "warehouse", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("warehouse","vorkuta_warehouse", 1, 1);
			    //setAmbientRoomTone( "warehouse", "amb_mine_bg_looper", 1, 3 );
			    //addAmbientElement( "warehouse", "", .1, .6, 50, 150 );
        
        //motorcycle_room_entry
		    declareAmbientRoom( "motorcycle_room_entry" );
		    declareAmbientPackage( "motorcycle_room_entry" );
		        setAmbientRoomContext( "motorcycle_room_entry", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("motorcycle_room_entry","vorkuta_motorcycle_room_entry", 1, 1);
			    //setAmbientRoomTone( "motorcycle_room_entry", "amb_mine_bg_looper", 1, 3 );
			    //addAmbientElement( "motorcycle_room_entry", "", .1, .6, 50, 150 );
        
        //motorcycle_room
		    declareAmbientRoom( "motorcycle_room" );
		    declareAmbientPackage( "motorcycle_room" );
		        setAmbientRoomContext( "motorcycle_room", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("motorcycle_room","vorkuta_motorcycle_room", 1, 1);
			    //setAmbientRoomTone( "motorcycle_room", "amb_mine_bg_looper", 1, 3 );
			    //addAmbientElement( "motorcycle_room", "", .1, .6, 50, 150 );
	    
	    //slow_mo_truck_explo
		    declareAmbientRoom( "slow_mo_truck_explo" );
		    declareAmbientPackage( "slow_mo_truck_explo" );
		        setAmbientRoomContext( "slow_mo_truck_explo", "ringoff_plr", "outdoor" );
			    setAmbientRoomReverb ("slow_mo_truck_explo","vorkuta_slow_mo_truck_explo", 1, 1);
			    //setAmbientRoomTone( "slow_mo_truck_explo", "amb_mine_bg_looper", 1, 3 );
			    //addAmbientElement( "slow_mo_truck_explo", "", .1, .6, 50, 150 );

	        activateAmbientPackage( 0, "default", 0 );
	        activateAmbientRoom( 0, "default", 0 );

    //MUSIC STATES
    
    declareMusicState("INTRO_FIGHT");
    	musicAlias ("mus_vokutafight_intro", 0);  //TUEY - no default loop makes the Music Alias transition to the next state instead of waiting to be completed.
  
	declareMusicState("MINE_INTRO");
	    musicAliasloop("mus_anvil_loop", 2, 2 );  
	    
	declaremusicstate( "NULL" );
	    musicAliasloop( "null", 2, 0 ); 
	    
	declaremusicstate("UNDERSCORE");
		musicAliasloop( "mus_drexel_underscore", 0, 2 ); 
		musicStinger( "mus_deviant_sergei_axe", 8, true);
		
	declareMusicState ("SERGEI_AXE");
		 musicAliasloop( "mus_drexel_underscore", 0, 2 ); 
		musicStinger("mus_deviant_door_open", 20, true ); 
	
	declaremusicstate( "OPEN_THE_DOOR" );
		musicAliasloop( "mus_drexel_underscore", 2, 2 ); 
//		musicStinger("mus_deviant_mine_cart_push", 97, true ); 

	declareMusicState("MINE_CART_PUSH"); 
	    musicAliasloop( "mus_deviant_mine_cart_push_loop", 0, 2 );
	   	musicStinger("mus_deviant_mine_cart_push_stg", 19, true); 
	
	declareMusicState("FINISHED_MINECART"); 		
  	 	musicAliasloop( "mus_panthers_strings_underscore_b", 2, 2 );
   	 	musicStinger("mus_foe_reznov_speech", 69, true); 
    
    declareMusicState("SLINGSHOT_SPEECH");
	    musicAliasloop( "mus_panthers_strings_underscore_c", 2, 2 );
	    
	declareMusicState ("SLINGSHOT_SPEECH_OVER");
	    musicAliasloop( "mus_panthers_strings_underscore_c", 2, 2 );
	     
	declareMusicState ("COURTYARD_FIGHT");
		musicAliasloop( "mus_deviant_courtyard_fight", 2, 2 );
		
	declareMusicState ("PRE_SKEWER");	
		musicAliasloop( "mus_deviant_pre_chopper_crash", 0, 2 );
	    musicStinger("mus_deviant_skewer_the_beast", 8, true );
	    
	declareMusicState ("SKEWER_THE_BEAST");
		musicAlias ("mus_deviant_post_chopper_crash", 0);
	 	musicAliasloop( "mus_deviant_nobrass_underscore", 0, 2 ); 
	 	musicStinger("mus_deviant_sergei_axe", 41, true );
	 	
	declareMusicState ("SERGEI_DOOR");		 	
		musicAliasloop( "mus_deviant_nobrass_underscore_b", 0, 2 ); 
	 	
	declareMusicState ("BLOW_TORCH"); 	
		musicAlias ("mus_hits_blowtorch_stg", 0);
		musicAliasloop( "mus_deviantv2_blowtorch_loop", 0, 2 ); 
		
	declareMusicState ("MINI_GUN");	
		musicAliasloop( "mus_deviant_mini_gun_loop", 0, 2 ); 
		
	declareMusicState ("TEAR_GAS");
	 	musicAlias ("mus_hits01_mini_gun_stg", 0);
	 	
	declareMusicState("SPEECH_OF_DECADENCE");
	 	MusicAliasloop ("mus_foe_speech_decadence", 0, 0);
//	 	MusicStinger ("mus_beheaded_escape",60, true);
	 	MusicStinger ("mus_eagleclaw_bike",55, true);

	 declareMusicState("MOTORCYLE_ESCAPE");
		musicAliasloop( "NULL", 0, 2 ); 
		
	declareMusicState ("ON_THE_TRAIN");
		musicAlias ("mus_anvil_train", 1);
			
    //MINE SECTION
    level thread vorkuta_mine_alarms_start();
    level thread vorkuta_group_vox();
    //level thread dynamic_player_breath();
    level thread slingshot_speech_temp();
    
    //EXTERIOR AMB
    level thread set_snapshot_at_start();	
    level thread jumpto_snapshot_override();	
    //level thread snapshot_test();
    level thread gas_attack();
    level thread enemies_at_the_door();
    level thread train_foreshadow();
    level thread slowmo_truck_explo();
    level thread level_fade_out();
    level thread intro_snapshot();
    level thread play_random_russian_PA();
    level thread jump_to_train_snapshot();
    level thread play_riot_outside();
    level thread play_door_beating();
    level thread snd_fx_create();
    level thread reznov_bike_idle();
    
}

vorkuta_mine_alarms_start()
{  
    level waittill( "mas" ); //Mine Alarm Start
    array_thread( getstructarray( "mine_alarm", "targetname" ), ::play_alarms_offset );
}

play_alarms_offset()
{
    level endon( "ext" );
    
    
    if( !IsDefined( self ) )
        return;
        
    wait( RandomIntRange( 4, 9 ) );
    
    while( 1 )
    {
        PlaySound( 0, "amb_mine_alarm", self.origin );
        wait(3);
    }
}

set_snapshot_at_start()
{
    snd_set_snapshot( "vork_occlude_exterior" );
    level waittill( "ext" );
    snd_set_snapshot( "vork_slow_exterior" );
    wait(10);
    snd_set_snapshot( "default" );
}

jumpto_snapshot_override()
{
    level waittill( "ors" );
    wait(3);
    snd_set_snapshot( "default" );
}

vorkuta_group_vox()
{
    level thread group_vox_reznov_fight();
    level thread group_vox_running();
    level thread group_vox_fighting();
}

//TEMP group vox and script
group_vox_reznov_fight()
{
    struct1 = getstruct( "amb_vox_group_fight_0", "targetname" );
    struct2 = getstruct( "amb_vox_group_fight_1", "targetname" );
    
    if( !IsDefined( struct1 ) )
        return;
    
    ent1 = spawn( 0, struct1.origin, "script_origin" );
    ent2 = spawn( 0, struct2.origin, "script_origin" );
    
    ent1 PlayLoopSound( "amb_vox_fight_root_loop_0" );
    ent2 PlayLoopSound( "amb_vox_fight_root_loop_1" );
    
    level thread fight_waitfor_ch1(ent1, ent2);
    level thread fight_waitfor_ch2(ent1, ent2);
    level thread fight_waitfor_ch3(ent1, ent2);
    level thread fight_waitfor_ch4(ent1, ent2); 
    
}
fight_waitfor_ch1(ent1, ent2)
{
	level waittill( "ch1" );
	PlaySound( 0, "amb_vox_fight_cheer_0", ent1.origin );
    PlaySound( 0, "amb_vox_fight_cheer_1", ent2.origin );
	
}
fight_waitfor_ch2(ent1, ent2)
{
	level waittill( "ch2" );
	PlaySound( 0, "amb_vox_fight_cheer_2", ent1.origin );
    PlaySound( 0, "amb_vox_fight_cheer_3", ent2.origin );	
}
fight_waitfor_ch3(ent1, ent2)
{
	level waittill( "ch3" );
	PlaySound( 0, "amb_vox_fight_cheer_0", ent1.origin );
    PlaySound( 0, "amb_vox_fight_cheer_2", ent2.origin  );
    wait(1);
    ent1 stoploopsound( 1 );
    ent2 stoploopsound( 1 );
    PlaySound( 0, "amb_vox_fight_trans_murmur_0", ent1.origin  );
    PlaySound( 0, "amb_vox_fight_trans_murmur_1", ent2.origin );
    wait(1);
    ent1 PlayLoopSound( "amb_vox_fight_angry_loop_0", .5 );
    ent2 PlayLoopSound( "amb_vox_fight_angry_loop_1", .5 );	
}
fight_waitfor_ch4(ent1, ent2)
{
	level waittill( "ch4" );
	ent1 stoploopsound( 1 );
    ent2 stoploopsound( 1 );
    PlaySound( 0, "amb_vox_fight_cheer_3", ent1.origin );
    PlaySound( 0, "amb_vox_fight_cheer_1", ent2.origin );
    wait(1);
    ent1 PlayLoopSound( "amb_vox_fight_joking_loop_0", .5 );
    ent2 PlayLoopSound( "amb_vox_fight_joking_loop_1", .5 );
    level waittill( "mas" );
    wait(1);
    ent1 PlayLoopSound( "amb_vox_fight_gearup_loop_0", .5 );
    ent2 PlayLoopSound( "amb_vox_fight_gearup_loop_1", .5 );
    wait(15);
    ent1 Delete();
    ent2 Delete();

}

group_vox_running()
{
    struct = getstruct( "amb_vox_group_run_0", "targetname" );
    
    if( !IsDefined( struct ) )
        return;
    
    level waittill( "mas" );
    
    ent = spawn( 0, struct.origin, "script_origin" );
    ent PlayLoopSound( "amb_vox_group_running_0", 1 );
    
    level waittill( "ext" );
    ent Delete();
}

group_vox_fighting()
{
    struct1 = getstructarray( "amb_vox_group_fighting_0", "targetname" );
    struct2 = getstruct( "amb_vox_group_fighting_1", "targetname" );
    
    if( !IsDefined( struct2 ) )
        return;
    
    level waittill( "mas" );
    ent1 = spawn( 0, struct1[0].origin, "script_origin" );
    ent2 = spawn( 0, struct1[1].origin, "script_origin" );
    ent3 = spawn( 0, struct2.origin, "script_origin" );
    ent4 = spawn( 0, struct1[0].origin, "script_origin" );
    ent5 = spawn( 0, struct1[1].origin, "script_origin" );
    
    ent1 PlayLoopSound( "amb_vox_group_fighting_0", 1 );
    ent4 PlayLoopSound( "fly_vorkuta_group_fistfight", 1 );
    ent2 PlayLoopSound( "amb_vox_group_fighting_0", 1 );
    ent5 PlayLoopSound( "fly_vorkuta_group_fistfight", 1 );
    ent3 PlayLoopSound( "amb_vox_group_fighting_1", 1 );
    
    level waittill( "ext" );
    ent1 Delete();
    ent2 Delete();
    ent3 Delete();
    ent4 Delete();
    ent5 Delete();
}

dynamic_player_breath()
{
    level endon( "ele" );

    level waittill( "mas" );
    
    player = getlocalplayers()[0];
    ent = spawn( 0, (0,0,0), "script_origin" );
    ent thread delete_ent();
    
    while(1)
    {
        speed = player getspeed() / 17.6;
        volume = scale_speed( 5, 10, 0, 1, speed );
        
        breath_id = ent PlayLoopSound( "vox_player_breath_loop", 0.5 );
        setSoundVolume( breath_id, volume );
        //IPrintLnBold( "SPEED: " + speed + " VOLUME: " + volume );
        wait(.05);
    }
}

delete_ent()
{
    level waittill( "ele" );
    self Delete();
}

slingshot_speech_temp()
{
    //level waittill( "ext" );
    
    ent1 = spawn(0, (-2917, 4401.5, 1572), "script_origin" );
    ent1 PlayLoopSound( "amb_vox_slingshot_roar", 1 );
     
    level waittill( "slng" );
    
    snd_set_snapshot( "vork_reznov_speech" );
    
    level waittill( "sdd" );
    
    ent1 stoploopsound( 5 );
    
    PlaySound( 0, "amb_vox_fight_end_cheer_0", (-2661, 4737.5, 1516) );
    wait(1);
    PlaySound( 0, "amb_vox_fight_end_cheer_1", (-2805, 4393.5, 1516) );
    snd_set_snapshot( "default" );
    
    wait(5);
    ent1 Delete();
}

snapshot_test()
{
    while(1)
    {
        /#
        IPrintLnBold( "SNAPSHOT: alloff" );
        #/
        snd_set_snapshot( "alloff" );
        wait(6);
        /#
        IPrintLnBold( "SNAPSHOT: default" );
        #/
        snd_set_snapshot( "default" );
        wait(6);
    }
}

gas_attack()
{
    level waittill( "gas" );
    
    ent = spawn( 0, (0,0,0), "script_origin" );
    ent PlayLoopSound( "chr_shock_loop", 3 );
    snd_set_snapshot( "vork_gas_attack" );
    
    level waittill( "egs" );
    
    ent stoploopsound( 2 );
    snd_set_snapshot( "default" );
    wait(2);
    ent Delete();
}

enemies_at_the_door()
{
    level waittill( "ead" );
    array_thread( getstructarray( "enemies_at_door_metal", "targetname" ), ::play_enemies_at_the_door, "metal" );
    array_thread( getstructarray( "enemies_at_door_wood", "targetname" ), ::play_enemies_at_the_door, "wood" );
}

play_enemies_at_the_door( type )
{
    level endon( "eade" );
    
    if( !IsDefined( self ) )
        return;
    
    suffix = [];
    suffix[0] = "_rattle";
    suffix[1] = "_hit";
    
    wait(RandomFloatRange(1,7));
    sound_ent = spawn(0, self.origin, "script_origin" );
    sound_ent thread delete_sound_ent();
    sound_ent PlayLoopSound( "amb_vox_group_moto_room_" + RandomIntRange(0,2), 4 );
    
    while(1)
    {
        PlaySound( 0, "amb_door_" + type + suffix[RandomIntRange(0,2)], self.origin );
        wait(RandomFloatRange(2,8));
    }
}

delete_sound_ent()
{
    level waittill( "eade" );
    self Delete();
}

train_foreshadow()
{
    level waittill( "ead" );
    
    struct = getstruct( "train_foreshadow", "targetname" );
    if( !IsDefined( struct ) )
        return;
        
    wait(RandomFloatRange(2,6));
    
    for( i=0; i<4; i++ )
    {
        PlaySound( 0, "veh_train_horn_med", struct.origin );
        wait(RandomFloatRange(3,6));
    }
}

slowmo_truck_explo()
{
    while(1)
    {
        level waittill( "slow" );
        snd_set_snapshot( "vork_truck_slowmo" );
        PlaySound( 0, "evt_slow_mo_in", (0,0,0) );
        PlaySound( 0, "evt_slow_mo_truck_explo", (0,0,0) );
        activateAmbientRoom( 0, "slow_mo_truck_explo", 15 );
        level waittill( "fast" );
        snd_set_snapshot( "default" );
        PlaySound( 0, "evt_slow_mo_out", (0,0,0) );
        deactivateAmbientRoom( 0, "slow_mo_truck_explo", 15 );
    }
}

level_fade_out()
{
    level waittill( "fdo" );
    snd_set_snapshot( "vorkuta_fadeout" );
}
play_random_russian_PA()
{
	level endon ("kill_pa");
	level waittill ("spa");
	
	vo_line_position = "undefined";
		
	
	while(1)
	{
		vo_line = "vox_fake_pa";
		
		line_position = randomintrange(0, 5);
		if(line_position == 0)
		{
			vo_line_position = (4488.9, 6512.3, 2008.9);	
		}	
		if(line_position == 1)
		{
			vo_line_position = (1480, 5597, 1654);
		}
		if(line_position == 2)
		{
			vo_line_position = (-3879, 6678, 1537); 	
		}
		if(line_position == 3)
		{
			vo_line_position = (-5715,4889,1466);	
		}
		if(line_position == 4)
		{
			vo_line_position = (567, 3700, 1326);	
		}
		wait(randomintrange (5, 10));

		PlaySound( 0, vo_line, vo_line_position );		
	
	}
	
	
}
intro_snapshot()
{
	level waittill ("intro_ss");
	PlaySound( 0, "evt_slow_mo_in_no_dew", (0,0,0) );
	snd_set_snapshot ("voice_only");
	PlaySound( 0, "mus_vorkuta_rez_stinger", (0,0,0) );
	level waittill ("unfrz");
	PlaySound( 0, "evt_slow_mo_out_spc", (0,0,0) );
	snd_set_snapshot ("default");
}
jump_to_train_snapshot()
{
	level waittill ("jtt");
	PlaySound( 0, "evt_slow_mo_in", (0,0,0) );
	snd_set_snapshot ("vork_truck_slowmo");
	level waittill ("jttd");
	PlaySound( 0, "evt_slow_mo_out", (0,0,0) );
	snd_set_snapshot ("default");
}
play_riot_outside()
{
		riot = clientscripts\_audio::playloopat(0, "amb_vox_slingshot_roar", (10003, 6477, 1517));	
		alarm = clientscripts\_audio::playloopat(0, "amb_alarm_main", (10053, 6099, 1414));	
	
}
play_door_beating()
{
	while(1)
	{
		wait(randomintrange (1, 5));
		PlaySound( 0, "evt_hit_door", (9182.5, 6314.3, 1412.5) );	
	}
}
snd_fx_create ()
{
        // TODO make the audio init happen after FX and put snd_play_auto_fx in _audio
        wait (1);
        clientscripts\_audio::snd_play_auto_fx( "fire_wall_1", "amb_mine_fire");         
        clientscripts\_audio::snd_play_auto_fx( "fire_wall_2", "amb_mine_fire");        
        clientscripts\_audio::snd_play_auto_fx( "fire_indoor_sm", "amb_fire_sm");         
        clientscripts\_audio::snd_play_auto_fx( "fire_outdoor_md", "amb_fire_md");         
        clientscripts\_audio::snd_play_auto_fx( "fire_outdoor_lg", "amb_mine_lg");   
        clientscripts\_audio::snd_play_auto_fx( "steam_burst_1", "amb_steam_hiss");   
              
    
}
reznov_bike_idle()
{
	level waittill("rez_bike_ready");
		
	riot = clientscripts\_audio::playloopat(0, "veh_moto_looper_idle", (9691,5555,1394));	
	
}
