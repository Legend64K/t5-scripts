//
// file: pow_amb.csc
// description: clientside ambient script for pow: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;
#include clientscripts\_audio;

main()
{
	//**AMBIENT PACKAGES**\\
	
		//Default
		declareAmbientRoom( "exterior_default" );
		declareAmbientPackage( "exterior_default" );
			setAmbientRoomReverb ("exterior_default","cuba_outdoor_deafault", 1, 1);
			setAmbientRoomContext( "exterior_default", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "exterior_default", "" );
			addAmbientElement( "exterior_default", "amb_wind_leaves", 2, 7, 50, 150 );
		
		//Opening scene, bar interior, small bar	
		declareAmbientRoom( "interior_bar" );
		declareAmbientPackage( "interior_bar" );
		    setAmbientRoomReverb ("interior_bar","cuba_interior_bar", 1, 1);
			setAmbientRoomContext( "interior_bar", "ringoff_plr", "indoor" );
			setAmbientRoomTone( "interior_bar", "amb_bar_interior" );
			//addAmbientElement( "interior_bar", "", .1, .6, 50, 150 );
		
		//The entirety of the streetbattle, wide streets, tall-ish buildings on either side	
		declareAmbientRoom( "exterior_streetbattle" );
		declareAmbientPackage( "exterior_streetbattle" );
		    setAmbientRoomReverb ("exterior_streetbattle","cuba_outdoor_battle", 1, 1);
			setAmbientRoomContext( "exterior_streetbattle", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "exterior_streetbattle", "" );
			addAmbientElement( "exterior_streetbattle", "amb_wind_leaves", 2, 7, 50, 150 );
		
		//Some buildins have overhangs with columns throughout the level. These are all outdoor	
		declareAmbientRoom( "outdoor_overhangs" );
		declareAmbientPackage( "outdoor_overhangs" );
		    setAmbientRoomReverb ("outdoor_overhangs","cuba_outdoor_overhangs", 1, 1);
			setAmbientRoomContext( "outdoor_overhangs", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "outdoor_overhangs", "" );
			//addAmbientElement( "outdoor_overhangs", "", .1, .6, 50, 150 );	
		
		//The small corridor at the end of the street battle until the small archway
		declareAmbientRoom( "streetbattle_to_path" );
		declareAmbientPackage( "streetbattle_to_path" );
		    setAmbientRoomReverb ("streetbattle_to_path","cuba_streetbattle_corr", 1, 1);
			setAmbientRoomContext( "streetbattle_to_path", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "streetbattle_to_path", "" );
			addAmbientElement( "streetbattle_to_path", "amb_wind_leaves", 2, 7, 50, 150 );
		
		//Initial start of the path, with trees and bushes on either side	
		declareAmbientRoom( "path_jungle" );
		declareAmbientPackage( "path_jungle" );
		    setAmbientRoomReverb ("path_jungle","cuba_path", 1, 1);
			setAmbientRoomContext( "path_jungle", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "path_jungle", "" );
			addAmbientElement( "path_jungle", "amb_wind_leaves", 2, 7, 50, 150 );
		
		//Tall wall to the left, sheer cliff and a distant town below to the right	
		declareAmbientRoom( "path_cliff" );
		declareAmbientPackage( "path_cliff" );
		    setAmbientRoomReverb ("path_cliff","cuba_path_cliff", 1, 1);
			setAmbientRoomContext( "path_cliff", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "path_cliff", "" );
			addAmbientElement( "path_cliff", "amb_wind_leaves", 2, 7, 50, 150 );			
			
		//Any courtyard or area that has walls on four sides but no roof
		declareAmbientRoom( "fourwall_openroof" );
		declareAmbientPackage( "fourwall_openroof" );
		    setAmbientRoomReverb ("fourwall_openroof","cuba_fourwall", 1, 1);
			setAmbientRoomContext( "fourwall_openroof", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "fourwall_openroof", "" );
			//addAmbientElement( "fourwall_openroof", "", .1, .6, 50, 150 );
			
		//Small room
		declareAmbientRoom( "small_room" );
		declareAmbientPackage( "small_room" );
		    setAmbientRoomReverb ("small_room","cuba_smallroom", 1, 1);
			setAmbientRoomContext( "small_room", "ringoff_plr", "indoor" );
			//setAmbientRoomTone( "small_room", "" );
			//addAmbientElement( "small_room", "", .1, .6, 50, 150 );
			
		//Garage, large-ish, stone-ish
		declareAmbientRoom( "garage" );
		declareAmbientPackage( "garage" );
		    setAmbientRoomReverb ("garage","cuba_garage", 1, 1);
			setAmbientRoomContext( "garage", "ringoff_plr", "indoor" );
			//setAmbientRoomTone( "garage", "" );
			//addAmbientElement( "garage", "", .1, .6, 50, 150 );	
			
		//it's a large room
		declareAmbientRoom( "large_room" );
		declareAmbientPackage( "large_room" );
		    setAmbientRoomReverb ("large_room","cuba_largeroom", 1, 1);
			setAmbientRoomContext( "large_room", "ringoff_plr", "indoor" );
			//setAmbientRoomTone( "large_room", "" );
			//addAmbientElement( "large_room", "", .1, .6, 50, 150 );
			
		//OLD: Will no longer exist when NEW BSP goes in
		declareAmbientRoom( "cuba_bar" );
		declareAmbientPackage( "cuba_bar" );
		    setAmbientRoomReverb ("cuba_bar","flashpoint_outside", 1, 1);
			setAmbientRoomContext( "cuba_bar", "ringoff_plr", "indoor" );
			//setAmbientRoomTone( "cuba_bar", "" );
			//addAmbientElement( "cuba_bar", "", .1, .6, 50, 150 );					
			
			declareAmbientRoom ("window_breach");
			setAmbientRoomTone ("window_breach", "NULL");
			setAmbientRoomReverb( "window_breach", "wmd_window_breach", 1, 1 );
			setAmbientRoomContext( "window_breach", "ringoff_plr", "outdoor" );
	
	declareAmbientRoom ("plane_interior");
	//		setAmbientRoomTone ("window_breach", "NULL");
			setAmbientRoomReverb( "plane_interior", "cuba_plane_interior", 1, 1 );
    
    declareAmbientPackage ("plane_interior");
    	addambientelement ("plane_interior", "prj_bullet_impact_ap_metal", .1, 2, 50, 300);
    
        
    //**Activating Default Ambient Package/Room**\\
		activateAmbientPackage( 0, "exterior_default", 0 );
		activateAmbientRoom( 0, "exterior_default", 0 );	
		
		
	//MUSIC STATES
		
		declareMusicState ("BAR_TENSION");
			musicAliasloop ("mus_bar_tension", 6, 6);
			
		declareMusicState ("BAR_FIGHT");
			musicAlias ("mus_bar_fight", 1);
//			musicStinger ("mus_group15_streets_stinger", 15.5, true);
		
		declareMusicState ("STREET");
			musicAliasloop ("mus_eagleclaw_street_loop",0, 2);
			musicStinger ("NULL", 0, true);
		
		declareMusicState ("STREET_ENDING");
			musicAliasloop ("NULL", 0, 0);
		
		declareMusicstate("END_STREET");
			musicAliasloop ("mus_end_street", 0, 0);
			
		declareMusicState ("FLARE");
			musicAliasloop ("NULL", 0, 1);
		
		declareMusicState ("ZIPLINE");
			musicAlias ("mus_group15_zipline", 0);
			musicAliasloop ("mus_group15_cuba_drums", 0, 0);
			musicStinger ("mus_melee", 12, true);			
			
		declareMusicState ("CONTEXT_MELEE");	
			musicAliasloop ("mus_group15_cuba_drums", 0, 0);
		
		declareMusicState ("STINGER_POST_ZIPLINE");
//			musicAlias ("mus_group15_post_zipline_stg", 0);
			musicAliasloop ("mus_virus_perc_loop", 0, 3);
			musicStinger ("NULL", 5, true);
			
		declareMusicState ("STINGER_MANSION_DOORS");
//			musicAlias ("mus_group15_zipline", 0);
			musicAliasloop ("mus_virus_perc_loop_b", 0, 2);

		declareMusicState ("BOWMAN_TAKEDOWN");
//			musicAlias ("mus_group15_zipline", 0);			
			musicAliasloop ("mus_virus_perc_loop", 0, 2);
			
		declareMusicState ("COURTYARD_FIGHT");
			musicAliasloop ("mus_group15_cuba_drums", 0, 2);
			musicStinger ("mus_virus_street_stg", 0, true);
			
		declareMusicState ("MUSIC_OFF");
			musicAliasloop ("NULL", 0, 0);	
			
		declareMusicState ("CASTRO_ASSASSINATION");
			musicAlias ("mus_castro_scene", 0);

		declareMusicState ("PLANE_ESCAPE");
			musicAliasloop ("mus_plane_escape", 0, 4);
		
		declareMusicState ("MASON_HERO");
			musicAliasloop ("mus_eagleclaw_mason_hero", 4, 0.5);
			musicStinger ("mus_stings_captured", 0, true);
	
		declareMusicState ("CAPTURED");
			musicAliasloop ("NULL", 0, 0);
		
		declareMusicState ("END_LEVEL");
			musicAliasloop ("mus_captured", 0, 2);
		
		
		//FUNCTIONS

		level thread bulletcam_audio();
		level thread airfield_stunned();
		level thread player_captured_transition();
		level thread time_slo_car_in();
		level thread time_slo_car_out();
		level thread post_car_movie();
		level thread snapshot_reset();
		level thread movie_snapshot();
		level thread airplane_takeoff_snapshot();
		level thread airplane_takeoff_reverb_change();
		level thread bulletcam_no_target_audio();
		level thread play_radio_garble();
		level thread trigger_air_raid_audio();
		level thread play_town_distant();
		level thread cuba_context_melee();
}
movie_snapshot()
{
	level waittill ("fis");
	snd_set_snapshot ("alloff_except_voice_music_event");	
	
}
airplane_takeoff_reverb_change()
{
	level waittill ("in_plane");
	activateAmbientRoom( 0, "plane_interior", 5 );	
	wait (5);
	activateAmbientPackage (0, "plane_interior", 5);	
	
}
airplane_takeoff_snapshot()
{
	level waittill("exit_plane");
	deactivateAmbientRoom( 0, "plane_interior", 5 );
	deactivateAmbientPackage(0, "plane_interior", 5);
	snd_set_snapshot ("cuba_airplane_takeoff");
	
}
bulletcam_audio()
{
		//waitforclient(0);
		
		level waittill( "slow_down" );
		
		ent1 = Spawn( 0, (0,0,0), "script_origin" );
		ent2 = Spawn( 0, (0,0,0), "script_origin" );
		
		PlaySound( 0, "evt_time_slow_start", (0,0,0) );
		activateAmbientRoom( 0, "window_breach", 6 );
		ent1 playloopsound ("evt_win_breach_bg");
		
		level waittill( "blt_st" );
		snd_set_snapshot( "bulletcam" );
		
		playsound(0, "evt_bulletcam_gun_act", (0,0,0));
		PlaySound( 0, "evt_bulletcam_start", (0,0,0) );
		playsound (0,"mus_beheaded_vox_castro", (0,0,0));
		
		
		//ent1 PlayLoopSound( "evt_bulletcam_vox", .05 );
		ent2 PlayLoopSound( "evt_bulletcam_whiz", .05 );
		
		level waittill( "blt_imp" );
		PlaySound( 0, "evt_bulletcam_ai_death", (0,0,0) );
		ent1 Delete();
		ent2 Delete();
			
		wait(.75);
			
		PlaySound( 0, "evt_bulletcam_end", (0,0,0) );
		PlaySound( 0, "evt_time_slow_stop", (0,0,0) );
		
		deactivateAmbientRoom(0, "window_breach", 6);
		snd_set_snapshot( "default" );

}
bulletcam_no_target_audio()
{
	//waitforclient(0);
	breach_bg_ent = Spawn( 0, (0,0,0), "script_origin" );
	level waittill( "slow_down_nt" );
	
	wait(3);
	ent1 = Spawn( 0, (0,0,0), "script_origin" );
	ent2 = Spawn( 0, (0,0,0), "script_origin" );

	PlaySound( 0, "evt_time_slow_start", (0,0,0) );
	breach_bg_ent playloopsound ("evt_win_breach_bg");
	
	playsound (0, "mus_stinger_first_breach", (0,0,0));
	
	activateAmbientRoom( 0, "window_breach", 6 );
	ent1 playloopsound ("evt_win_breach_bg");
	
	level waittill( "slow_down_stp" );
	
	PlaySound( 0, "evt_time_slow_stop", (0,0,0) );
	breach_bg_ent stoploopsound(3);
	breach_bg_ent delete();
	deactivateAmbientRoom(0, "window_breach", 6);
	
	ent1 delete();
	ent2 delete();

}
		

		
airfield_stunned()
{
    level waittill( "stnd" );
    
    sound_ent = spawn( 0, (0,0,0), "script_origin" );
    sound_ent PlayLoopSound( "chr_tinitus_loop", 1 );
    snd_set_snapshot( "vork_gas_attack" );
    PlaySound( 0, "vox_mason_mortar_shock", (0,0,0) );
    
    level waittill( "stndo" );
    
    snd_set_snapshot( "default" );
    sound_ent stoploopsound( 1 );
    wait(3);
    sound_ent Delete();
}

player_captured_transition()
{
    level waittill( "endst" );
    
    PlaySound( 0, "evt_mason_pistol_whip", (0,0,0) );
    PlaySound( 0, "vox_mason_pistol_whip", (0,0,0) );
    snd_set_snapshot( "cuba_player_captured" );
    ent = spawn( 0, (0,0,0), "script_origin" );
    ent PlayLoopSound( "amb_docks_end", 2.5 );
    
    level waittill( "enden" );
    
    snd_set_snapshot( "default" );
}
time_slo_car_in()
{
	level waittill ("tsi");
	snd_set_snapshot("cuba_car");
	PlaySound( 0, "evt_cuba_car_timeslow", (0,0,0) );
	ent1 = Spawn( 0, (0,0,0), "script_origin" );
	ent1 playloopsound ("evt_win_breach_bg");
	
	activateAmbientRoom( 0, "window_breach", 60 );
	level waittill ("kill_bg");
	ent1 stoploopsound();
	ent1 delete();
}
time_slo_car_out()
{
	level waittill ("tso");
	PlaySound( 0, "evt_cuba_car_timeslow_out", (0,0,0) );
	snd_set_snapshot( "default" );
	deactivateAmbientRoom( 0, "window_breach", 60 );
	level notify ("kill_bg");
	
}
post_car_movie()
{
	level waittill ("sm");
	snd_set_snapshot( "post_cuba_car" );	
}
snapshot_reset()
{
	level waittill ("md");
	snd_set_snapshot( "default" );	
}
play_radio_garble()
{
	radio = clientscripts\_audio::playloopat(0, "amb_radio_static", (-4960, -3184, -360));	
}
trigger_air_raid_audio()
{
	level waittill ("tar");
	siren_1 = clientscripts\_audio::playloopat(0, "amb_air_raid", (-10216, -7728, 480));	
	siren_2 = clientscripts\_audio::playloopat(0, "amb_air_raid", (-8036, -5514, 188.8));	
	siren_3 = clientscripts\_audio::playloopat(0, "amb_air_raid", (-264, 9504, -760));	
	
}	

play_town_distant()
{
	wait(1.5);
	town_dist = clientscripts\_audio::playloopat(0, "amb_town_distant", (-14936,-1312,-728 ));	
	level waittill ("md");
//	town_dist stoploopsound(.5);
}
cuba_context_melee()
{
	level waittill ("cms_go");
	snd_set_snapshot ("cuba_context_melee");
	wait (8);
	snd_set_snapshot ("default");
}