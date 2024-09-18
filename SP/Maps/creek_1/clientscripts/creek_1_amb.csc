//
// file: creek_1_amb.csc
// description: clientside ambient script for creek_1: setup ambient sounds, etc.
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
		//Default
		declareAmbientRoom( "outside" );
		declareAmbientPackage( "outside" );
			setAmbientRoomReverb ("outside","creek_1_jungle", 1, 1);
			setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "outside", "" );
			//addAmbientElement( "outside", "", .1, .6, 50, 150 );

		//Helicopter Interior
		declareAmbientRoom( "helicopter" );
		declareAmbientPackage( "helicopter" );
			setAmbientRoomReverb ("helicopter","creek_1_helo", 1, 1);
			setAmbientRoomContext( "helicopter", "ringoff_plr", "indoor" );
			//setAmbientRoomTone( "outside", "" );
			//addAmbientElement( "outside", "", .1, .6, 50, 150 );
			
		//Path, directly after Meatshield Event	
		declareAmbientRoom( "creek_path" );
		declareAmbientPackage( "creek_path" );
			setAmbientRoomReverb ("creek_path","creek_1_path", 1, 1);
			setAmbientRoomContext( "creek_path", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "creek_path", "" );
			//addAmbientElement( "creek_path", "", .1, .6, 50, 150 );
		
		//Open Hut: First hut the player enters post creek path
		declareAmbientRoom( "hut_open" );
		declareAmbientPackage( "hut_open" );
			setAmbientRoomReverb ("hut_open","creek_1_partial_hut", 1, 1);
			setAmbientRoomSnapshot( "hut_open", "creek_hut_rain_dip" );
			setAmbientRoomContext( "hut_open", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "hut_open", "", 1.5, 0.4 );		
			//addAmbientElement( "hut_open", "", .1, .6, 50, 150 );	
		
		//Small Partial Hut
		declareAmbientRoom( "hut_small_partial" );
		declareAmbientPackage( "hut_small_partial" );
			setAmbientRoomReverb ("hut_small_partial","creek_1_partial_hut", 1, 1);
			setAmbientRoomContext( "hut_small_partial", "ringoff_plr", "indoor" );
			//setAmbientRoomTone( "hut_small_partial", "", 1.5, 0.4 );		
			//addAmbientElement( "hut_small_partial", "", .1, .6, 50, 150 );
		
		//Large Full Hut
		declareAmbientRoom( "hut_large_full" );
		declareAmbientPackage( "hut_large_full" );
			setAmbientRoomReverb ("hut_large_full","creek_1_large_hut", 1, 1);
			setAmbientRoomContext( "hut_large_full", "ringoff_plr", "indoor" );
			//setAmbientRoomTone( "hut_large_full", "", 1.5, 0.4 );		
			//addAmbientElement( "hut_large_full", "", .1, .6, 50, 150 );	
		
		//Small Full Hut
		declareAmbientRoom( "hut_small_full" );
		declareAmbientPackage( "hut_small_full" );
			setAmbientRoomReverb ("hut_small_full","creek_1_small_hut", 1, 1);
			setAmbientRoomContext( "hut_small_full", "ringoff_plr", "indoor" );
			//setAmbientRoomTone( "hut_small_full", "", 1.5, 0.4 );		
			//addAmbientElement( "hut_small_full", "", .1, .6, 50, 150 );
			
		//Awning-covered decks outside of larger buildings
		declareAmbientRoom( "under_awning" );
		declareAmbientPackage( "under_awning" );
			setAmbientRoomReverb ("under_awning","creek_1_partial_hut", 1, 1);
			setAmbientRoomContext( "under_awning", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "under_awning", "", 1.5, 0.4 );		
			//addAmbientElement( "under_awning", "", .1, .6, 50, 150 );
		
		//Village Exterior
		declareAmbientRoom( "village_exterior" );
		declareAmbientPackage( "village_exterior" );
			setAmbientRoomReverb ("village_exterior","creek_1_village_fight", 1, 1);
			setAmbientRoomContext( "village_exterior", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "village_exterior", "", 1.5, 0.4 );		
			//addAmbientElement( "village_exterior", "", .1, .6, 50, 150 );	
			
		//Riverside
		declareAmbientRoom( "riverside" );
		declareAmbientPackage( "riverside" );
			setAmbientRoomReverb ("riverside","creek_1_jungle", 1, 1);
			setAmbientRoomContext( "riverside", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "riverside", "", 1.5, 0.4 );		
			//addAmbientElement( "riverside", "", .1, .6, 50, 150 );	
			
		//Tunnel Interior
		declareAmbientRoom( "tunnel_interior" );
		declareAmbientPackage( "tunnel_interior" );
			setAmbientRoomReverb ("tunnel_interior","creek_1_cave", 1, 1 );
			setAmbientRoomContext( "tunnel_interior", "ringoff_plr", "indoor" );
 			setAmbientRoomTone( "tunnel_interior", "amb_tunnel", 2, 5 ); 			
 			addAmbientElement( "tunnel_interior", "amb_tension_oneshot", 8, 18, 50, 150 );	
 		
 		//Tunnel War Room
		declareAmbientRoom( "tunnel_warroom" );
		declareAmbientPackage( "tunnel_warroom" );
			setAmbientRoomReverb ("tunnel_warroom","creek_1_cave_war", 1, 1 );
			setAmbientRoomContext( "tunnel_warroom", "ringoff_plr", "indoor" );
 			//setAmbientRoomTone( "tunnel_warroom", "amb_tunnel", 2, 5 ); 			
 			//addAmbientElement( "tunnel_warroom", "amb_tension_oneshot", 8, 18, 50, 150 );	
 			
 		//Tunnel Interior
		declareAmbientRoom( "tunnel_interior_collapse" );
		declareAmbientPackage( "tunnel_interior_collapse" );
			setAmbientRoomReverb ("tunnel_interior_collapse","creek_1_cave_collapse", 1, 1, 1.5 );
			setAmbientRoomContext( "tunnel_interior_collapse", "ringoff_plr", "indoor" );
 			//setAmbientRoomTone( "tunnel_interior_collapse", "amb_tunnel", 2, 5 ); 			
 			//addAmbientElement( "tunnel_interior_collapse", "amb_tension_oneshot", 8, 18, 50, 150 );	
	
		//Tunnel Reznov Room
		declareAmbientRoom( "creek_reznov_room" );
			setAmbientRoomReverb ("tunnel_interior_collapse","CAVE", 1, 1, 1.5 );
			setAmbientRoomContext( "tunnel_interior_collapse", "ringoff_plr", "indoor" );
		
		
		
		//SHOCK
		declareAmbientRoom( "shock" );
		declareAmbientPackage( "shock" );
 			setAmbientRoomTone( "shock", "chr_shock_loop", 3, .5 );
 			setAmbientRoomReverb ("shock","creek_1_shock", 1, 1 );
 			setAmbientRoomContext( "shock", "ringoff_plr", "indoor" );
 			//addAmbientElement( "shock", "", 8, 18, 50, 150 );
 			
 		//MEATSHIELD
		declareAmbientRoom( "meatshield" );
		declareAmbientPackage( "meatshield" );
 			//setAmbientRoomTone( "meatshield", "chr_heartbeat_meatshield", 2, .5 );
 			setAmbientRoomReverb ("meatshield","creek_1_meat", 1, 1 );
 			setAmbientRoomContext( "meatshield", "ringoff_plr", "outdoor" );
		
 		
 		//Underwater Faked
 		declareAmbientRoom( "underwater_faked" );
 			setAmbientRoomTone( "underwater_faked", "chr_swimming_underwater_amb", 1, .1 );
 			setAmbientRoomReverb ("underwater_faked","creek_1_underwater", 1, 1 );
 			setAmbientRoomContext( "underwater_faked", "ringoff_plr", "indoor" );
		
		//Activate the Default Package
		activateAmbientPackage( 0, "outside", 0 );
		activateAmbientRoom( 0, "outside", 0 );			

	
	//**MUSIC STATES**\\
		declareMusicState("INTRO"); 
			musicAlias("mus_chopperintro_STG", 0);


		declareMusicState("MEAT_SHIELD");
			musicAlias("mus_meat_shield", 0);
			musicAliasloop("mus_jungle_ambient_loop", 1, 3);	
			
		declareMusicState("IN_THE_JUNGLE_ACTION"); 
			musicAliasloop("mus_jungle_action_loop", 0, 1);	
			
		declareMusicState ("IN_THE_JUNGLE_AMBIENT");
			musicAliasloop("mus_jungle_ambient_loop", 1, 3);	
	
		declareMusicState("BOAT_KILL");
			musicAlias("mus_stinger_boat_kill", 0);
			
		declareMusicState("TENSION");
			musicAlias("mus_bendz_tension", 0);
	
		declareMusicState("VILLAGE_STEALTH");
			musicAliasloop("mus_village_part_one", 0, 2);	
			musicStinger ("mus_curtain", 15, true);
			
		declareMusicState("VILLAGE_RICE_SECTION");//			
			musicAliasloop("mus_village_part_two", 2, 3);	
		
		declareMusicState("VILLAGE_PRE_FIGHT");
			musicAlias ("mus_village_fight_intro", 0);
			musicAliasloop("mus_village_lead_in", 1, 2);	
		
		declareMusicState("VILLAGE_FIGHT");
//			musicAliasloop("mus_invictus_tribal_loop", 0, 1);
			musicAliasloop("mus_danbau_village", 0, 1);


		declareMusicState("CHOPPERS_INBOUND");
		//	musicAliasloop ("mus_choppers_inbound", 1, 4 );
			musicAlias ("mus_invictus_village_horns", 0);
//			musicAliasloop ("mus_invictus_tribal_loop_b", 1, 4);		
			musicAliasloop ("mus_danbau_village", 0, 4);		
			musicStinger ("mus_invictus_village_STG", 5);
		
		declareMusicState("TUNNEL_UNDERSCORE");
			musicAliasloop("mus_waterboard_tunnel", 1, 1); 
			
		declareMusicState("TUNNEL_UPHILL");	
			musicAliasloop("mus_tunnel_uphill", 0, 1);
			musicStinger ("mus_tunnel_door_open", 39 );

		declareMusicState("TUNNEL_DOOR_OPEN");	
			musicAliasloop("mus_waterboard_tunnel", 0, 1);	

		declareMusicState("CAVE_IN");	
			musicAliasloop("mus_tunnel_cave_in", 0, 1);	
			musicStinger ("mus_tunnel_cave_in_STG", 7, true);
			
		declareMusicState("CLIFF_HANGER");
			musicAlias("mus_deviant_huey_ending", 0);
			musicAliasloop("null", 0, 1);			
		
			

	//**BUS STATES**\\
	
	//**FUNCTIONS**\\
	level thread jumpto_fix();
	level thread demo_end_sound_off();
	level thread demo_rain_and_village_trigger_overrides();
	
	//BEAT 1 - Helicopter Event
	level thread creek_s01_HELO_EVENT();
	level thread copilot_death_audio();
	level thread creek_s01_MEATSHIELD();
	level thread bulletcam();
	level thread start_creek_raining();
	
	//BEAT 3 - Village Fight
	level thread village_ambience();
	level thread village_assault_snapshot();
	//Beat 4 - Tunnel Section
	level thread footstep_vol_override();
	level thread anml_run_triggers();
	level thread amb_tension_laugh_trig();
	level thread number_looper(); 	
	
//	level thread for_testing_only();
}
//for_testing_only()
//{
//	wait(5);
//	snd_set_snapshot( "default" );
//	activateAmbientRoom( 0, "outside", 60 );
	


//**********************
//  HELICOPTER OPENING PLAYER EVENT
//**********************

creek_s01_HELO_EVENT()
{
	self endon( "skip" );
	
	self waittill( "start_helo_event" );
	
	snd_set_snapshot( "special_event" );
	
	activateAmbientRoom( 0, "helicopter", 30 );
	clientscripts\_swimming::disable_underwater_snapshot( true );
	level thread play_heli_intro();
	
	realwait(9);
	level thread underwater_detection();
	level thread helo_ambient_elements();
	level thread vc_ambient_boat_movement();
	activateAmbientRoom( 0, "shock", 60 );
	snd_set_snapshot( "shock" );
	
	level waittill( "hls" );
	realwait(2);
	PlaySound( 0, "chr_shock_out", (0,0,0) );
	realwait(1.25);
	snd_set_snapshot( "low_ambience" );
	deactivateAmbientRoom( 0, "shock", 60 );
	clientscripts\_swimming::disable_underwater_snapshot( false );
}

//self is level
play_heli_intro()
{
    self thread play_heli_intro_rumble();
    PlaySound( 0, "evt_heli_intro_front", (0,0,0) );
    realwait( 1.5 );
    PlaySound( 0, "vox_cre1_s01_001A_usc1", (0,0,0) );
}

play_heli_intro_rumble()
{
 	println("start rumble NOW");
 	players = getlocalplayers();
	player = players[0];	
	realwait(7.5);
	if(IsDefined(player))
	{
		println("player is defined in creek_1_amb");
	}
	
	for(i = 0; i < 20; i++)
	{
   	waitforclient(0);
		player PlayRumbleOnEntity(0, "grenade_rumble");
		wait 0.02;
	}
	//player PlayRumbleLoopOnEntity( 	0, "damage_heavy" );
	
	//wait 1.5;
	//player StopRumble( 0, "damage_heavy" );
}

helo_ambient_elements()
{
	radio = getstruct( "evt_heli_radio", "targetname" );
	alarm = getstruct( "evt_heli_alarm", "targetname" );
	sparks = getstruct( "evt_heli_spark", "targetname" );
	water_1 = getstruct( "evt_heli_water_rush_1", "targetname" );
	water_2 = getstruct( "evt_heli_water_rush_2", "targetname" );
	
	if( !IsDefined( radio ) )
		return;
		
	array_thread( (getstructarray( "amb_sparks", "targetname" ) ), ::heli_sparks );
	
	radio_ent = Spawn( 0, radio.origin, "script_origin" );
	alarm_ent = Spawn( 0, alarm.origin, "script_origin" );
	sparks_ent = Spawn( 0, sparks.origin, "script_origin" );
	water_1_ent = Spawn( 0, water_1.origin, "script_origin" );
	water_2_ent = Spawn( 0, water_2.origin, "script_origin" );
	ent1 = Spawn( 0, (0,0,0), "script_origin" );
	
	radio_ent thread play_helo_ambient_elements( "evt_s01_heli_amb_chatter" );
	alarm_ent thread play_helo_ambient_elements( "evt_s01_heli_amb_alarm1" );
	sparks_ent thread play_helo_ambient_elements( "evt_s01_heli_amb_alarm2" );
 	waitforclient(0);
	water_1_ent PlayLoopSound( "evt_s01_heli_amb_waterspray1", 3 );
	water_2_ent PlayLoopSound( "evt_s01_heli_amb_waterspray2", 3 );
	ent1 PlayLoopSound( "evt_s01_helo_water_loop", 3 );
	level thread heli_groans();
	
	level waittill( "s01uw2" );
	
	water_1_ent Delete();
	water_2_ent Delete();
	ent1 Delete();
}

play_helo_ambient_elements( alias )
{
	self PlayLoopSound( alias, 3 );
	level waittill( "s01uw2" );
	wait( RandomIntRange( 1, 5 ) );
	waitforclient(0);
	self stoploopsound( .5 );
	PlaySound( 0, "amb_sparks", self.origin );
	wait( 1 );
	self Delete();
}

heli_sparks()
{
	level endon( "s01uw2" );
	ent = Spawn( 0, self.origin, "script_origin" );
	
	while(1)
	{
		waitforclient(0);
		PlaySound( 0, "amb_sparks", ent.origin );
		realwait(RandomIntRange(1,9));
	}
}

heli_groans()
{
    level endon( "s01uw1" );
    
    while(1)
    {
       	waitforclient(0);
        PlaySound( 0, "evt_helo_general_groans", (0,0,0) );
        realwait(RandomFloatRange( 4, 8 ) );
    }
}

underwater_detection()
{
	ent1 = Spawn( 0, (0,0,0), "sript_origin" );
	
	level waittill( "s01uw1" );
	level set_below_water();
	PlaySound( 0, "vox_carter_uw1", (0,0,0) );
	PlaySound( 0, "evt_s01_helo_uw0", (0,0,0) );
	
	level waittill( "s01aw1" );
	level set_above_water();
	PlaySound( 0, "vox_carter_uw2", (0,0,0) );
	
	level waittill( "s01uw2" );
	level set_below_water();
	PlaySound( 0, "evt_s01_helo_uw_falling", (0,0,0) );
	PlaySound( 0, "evt_s01_helo_uw_plr_struggle", (0,0,0) );
	ent1 PlayLoopSound( "evt_s01_helo_underwater_loop", 1 ); 
	PlaySound( 0, "vox_carter_uw3", (0,0,0) );
	
	level waittill( "hlo" ); 
	deactivateAmbientRoom( 0, "underwater", 50 );
	deactivateAmbientRoom( 0, "helicopter", 30 );
	realwait(4);
	waitforclient(0);
	ent1 stoploopsound(1);
	realwait(1);
	waitforclient(0);
	ent1 Delete();
}

set_below_water()
{
	activateAmbientRoom( 0, "underwater", 50 );
	snd_set_snapshot( "underwater" );
	PlaySound( 0, "chr_swimming_dive_start_plr", (0,0,0) ); //Diving Sound
	PlaySound( 0, "chr_ear_fill", (0,0,0) );
}

set_above_water()
{
	deactivateAmbientRoom( 0, "underwater", 50 );
	snd_set_snapshot( "low_ambience" );
	PlaySound( 0, "chr_swimming_surface_plr", (0,0,0) ); //Surfacing Splashes
	PlaySound( 0, "chr_ear_drain", (0,0,0) );
}

copilot_death_audio()
{
	level waittill( "cop_str" );
	realwait(.35);
	PlaySound( 0, "evt_copilot_whoosh" );
	snd_set_snapshot( "creek_copilot_death" );
	//iprintlnbold("voice_only");
	realwait(.7);
	PlaySound( 0, "evt_copilot_death" );
	//iprintlnbold("evt_copilot_death");
	level waittill( "cop_sht" );
	//iprintlnbold("cop_sht");
	snd_set_snapshot( "low_ambience" );
	//iprintlnbold("low_ambience");
}

vc_ambient_boat_movement()
{
    array_thread( getstructarray( "vc_boat_movement", "targetname" ), ::vc_boat_moving_loops );
}

vc_boat_moving_loops()
{
    if( !IsDefined( self ) )
        return;
    
    end = getstruct( self.target, "targetname" );
    ent = spawn( 0, self.origin, "script_origin" );

    realwait(.5);
		waitforclient(0);

    ent thread vc_boat_moving_vox();
    ent PlayLoopSound( "veh_sampan_run_loop", 1 );
    ent MoveTo( end.origin, RandomIntRange(18,22) );
    ent waittill( "movedone" );
   	waitforclient(0);
    //IPrintLnBold( "BOATS DONE MOVING!!!" );
    ent stoploopsound( .25 );
    PlaySound( 0, "veh_sampan_shut_off", end.origin );
    ent Delete();
}

vc_boat_moving_vox()
{
    self endon( "movedone" );
    
    while(1)
    {
        PlaySound( 0, "amb_sampan_voice", self.origin );
        wait(RandomFloatRange( 3, 9 ) );
       	waitforclient(0);
    }
}

//**********************
//  MEATSHIELD AND BULLETCAM
//**********************
creek_s01_meatshield()
{
	level thread meatshield_snapshot_override();
	
	level waittill( "meats" );
	realwait(.5);
	snd_set_snapshot( "meatshield" );
	activateAmbientRoom( 0, "meatshield", 80 );
	PlaySound( 0, "evt_meatshield_creek_out", (0,0,0) );
	
	level waittill( "meats2" );
	level thread meatshield_whizbys();
	level thread meatshield_imps();
	level thread meatshield_vox();

	level waittill( "blt_st" );
	level notify( "bullettime_active" );
}

meatshield_snapshot_override()
{
	self endon( "bullettime_active" );
	level waittill( "meatd" );
	deactivateAmbientRoom( 0, "meatshield", 80 );
	snd_set_snapshot( "default" );
}

meatshield_whizbys()
{
	self endon( "blt_st" );
	self endon( "meatd" );
	
	realwait(1.5);
	
	while(1)
	{
		PlaySound( 0, "evt_ms_whizby_fnt", (0,0,0) );
		wait(RandomFloatRange( .1, .75 ) );
	}
}

meatshield_imps()
{
	self endon( "blt_st" );
	self endon( "meatd" );
	
	players = GetLocalPlayers();
	player = players[0];
	
	while(1)
	{
		PlaySound( 0, "prj_bullet_impact_special_ms", player.origin );
		realwait(RandomFloatRange( .1, .45 ) );
		waitforclient(0);
	}
}

meatshield_vox()
{
    self endon( "blt_st" );
    self endon( "meatd" );
    self endon( "msd" );
    
    self thread ms_death_vox();
    
    while(1)
    {
        PlaySound( 0, "vox_ms_pain", (0,0,0) );
        realwait(RandomFloatRange( .4, 1 ) );
    }
}

ms_death_vox()
{
    self waittill( "msd" );
    PlaySound( 0, "vox_ms_death", (0,0,0) );
}

jumpto_fix()
{
	level waittill( "skip" );
	snd_set_snapshot( "default" );
	deactivateAmbientRoom( 0, "helicopter", 30 );
	clientscripts\_swimming::disable_underwater_snapshot( false );
}

//Sets up a Snapshot and plays Audio whenever bullet cam is activated
bulletcam()
{
	while(1)
	{
		ent1 = Spawn( 0, (0,0,0), "script_origin" );
		ent2 = Spawn( 0, (0,0,0), "script_origin" );
		
		level waittill( "blt_st" );
		waitforclient(0);

		snd_set_snapshot( "bulletcam" );
		PlaySound( 0, "evt_bulletcam_start", (0,0,0) );
		PlaySound( 0, "evt_bulletcam_end", (0,0,0) );
		ent1 PlayLoopSound( "evt_bulletcam_vox", .05 );
		ent2 PlayLoopSound( "evt_bulletcam_whiz", .05 );
		
		level waittill( "blt_imp" );
		waitforclient(0);

		PlaySound( 0, "evt_bulletcam_ai_death", (0,0,0) );
		ent1 Delete();
		ent2 Delete();
		wait(1.3);
		deactivateAmbientRoom( 0, "meatshield", 80 );
		PlaySound( 0, "evt_bulletcam_creek_in", (0,0,0) );
		wait(.75);
		activateAmbientPackage( 0, "outside", 0 );
		snd_set_snapshot( "default" );
	}
}

//**********************
//  PATHWAY AND RAIN
//**********************
start_creek_raining()
{
    trigger_start1 = GetEnt( 0, "start_creek_raining_light", "targetname" );
    trigger_start2 = GetEnt( 0, "start_creek_raining_heavy", "targetname" );
    trigger_end1 = GetEnt( 0, "end_creek_raining_heavy", "targetname" );
    trigger_end2 = GetEnt( 0, "end_creek_raining_light", "targetname" );
    
    if( !IsDefined( trigger_start1 ) )
    {
        //IPrintLnBold( "Your Rain Triggers Don't Exist" );
	    return;
	}
	
	level.raining_audio = undefined;
	
	array_thread( ( getstructarray( "rain_structs", "targetname" ) ), ::creek_rain_3d_structs );
    level thread play_creek_uw_raining();
	trigger_start1 thread rain_tracker( "light" );
	trigger_start2 thread rain_tracker( "heavy", "thunder" );
	trigger_end1 thread rain_tracker( "light" );
	trigger_end2 thread rain_tracker( "end" );
	
	//Make sure the player actually makes a splash sound when he jumps into the water
	trigger_end1 thread fake_splash_audio();
}

rain_tracker( type, thunder )
{
    //IPrintLnBold( "AUDIO RAIN TRIGGER " + type + " WAITING" );
    self waittill( "trigger" );
    //IPrintLnBold( "RAIN TRIGGER " + type + " HIT" );
    
    if( type == "end" )
    {
        level notify( "end_rain" );
        return;
    }
    
    level.raining_audio = type;
    
    if( IsDefined( thunder ) )
    {
        PlaySound( 0, "amb_thunder_2d_oneshot", (0,0,0) );
    }
}

creek_rain_3d_structs()
{
    level endon( "end_rain" );
    
    wait( RandomFloatRange( .5, 3 ) );
    
    while(1)
    {
        while( IsDefined( level.raining_audio ) )
        {
            if( level.raining_audio == "heavy" )
            {
                PlaySound( 0, "amb_rain_on_heavy_" + self.script_sound, self.origin );
                wait(RandomFloatRange( .15,.75 ) );
               	waitforclient(0);

            }
            else if( level.raining_audio == "light" )
            {
                if( self.script_sound != "rock" )
                    PlaySound( 0, "amb_rain_on_light_" + self.script_sound, self.origin );
                
                wait(RandomFloatRange( .5,1.0 ) );
               	waitforclient(0);
            }
        }
        wait(1);
       	waitforclient(0);
    }
}

play_creek_uw_raining()
{
    level endon( "end_rain" );
    
    ent = spawn( 0, (0,0,0), "script_origin" );
    ent thread delete_rain_ent();
    players = GetLocalPlayers();
    player = players[0];
    
    while(1)
    {
        while( IsDefined( level.raining_audio ) )
        {
            player waittill( "underwater" );
           	waitforclient(0);

            
            if( level.raining_audio == "heavy" )
            {
                ent PlayLoopSound( "amb_rain_heavy_uw_2d", .25 );
            }
            else if( level.raining_audio == "light" )
            {
                ent PlayLoopSound( "amb_rain_light_uw_2d", .25 );
            }
                
            player waittill( "surface" );
           	waitforclient(0);

            ent stoploopsound( .25 );
        }
        wait(1);
				waitforclient(0);
    }
}

delete_rain_ent()
{
    level waittill( "end_rain" );
    self Delete();
}

fake_splash_audio()
{
    self waittill( "trigger" );
    PlaySound( 0, "chr_swimming_dive_start_plr", (0,0,0) );
}

//**********************
//  VILLAGE
//**********************
village_ambience()
{
	trigger = GetEnt( 0, "amb_village_ambience", "targetname" );
	if( !IsDefined( trigger ) )
	{
		return;
	}
	trigger waittill( "trigger" );
	array_thread( (getstructarray( trigger.target, "targetname" ) ), ::play_village_ambience );
}

play_village_ambience()
{
	ent = Spawn( 0, self.origin, "script_origin" );
	ent PlayloopSound( self.script_sound, 3 );
	level waittill( "bst" );
	waitforclient(0);

	ent stoploopsound( 1 );
}

village_assault_snapshot()
{
	level waittill( "bst" );
	snd_set_snapshot( "low_ambience" );
	level waittill( "s4s" );
	snd_set_snapshot( "default" );
}

//**********************
//  TUNNEL
//**********************
footstep_vol_override()
{
	level waittill( "tun" );
	level.footstep_vol_override = true;
}

anml_run_triggers()
{
	trigs = GetEntArray( 0, "amb_anmlrun_trig", "targetname" );
	
	if( !IsDefined( trigs ) )
	{
		return;
	}
	
	array_thread( trigs, ::anml_run_triggers_activate );
}

anml_run_triggers_activate()
{
	struct = getstruct( "rat_run_struct_3", "targetname" );
	self waittill( "trigger" );
	PlaySound( 0, "amb_anml_rat", struct.origin );
}

amb_tension_laugh_trig()
{
	trigs_1 = GetEntArray( 0, "amb_tension_oneshot", "targetname" );
	trigs_2 = GetEntArray( 0, "amb_vc_voice", "targetname" );
	
	if( !IsDefined( trigs_1 ) || !IsDefined( trigs_2 ) )
	{
//		IPrintLnBold( "No Triggers, Collin" );
		return;
	}
//	IPrintLnBold( "No Triggers, Collin" );
	array_thread( trigs_1, ::play_trig_sounds );
	array_thread( trigs_2, ::play_trig_sounds );
}

play_trig_sounds()
{

	struct = getstruct( self.target, "targetname" );
	self waittill( "trigger" );
	waitforclient(0);

	PlaySound( 0, self.script_sound, struct.origin );
}

demo_end_sound_off()
{
	level waittill( "snd_off" );
	snd_set_snapshot( "alloff" );
}

//THIS FUNCTION SERVES ONLY TO FORCESTART THE RAIN AND VILLAGE STREAMS FOR THE PRESS DEMO
demo_rain_and_village_trigger_overrides()
{
    //Start Light Rain
    level waittill( "drl" );
    level.raining_audio = "light";
    
    //Start Heavy Rain
    level waittill( "drh" );
    PlaySound( 0, "amb_thunder_2d_oneshot", (0,0,0) );
    level.raining_audio = "heavy";
    
    //Start Village Streams
    trigger = GetEnt( 0, "amb_village_ambience", "targetname" );
	array_thread( (getstructarray( trigger.target, "targetname" ) ), ::play_village_ambience );
}

number_looper()
{

	num_ent = spawn (0, ((-19247.2, 36639.8, -148.2)), "script_origin");		
	num_ent playloopsound ("amb_num_13_d", 1);
					
}