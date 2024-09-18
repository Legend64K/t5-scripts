// Test clientside script for hue_city

#include clientscripts\_utility;
#include clientscripts\_clientfaceanim;

main()
{
	
	level.CLIENT_RAGLAUNCH_FLAG	= 2;
	
	// Has to be first for CreateFX
	clientscripts\hue_city_fx::main();
	
	// _load!
	clientscripts\_load::main();

	register_clientflag_callback("actor", level.CLIENT_RAGLAUNCH_FLAG, ::defend_ragdoll_splash );

	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\hue_city_amb::main();
	
	thread clean_macv_destructibles();
	
	//level._faceAnimCBFunc = clientscripts\_clientfaceanim::manageface;


	// This needs to be called after all systems have been registered.
	thread waitforclient(0);

	println("*** Client : hue_city running...");
}

clean_macv_destructibles()
{
	level waittill ("clean_macv_client_destructibles");
	ents = GetEntArray(0, "destructible", "targetname");
	for (i=0; i < ents.size; i++)
	{
		if (ents[i].origin[1] < -4000 && ents[i].origin[0] < -1000 )
		{
			ents[i] Delete();
		}
	}
}

defend_ragdoll_splash(localClientNum, set, newEnt)
{
	while(1)
	{
		pos = self.origin;
		if (pos[1] > 1400 && pos[2] < 7420  )
		{
			org = (pos[0], pos[1], 7367 );
			PlayFX (localClientNum, level._effect["body_splash"], org );
			return;
		}
		wait 0.05;
	}
}
		