// Test clientside script for vorkuta

#include clientscripts\_utility;

motorcycle_init()
{
	level.DEFAULT_FOV				= 55;
	level.DEFAULT_FOV_LERP_TIME		= .5;
	level.MAX_FOV                   = 65;

	register_clientflag_callback("vehicle", 15, ::vorkuta_bike_flag_handler);

	level._my_vehicle_flag_handler = ::vorkuta_bike_flag_handler;

	println("*** Client : _motorcycle_ride running...");
}


vorkuta_bike_flag_handler(localClientNum, set, newEnt)
{
	if( set )
	{
		self notify("bike_flag_set");
		self thread motorcycle_fov();
	}
	else	// Flag being cleared.
	{
	}
}
	
motorcycle_fov()
{
	self endon("entityshutdown");
	self endon("bike_flag_set");
	level endon( "evM" );   // This is level specific notify to end this thread
	    
	player = getlocalplayers()[0];	
 
	while(1)
	{
		inches_per_second = self getspeed();
		
		// only lerp while accelerating 
		if( inches_per_second < 0 )
		{
			SetClientDvar( "cg_fov", level.DEFAULT_FOV );
			wait(0.016);
			continue;
		}

		// convert that fucker to mph, yeah!!!!
		miles_per_second = inches_per_second / 63360; 
		miles_per_hour =  miles_per_second * 3600; 
			
		if( miles_per_hour < 50 )
		{
			SetClientDvar( "cg_fov", level.DEFAULT_FOV );
		}
		else if( miles_per_hour > 60 )
		{
			SetClientDvar( "cg_fov", level.MAX_FOV );
		}	
		else
		{
			base_speed = miles_per_hour - 50;
			base_speed = (base_speed * base_speed) /10;
			new_fov    = level.DEFAULT_FOV + base_speed;
			SetClientDvar( "cg_fov", new_fov );			
		} 	
		
		wait(0.016);
	}
}	

