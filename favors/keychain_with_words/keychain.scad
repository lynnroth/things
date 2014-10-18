use<write.scad>;

//Set The name to the word you want engraved on the ring

words=["Pettisville", "Science", "Technology", "Engineering", "Mathematics"];

//Set wordCount to the number of times the word should be printed.
wordCount=len(words);

//rotatetext = 0; //for 6 words
rotatetext = 15; //for 5 words
//rotatetext = 45; //for 4 words
//rotatetext = 90; //for 3 words

//Depth of the word
namedepth = 2.5;

//Height of main body of keyring
height=60;

//Radius - Outside Diameter
radius=10;

hollow = 0;

//Thickness of wall
wall=6;
$fn=100;

difference()
{
	union()
	{
		//Main Body
		rotate([0,0,0])
			minkowski()
			{
				cylinder(h=height,r=radius, $fn=wordCount);
				sphere(.3);
			}
			
			
		//KeyRing Body
		minkowski()
		{
			translate([0,0,height-2])cylinder(r=radius-wall, h=10, $fn=20);
			sphere(.5);
		}
	}
	
	translate([0,0,height/2])
		for (z = [0 : wordCount]) 
		{
			//Rotate 360/wordCount for each iteration
			rotate([0,0,-z * 360 / wordCount])
				//writecylinder(words[z],[0,0,0],radius-2,t=namedepth, h=7, rounded=1, rotate=90);
				translate([radius-namedepth,2,0])rotate([0,90,36.5])
                                linear_extrude(height=namedepth)
                                    text(text=words[z], size=7, halign="center");
		}	
	
	//Remove Center
	if (hollow)
	{
		rotate([0,0,rotatetext])translate([0,0,-1])cylinder(r=radius-wall, h=height+2, $fn=wordCount);
	}
		
	//keyring hole
	rotate([0,0,rotatetext])translate([0,10,height-2+6])rotate([90,0,0])rotate([0,0,22.5])
		cylinder(r=2, h=20, $fn=8);
		
};




