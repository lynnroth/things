use<write.scad>;

//Set The name to the word you want engraved on the ring
name="Lynn";

//Set nameCount to the number of times the word should be printed.
nameCount=2;

//Depth of the word
namedepth = 2;

//Height of ring
height=22;

//Radius - Outside Diameter
radius=24;

//Thickness of wall
wall=3;

$fn=100;

difference()
{
	difference()
	{
		//Outside of ring
		cylinder(h=height,r=radius);
		//difference the name
		translate([0,0,height/2])
			//Loop nameCount times
			for (z = [0 : nameCount]) 
			{
				//Rotate 360/namecount for each iteration
				rotate([0,0,z * 360 / nameCount])
					//Write the Name
					writecylinder(name,[0,0,0],radius,t=namedepth, h=height/3*1.8, rounded=1);
			}		
	}
	//Remove Center
	translate([0,0,-1])cylinder(r=radius-wall, h=height+2);
	
};


