//
// file: rebirth_amb.csc
// description: clientside ambient script for rebirth: setup ambient sounds, etc.
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
	
		//INDOOR
	
		declareAmbientRoom( "small_room" );
		declareAmbientPackage( "small_room" );
 			//setAmbientRoomTone( "small_room", "null" );
 			setAmbientRoomReverb ("small_room","rebirth_smallroom", 1, 1);
            setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );	

		declareAmbientRoom( "large_room" );
		declareAmbientPackage( "large_room" );
 			//setAmbientRoomTone( "large_room", "null" );
 			setAmbientRoomReverb ("large_room","rebirth_largeroom", 1, 1);
            setAmbientRoomContext( "large_room", "ringoff_plr", "indoor" );	
            
		declareAmbientRoom( "stairwell_room" );
		declareAmbientPackage( "stairwell_room" );
 			//setAmbientRoomTone( "stairwell_room", "null" );
 			setAmbientRoomReverb ("stairwell_room","rebirth_stairwell", 1, 1);
            setAmbientRoomContext( "stairwell_room", "ringoff_plr", "indoor" );	
            
		declareAmbientRoom( "hallway_room" );
		declareAmbientPackage( "hallway_room" );
 			//setAmbientRoomTone( "hallway_room", "null" );
 			setAmbientRoomReverb ("hallway_room","rebirth_hallway_narrow", 1, 1);
            setAmbientRoomContext( "hallway_room", "ringoff_plr", "indoor" );	
            
		declareAmbientRoom( "wood_room" );
		declareAmbientPackage( "wood_room" );
 			//setAmbientRoomTone( "wood_room", "null" );
 			setAmbientRoomReverb ("wood_room","rebirth_wood_room", 1, 1);
            setAmbientRoomContext( "wood_room", "ringoff_plr", "indoor" );	
           
		declareAmbientRoom( "huge_room" );
		declareAmbientPackage( "huge_room" );
 			//setAmbientRoomTone( "huge_room", "null" );
 			setAmbientRoomReverb ("huge_room","rebirth_huge_room", 1, 1);
            setAmbientRoomContext( "huge_room", "ringoff_plr", "indoor" );	
            
		declareAmbientRoom( "tile_room" );
		declareAmbientPackage( "tile_room" );
 			//setAmbientRoomTone( "tile_room", "null" );
 			setAmbientRoomReverb ("tile_room","rebirth_tile_room", 1, 1);
            setAmbientRoomContext( "tile_room", "ringoff_plr", "indoor" );	
            
		declareAmbientRoom( "container_room" );
		declareAmbientPackage( "container_room" );
 			//setAmbientRoomTone( "container_room", "null" );
 			setAmbientRoomReverb ("container_room","rebirth_container", 1, 1);
            setAmbientRoomSnapshot ("container_room", "rebirth_monkey_chill");
            setAmbientRoomContext( "container_room", "ringoff_plr", "indoor" );
            
		declareAmbientRoom( "hazmat_suit" );
		declareAmbientPackage( "hazmat_suit" );
 			setAmbientRoomTone( "hazmat_suit", "fly_hazmat_loop" );
 			setAmbientRoomReverb ("hazmat_suit","rebirth_hazmat", 1, 1);
            setAmbientRoomContext( "hazmat_suit", "hazmat", "mask" );
	
		declareAmbientRoom ("dock");
			setAmbientRoomReverb ("dock","rebirth_docks", 1, 1);
            setAmbientRoomContext( "dock", "ringoff_plr", "outdoor" );
            setAmbientRoomSnapshot ("dock", "rebirth_monkey_chill");
	
		//OUTDOOR
	
	//	default for outside
		declareAmbientRoom( "outside" );
		declareAmbientPackage( "outside" );
 			//setAmbientRoomTone( "outside", "null" );
 			setAmbientRoomReverb ("outside","rebirth_outside", 1, 1);
            setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );
            setAmbientRoomSnapshot ("outside", "rebirth_monkey_chill");

	
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

 		activateAmbientPackage( 0, "outside", 0 );
 		activateAmbientRoom( 0, "outside", 0 );
 		
 		
 		
 		
 //************************************************************************************************
//                                   MUSIC STATES
//************************************************************************************************			
 		
 		
 		
 		
 		declareMusicstate("INTRO");
			musicAlias("mus_dwarka_intro", 0);
			
		declareMusicState ("STEALTH_PART_ONE");
			musicaliasloop ("mus_delerious_stealth_part_one", 0, 1);
			musicStinger ("mus_delerious_get_hatchet", 16, true);
			
		declareMusicState ("STEALTH_PART_TWO");
			musicaliasloop ("mus_delerious_stealth_part_two", 0, 1);
			musicStinger ("mus_delerious_throw_hatchet", 10, true);
			
		declareMusicState ("THROW_HATCHET");			
			musicaliasloop ("mus_delerious_stealth_part_one", 0, 1);
			musicStinger("mus_delerious_throw_hatchet_kill", 0, true);
			
		declareMusicState("THROW_HATCHET_KILL");
//			musicaliasloop ("mus_delerious_stealth_part_one_b", 3, 2);
			musicStinger ("mus_chopper_tension", 14, true);
			
 		declareMusicState("CHOPPER_HIDE");
			musicaliasloop ("mus_delerious_stealth_part_one_c", 3, 2);
			musicStinger ("mus_delerious_guy_off_ladder", 7, true);
 		
 		declareMusicState("PULL_GUY_LADDER");
 			musicaliasloop ("mus_delerious_stealth_part_two", 2, 1);
 //			musicStinger ("mus_delerious_fight_in_base", 60, true);
 		
 		 declareMusicState("FIGHT_IN_BASE");
 			musicaliasloop ("mus_delerious_fight_in_base", 0, 2);
 			musicStinger ("mus_delerious_fight_in_base_stg", 8, true);
 			
 		declareMusicState("STEINER_HALL");	
 			musicaliasloop ("mus_delerious_stealth_part_one", 3, 3);
// 			musicStinger("mus_chopper_stiener_lab", 38.35, true);
 			
 		declareMusicState("STEINER_LAB");
 			musicaliasloop("mus_chopper_stiener_lab_b", 0, 1);
 			musicstinger ("mus_dwarka_mason_steiner", 20, true );
 		 			
 		 declareMusicState("REZNOV_SPEAKS");
// 		 	musicAlias ("mus_dwarka_mason_steiner", 0.25);
 			musicaliasloop ("NULL", 0, 1);
 
 		declareMusicState("HUDSON_INTRO");
 			musicaliasloop ("mus_redglare_hudson_intro", 0, 2);
 	
 		declareMusicState("HUDSON_BTR");
 		 	musicAliasloop ("mus_redglare_btr", 0, 0);
 		 	musicStinger ("mus_redglare_chopper_coming", 12.5, true);
 		 		
 		declareMusicState ("CHOPPER_COMING");
 			musicAliasloop ("NULL", 2, 2);
 		 	musicStinger ("mus_redglare_btr_owned", 15, true);
 		 	
 		declareMusicState ("BTR_OWNED");
 			musicaliasloop ("mus_gamewardens_mask_loop", 2, 4); 
 			musicStinger ("mus_group14_rebirth_stg", 1, true);			
 		
 		declareMusicState ("STRELLA_LOOP");
 			musicaliasloop ("mus_redglare_chopper_loop", 3, 1);
 			musicStinger ("mus_redglare_chopper_end", 10, true);
 		
 		declareMusicState ("CHOPPERS_DEFEATED");
 			musicAliasloop ("mus_redglare_hudson_intro", 0, 2);
 			musicStinger ("mus_drexel_post_strella", 101, true );
 			
 		declareMusicState ("WEAPONS_FREE");
 			musicaliasloop ("mus_delerious_stealth_part_two", 0, 1);
 			musicStinger ("mus_chopper_stiener_hudson_lab", 28, true);
 			
 		declareMusicState ("END_SCENE");
 			musicAlias ("mus_dwarka_hudson_steiner", 0);
 			
 		
 		
 		
//************************************************************************************************
//                                      THREAD FUNCTIONS
//************************************************************************************************	
 		
 		level thread rebirth_default_snapshot();
		level thread rebirth_mask_snapshot();
		level thread crane_moves();
		level thread container_a();
		level thread container_b();
		level thread decontamination_alarm();
		level thread mask_damage_snapshot_1();
		level thread mask_damage_snapshot_2();
		level thread mask_damage_snapshot_3();
		level thread mid_level_transition_snapshot();
		level thread hudson_start_snapshot();
		level thread nova_six();
		level thread hudson_final_scene();
		level thread set_inbase_snapshot();

		
		//level thread pa_dock_vox();
		//level thread pa_rail_vox();
		
		array_thread(GetEntArray( 0,"amb_pa_dock", "targetname"), ::pa_dock_vox);		
		array_thread(GetEntArray( 0,"amb_pa_dock", "targetname"), ::pa_explo_vox);	
		array_thread(GetEntArray( 0,"amb_pa_dock", "targetname"), ::pa_elevator_slide_vox);	
		array_thread(GetEntArray( 0,"amb_pa_dock", "targetname"), ::pa_elevator_kill_vox);	
			
		array_thread(GetEntArray( 0,"amb_alarm", "targetname"), ::alarms_lab);		
		array_thread(GetEntArray( 0,"amb_alarm_lab_out", "targetname"), ::alarms_lab_out);	
		
		array_thread(GetEntArray( 0,"amb_alarm_lab_out", "targetname"), ::alarms_spotlight);	
		
		//array_thread(GetEntArray( 0,"amb_alarm_lab_out", "targetname"), ::alarms_lab_out_off);	
		array_thread(GetEntArray( 0,"amb_alarm_out", "targetname"), ::alarms_out);	
		array_thread(GetEntArray( 0,"amb_alarm_computer", "targetname"), ::alarms_computer);		
		array_thread(GetEntArray( 0,"amb_alarm_office", "targetname"), ::alarms_office);	
	
		array_thread(GetEntArray( 0,"fan_chamber", "targetname"), ::fans_chamber);	
		array_thread(GetEntArray( 0,"fan_room", "targetname"), ::fans_room);		

		array_thread(GetEntArray( 0,"decontamination", "targetname"), ::decontamination);	
 		
}

	//************************************************************************************************
	//                                      SWITCH SNAPSHOTS
	//************************************************************************************************		
	
rebirth_default_snapshot()
{
    level waittill( "mos" );
    level.snd_footstep_override_plr = "";
    snd_set_snapshot( "default" );
		deactivateAmbientRoom( 0, "hazmat_suit", 4 );
}

rebirth_mask_snapshot()
{
    level waittill( "mask_on_snapshot" );
    level.snd_footstep_override_plr = "fly_hazmat_step";
    snd_set_snapshot( "hazmat_mask" );
		activateAmbientRoom( 0, "hazmat_suit", 4 );
}
mask_damage_snapshot_1()
{
	level waittill ("_gasmask_on_cracked_1");	
	snd_set_snapshot( "hazmat_mask_damage_1" );
	
}
mask_damage_snapshot_2()
{
	level waittill ("_gasmask_on_cracked_2");	
	snd_set_snapshot( "hazmat_mask_damage_2" );
	
}
mask_damage_snapshot_3()
{
	level waittill ("_gasmask_on_cracked_3");	
	snd_set_snapshot( "hazmat_mask_damage_3" );
	
}
mid_level_transition_snapshot()
{
	level waittill ("mason_int");
	snd_set_snapshot( "alloff_except_voice_music_event" );	
	
}
hudson_start_snapshot()
{
	level waittill ("hudson_start");
	snd_set_snapshot( "default" );	
	
}
hudson_final_scene()
{
	level waittill( "fss");
	snd_set_snapshot ("rebirth_final_scene");
}
set_inbase_snapshot()
{
	//Fix for a helicopter that is flying just outside steiners office and sounds terrible.
	level waittill ("in_base");
	snd_set_snapshot ("rebirth_in_base_no_chopper");
}


//************************************************************************************************
//                                       FUNCTIONS
//************************************************************************************************	

//************ alarms lab ************
alarms_lab()
{	
	//trig = GetEnt( 0, "alarm_trig", "targetname");
	//trig waittill ("trigger");
	level waittill ("alarmz_trig");	
	self PlayLoopSound( "amb_alarms");
}

//************ alarms outside lab************
alarms_lab_out()
{
	//trig = GetEnt( 0, "alarm_trig", "targetname");
	//trig waittill ("trigger");
	level waittill ("alarmz_trig");	
	self playloopsound ("amb_alarms_out");
	level waittill ("outside_lab_alarms_off");	
	self stoploopsound(6);	
}


//************ alarms_spotlight************
alarms_spotlight()
{
	player = getlocalplayer(0);	
	level waittill ("spotlight_kid");	
	self playloopsound ("amb_alarms_out");
	player waittill("death");
	self stoploopsound();
}

//************ alarms outside ************
alarms_out()
{
	level waittill ("alarms_outside");
	self playloopsound ("amb_alarms_out");	

	
}

//************ alarms computer rooms ************
alarms_computer()
{
	//trig = GetEnt( 0, "alarm_trig", "targetname");
	//trig waittill ("trigger");
	level waittill ("alarmz_trig");	
	self playloopsound ("amb_alarms_computer");		
	//self stoploopsound();	
}

//************ alarms offices ************
alarms_office()
{
	//trig = GetEnt( 0, "alarm_trig", "targetname");
	//trig waittill ("trigger");
	level waittill ("alarmz_trig");	
	self playloopsound ("amb_alarms_offices");	
}

//************ fans chamber ************
fans_chamber()
{
	level waittill ("fans_chamber_on");
	self PlaySound( 0, "evt_fan_on");		
	self playloopsound ("evt_fan_run");	
	level waittill ("fans_chamber_off");
	self stoploopsound (0.5);
	self PlaySound( 0, "evt_fan_off");	
}

//************ fans room ************
fans_room()
{
	level waittill ("fans_room_on");
	self PlaySound( 0, "evt_fan_on");		
	self playloopsound ("evt_fan_run");	
	level waittill ("fans_room_off");
	self stoploopsound (0.5);
	self PlaySound( 0, "evt_fan_off");	
}

//************ decontamination ************
decontamination()
{
	level waittill ("decontamination_on");
	//realwait (2);
	self PlaySound( 0, "evt_decon_on");		
	realwait (0.5);
	self playloopsound ("evt_decon_run");	
	level waittill ("decontamination_off");
	self stoploopsound (0.5);
	self PlaySound( 0, "evt_decon_off");	
}

decontamination_alarm()
{
	level waittill ("decon_alarm");
	alarm_ent_decon = spawn (0, (14506, 14502, 226), "script_origin");
	alarm_ent_decon playloopsound ("amb_decon_alarm", .5);	
	level waittill ("decontamination_off");
	realwait (15);
	alarm_ent_decon stoploopsound( .5);			
	realwait (0.5);
	alarm_ent_decon delete();
}

//************ PA vox lines ************
pa_dock_vox()
{
	level waittill ("start_dock_pa");
	realwait( 1 );
	self playsound ( 0,"vox_reb1_s01_021A_rus1_f");
	realwait( 10 );
	self playsound ( 0,"vox_reb1_s01_022A_rus1_f");
	realwait( 7 );
	self playsound ( 0,"vox_reb1_s01_023A_rus1_f");
}

pa_explo_vox()
{
	level waittill ("start_dist_explo_pa");
	self playsound ( 0,"vox_reb1_s01_043A_rus1_f");
	//wait( 12 );
	//self playsound ( 0,"vox_reb1_s01_048A_rus1_f");
}

pa_elevator_slide_vox()
{
	level waittill ("start_elevator_slide_pa");
	self playsound ( 0,"vox_reb1_s02_050A_rus1_f");
}

pa_elevator_kill_vox()
{
	level waittill ("start_elevator_kill_pa");
	self playsound ( 0,"vox_reb1_s02_058A_rus1_f");
}

crane_moves()
{
	level waittill ("crane_moves");
	sound_ent = spawn (0, (0,0,0), "script_origin");
	realwait( 2.9 );
	//iprintlnbold ("start");
	playsound ( 0,"amb_crane_start", (0,0,0));
	realwait( .5 );	
	sound_ent playloopsound ("amb_crane_loop", 1.5);	
	realwait( 8 );	
	//iprintlnbold ("stop");
	playsound ( 0,"amb_crane_stop", (0,0,0));	
	sound_ent stoploopsound( 1.2);	
	realwait( 3.2 );	
	//iprintlnbold ("start2");
	playsound ( 0,"amb_crane_start", (0,0,0));
	realwait( .5 );	
	sound_ent playloopsound ("amb_crane_loop", 1.5);	
	realwait( 13.2 );
	//iprintlnbold ("stop2");		
	playsound ( 0,"amb_crane_stop", (0,0,0));	
	playsound ( 0,"amb_container_land", (0,0,0));
	sound_ent stoploopsound( 1.2 );			
	realwait (0.5);
	sound_ent delete();			
}

container_a()
{
	level waittill ("container_a_moves");
	sound_ent_a = spawn (0, (19313, 11956, 6), "script_origin");
	//iprintlnbold ("start_a");
	playsound ( 0,"amb_container_start", (19313, 11956, 6));
	realwait( .5 );	
	sound_ent_a playloopsound ("amb_container_loop", 1.5);	
	realwait( 14 );
	//iprintlnbold ("stop_a");		
	playsound ( 0,"amb_container_stop", (19313, 11956, 6));	
	playsound ( 0,"amb_container_land_3d", (19225, 12057, -373));
	sound_ent_a stoploopsound( 1 );
	realwait( 1 );
	//iprintlnbold ("start_a");
	playsound ( 0,"amb_container_start", (19313, 11956, 6));
	realwait( .5 );	
	sound_ent_a playloopsound ("amb_container_loop", 1.5);	
	realwait( 1.3 );
	//iprintlnbold ("stop_a");		
	playsound ( 0,"amb_container_stop", (19313, 11956, 6));	
	sound_ent_a stoploopsound( 1 );			
	realwait (0.5);
	sound_ent_a delete();			
}

container_b()
{
	level waittill ("container_b_moves");
	sound_ent_b = spawn (0, ((18876, 12988, 194)), "script_origin");
	//iprintlnbold ("start_b");
	playsound ( 0,"amb_container_start", (18876, 12988, 194));
	realwait( .5 );	
	sound_ent_b playloopsound ("amb_container_loop", 1.5);	
	realwait( 5.3 );
	//iprintlnbold ("stop_b");		
	playsound ( 0,"amb_container_stop", (18876, 12988, 194));	
	playsound ( 0,"amb_container_land_3d", (18909, 12936, -381));
	sound_ent_b stoploopsound( 1 );		
	realwait( 2.2 );
	//iprintlnbold ("start_b");
	playsound ( 0,"amb_container_start", (18876, 12988, 194));
	realwait( .5 );	
	sound_ent_b playloopsound ("amb_container_loop", 1.5);	
	realwait( 4.2);
	//iprintlnbold ("stop_b");	
	sound_ent_b stoploopsound( 1 );		
	playsound ( 0,"amb_container_stop", (18876, 12988, 194));	
	realwait (2);
	sound_ent_b delete();					
}

nova_six()
{
	level waittill ("nova_seis");
	//iprintlnbold ("nova_6");
	realwait( 2.5 );
	playsound ( 0,"evt_gk_nova_six_chopper", (0,0,0));	
	realwait( 2.75 );
	playsound ( 0,"evt_gk_nova_six_a", (7765, 5765, 626));	
	realwait (0.5);	
	playsound ( 0,"evt_gk_nova_six_a_2", (7765, 5765, 626));
	realwait( 2.5 );			
	playsound ( 0,"evt_gk_nova_six_b", (7765, 5765, 626));	
	realwait (0.2);	
	playsound ( 0,"evt_gas_leaking", (7765, 5765, 626));	
	realwait( 2.5 );
	playsound ( 0,"evt_gk_nova_six_b", (7765, 5765, 626));	
	realwait (0.5);	
	playsound ( 0,"evt_gk_nova_six_b_pop", (7765, 5765, 626));	
	realwait (0.2);	
	playsound ( 0,"evt_gk_nova_six_b_pop", (7765, 5765, 626));
	realwait (0.3);	
	playsound ( 0,"evt_gk_nova_six_b_pop", (7765, 5765, 626));
	playsound ( 0,"evt_gas_leaking", (7765, 5765, 626));		
}

