//
// file: int_escape_amb.csc
// description: clientside ambient script for int_escape: setup ambient sounds, etc.
// scripter: 		(initial clientside work - laufer)
//

#include clientscripts\_utility; 
#include clientscripts\_ambientpackage;
#include clientscripts\_music;

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
	
	declareAmbientRoom( "hallway" );//this will be default for the hallways.
		setAmbientRoomContext( "hallway", "ringoff_plr", "indoor" );
		setAmbientRoomReverb ("hallway","int_hallway", 1, 1);
		setAmbientRoomTone( "hallway", "amb_trippy", 1, 1 );
		
	declareAmbientRoom( "interrogation_room" );//pretty self explanitory
		setAmbientRoomContext( "interrogation_room", "ringoff_plr", "indoor" );
		setAmbientRoomReverb ("interrogation_room","int_interrogation_room", 1, 1);
		setAmbientRoomTone( "interrogation_room", "amb_trippy", 1, 1 );
			    	
	declareAmbientRoom( "1st_room" );//the room right after getting out of the int room.
		setAmbientRoomContext( "1st_room", "ringoff_plr", "indoor" );
		setAmbientRoomReverb ("1st_room","int_1st_room", 1, 1);
		setAmbientRoomTone( "1st_room", "amb_trippy", 1, 1 );
		
	declareAmbientRoom( "real_lab" );//the med lab room where steiner flashback happens.
		setAmbientRoomContext( "real_lab", "ringoff_plr", "indoor" );
		setAmbientRoomReverb ("real_lab","int_real_lab", 1, 1);
		setAmbientRoomTone( "real_lab", "amb_trippy", 1, 1 );
		
	declareAmbientRoom( "flashback_lab" );//the med lab room where steiner is talking during the flashback.
		setAmbientRoomContext( "flashback_lab", "ringoff_plr", "indoor" );
		setAmbientRoomReverb ("flashback_lab","int_flashback_lab", 1, 1);
		setAmbientRoomTone( "flashback_lab", "amb_wolverine", 1, 1 );
		
	declareAmbientRoom( "conference_room" );//where the projector is and all the resnov screens
		setAmbientRoomContext( "conference_room", "ringoff_plr", "indoor" );
		setAmbientRoomReverb ("conference_room","int_conference_room", 1, 1);
		setAmbientRoomTone( "conference_room", "amb_trippy", 1, 1 );
		
	declareAmbientRoom( "office_room" );//The first room after the rocket hallway
		setAmbientRoomContext( "office_room", "ringoff_plr", "indoor" );
		setAmbientRoomReverb ("office_room","int_office_room", 1, 1);
		setAmbientRoomTone( "office_room", "amb_trippy", 1, 1 );
		
	declareAmbientRoom( "control_room" );//The room where hudson punches you in the face
		setAmbientRoomContext( "control_room", "ringoff_plr", "indoor" );
		setAmbientRoomReverb ("control_room","int_control_room", 1, 1);
		setAmbientRoomTone( "control_room", "amb_trippy", 1, 1 );
			    	
			    	
	
	//************************************************************************************************
	//                                      ACTIVATE DEFAULT AMBIENT SETTINGS
	//************************************************************************************************

//		activateAmbientPackage( 0, "_pkg", 0 );
		activateAmbientRoom( 0, "hallway", 0 );	

	declareMusicstate ("TEMP_INTRO");
		musicAliasloop ("NULL", 0,0);
		
	declareMusicState ("POST_HUDSON");
		musicAliasloop ("mus_sog_intescape", 0, 2);
		musicStinger ("mus_bendz_table", 38, true);
	
	declareMusicState ("TABLE");
		musicAliasloop ("mus_sog_intescape_b", 1, 2);
		musicStinger ("mus_anvil_trippy", 56, true);
		
	declareMusicState ("PROJECTOR_ROOM");
		musicAliasloop ("mus_sog_intescape_c", 1, 2);

	declareMusicstate ("END_FADE");
		musicAliasloop ("NULL", 1,1);		
}

