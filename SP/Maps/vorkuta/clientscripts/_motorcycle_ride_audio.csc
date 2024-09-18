#include clientscripts\_utility; 
#include clientscripts\_music;
#include clientscripts\_audio;

// *************************************************	
// INIT MOTORCYCLE SOUNDS FOR VORKUTA
// *************************************************	

//*****************
//  Self Values
//*****************
/*
    Self = Player Bike
    self.moto_gear_trans[i]["pitch_time"]   = Amount of time before the current gear changes to the next gear
    self.moto_gear_trans[i]["min_pitch"]    = Minimum pitch of the loop for the current gear
    self.moto_gear_trans[i]["max_pitch"]    = Maximum pitch of the loop for the current gear
    self.moto_gear_trans[i]["alias"]        = Alias the current gear is using
    
    self.is_accelerating    = Based off of ClientNotify's, is True when the player is pressing the right trigger
    self.is_idle            = Based off of ClientNotify's, is True when the player is below 5mph and is NOT pressing the trigger
    self.is_jumping         = Based off of ClientNotify's, is True when the player's Motorcycle is off the ground
    self.is_jumping         = Based off of ClientNotify's, is True when the player is above 20mph and is pressing B
    self.gear_state         = The current gear state
    self.gear_pitch         = The current gear pitch, based off the moto_gear_trans values
    
    **ClientNotifies Being Used**
    vMa = Bike is accelerating
    vMd = Bike is decelerating
    vMj = Bike is jumping
    vMi = Bike is idling
*/

//SELF = Player Bike
init()
{
    self thread do_moto_setup();       
}

//SELF = Player Bike
do_moto_setup()
{
    level waittill( "vM" );

    //player = getlocalplayers()[0];
    
    self gear_setup();
    self thread set_moto_state();
    self thread set_gear_state();
    self thread play_moto_sounds();
    //self thread play_wind_sounds();
    self thread check_for_death();
    //player thread test_prints();
}

//SELF = Player or AI
gear_setup()
{
	self.moto_gear_trans = [];
	p = 1;
	n = 0;
	m = 0;
	
	for(i=0;i<8;i++)
	{
	    self.moto_gear_trans[i] = [];
	    
	    if( i == 0 )
	        self.moto_gear_trans[i]["pitch_time"] = 1;
	    else
	        self.moto_gear_trans[i]["pitch_time"] = p*2;
	        
	    self.moto_gear_trans[i]["min_pitch"] = .75 + n;
	    self.moto_gear_trans[i]["max_pitch"] = 1.15 + m;
	    self.moto_gear_trans[i]["alias"] = "veh_moto_looper_fast";
	    
	    p = self.moto_gear_trans[i]["pitch_time"];
	    n = n + .055;
	    m = m + .045;
    }
}

set_moto_state()
{
    self.is_accelerating = false;
    self.is_idling = true;
    self.is_jumping = false;
    self.is_turning = false;
    self.is_dying = false;
    
    self thread check_for_accel();
    self thread check_for_decel();
    self thread check_for_jump();
    self thread check_for_idle();
    //self thread check_for_turn();
}

set_gear_state()
{
 	self endon( "entityshutdown" );
	self endon( "death" );
    level endon( "evM" );
 
	self.gear_state = 0;
    current_time = undefined;
    decelerate_time = undefined;
    self.gear_pitch = .75;
    self.gear_alias = self.moto_gear_trans[0]["alias"];
    
    while(1)
    {
        while( self.is_accelerating && !self.is_jumping && !self.is_braking )
        {
            if( !IsDefined( current_time ) )
                current_time = 0;
                
            gear_change_time = self.moto_gear_trans[self.gear_state]["pitch_time"];
            self.gear_pitch = scale_speed( 0, self.moto_gear_trans[self.gear_state]["pitch_time"], self.moto_gear_trans[self.gear_state]["min_pitch"], self.moto_gear_trans[self.gear_state]["max_pitch"], current_time );
            self.gear_alias = self.moto_gear_trans[self.gear_state]["alias"];
            
            if( current_time >= gear_change_time )
            {
                current_time = undefined;
                self.gear_state = self.gear_state + 1;
				//IPrintLnBold( "Client : gear changed ++ " );
                wait(.05);
            }
            else
            {
                wait(.05);
                current_time = current_time + .05;
            }
        }
        
        while( !self.is_accelerating || self.is_jumping || self.is_braking )
        {
            current_time = undefined;
            
            if( !IsDefined( decelerate_time ) )
                decelerate_time = 0;
            
            if( decelerate_time >= 1 )
            {
                if( self.gear_state == 0 )
                {
                    decelerate_time = undefined;
                    wait(.05);
                }
                else
                {
                    decelerate_time = undefined;
                    self.gear_state = self.gear_state - 1;
					//IPrintLnBold( "Client : gear changed -- " );
                    wait(.05);
                }
            }
            else
            {
                wait(.05);
                decelerate_time = decelerate_time + .05;
            }
            
        }
    }
}

play_moto_sounds()
{
	self endon( "entityshutdown" );
	self endon( "death" );
	level endon( "evM" );
	
	moto_ent = spawn( 0, (0,0,0), "script_origin" );
	idle_ent = spawn( 0, (0,0,0), "script_origin" );
	
	moto_ent LinkTo( self, "tag_wheel_front" );
	idle_ent LinkTo( self, "tag_wheel_front" );
	
	level thread delete_ents( moto_ent, idle_ent );
	
	last_gear = undefined;
	current_state = undefined;
	decel_pitch = undefined;
	jump_pitch = undefined;
	jump_count = undefined;

	while(1)
	{
	    pitch = self.gear_pitch;
	    alias = self.gear_alias;
	    current_gear = self.gear_state;
	    
	    if( self.is_jumping )
	    {
	        if( !IsDefined( current_state ) || current_state != "jumping" )
	        {
	            jump_pitch = self.gear_pitch;
	            jump_count = 0;
	            current_state = "jumping";
	        }
	            
	        jump_id = moto_ent PlayLoopSound( "veh_moto_looper_fast", .05 );
	        setsoundpitch( jump_id, jump_pitch );
	        
	        if( jump_count < 5 )
	        {
	            jump_pitch = jump_pitch + .035;
	            jump_count = jump_count + 1;
	        }
	        else
	        {
	            jump_pitch = jump_pitch - .0065;
	        }
	        
	        wait(.05);
            continue;
	    }
	    else if( self.is_idling )
	    {
	        if( IsDefined( current_state ) && current_state == "idling" )
	        {
	            wait(.05);
	            continue;
	        }
	            
	        self PlaySound( 0, "veh_moto_change_idle" );
	        moto_ent stoploopsound( .5 );
	        idle_ent PlayLoopSound( "veh_moto_looper_idle", 2 );
	        current_state = "idling";
	        wait(.05);
            continue;
	    }
	    else if( !self.is_accelerating || self.is_braking )
	    {
	        if( !IsDefined( current_state ) || current_state != "decelerating" )
	        {
	            decel_pitch = self.gear_pitch;
	            //self PlaySound( 0, "veh_moto_gear_change" );
	        }
	            
	        decel_id = moto_ent PlayLoopSound( "veh_moto_looper_fast", .05 );
	        setsoundpitch( decel_id, decel_pitch );
	        current_state = "decelerating";
	        decel_pitch = decel_pitch - .0065;
	        wait(.05);
            continue;
	    }
	    else if( self.is_accelerating )
	    {
	        if( !IsDefined( last_gear ) )
	            last_gear = self.gear_state;
	            
	        pitch = self.gear_pitch;
	        alias = self.gear_alias;
	        current_gear = self.gear_state;
	        
	        idle_ent stoploopsound( 1 );
	        
	        if( current_gear != last_gear )
	        {
	            self PlaySound( 0, "veh_moto_gear_change" );
	            moto_ent stoploopsound( .1 );
	            last_gear = current_gear;
	            wait(.35);
	        }
	        
	        moto_id = moto_ent PlayLoopSound( alias, .05 );
	        setsoundpitch( moto_id, pitch );
	        
	        if( self.is_dying == true )
	        {
	            setsoundvolume( moto_id, .85 );
	        }
	            
	        current_state = "accelerating";
	    }
		wait( .05 );
	}
}

play_wind_sounds()
{
    self endon( "entityshutdown" );
	self endon( "death" );
    level endon( "evM" );
    
    wind_ent = spawn( 0, (0,0,0), "script_origin" );
    self thread delete_ents( wind_ent );
    
    wind_id = undefined;
    volume = 0;
    
    while(1)
    {
        while( self.is_accelerating )
        {
            if( volume > 1 )
                volume = 1;
            if( volume < 0 )
                volume = 0;
                
            wind_id = wind_ent PlayLoopSound( "veh_moto_wind", .05 );
	        setsoundvolume( wind_id, volume );
	        wait(.05);
	        volume = volume + .025;
        }
        while( !self.is_accelerating )
        {
            if( !IsDefined( wind_id ) )
            {
                wait(.05);
                continue;
            }
                
            setsoundvolume( wind_id, volume );
            wait(.05);
            volume = volume - .025;
        }
    }
}

test_prints()
{   
    old_gear_state = undefined;
    new_gear_state = undefined;
    old_accel_state = undefined;
    new_accel_state = undefined;
    
    while(1)
    {
        if( !IsDefined( self.gear_state ) )
            continue;
            
        if( !IsDefined( old_gear_state ) )
            old_gear_state = self.gear_state;
        if( !IsDefined( old_accel_state ) )
            old_accel_state = self.is_accelerating;
        
        new_gear_state = self.gear_state;
        new_accel_state = self.is_accelerating;
        
        if( ( old_gear_state != new_gear_state ) || ( old_accel_state != new_accel_state ) )
        {
            /#
            IPrintLnBold( "GEAR: " + self.gear_state + " IS_ACCEL: " + self.is_accelerating + " WAIT: " + self.moto_gear_trans[self.gear_state]["pitch_time"] );
            #/
        }
        
        old_gear_state = new_gear_state;
        old_accel_state = new_accel_state;
        wait(.05);
    }
}

check_for_accel()
{
    self endon( "entityshutdown" );
	self endon( "death" );
    level endon( "evM" );
    
    while(1)
    {
        level waittill( "vMa" );
        self.is_accelerating = true;
        self.is_idling = false;
        self.is_jumping = false;
        self.is_braking = false;
    }
}

check_for_decel()
{
    self endon( "entityshutdown" );
	self endon( "death" );
    level endon( "evM" );
    
    while(1)
    {
        level waittill( "vMd" );
        self.is_accelerating = false;
        self.is_idling = false;
        self.is_jumping = false;
        self.is_braking = false;
    }
}

check_for_jump()
{
    self endon( "entityshutdown" );
	self endon( "death" );
    level endon( "evM" );
    
    while(1)
    {
        level waittill( "vMj" );
        self.is_accelerating = true;
        self.is_idling = false;
        self.is_jumping = true;
        self.is_braking = false;
    }
}

check_for_idle()
{
    self endon( "entityshutdown" );
	self endon( "death" );
    level endon( "evM" );
    
    while(1)
    {
        level waittill( "vMi" );
        self.is_accelerating = false;
        self.is_idling = true;
        self.is_jumping = false;
        self.is_braking = false;
    }
}

check_for_death()
{
    self endon( "entityshutdown" );
	self endon( "death" );
    level waittill( "vMF" );
    self.is_dying = true;
    dying_ent = spawn( 0, (0,0,0), "script_origin" );
    dying_ent LinkTo( self, "tag_wheel_front" );
   
    dying_ent PlayLoopSound( "veh_moto_dying_loop", .1 );
    level waittill( "evM" );
    wait(2.5);
    dying_ent Delete();
}

/*
check_for_turn()
{
    self endon( "entityshutdown" );
    
    while(1)
    {
        level waittill( "vMt" );
        self.is_turning = true;
        level waittill( "vMs" );
        self.is_turning = false;
    }
}
*/

delete_ents( ent1, ent2 )
{
    level waittill( "evM" );
    wait(2);
    ent1 stoploopsound(.5);
    
    if(IsDefined(ent2))
        ent2 stoploopsound(.5);
    
    wait(1);
    ent1 Delete();
    
    if(IsDefined(ent2))
        ent2 Delete();
}