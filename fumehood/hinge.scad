// $fn = 50;
// width = 20;
// length = 40;
// thickness = 3;
// pinradius = 1;
// barrelthickness = 1;
// barrelsections = 4;
// barrelspacing = .1;
// barrellength = (length / barrelsections) - barrelspacing;
// barrelradius = pinradius+barrelthickness;
// barreldiameter = barrelradius * 2;


// $fn = 50;
// width = 20;
// length = 30;
// thickness = 3;
// pinradius = 1;
// barrelthickness = 1;
// barrelsections = 4;
// barrelspacing = .1;
// barrellength = (length / barrelsections) - barrelspacing;
// barrelradius = pinradius+barrelthickness;
// barreldiameter = barrelradius * 2;


$fn = 50;
width = 20;
length = 34;
thickness = 4;
pinradius = 1.2;
barrelthickness = 2;
barrelsections = 4;
barrelspacing = .3;
barrellength = (length / barrelsections) - barrelspacing;
barrelradius = pinradius+barrelthickness;
barreldiameter = barrelradius * 2;



screwradius = 2.6;
printedpin = 0;
pinhead = 2;


hinge_side(width, length, thickness);
translate([-10,0,0])
hinge_side(width, length, thickness, 1);

if (printedpin == 1)
{
	pin();
}
 
 module pin()
 {
	rotate([270,0,0])
	{
		cylinder(h=length + pinhead, r=pinradius-.3);
		for(i=[0:length/4])
		{
			translate([0,pinradius-.3,i*4])
			#cube([.3,.3,1]);
		}
		translate([0,0,length+.2])
		cylinder(h=pinhead, r=pinradius + barrelthickness);
	}
 }
 
module hinge_side(width, length, thickness, mirrorx=0)
{
	c = mirrorx == 1 ? "blue" : "orange";
 
	rotate([0,$t * mirrorx* 135,0])
	translate([0,0,-barrelradius])
	{
		color(c)
		{
			rotate([0,0,mirrorx * 180])
			translate([0, -mirrorx * length, 0])
			{
				translate([barrelradius, 0,0])
					difference()
					{
						cube([width, length, thickness]);
						
						translate([width/2,5,-1])
						cylinder(h=thickness + 2, r = screwradius);
						
						translate([width/2,length-5,-1])
						cylinder(h=thickness + 2, r = screwradius);
						
						
						translate([0,(barrellength + barrelspacing /2) ,0])
								barrelcutout();
						translate([0,(barrellength + barrelspacing + barrellength + barrelspacing + barrellength + barrelspacing + barrelspacing /2) ,0])
							barrelcutout();
					}
					
				barrel();
				translate([0,(barrellength + barrelspacing + barrellength + barrelspacing + barrelspacing /2) ,0])
					barrel();
			}
		}
	}
}

module barrelcutout()
{
	translate([-.1,0,-.5])
	cube([1.1, barrellength + barrelspacing + barrelspacing, 10]);
}

module barrel()
{
	translate([0,0, barrelradius])
	{
		rotate([-90,0,0])
		difference()
		{
			cylinder(h=barrellength, r=pinradius+barrelthickness);
			translate([0,0,-1])cylinder(h=barrellength + 2, r=pinradius);
		}
	}
	translate([0,0, 0])
	{
		translate([pinradius,0,0])
		rotate([0,0,0])	
		{
			#cube([barrellength,barrellength,thickness]);
		}
		//translate([pinradius,0,pinradius])
	}
	#cube([pinradius*3,barrellength,barrelthickness]);	

}


screw_dia = 4.35;
screw_length = 19;
head_dia = 7.5;
head_depth = 3.2;
module screwhole()
{
	translate([0,0,-screw_length])
	color("green")
	cylinder(r=screw_dia / 2 + .1, h=screw_length);
	
	color("green")
	translate([0,0,-head_depth])
	cylinder(r2=head_dia / 2 + .1, r = screw_dia / 2, h=head_depth);
	
	color("green")
	translate([0,0,-.1])
	cylinder(r=head_dia / 2+.2, h=10);
	
}
