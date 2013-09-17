$fn=60;
height = 30;
length = 120;
doorwidth= 35;
wall_thickness = 4;
bottom_thickness = 2;

totalwidth = doorwidth * 2 + wall_thickness * 3;

difference()
{
	cube([length, totalwidth, height]);
	translate([-2,wall_thickness, bottom_thickness])cube([length + 4, doorwidth, height]);
	translate([-2,wall_thickness* 2 + doorwidth, bottom_thickness])cube([length + 4, doorwidth, height]);
	translate([length/2, totalwidth / 2 - doorwidth /2, bottom_thickness])screwhole();
	translate([length/2, totalwidth / 2 + doorwidth /2, bottom_thickness])screwhole();
}


screw_dia = 3;
screw_length = 10;
head_dia = 5;
head_depth = 2;
module screwhole()
{
	translate([0,0,-screw_length])
	color("green")
	cylinder(r=screw_dia / 2, h=screw_length);
	
	color("green")
	translate([0,0,-head_depth])
	cylinder(r2=head_dia / 2, r = screw_dia / 2, h=head_depth);
	
	color("green")
	translate([0,0,-.1])
	cylinder(r=head_dia / 2, h=.4);
	
}


