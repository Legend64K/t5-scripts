//
// file: underwaterbase_amb.csc
// description: clientside ambient script for underwaterbase: setup ambient sounds, etc.
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
	
	    //Default: Outdoor, open ocean, beautiful, serene, would want to vacation there
	        declareAmbientRoom( "default" );
		    declareAmbientPackage( "default" );
		        setAmbientRoomContext( "default", "ringoff_plr", "outdoor" );
			    setAmbientRoomReverb ("default","uwb_outside", 1, 1);
			    //setAmbientRoomTone( "default", "amb_blizzard_st_looper", .5, .5 );
			    //addAmbientElement( "default", "amb_wind_dirty_gust", 4, 13, 50, 1100 );
	    
	    //Ship Interior Small: Mostly small corridors within the ship, metal
		    declareAmbientRoom( "ship_interior_small" );
		    declareAmbientPackage( "ship_interior_small" );
		        setAmbientRoomContext( "ship_interior_small", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("ship_interior_small","uwb_ship_int_small", 1, 1);
			    //setAmbientRoomTone( "ship_interior_small", "amb_blizzard_st_looper", .5, .5 );
			    //addAmbientElement( "ship_interior_small", "amb_wind_dirty_gust", 4, 13, 50, 1100 );
			    
		//Ship Interior Medium: Same as above, but now in a new, harder to pack size - MEDIUM!!!!
		    declareAmbientRoom( "ship_interior_medium" );
		    declareAmbientPackage( "ship_interior_medium" );
		        setAmbientRoomContext( "ship_interior_medium", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("ship_interior_medium","uwb_ship_int_medium", 1, 1);
			    //setAmbientRoomTone( "ship_interior_medium", "amb_blizzard_st_looper", .5, .5 );
			    //addAmbientElement( "ship_interior_medium", "amb_wind_dirty_gust", 4, 13, 50, 1100 );
			    
		//Ship Interior Moonpool: Large room, has the moonpool in it, metal
		    declareAmbientRoom( "ship_interior_moonpool" );
		    declareAmbientPackage( "ship_interior_moonpool" );
		        setAmbientRoomContext( "ship_interior_moonpool", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("ship_interior_moonpool","uwb_ship_int_moonpool", 1, 1);
			    //setAmbientRoomTone( "ship_interior_moonpool", "amb_blizzard_st_looper", .5, .5 );
			    //addAmbientElement( "ship_interior_moonpool", "amb_wind_dirty_gust", 4, 13, 50, 1100 );	    
			    
		//Base Interior Small: Underwater Base, small room, all metal
		    declareAmbientRoom( "base_interior_small" );
		    declareAmbientPackage( "base_interior_small" );
		        setAmbientRoomContext( "base_interior_small", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("base_interior_small","uwb_base_int_small", 1, 1);
			    setAmbientRoomTone( "base_interior_small", "amb_uwb_bg", .5, .5 );
			    //addAmbientElement( "base_interior_small", "amb_wind_dirty_gust", 4, 13, 50, 1100 );
			    
		//Base Interior Medium: Underwater Base, medium room, all metal
		    declareAmbientRoom( "base_interior_medium" );
		    declareAmbientPackage( "base_interior_medium" );
		        setAmbientRoomContext( "base_interior_medium", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("base_interior_medium","uwb_base_int_medium", 1, 1);
			    setAmbientRoomTone( "base_interior_medium", "amb_uwb_bg", .5, .5 );
			    //addAmbientElement( "base_interior_medium", "amb_wind_dirty_gust", 4, 13, 50, 1100 );
			    
		//Base Interior Large: Underwater Base, Large room, all metal
		    declareAmbientRoom( "base_interior_large" );
		    declareAmbientPackage( "base_interior_large" );
		        setAmbientRoomContext( "base_interior_large", "ringoff_plr", "indoor" );
			    setAmbientRoomReverb ("base_interior_large","uwb_base_int_large", 1, 1);
			    setAmbientRoomTone( "base_interior_large", "amb_uwb_bg", .5, .5 );
			    //addAmbientElement( "base_interior_large", "amb_wind_dirty_gust", 4, 13, 50, 1100 );	    	    	    
	
	  		declareAmbientRoom( "in_chopper" );
				setAmbientRoomReverb ("in_chopper","uwb_in_chopper", 1, 1);
	
	//ACTIVATING DEFAULTS    
	    activateAmbientPackage( 0, "default", 0 );
	    activateAmbientRoom( 0, "default", 0 );	


	//MUSIC STATES
		declareMusicState ("TEMP_ALBION");
			musicAliasloop ("mus_albion_loop", 0, 0);
			
			
	//FINAL MUSIC STATES
		declareMusicState ("INTRO_CHOPPER_FIGHT");
			musicAliasloop ("mus_eagleclaw_orch_intro", 0, 0);	
				
		declareMusicState ("ENEMY_CHOPPER");
			musicAliasloop ("mus_eagleclaw_orch_enemychopper", 0, 0);	
			
		declareMusicState ("CRASHING");
			musicAliasloop ("mus_pegasus_crashing_loop", 0,0);
			musicStinger ("mus_stinger_jump_chopper", 15, true);
			
		declareMusicState ("JUMP");
			musicAliasloop ("mus_punchthrough_deck_loop", 0, 3);
			
		declareMusicState ("CALMER_LOOP");
			musicAliasloop ("mus_punchthrough_calm_loop", 0, 3);

		declareMusicState ("LOWER_DECK_FIGHT");
			musicAliasloop ("mus_punchthrough_lower_deck_loop", 0, 5);
			
		declareMusicState ("BROADCAST");
			musicAliasloop ("mus_panthers_station_b", 2, 4);	
			
		declareMusicState ("DIVE");
			musicAliasloop ("mus_albion_loop", 4, 0);
			musicStinger ("mus_stinger_explosion", 13, true);
			
		declareMusicState ("MUS_STINGER_EXPLOSION");
			musicAliasloop ("mus_group15_bad_ass", 0, 0);
			
		declareMusicState ("NUMBERS");
			musicAliasloop ("mus_roulette_numbers_buttons", 0, 2);
			
		declareMusicState ("GRAB_DRAGOVICH");
			musicAliasloop ("mus_roulette_grab_dragovich", 0, 0);
	
		declareMusicState ("SWIM_OUT");
			musicAliasloop ("mus_enschtal_swimming", 0, 3);
			
		declareMusicState ("UP_TOP");
			musicAliasloop ("NULL", 0, 3);
			
		declareMusicState ("SURFACE");
			musicAlias ("mus_enschtal_guitars", 0);
			
	//Scripts
	level thread wait_for_fx_spawns_to_play_sound();
	level thread wait_to_set_explo_snapshot();
	level thread wait_to_set_explo_snapshot_uw();
	level thread play_fire_loopers_on_fx();
	
	level thread trans_to_swimtobase();
	level thread ship_alarms_exterior();
	level thread play_uwb_creaking();
	
	level thread spools_and_pumps();
	level thread missing_steam();
	level thread uwb_chopper_snapshot();
	level thread uwb_default_snapshot();
	level thread uwb_default_room();
	level thread number_looper(); 	
	
}

wait_for_fx_spawns_to_play_sound()
{
    while(1)
    {
        level waittill( "upfxsn" );
        wait(1.1);
        level thread spawn_fx_loopers();
    }
}

spawn_fx_loopers()
{
    //STEAM
    clientscripts\_audio::snd_play_auto_fx( "fx_pipe_steam_md", "amb_steam_sputter");
    clientscripts\_audio::snd_play_auto_fx( "fx_pipe_steam_md_runner", "amb_steam_sputter");
    clientscripts\_audio::snd_play_auto_fx( "fx_quinn_steam_blast_lg", "amb_steam_large");
    clientscripts\_audio::snd_play_auto_fx( "fx_steam_hallway_md", "amb_steam_medium");
    
    //WATER
    clientscripts\_audio::snd_play_auto_fx( "fx_water_fine_spray_sm", "amb_water_spray_small");
    clientscripts\_audio::snd_play_auto_fx( "fx_water_fine_spray_md", "amb_water_spray_small");
    //clientscripts\_audio::snd_play_auto_fx( "fx_water_splash_gush_lg", "amb_water_gush");
    clientscripts\_audio::snd_play_auto_fx( "fx_water_spray_leak_sm", "amb_water_spray_small");
    clientscripts\_audio::snd_play_auto_fx( "fx_water_spray_leak_md", "amb_water_spray_small");
    clientscripts\_audio::snd_play_auto_fx( "fx_water_pipe_spill_sm", "amb_water_spray_large");
    //clientscripts\_audio::snd_play_auto_fx( "fx_water_pipe_spill_md", "amb_water_spray_large");
    //clientscripts\_audio::snd_play_auto_fx( "fx_water_sheet_line_md_100", "amb_water_heavy_drip");
    //clientscripts\_audio::snd_play_auto_fx( "fx_water_sheet_line_md_300", "amb_water_heavy_drip");
}

wait_to_set_explo_snapshot()
{
    while(1)
    {
        level waittill( "exsnp" );
        snd_set_snapshot( "uwb_explosions" );
        realWait(1.25);
        snd_set_snapshot( "default" );
    }
}

wait_to_set_explo_snapshot_uw()
{
    level waittill( "exsnpu" );
    snd_set_snapshot( "uwb_explosions" );
    realWait(2);
    PlaySound( 0, "evt_go_underwater", (0,0,0) );
    snd_set_snapshot( "underwater" );
}

trans_to_swimtobase()
{
    level waittill( "trans1" );
    snd_set_snapshot( "uwb_transition" );
    level waittill( "trans1e" );
    ent = spawn( 0, (0,0,0), "script_origin" );
    ent PlayLoopSound( "evt_dive_breath_loop", 4 );
    level waittill( "trans2" );
    ent stoploopsound( 1 );
    snd_set_snapshot( "default" );
    
    wait(2);
    ent Delete();
}

play_fire_loopers_on_fx()
{
    level waittill( "snfxfr" );
    clientscripts\_audio::snd_play_auto_fx( "fx_fire_line_lg", "amb_fire_large");
    clientscripts\_audio::snd_play_auto_fx( "fx_fire_line_md", "amb_fire_medium");
    clientscripts\_audio::snd_play_auto_fx( "fx_fire_line_sm", "amb_fire_medium");
    clientscripts\_audio::snd_play_auto_fx( "fx_ship_fire_destruction", "amb_fire_extreme");
    
    level waittill( "dlsnfx" );
    //IPrintLnBold( "DELETING FIRES" );
    clientscripts\_audio::snd_delete_auto_fx( "fx_fire_line_lg" );
    clientscripts\_audio::snd_delete_auto_fx( "fx_fire_line_md" );
    clientscripts\_audio::snd_delete_auto_fx( "fx_fire_line_sm" );
    clientscripts\_audio::snd_delete_auto_fx( "fx_ship_fire_destruction" );
}

ship_alarms_exterior()
{
    array_thread( getstructarray( "alarm_ship_ext", "targetname" ), ::play_alarm_audio, "alms1", "amb_alarm_boat_exterior", "dlsnfx" );
    array_thread( getstructarray( "alarm_ship_int", "targetname" ), ::play_alarm_audio, "alms2", "amb_alarm_boat_interior", "trans1e" );
    array_thread( getstructarray( "alarm_uwb_1", "targetname" ), ::play_alarm_audio, "almu1", "amb_alarm_uwb_1", "exsnpu" );
    array_thread( getstructarray( "alarm_uwb_2", "targetname" ), ::play_alarm_audio, "exsnpu", "amb_alarm_uwb_2", "almof" );
}

play_alarm_audio( start, alias, end )
{
    level waittill( start );
    
    if( !IsDefined( self ) )
        return;
    
    sound_ent = spawnFakeEnt( 0 );
	SetFakeEntOrg( 0, sound_ent, self.origin );
	playloopsound( 0, sound_ent, alias, .5 );
    level thread delete_sound_ent( sound_ent, end );
}

delete_sound_ent( sound_ent, end )
{
    level waittill( end );
    deletefakeent( 0, sound_ent );
}

play_uwb_creaking()
{
    level waittill( "trans1e" );
    
    ent = spawn( 0, (30271, 333, -5066), "script_origin" );
    ent PlayLoopSound( "amb_uwb_creaking" );
    
    level waittill( "trans2" );
    
    ent stoploopsound( 2 );
    wait(2);
    ent Delete();
}

spools_and_pumps()
{
	level waittill ("spools_moving");
	//iprintlnbold ("spools_moving");	
	
	//Spools	
	spool_ent_a = spawn (0, ((317, 1, -401)), "script_origin");	
	spool_ent_b = spawn (0, ((899, -390, -377)), "script_origin");	
	spool_ent_c1 = spawn (0, ((1418, -94, -392)), "script_origin");	
	spool_ent_c2 = spawn (0, ((1474, 2, -399)), "script_origin");	
	spool_ent_c3 = spawn (0, ((1414, 98, -402) ), "script_origin");	

	//Pumps
	pump_ent_a = spawn (0, ((1327, 1, -372)), "script_origin");	
	pump_ent_b = spawn (0, ((894, -241, -387)), "script_origin");	
	pump_ent_c = spawn (0, ((472, 1, -376)), "script_origin");	
	
	//Middle thing	
	mid_thing = spawn (0, ((942, 2, -338)), "script_origin");	

	//START AND LOOP
	
	spool_ent_a playloopsound ("amb_spool_loop", 1.5);	
	spool_ent_b playloopsound ("amb_spool_loop", 1.5);	
	spool_ent_c1 playloopsound ("amb_spool_loop", 1.5);
	spool_ent_c2 playloopsound ("amb_spool_loop", 1.5);	
	spool_ent_c3 playloopsound ("amb_spool_loop", 1.5);

	pump_ent_a playloopsound ("amb_pump_loop", 1.5);
	pump_ent_b playloopsound ("amb_pump_loop", 1.5);
	pump_ent_c playloopsound ("amb_pump_loop", 1.5);

	mid_thing playloopsound ("amb_mid_thing_loop", 1.5);
			
	//STOP AND DELETE

	level waittill ("spools_stopping");
	//iprintlnbold ("spools_stopping");		
	
	spool_ent_a stoploopsound( 1 );	
	spool_ent_b stoploopsound( 1 );			
	spool_ent_c1 stoploopsound( 1 );		
	spool_ent_c2 stoploopsound( 1 );		
	spool_ent_c3 stoploopsound( 1 );		
	
	mid_thing stoploopsound( 1 );
		
	playsound ( 0,"amb_mid_thing_stop", (942, 2, -338));	
	
  realwait (2);
  	
	pump_ent_a stoploopsound( 3 );		
	pump_ent_b stoploopsound( 3 );		
	pump_ent_c stoploopsound( 3 );		
	
  wait (10);
	spool_ent_a delete();	
	spool_ent_b delete();		
	spool_ent_c1 delete();	
	spool_ent_c2 delete();	
	spool_ent_c3 delete();	
	pump_ent_a delete();	
	pump_ent_b delete();	
	pump_ent_c delete();	
	mid_thing delete();	
				
}

missing_steam()
{
	level waittill ("steam_go");

	steam_ent_a = spawn (0, ((-799, 14, 195)), "script_origin");		
	steam_ent_a playloopsound ("amb_steam_sputter", 1.5);	

	level waittill ("spools_stopping");
	steam_ent_a stoploopsound( 1 );	
	
	wait (3);
	steam_ent_a delete();	
				
}
uwb_chopper_snapshot()
{
	level waittill ("in_chopper");
	snd_set_snapshot("uwb_chopper_int");
	activateAmbientRoom( 0, "in_chopper", 5 );
}
uwb_default_room()
{
	level waittill ("ssdflt");
	deactivateAmbientRoom( 0, "in_chopper", 5 );
	
}
uwb_default_snapshot()
{
	while(1)
	{
		level waittill ("ssdflt");
		snd_set_snapshot("default");
		
	}	
	
}

number_looper()
{

	num_ent = spawn (0, ((31121, 220, -5134)), "script_origin");		
	num_ent playloopsound ("amb_num_28_d", .5);	
	
	level waittill ("num_nix");
	realwait( 2 );
	num_ent stoploopsound( 1 );	
	realwait( .5 );	
	playsound ( 0,"evt_shut_down", (31121, 220, -5134));	
	wait (5);
	num_ent delete();	
	
}