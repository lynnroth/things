// include<../../../elmom/MCAD/2Dshapes.scad>;
// include<../../../elmom/MCAD/regular_shapes.scad>;
// include<../../../elmom/MCAD/triangles.scad>;
include<../../../elmom/MCAD/boxes.scad>;
word = "Kate";

red = 1;
silver = 0;


size_x = 60;
size_y = 30;
size_z = 2;

radius = 3;
inside_offset = 3;
inside_width = 2;

text_height = .6;
text_size = 15;

ring_radius = 8/2;
ring_width = 3;

r2_radius = 3;
r2_width = 2;

if (silver)
{
	
	 color("Grey")
		difference()
		 {
			background();
			foreground();
			
		}
}

if (red)
{
    color("Red")
	{
	foreground();
		// difference()
		// {
			// foreground();
			// intersection()
			// {
				// background();
				// foreground();
			// }
		// }
	}
}

module background()
{
	translate([0,0,size_z/2])
		roundedBox([size_x,size_y,size_z],radius, true);
	ring();
}

module foreground()
{
	union()
	{
		border();
		translate([0,0,size_z - text_height])
		letters();
		translate([0,0,text_height])
		rotate([180,0,0])
			letters();
	}
}

module border()
{
translate([0,0,size_z/2])
		difference()
		{
			roundedBox([size_x-inside_offset*2, size_y-inside_offset*2, size_z], radius, true);
			//translate([inside_width,inside_width,-.1])
			translate([0,0,-.1])
			roundedBox([size_x-inside_offset*2-inside_width*2, size_y-inside_offset*2-inside_width*2, size_z+.3], radius, true);
		}

}


module letters()
{
	//translate([0,0,size_z])
	{
		//translate([0,0,-.60])
			linear_extrude(height=text_height)
				text(text=word, font="SketchFlow Print", size=text_size, halign="center", valign="center");

		//translate([inside_offset,inside_offset,0])
	}
}

module ring()
{	
        translate([-size_x/2-ring_radius,ring_radius/2-2,0])
	{
        difference()
		{
			cylinder(h=size_z, r=ring_radius+4, $fn=30);
			translate([0,0,-.1])cylinder(h=size_y/3+.2, r=ring_radius, $fn=40);
		}
	}
}
