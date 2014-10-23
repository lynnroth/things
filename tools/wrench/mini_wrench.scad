include <inc/shapes.scad>

kerf = 0.4;
WrenchSize = 8;
D = WrenchSize + kerf; 	// DIAMETER OF NUT
M = D/2; 	// MARGIN
H = 4; 	// HEIGHT (THICKNESS) OF TOOL
Ltot = D * 9; 	// TOTAL LENGTH OF TOOL

// Length from Center of One Side to Center of Other Side
L = Ltot-2*(D/2+M);
 
rotate([0, 0, 0])
difference() {
	union() {
		translate([0,L/2,H/2]) {
			cylinder(r = (D/2+M), h = H,center = true);
		}
		translate([0,-L/2,H/2]) {
			cylinder(r = (D/2+M), h = H,center = true);
		}
		translate([-1*D/2,-L/2,0]) {
			cube([D,L,H], center=false);
		}
	}
	translate([0,-L/2 - D / 4,H/2 - 0.5]) {
		rotate([0,0,30]) {
			hexagon(D, H + 2);
		}	
	}
	translate([0,-L/2 - D - D / 4,H/2 - 0.5]) {
		cube([D,2*D,H + 2], center = true);
	}
	translate([0,L/2,H/2 - 0.5]) {
		rotate([0,0,30]) {
			hexagon(D, H + 2);
		}	
	}
	translate([0, 0, H - 1])
		
		rotate([0,0,90])
                linear_extrude(height=3)
                    text(text=str(WrenchSize, " mm"), size=WrenchSize * .7, halign="center", valign="center");
}