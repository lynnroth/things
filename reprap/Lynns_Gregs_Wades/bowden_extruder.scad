// Compact extruder for J-Head 12mm adapter
// Gabino Lopez
// http://www.koinobori.es

module bowden_extruder_base(){
	// Extruder plate mount
	translate([-22,0,0]) cube([44,22,18]); 
}

mount_length = 12.8;
mount_height = 35;
mount_width = 8;

module mount()
{
	#translate([0,mount_height/2,-mount_width/2])
	difference()
	{
		cube([mount_length,mount_height,mount_width], center=true);
		#for(i = [-2:3])
		{
			translate([-mount_length/2-.5,-2+i*5,0])
			rotate([0,90,0])
			cylinder(h=mount_length+1, r=1.6, $fn=8);
		}
	}
}
module bowden_extruder_holes(){
	rotate([90,0,0]){
		// fijaciones para el J-Head
		translate([-7,6,-35])  cylinder(r=1.5, h=34, $fn=20);
		translate([7,6,-35]) cylinder(r=1.5, h=34, $fn=20);

  		// fijaciones para ventilador
		translate([-17.5,4,-35])  cylinder(r=1.5, h=34, $fn=20);
		translate([17.5,4,-35]) cylinder(r=1.5, h=34, $fn=20);

  		// Carriage mount right screw head hole
  		translate([-15,12,-23]) cylinder(r=3, h=16, $fn=20);
  		// Carriage mount left screw head hole
 		translate([15,12,-23]) cylinder(r=3, h=16, $fn=20);
 	 	// Carriage mount right screw hole
 	 	translate([-15,12,-9]) cylinder(r=1.5, h=14, $fn=10);
  		// Carriage mount left screw head hole
  		translate([15,12,-9]) cylinder(r=1.5, h=14, $fn=10);
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