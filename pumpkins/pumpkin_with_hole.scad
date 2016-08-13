$fn=10;
module base()
{
	import("pumpkin_xyz.stl", convexity=5);
}

difference()
{
	base();
	translate([41,41,-1])
	cylinder(r=4, h=60);
}
	