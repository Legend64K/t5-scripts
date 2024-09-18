//
// file: river_amb.csc
// description: clientside ambient script for river: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;
#include clientscripts\_busing;
#include clientscripts\_audio;

main()
{
	//AMBIENT PACKAGES
	//Default
		declareAmbientRoom( "outside" );
		declareAmbientPackage( "outside" );
			setAmbientRoomReverb ("outside","river_outside", 1, 1);
			setAmbientRoomContext( "outside", "ringoff_plr", "outdoor" );
			//setAmbientRoomTone( "outside", "" );
			//addAmbientElement( "outside", "", .1, .6, 50, 150 );
			
		declareAmbientRoom( "fuselage" );
			declareAmbientPackage( "fuselage" );
			setAmbientRoomReverb( "fuselage", "river_fuselage", 1, 1 );
			setAmbientRoomContext( "fuselage", "ringoff_plr", "indoor" );
			
		declareAmbientRoom( "rock_canyon" );
			declareAmbientPackage( "rock_canyon" );
			setAmbientRoomReverb( "rock_canyon", "river_rock_canyon", 1, 1 );
			setAmbientRoomContext( "rock_canyon", "ringoff_plr", "outdoor" );

		declareAmbientRoom( "sunken_clearing" );
			declareAmbientPackage( "sunken_clearing" );
			setAmbientRoomReverb( "sunken_clearing", "river_sunken_clearing", 1, 1 );
			setAmbientRoomContext( "sunken_clearing", "ringoff_plr", "outdoor" );


		activateAmbientPackage( 0, "outside", 0 );
		activateAmbientRoom( 0, "outside", 0 );		
		
			
		//MUSIC STATES
		declareMusicState ("INTRO_BASE");
			musicAlias ("mus_foe_intro", 0);
			
		declareMusicState ("SYMPATHY");
			musicAliasloop ("mus_sympathy_for_the_devil_loop", 0, 4);	
			
		declareMusicState ("BATTLE_POST_BLOCKER");
			musicAliasloop ("mus_punchthrough_loop", 1, 0);	
			musicStinger ("mus_punchthrough_STG",10, true); 
			
		declareMusicState ("POST_FLASHBACK");
			musicAliasloop ("mus_commies_postflashback", 0, 0);		
		
		declareMusicState ("UPHILL_FIGHT");
			musicAliasloop ("mus_drexel_fight_uphill", 0, 2);
			musicStinger ("mus_drexel_fight_uphill_stg",18, true );
			
		declareMusicState ("UPHILL_FIGHT_SHORE");
			musicAliasloop ("NULL", 0, 0);
			musicStinger ("mus_drexel_chopper_stinger",18, true );
	
		declareMusicState ("CHOPPERS_INBOUND");
			musicAliasloop ("mus_danbau_tension", 4,4);
			
		declareMusicState ("INVESTIGATE_PLANE");
			musicAliasloop ("mus_panthers_plane_section", 2, 2);
			
		declareMusicState ("END_BATTLE");
			musicAliasloop ("mus_punchthrough_end_battle", 3,0);
			musicStinger ("mus_stingers_plane_ending", 30, true);
			
		declareMusicState ("ENDING");
			musicAliasloop ("NULL", 0,0);
		
			
	level thread snapshot_intro();
	level thread snapshot_boat();
	level thread snapshot_default();
	level thread jumpto_override();
	level thread snapshot_ending();
}
snapshot_intro()
{
	level endon( "snpov" );
	
	level waittill ("lvs");
	snd_set_snapshot( "river_fade" );
	level waittill( "fdin" );
	snd_set_snapshot( "default");
}
jumpto_override()
{
    level waittill( "snpov" );
    snd_set_snapshot( "default" );
}
snapshot_boat()
{
	level waittill ("pbt");
	snd_set_snapshot( "default");
	
}
snapshot_default()
{
	level waittill ("pbto");
	snd_set_snapshot( "default" );
	
}
snapshot_ending()
{
	level waittill ("end");
	snd_set_snapshot( "river_end_level");
	
	
}