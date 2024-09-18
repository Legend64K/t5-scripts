#include clientscripts\_utility;

main()
{
	clientscripts\cuba_fx::main();
	
	// _load!
	clientscripts\_load::main();

//	thread clientscripts\_fx::fx_init(0);
	thread clientscripts\_audio::audio_init(0);

	thread clientscripts\cuba_amb::main();

	// This needs to be called after all systems have been registered.
	waitforclient(0);

	level thread setup_wristwatch();

	println("*** Client : pow running...");
}

setup_wristwatch()
{
	while (1)
	{
		waitforclient(0);
		//setup the ui3d and wristwatch
		ui3dsetwindow( 0, 0, 0, 0.125, 0.25 );
		ui3dsetwindow( 1, 0.25, 0, 0.25, 0.5 );
		ui3dsetwindow( 2, 0.5, 0, 0.5, 0.5 );
		ui3dsetwindow( 3, 0, 0.5, 0.25, 0.5 );
		ui3dsetwindow( 4, 0.25, 0.5, 0.25, 0.5 );
		ui3dsetwindow( 5, 0.5, 0.5, 0.5, 0.5 );
		showUI(0, "WristWatch", 1);
		getlocalplayers()[0] SetWatchStyle(2);
		level waittill("save_restore");
	}
}
