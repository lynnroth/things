// Compact extruder for J-Head 12mm adapter
// Gabino Lopez
// http://www.koinobori.es

mount_x = 30;
mount_y = 22;
mount_z = 18;

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
 	translate([0,12,-1]) rotate([0,0,0]) cylinder(r=8.1, h=24, $fn=20);
  	// Hole for hotend
  	translate([0,12,-1]) rotate([0,0,0]) cylinder(r=8.1, h=12, $fn=10);
}

module bowden_extruder()
{
	mount();
	rotate([90,0,180]){
		difference(){
			bowden_extruder_base();
			bowden_extruder_holes();
		}
	}
}