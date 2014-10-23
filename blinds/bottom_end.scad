$fn=30;
$fn=30;
outside_rad = 6;
height=12;
difference()
{
	hull()
	{
		cylinder(h=height, r=outside_rad);
		translate([11,0,0])cylinder(h=height, r=outside_rad);
	}

	translate([0,0,.86])
	hull()
	{
		cylinder(h=height, r=outside_rad - .86);
		translate([11,0,0])cylinder(h=height, r=outside_rad -.86);
	}	
}
