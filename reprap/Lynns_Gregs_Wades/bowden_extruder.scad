// Compact extruder for J-Head 12mm adapter
// Gabino Lopez
// http://www.koinobori.es

module bowden_extruder_base(){
	// Extruder plate mount
	translate([-22,0,0]) cube([44,22,18]); 
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
	rotate([90,0,0]){
		difference(){
			extruder_base();
			extruder_holes();
		}
	}
}