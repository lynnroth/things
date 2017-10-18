/*
The MIT License (MIT)

Copyright (c) 2017 Lynn A. Roth

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/


//Set the words array to the words you want engraved.  One per side.
words=["Pettisville", "Science", "Technology", "Engineering", "Art", "Mathematics"];

//Set wordCount to the number of times the word should be printed.
wordCount=len(words);

//We need to rotate the text different amount depending on the number of sides.
rotatetextarray = [0,0,0,60,45,36.5,30];
rotatetext = rotatetextarray[wordCount];

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
				translate([radius-namedepth,2,0])rotate([0,90,rotatetext])
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




