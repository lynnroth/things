//rambo-rumba.scad

ramps_screw_width = 94.9;
ramps_screw_depth = 95.36;
mount_height = 2;
frame_width = 14;

rumba_hole_width_1=67.55;
rumba_hole_width_2=35.65;
rumba_hole_depth=127.4;

screw_dia = 3.3;

module screwhole()
{
	translate([0,0,-2])cylinder(r=screw_dia /2, h=20, $fn=30);
}

module nutHole(h1)
{
	cylinder(r=6.80/2, h=h1, $fn=6);
}

module peg()
{
	
	difference(){
		minkowski(){
			union()
			{
				cylinder(r=4, h=6, $fn=30);
				cylinder(r=7, h=mount_height, $fn=30);
			}
			sphere(r=.5, $fn=10);
		}
		screwhole();
	}
}

module rumbapegs()
{
	translate([0,0,0])peg();
}

module rambo_frame()
{
	difference()
	{
		
		translate([-4,-4,0])
		minkowski(){
			difference()
			{
				cube([ramps_screw_width + 8, ramps_screw_depth + 8, mount_height]);
				translate([frame_width / 2, frame_width / 2, 0])cube([ramps_screw_width + 8 - frame_width, ramps_screw_depth + 8 - frame_width, mount_height +.5]);
			}
			sphere(r=.5, $fn=10);
		}
		translate([0,0,0])screwhole();
		translate([ramps_screw_width,0,0])screwhole();
		translate([ramps_screw_width,ramps_screw_depth,0])screwhole();
		translate([0,ramps_screw_depth,0])screwhole();
		
		
	}
}

module rumba_frame_base()
{
	translate([-4,-4,0])
		minkowski(){
			difference()
			{
				cube([rumba_hole_width_1 + 8, rumba_hole_depth + 8, mount_height]);
				translate([frame_width / 2, frame_width / 2, 0])cube([rumba_hole_width_1 + 8 - frame_width, rumba_hole_depth + 8 - frame_width, mount_height +.5]);
				//translate([rumba_hole_width_2 + frame_width / 2 + 1, 0, 0])cube([rumba_hole_width_1, frame_width, 2]); 
				translate([frame_width / 2, frame_width / 2, 0])cube([ramps_screw_width + 8 - frame_width, ramps_screw_depth - frame_width, mount_height +.5]);
				translate([0, 0, 0])cube([ramps_screw_width, ramps_screw_depth - frame_width, mount_height +.5]);
				
			}
			sphere(r=.5, $fn=10);
		}
		translate([0,0,0])peg();
		translate([rumba_hole_width_2,0,0])peg();
		translate([rumba_hole_width_1,rumba_hole_depth,0])peg();
		translate([0,rumba_hole_depth,0])peg();
}

module rumba_frame()
{
	translate([0,8,0])
	difference()
	{ 
		rumba_frame_base();
		translate([0,0,0])screwhole();
		translate([rumba_hole_width_2,0,0])screwhole();
		translate([rumba_hole_width_1,rumba_hole_depth,0])screwhole();
		translate([0,rumba_hole_depth,0])screwhole();
		translate([0,0,-1])nutHole(5.5);
		translate([rumba_hole_width_2,0,-1])nutHole(5.5);
		translate([rumba_hole_width_1,rumba_hole_depth,-1])nutHole(5.5);
		translate([0,rumba_hole_depth,-1])nutHole(5.5);
		
	}
}

module frame()
{
	rambo_frame();
	rumba_frame();
}

difference(){
	frame();
	translate([0,8,-1])nutHole(5.5);
	translate([rumba_hole_width_2,8,-1])nutHole(5.5);
	
	translate([0,0,0])screwhole();
	translate([0,ramps_screw_depth,0])screwhole();
	translate([ramps_screw_width,0,0])screwhole();
	translate([ramps_screw_width,ramps_screw_depth,0])screwhole();
}