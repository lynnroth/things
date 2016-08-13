// Compact extruder for J-Head 12mm adapter
// Gabino Lopez
// http://www.koinobori.es

mount_x = 24;
mount_y = 22;
mount_z = 20;

jhead_diameter = 16 + .7;

module bowden_extruder_base(){
	// Extruder plate mount
	translate([-mount_x/2,0,0]) cube([mount_x,mount_y,mount_z]); 
}

attachment_mount_length = 12.8;
attachment_mount_height = 35;
attachment_mount_width = 8;

module mount()
{
	#translate([0,attachment_mount_height/2,-attachment_mount_width/2])
	difference()
	{
		cube([attachment_mount_length,attachment_mount_height,attachment_mount_width], center=true);
		for(i = [-2:3])
		{
			translate([-attachment_mount_length/2-.5,-2+i*5,0])
			rotate([0,90,0])
			cylinder(h=attachment_mount_length+1, r=m3_diameter/2, $fn=8);
		}
	}
}

module bowden_extruder_holes(){
	rotate([90,0,0]){
		// fijaciones para el J-Head
		translate([-7,6,-35])  cylinder(r=1.5, h=34, $fn=20);
		translate([7,6,-35]) cylinder(r=1.5, h=34, $fn=20);

  		// fijaciones para ventilador
		translate([-12,14,-35])  cylinder(r=1.5, h=34, $fn=20);
		translate([12,14,-35]) cylinder(r=1.5, h=34, $fn=20);
	}

 	// Filament path
 	translate([0,12,-1]) rotate([0,0,0]) cylinder(r=jhead_diameter/2, h=24, $fn=30);
  	// Hole for hotend
  	#translate([0,12,-1]) rotate([0,0,0]) cylinder(r=jhead_diameter/2, h=12, $fn=30);
}


module wildseyed_mount_holes(insulator_d=12.7)  
{  
	extruder_recess_d=insulator_d+0.7;
	//LAR - Change depth to 12 from 10 for Prometheus Hot end.
	extruder_recess_h=12;
    hotend_nut_trap_depth = 3.5; // mrice

	// Recess in base
	translate([0,0,-1])
	cylinder(r=extruder_recess_d/2,h=extruder_recess_h+1);
	
	for (hole=[-1,1])
	rotate(90,[1,0,0])
	{
		translate([hole*(extruder_recess_d/2-1.5),3+1.5,-wade_block_depth/2-1])
		cylinder(r=1.5,h=wade_block_depth+2,$fn=10);

		// holes for recessed nut traps
		translate([hole*(extruder_recess_d/2-1.5),3+1.5,wade_block_depth/2+base_extra_depth-hotend_nut_trap_depth])
		cylinder(r=m3_nut_diameter/2+.5,h=hotend_nut_trap_depth,$fn=6);
	}
}

fitting_length= 9.4;
fitting_base_width = 9.45 + .2;
fitting_tip_width = 9.15 + .2;
	
module pushtofitconnector()
{
	cylinder(fitting_length + .2,fitting_tip_width/2,fitting_base_width/2);
}

module bowden_adapter(insulator_d=16)  
{
	extruder_recess_d=insulator_d-0.2;
	extruder_recess_h=12;
    hotend_nut_trap_depth = 3.5; 

	// Recess in base
	difference()
	{
		cylinder(r=extruder_recess_d/2,h=extruder_recess_h+1);
		translate([0,0,extruder_recess_h-fitting_length+.81])
			#pushtofitconnector();
		cylinder(r=4/2,h=extruder_recess_h+1);
	}
}


module bowden_extruder()
{
	mount();
	rotate([90,0,180]){
		difference(){
			bowden_extruder_base();
			translate([0,12,-1]) 
			{
				wildseyed_mount_holes(16);
				translate([0,0,mount_z-fitting_length+.81])
				#pushtofitconnector();
			}
			//bowden_extruder_holes();
		}
	}
}