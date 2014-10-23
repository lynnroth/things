$fn=60;

// hose_radius = 84/2;
// hose_depth = 25;
// thickness = 3;

// flange_width = 120;
// flange_length = 120;
// flange_depth = 3;

// flange_offset_x = 15;
// flange_offset_y = 15;

// fan_mount_hole_distance=67;
// fan_mount_hole_diameter = 4.5;

// flange_hole_diameter = 4.5;


hose_radius = 84/2;
hose_depth = 35;
thickness = 2;

flange_width = 100;
flange_length = 100;
flange_depth = 3;

flange_offset_x = 0;
flange_offset_y = 0;


fan_holes = 0;
fan_mount_hole_distance=71.2 / 2;
fan_mount_hole_diameter = 4.5;

flange_hole_diameter = 4.5;
flange_hole_distance = (flange_width - 20) /2;

flange(1, 0, 0, flange_width, flange_length, flange_depth, hose_radius, hose_depth);

//translate([120,0,0])
//translate([120,0,0])
//flange(0, 1, 1, flange_width + 15, flange_length + 15, flange_depth +1, hose_radius, 25.4/2, hose_radius-thickness -.5, hose_depth+25);

//color("blue")
//translate([120,100,0])
//insert(hose_radius, hose_depth+25);

module insert(hose_radius, hose_depth)
{
	difference()
	{
		cylinder(r=hose_radius, h=hose_depth);
		translate([0,0,-1])
			cylinder(r=hose_radius-thickness, h=hose_depth+2);
	}
}

module lines(gw)
{
	for(i = [-flange_length / gw / 2:(flange_length / gw / 2)])
	{
		translate([-flange_width/2,	i * gw,0])
			cube([flange_width,gw /3,2]);
	}
}


module flange(fan_holes, mount_holes, grid, flange_width, flange_length, flange_depth, hose_radius, hose_depth, hose_radius2, hose_depth2)
{
	gw = 6;
	if (grid == 1)
	{
		difference()
		{
			union()
			{
				rotate([0,0,90])lines(gw);
				lines(gw);
			}
			if (mount_holes == 1)
			{
				translate([-flange_hole_distance, -flange_hole_distance, -1])
					flange_mount();
				translate([-flange_hole_distance, flange_hole_distance, -1])
					flange_mount();
				translate([flange_hole_distance, -flange_hole_distance, -1])
					flange_mount();
				translate([flange_hole_distance, flange_hole_distance, -1])
					flange_mount();		
			}
		}
	}
	
	difference()
	{
		union()
		{
			cylinder(r=hose_radius, h=hose_depth);
			cylinder(r=hose_radius2, h=hose_depth2);
			translate([flange_offset_x, flange_offset_y, 0])
				translate([-flange_width/2, -flange_length/2, 0])
					cube([flange_width, flange_length, flange_depth]);

			

		}
		
		translate([0,0,-1])
		{
			if (hose_radius2 > 0)
				cylinder(r=hose_radius2-thickness, h=hose_depth2+2);
			else
				cylinder(r=hose_radius-thickness, h=hose_depth+2);

		}
		
		if (fan_holes == 1)
		{
			translate([-fan_mount_hole_distance, -fan_mount_hole_distance, -1])
				fan_mount();
			translate([-fan_mount_hole_distance, fan_mount_hole_distance, -1])
				fan_mount();
			translate([fan_mount_hole_distance, -fan_mount_hole_distance, -1])
				fan_mount();
			translate([fan_mount_hole_distance, fan_mount_hole_distance, -1])
				fan_mount();
		}
		
		if (mount_holes == 1)
		{
			translate([-flange_hole_distance, -flange_hole_distance, -1])
				flange_mount();
			translate([-flange_hole_distance, flange_hole_distance, -1])
				flange_mount();
			translate([flange_hole_distance, -flange_hole_distance, -1])
				flange_mount();
			translate([flange_hole_distance, flange_hole_distance, -1])
				flange_mount();		
		}
	}
}

module flange_mount()
{
	
	cylinder(r=fan_mount_hole_diameter/2, h=flange_depth + 2);
}
module fan_mount()
{
	//translate([0,0,1])cylinder(r=6.2, h=4, $fn=6);
	cylinder(r=fan_mount_hole_diameter/2, h=flange_depth + 2);
}