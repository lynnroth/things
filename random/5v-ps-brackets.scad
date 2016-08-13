use <../../../elmom/MCAD/boxes.scad>

bracket_thickness = 4;

bracket_width = 15;



ps_width = 100;
ps_height = 38;


bracket1();
translate([0,ps_height + 15,0])
bracket2();

module bracket1()
{
	difference()
	{
		cube([ps_width + bracket_thickness * 2 , ps_height + bracket_thickness , bracket_width]);
		translate([bracket_thickness, -.1, -.1])
		cube([ps_width, ps_height+.2, bracket_width+.2]);
	}
	
	translate([ps_width + bracket_thickness,28.5,bracket_width+4])
	difference()
	{
	translate([bracket_thickness/2,0,0])
		cube([bracket_thickness,10,10], center = true);
		rotate([0,90,0])
			translate([0,0,-.1])
				cylinder(r=1.7,h=bracket_thickness +.2);
	}

	translate([-bracket_width, 0, 0])
	pad();

	translate([ps_width + bracket_thickness *2 , 0, 0])
	pad(10);
}

module bracket2()
{
	difference()
	{
		cube([ps_width + bracket_thickness * 2 , ps_height + bracket_thickness , bracket_width]);
		translate([bracket_thickness, -.1, bracket_thickness])
		cube([ps_width, ps_height+.2, bracket_width+.2]);
		translate([bracket_thickness, -.1, -.1])
		cube([ps_width, ps_height-10, bracket_width+.2]);
	}

	

	translate([-bracket_width, 0, 0])
	pad();

	translate([ps_width + bracket_thickness *2 , 0, 0])
	pad();
}



module pad()
{
	difference()
	{
		cube([bracket_width+.1,bracket_thickness,bracket_width]);
		translate([bracket_width/2, -.1, bracket_width/2])
			rotate([-90,0,0])
				screwhole();
		
	}
	
}

module screwhole()
{

	cylinder(r=2.3, h=bracket_thickness+3, $fn=8);
	translate([0,0,bracket_thickness-3])
	color("yellow")
	cylinder(r=2.3, r2=3.9, h=3.1, $fn=8);
		
}
