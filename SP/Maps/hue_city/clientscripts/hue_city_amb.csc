//
// file: hue_city_amb.csc
// description: clientside ambient script for hue_city : setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;
#include clientscripts\_audio;



main()
{
	
// ROOMS and Packages  \\

	declareAmbientRoom ("default");
		setAmbientRoomReverb( "default", "hue_city_street", 1, 1 );
		setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
		
	declareAmbientRoom("bathroom");
			setAmbientRoomTone( "bathroom", "amb_room_quiet" );
			setAmbientRoomReverb( "bathroom", "hue_city_bathroom", 1, 1 );
			setAmbientRoomContext( "bathroom", "ringoff_plr", "indoor" );
	
	declareAmbientPackage("bathroom");
    addAmbientElement( "bathroom", "amb_pa_shouts_vc", 15, 30, 50, 300 );
    addAmbientElement( "bathroom", "amb_huey_flyover", 17, 45, 0, 0 );
	
	declareAmbientRoom("mac-v");	
		setAmbientRoomReverb("mac-v", "hue_city_office", 1, 1);
		setAmbientRoomTone("mac-v", "amb_room_quiet", 1, 1);
		setAmbientRoomContext( "mac-v", "ringoff_plr", "indoor" );
		
	declareAmbientPackage("mac-v");
    addAmbientElement( "mac-v", "amb_pa_shouts_vc", 15, 30, 50, 300 );
    addAmbientElement( "mac-v", "amb_huey_flyover", 17, 45, 0, 0 );

	declareAmbientRoom("mac-v-2");	
		setAmbientRoomReverb("mac-v-2", "hue_city_largeroom", 1, 1);
		setAmbientRoomContext( "mac-v-2", "ringoff_plr", "indoor" );
		
	declareAmbientPackage("mac-v-2");
    addAmbientElement( "mac-v-2", "amb_pa_shouts_vc", 15, 30, 50, 300 );
    addAmbientElement( "mac-v-2", "amb_huey_flyover", 17, 45, 0, 0 );
	
	declareAmbientRoom("street_int");	
		setAmbientRoomReverb("street_int", "hue_city_smallroom", 1, 1);
		setAmbientRoomContext( "street_int", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("heli_intro_int");	
		setAmbientRoomReverb("heli_intro_int", "hue_city_street", 1, 1);
		setAmbientRoomContext( "heli_intro_int", "ringoff_plr", "indoor" );

// James new reverb triggers - in order of progression

	declareAmbientRoom("bowman_room");	
		setAmbientRoomReverb("bowman_room", "hue_city_smallroom", 1, 1);
		setAmbientRoomContext( "bowman_room", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("hallway_room");	
		setAmbientRoomReverb("hallway_room", "hue_city_hallroom", 1, 1);
		setAmbientRoomContext( "hallway_room", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("civ_kill_room");	
		setAmbientRoomReverb("civ_kill_room", "hue_city_medlroom", 1, 1);
		setAmbientRoomContext( "civ_kill_room", "ringoff_plr", "indoor" );

	declareAmbientRoom("molotov_room");	
		setAmbientRoomReverb("molotov_room", "hue_city_hallway", 1, 1);
		setAmbientRoomContext( "molotov_room", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("safe_room");	
		setAmbientRoomReverb("safe_room", "hue_city_stoneroom", 1, 1);
		setAmbientRoomContext( "safe_room", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("ceilinghole_room");	
		setAmbientRoomReverb("ceilinghole_room", "hue_city_stonecorridor", 1, 1);
		setAmbientRoomContext( "ceilinghole_room", "ringoff_plr", "indoor" );
		
	declareAmbientRoom("war_room");	
		setAmbientRoomReverb("war_room", "hue_city_warroom", 1, 1);
		setAmbientRoomContext( "war_room", "ringoff_plr", "indoor" );
		
	declareAmbientRoom ("window_breach");//for the time slow when you get the first kill with the d breath
		setAmbientRoomTone ("window_breach", "NULL");
		setAmbientRoomReverb( "window_breach", "wmd_window_breach", 1, 1 );
		setAmbientRoomContext( "window_breach", "ringoff_plr", "outdoor" );





//MUSIC
	
	declareMusicState ("INTRO");
		musicAliasloop ("mus_hits_intro", 0, 2);
		musicStinger ("mus_blackbird_intro", 55, true);

//NEW MUSIC STUFF
// MAC V
	declareMusicState ("MAC_V");
		musicAliasloop ("mus_resurrection_pre_chopper", 0, 4);

	declareMusicState ("CHOPPER_OWNS");
		musicAliasloop ("mus_macv_fight", 1, 2);
			
// CINEMATIC MOMENT IN MAC V Befor War Room
	declareMusicState ("SAFE_ROOM");
		musicAliasloop ("mus_resurrection_calm", 1, 4);
		
	declareMusicState ("WAR_ROOM");
		musicAliasloop ("mus_macv_fight_b", 4, 2);
	
	declareMusicState ("WAR_ROOM_CLEAR");
		musicAliasloop ("mus_resurrection_calm", 1, 1);
		musicStinger ("mus_reznov_attack", 11, true);
		
	declareMusicState ("BREACH_REZNOV_DOOR");
		musicAlias ("mus_meetreznov", 1);
		musicAliasloop ("mus_resurrection_pre_streets", 1, 1);
		
//streets
	declareMusicState ("STREETS_INTRO");//This is called in hue_city_event2.gsc
			musicAliasloop ("mus_resurrection_pre_streets", 1, 1);
			
	declareMusicState("CROSBY_BUILD");//This is called in hue_city_anim_streets.gsc
			musicAlias("mus_build", 2);
			
	declareMusicState ("METAL_LOOP1");//This is called in hue_city_event2.gsc
			musicAliasloop ("mus_metal1", 0, 4);
			musicStinger ("mus_metal_1_stg", 3);
			
	declareMusicState ("METAL_LOOP2");//This is called in hue_city_amb.gsc
			musicAliasloop ("mus_metal2", 1, 2);
			
	declareMusicState ("APC");
			musicAliasloop ("mus_resurrection_apc_attack", 1, 2);
			musicStinger ("mus_metal_1_stg", 3);
			
	declareMusicState ("APC_OWNED");
		musicAliasloop ("mus_metal2", 1, 4);	
	
	declareMusicState ("CHOPPER_RETREAT");			
			musicAliasloop ("mus_resurrection_chopper_chased", 0, 4);
			musicStinger ("mus_sting06_window",16, true);
	
	declareMusicState ("THROUGH_THE_DOOR");			
			musicAliasloop ("mus_resurrection_pre_chopper", 2, 4);
			musicStinger ("mus_pentagon_extraction", 49, true);
			
	declareMusicState ("C4");				
			musicAliasloop ("mus_resurrection_defend_phase_1", 1, 2);
			musicStinger ("mus_resurrection_defend_phase_1_STG", 15, true);
			
	declareMusicState ("DEFEND_PHASE_TWO");
			musicAlias("mus_resurrection_defend_phase_2", 0);
			
	declareMusicState ("RUN_TO_BOAT");		
			musicAlias("mus_resurrection_run_like_hell", 0);
			
	declareMusicState ("STREET_INST");//This is called in hue_city_event2.gsc
			musicAliasloop ("mus_resurrection_pre_chopper", 0, 4);
			
//setmusicstate("POST_MAC_V");


//BUS STATES \\
			
//	declareBusState("in_chopper");
//		busFadeTime(1);
//		busVolumes("pis_3rd", .1);
//		busVolumes("smg_3rd", .1); 
//		busVolumes("rfl_3rd", .1);
//		
		
			//activateAmbientPackage( 0, "_pkg", 0 );
		activateAmbientRoom( 0, "default", 0 );	
		
		thread play_projector_loop();
		thread snd_fx_create();
		thread chopper_special_FX();
		thread play_heli_fires();
		thread air_raid_siren();
		thread heli_intro_reverb();
		thread level_start_fadein();
		thread level_end_fadeout();
		thread bulletcam_audio();
		thread ambient_rattle_sounds();
}
play_projector_loop()
{
	
	level waittill ("top");
	sound_id_1 = clientscripts\_audio::playloopat(0, "amb_projector_loop", (-76680, -25408, 7664));
	sound_id_2 = clientscripts\_audio::playloopat(0, "amb_projector_soundtrack", (-76680, -25408, 7696));
																			

}
play_heli_fires()
{

	playloopat(0, "amb_fire_lrg", (-74964,-23190,7510));
	playloopat(0, "amb_fire_xlrg", (-75483,-23283,7513));
	
}
snd_fx_create ()
{
	// TODO make the audio init happen after FX and put snd_play_auto_fx in _audio
	wait (1);
	
	
	clientscripts\_audio::snd_play_auto_fx( "a_fire_sm_fuel", "exp_fire_manager_0");
	clientscripts\_audio::snd_play_auto_fx( "dust_crumble_sm_runner", "amb_dirt_crumble");
	clientscripts\_audio::snd_play_auto_fx( "dust_crumble_md_runner", "amb_dirt_crumble");
	clientscripts\_audio::snd_play_auto_fx( "insects_ambient", "amb_fly_buzz");
	
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_plume_xlg_tall_blk", "exp_fire_manager_0");
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_smolder_sm", "exp_fire_manager_0");
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_fire_md_fuel", "exp_fire_manager_0");
	//clientscripts\mp\_audio::snd_play_auto_fx( "a_smk_field_sm", "exp_fire_manager_0");				
}	
chopper_special_FX()
{
	level waittill ("csfx");
	snd_set_snapshot("quagmire_special_fx");
	sound_id_42 = clientscripts\_audio::playloopat(0, "evt_4_slow_chopper", (0,0,0));
	
	level waittill ("rsfx");
	snd_set_snapshot("default");
	stoploopsound(0, sound_id_42, 2);
}

air_raid_siren()
{
	waitforclient(0);
	playloopat(0, "amb_air_raid", (-3664,1840,8208));
}

heli_intro_reverb()
{
	level waittill ("heli_intro_verb");
	activateAmbientRoom( 0, "heli_intro_int", 30 );
	
	level waittill ("heli_intro_verb_off");
	wait 5;
	deactivateAmbientRoom( 0, "heli_intro_int", 30 );
	
}
level_start_fadein()
{
	level waittill ("ind");
    snd_set_snapshot( "alloff_except_voice_music" );
    level waittill( "fdeu" );
    snd_set_snapshot( "default" );
    
    
    
}
level_end_fadeout()
{
    level waittill( "fdo" );
    snd_set_snapshot( "hue_levelend_fadeout" );
}

bulletcam_audio()
{
	level waittill( "slow_down" );
		
	ent1 = Spawn( 0, (0,0,0), "script_origin" );
	
	//snd_set_snapshot( "bulletcam" );
	PlaySound( 0, "evt_bulletcam_start", (0,0,0) );
		
	PlaySound( 0, "evt_time_slow_start", (0,0,0) );
	activateAmbientRoom( 0, "window_breach", 60 );
	ent1 playloopsound ("evt_win_breach_bg");
		
	level waittill( "speed_up" );
	ent1 Delete();
	PlaySound( 0, "evt_bulletcam_end", (0,0,0) );
	PlaySound( 0, "evt_time_slow_stop", (0,0,0) );
	wait(.75);
	deactivateAmbientRoom(0, "window_breach", 60);
	//snd_set_snapshot( "default" );
}
ambient_rattle_sounds()
{
	rattle_org = getentarray(0, "amb_rattlers", "targetname");
	for(i=0;i<rattle_org.size;i++)
	{
		rattle_org[i] thread play_rattle_sounds();	
		
	}
	
}
play_rattle_sounds()
{
	while(1)
	{
		level waittill ("exp_hit_rattle");
		wait (randomfloatrange(0.05, 0.35));
		waitforclient(0);
		playsound(0, "amb_rattle", self.origin);
		
	}	
	
}
