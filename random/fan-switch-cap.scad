$fn=100;

outside_dia = 98;
cylinder_thickness = 2;
bottom_thickness = 3;
height = 15;
bolt_dia = 10.1;
screw_dia = 3.6;

difference()
{
	cylinder(r=outside_dia/2, h=height);
	translate([0,0,bottom_thickness])
		cylinder(r=outside_dia/2 - cylinder_thickness, h=height-bottom_thickness + 1);
	translate([0,0,-1])
		cylinder(r=bolt_dia/2, h=bottom_thickness + 2);
	translate([outside_dia/2-cylinder_thickness-1,0,height - screw_dia/2 - 4])rotate([90,0,90])
		cylinder(r=screw_dia/2,h=cylinder_thickness + 2);
	rotate([0,0,120])translate([outside_dia/2-cylinder_thickness-1,0,height - screw_dia/2 - 4])rotate([90,0,90])
		cylinder(r=screw_dia/2,h=cylinder_thickness + 2);
	rotate([0,0,240])translate([outside_dia/2-cylinder_thickness-1,0,height - screw_dia/2 - 4])rotate([90,0,90])
		cylinder(r=screw_dia/2,h=cylinder_thickness + 2);
	
}