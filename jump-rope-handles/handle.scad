$fn=60;
length = 120;
outside_diameter = 30;
wall_thickness = 4;
rope_diameter = 6;


difference()
{
	{
		difference()
		{
			union()
			{
				cylinder(r=outside_diameter/2, h=length);
				translate([0,0,length])sphere(r=outside_diameter/2);
			}
			translate([0,0,-1])cylinder(r=outside_diameter/2-wall_thickness, h=length - outside_diameter);
		}
	};
	
	cylinder(r=rope_diameter/2,h=length + outside_diameter * 2);
};