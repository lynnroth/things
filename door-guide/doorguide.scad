$fn=60;
height = 33;
length = 60;
doorwidth= 35;
wall_thickness = 4;
middlewall_thickness = 2.5;
bottom_thickness = 8;
screw_bottom_thickness = 4;

totalwidth = doorwidth * 2 + wall_thickness * 2 + middlewall_thickness;

difference()
{
	translate([-length/2, -totalwidth/2,0])cube([length, totalwidth, height]);
	translate([-length/2-2,middlewall_thickness/2, bottom_thickness])cube([length + 4, doorwidth, height]);
	translate([-length/2-2,-doorwidth - middlewall_thickness/2, bottom_thickness])cube([length + 4, doorwidth, height]);
	translate([16,18,screw_bottom_thickness])screwhole();
	translate([-16,-18, screw_bottom_thickness])screwhole();
}


screw_dia = 3.75;
screw_length = 19;
head_dia = 6.7;
head_depth = 3.2;
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
	cylinder(r=head_dia / 2, h=10);
	
}


