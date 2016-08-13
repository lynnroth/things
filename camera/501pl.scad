use <../../../elmom/MCAD/libtriangles.scad>

width_bottom = 50;
width_top = 43;
width_triangle = (width_bottom - width_top) /2;
length = 90;
height = 13.00;
triangle_height = 7;

module plate()
{
	translate([width_triangle,0,0])
	cube([width_top, length, height]);


	color("green")
	translate([width_triangle,0,0])
	mirror([1,0,0])
	rightprism(width_triangle,length,triangle_height);


	color("green")
	translate([width_top+width_triangle,0,0])
	rightprism(width_triangle,length,triangle_height);
}

screw_thread_radius = 6.18 /2;
screw_thread_length = 8.14;
screw_length = 12.25;
screw_head_radius = 11.75/2;

thread_inside = screw_length - 5.92;
$fn=20;
module holes()
{
translate([width_bottom/2, length/2-6, 0])
{
	translate([0,0, thread_inside])
	{
		cylinder(r=screw_thread_radius, h=screw_length);
		cylinder(r2=screw_thread_radius, r=screw_head_radius, h=screw_length-screw_thread_length);
	}
	
	cylinder(r=screw_head_radius, h=thread_inside);
}
}

module slots()
{
	translate([5,0,0])
	{
		cube([6,length/2,5]);
	}
	translate([5+5.9,0,0])
	{
		cube([6,length,5]);
	}
	color("red")
	translate([5+6,length,5])
	//mirror([0,1,0])
	rotate([-90,0,180])
	rightprism(6,5,length/3);
	translate([5+6+6-.2,-.1,0])
	{
		cube([width_bottom- 22,length+.2,5]);
	}
}

//slots();

// translate([0,0,height])
// rotate([180,0,0])

difference()
{
	plate();
	holes();
	translate([0,0,-.2])slots();
}