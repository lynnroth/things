//include <../../../hugokernel/OpenSCAD_Dovetail/dovetail.scad>
include <../../../../lib/dovetail.scad>
$fn=60;
count = 2;

end_x = 4.9;
end_z = 4.9;
end_y = 30;

front_z = 9.9;
front_y = 5.1;
front_z_offset=4.7;

spacer_distance = 50.2;

spacer_x = spacer_distance/3 ;//* 2;
spacer_y = 32;
spacer_z = front_z_offset;
spacer_radius = 1.6;
spacer_multiple = 1;

tongue_x = 10;
tongue_z = 2;

module stand_end(translate_x)
{
		translate([translate_x, 0, -end_z/2])
			cube([end_x,end_y,end_z]);
		
		translate([translate_x, 42.7, 6])
			rotate([90,0,0])
				cube([end_x,end_y,end_z]);
		
		 difference()
		 {
			union()
			{
				translate([translate_x, 32.5, 7])
				rotate([0,90,0])
				rotate_extrude(convexity = 10, $fn = 130)
				translate([5, 0, 0])
				square([end_x,end_z]);
			}
			translate([-10, 15,7])cube([translate_x+20,30,15]);
			translate([translate_x-10, 20,7])rotate([-90,0,0])cube([translate_x +20,20,10]);
		}
}

module stand_front()
{
	translate([0,-front_y,-front_z+spacer_radius+front_z_offset])cube([spacer_distance*(count+1),front_y,front_z]);
}//-(front_z-front_z_offset)

module stand_support(i)
{
	translate([i* spacer_distance, 0, 0])
		rotate([-90,0,0])cylinder(h=32, r=spacer_radius);
		
	translate([i* spacer_distance, 39.4, 6])
		rotate([-0,0,0])cylinder(h=30, r=spacer_radius);
		
	difference()
	{
		union()
		{
			translate([i* spacer_distance, 32.5, 7])
			rotate([0,90,0])
			rotate_extrude(convexity = 10, $fn = 130)
			translate([7, 0, 0])
			circle(r = spacer_radius, $fn = 30);
		}
		translate([0, 22.5,7])cube([spacer_distance*(count+1),20,15]);
		translate([0, 21.2,7])rotate([-90,0,0])cube([spacer_distance*(count+1),20,10]);
	}
}

module stand()
{

	stand_end(0);
	stand_end(spacer_distance*(count+1) - end_x);
	
	for (i = [1:count]) 
	{
		stand_support(i);
	}
	
	stand_front();
	

}

module spacer()
{
	difference()
	{
		cube([spacer_x, spacer_y, spacer_z]);
		translate([0,spacer_y/2,0])
			rotate([0,0,-90])
				female_dovetail_negative(max_width=11, min_width=5, depth=5, height=spacer_z, clearance=0.45);
	
				
	}
	
 translate([spacer_x,spacer_y/2,0]) 
 rotate([0,0,-90])
	union() {
		male_dovetail(max_width=11, min_width=5, depth=5, height=spacer_z, cutout_width=0, cutout_depth=0);
		translate([-10,-5,0]) cube([20,5,spacer_z]);
	}
}

$stand();
//color("grey")
translate([0,0,2])
spacer(1);
