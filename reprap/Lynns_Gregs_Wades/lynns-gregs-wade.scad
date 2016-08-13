// Greg's Wade Extruder. 
// It is licensed under the Creative Commons - GNU GPL license. 
//  2010 by GregFrost
// Extruder based on prusa git repo.
// http://www.thingiverse.com/thing:6713
// modified for i3 by vlnofka <vlnofka@gmail.com>

// Changes made by Martin Rice <mrice411@gmail.com>
// 
// increased hole for 608 bearing from 22.3 to 23mm.
// -strike-extra base thickness set to 3mm so idler bolt doesn't hit box-frame style X carriage
// Added a small thumb-grip to the top of the idler.
// The forward-foot of the base was shortened by 10mm.  This also allows for fan mount to fit on standard x carriage.
// The legacy mounting holes were removed.
// Recessed M3 nut traps were added for JHead (wildseyed) mount on the X-carriage side of the body.
// Radius of the nut trap built into the idler hinge was increased by .5mm because mine are always too small.
// Added a OSH logo tucked into the space under the motor mount.
// The thickness of the bearing washer was changed from 1mm to 3 times the layer_thickness.
// Added a fan holder
// radius of recessed carriage mounting holes was increased by .1mm
// The idler was mirrored, so that the screw head sticks out on the side away from the carriage (interference)
// The beveled guide inside the idler was moved outward a little, because it's too tight
// The cutout for the 20mm idler bolt (M8) was increased in radius to M8/2.

// Changes made by Lynn A. Roth <lynnr@penguin.nu>
// Change base length
// Extend Guidler
// Extend support around filament below the hobbed bolt.
// Add mounting blocks for 2nd hot end.

include<inc/configuration.scad>
include<inc/functions.scad>
include<bowden_extruder.scad>    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Define the hotend_mounting style you want by specifying hotend_mount=style1+style2 etc.
//e.g. wade(hotend_mount=groovemount+peek_reprapsource_mount);

jhead_mount=256;
default_extruder_mount=256;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

mounting_holes_legacy=1;
mounting_holes_symmetrical=2;
default_mounting_holes=mounting_holes_legacy;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// translate([70,0,0])  i3_fanmount();
//wade(hotend_mount=default_extruder_mount,	mounting_holes=default_mounting_holes);
// //translate([-35,10,0]) bearing_washer();
//translate([-20,10,15.25]) rotate([0,-90,0]) wadeidler(); 

  // translate([-10,0,5])//uncomment to print
  // rotate([90,0,0])//uncomment to print
  // translate([-21,-5,15]) 
  // rotate([ 0,-90,0])
  // bowden_extruder();
 
 bowden_adapter(); 
  

 
 // translate([-30,30,-20])//uncomment to print
 // rotate([90,0,0])//uncomment to print
 // translate([-0,-10,0])
	 //connector();

// translate([30,0,0])
// connector_half(1);

// translate([20,0,0])
// connector_half(0);

 // translate([-60,30,-0]) //uncomment to print
 // rotate([90,0,0])//uncomment to print
 // translate([-0,-30,0])
 // translate([-0,-20,0])
	// connector();
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * Extruder
 * @name Extruder
 * @assembled
 * @using 1 small-gear
 * @id extruder
 * @using 1 idler
 * @using 1 extruder-body
 * @using 1 m3nut
 * @using 1 m3washer
 * @using 1 m3x25
 * @step Take idler and insert nut into small nut-trap inside the hinge.
 * @step While holding the nut in place, preprare M3x25 bolt with washer and screw it into the hinge just enough to hold the nut.
 * @step Now take the extruder body and idler. Place idler on the hinge counterpart and compleately screw the M3x25 bolt. This will create secured hinge.
 * 
 * @using 2 m4nut
 * @step Place M4 nuts into their nut traps, secure them with piece of tape. We need them in place, since later they would be harder to access.
 * 
 * @using 3 m3x10
 * @using 3 m3washer
 * @using 1 NEMA17
 * @step Prepare your NEMA17 stepper motor and three M3x10 screws with washers.
 * @step Hold motor on place and lightly tighten the screws. We need to adjust motor position later, no need to tighten it hard.
 * 
 * @using 1 large-gear
 * @using 1 m8washer
 * @using 2 m8nut
 * @using 2 bearing-608
 * @step Place two skate bearings on ther position, they should snuggly fit in.
 * @step Insert prepared large gear into the body with mounted bearings.
 * @step Check if the alignment of hobbed part with the filament path. Adjust it accordingly with adding or removing M8 washers.
 * @step After adjusting, we need to fix the bolt in. So we place washer at the end of hobbed bolt and with two M8 nuts we will do locknut by tightening them against each other.
 * @step Check if large gear turns freely.
 * 
 * @using 2 m3x40
 * @using 4 m3washer
 * @using 2 extruder-spring
 * @step Prepare two M3x40 screws with sandwitch of washer-spring-washer.
 * @step Insert two M3 nuts into nut traps on top of drive mechanism. [[extruder/top-nut-traps.png]]
 * @step Insert prepared screws into the holes on idler. Close the idler and tighten the screws into the trapped nuts. More you tighten those screws, more pressure will be on fillament.
 * @step Your extruder is done. [[extruder/assembled.jpg]]
 */

/**
 * Extruder body
 * @name Extruder body
 * @category Printed
 * @id extruder-body
 */

/**
 * Extruder idler
 * @name Extruder Idler
 * @id idler
 * @category Printed
 * @using 1 bearing-608
 * @using 1 idler-m8-piece
 * @step Insert piece of M8 rod into bearing.
 * @step Insert 608 bearing with rod into printed idler part.
 */

/**
 * Small M8 rod 
 * @name Idler
 * @id idler-m8-piece
 * @category Rods and Bars
 */

/**
 * Spring used for idler on extruder.
 * @name Extruder spring
 * @id extruder-spring
 */

//===================================================
// Parameters defining the wade body:

elevation = 15;
wade_block_height=55+elevation;
wade_block_width=24;
wade_block_depth=28;

block_bevel_r=6;

base_thickness=10;
//LAR - Change base length
base_length = 40; //70+2-6;
base_leadout=22-10; // mrice
base_extra_depth=2.5; // mrice

nema17_hole_spacing=1.2*25.4;//31; 
nema17_width=1.7*25.4;
nema17_support_d=nema17_width-nema17_hole_spacing;

screw_head_recess_diameter=7.2;
screw_head_recess_depth=3;

motor_mount_rotation=0;
motor_mount_translation=[48,50+elevation,0];
//motor_mount_translation=[52.5,38,0]; //original
motor_mount_thickness=8;

large_wheel_translation=[50.5-(7.4444+32.0111+0.25),34+elevation,0];

m3_nut_trap_r = m3_nut_diameter/2+.8; // mrice

m8_clearance_hole=8.8;
hole_for_608=23; // mrice
608_diameter=22; 

block_top_right=[wade_block_width,wade_block_height];

layer_thickness=0.30;
filament_diameter=3;
filament_feed_hole_d=(filament_diameter*1.1)/cos(180/8);
hobbing_depth=2;
echo ("filament_feed_hole_d", filament_feed_hole_d);

//This is the distance from the centre of the filament to the centre of the hobbed bolt.
filament_feed_hole_offset=8/2-hobbing_depth+filament_diameter/2;

echo ("filament_feed_hole_offset", filament_feed_hole_offset);

idler_nut_trap_depth=7.5;
idler_nut_thickness=4;

gear_separation=7.4444+32.0111+0.25;

function motor_hole(hole)=[
	motor_mount_translation[0],
	motor_mount_translation[1]]+
	rotated(45+motor_mount_rotation+hole*90)*nema17_hole_spacing/sqrt(2);

// Parameters defining the idler.

filament_pinch=[
	large_wheel_translation[0]-filament_feed_hole_offset-filament_diameter/2,
	large_wheel_translation[1],
	wade_block_depth/2];
idler_axis=filament_pinch-[608_diameter/2,0,0];
idler_fulcrum_offset=608_diameter/2+3.5+m3_diameter/2;
idler_fulcrum=idler_axis-[0,idler_fulcrum_offset,0];
idler_corners_radius=4; 
idler_height=12;
idler_608_diameter=608_diameter+2;
idler_608_height=9;
idler_mounting_hole_across=8;
idler_mounting_hole_up=15;
idler_short_side=wade_block_depth-2;
idler_hinge_r=m3_diameter/2+3.5;
idler_hinge_width=6.5;
idler_end_length=(idler_height-2)+5;
idler_mounting_hole_diameter=m4_diameter+0.25;
idler_mounting_hole_elongation=1;
idler_long_top=idler_mounting_hole_up+idler_mounting_hole_diameter/2+idler_mounting_hole_elongation+2.5;
idler_long_bottom=idler_fulcrum_offset;
idler_long_side=idler_long_top+idler_long_bottom;

extruder_mount_top_offset = [0,-10,0];
extruder_mount_bottom_offset = [0,-20,0];

module bearing_washer()
{
	difference()
	{
		cylinder(r=hole_for_608/2-0.05,h=3*layer_thickness);
		translate([0,0,-1])
		cylinder(r=8,h=3); 
	}
}
connector_r = m3_diameter/2+2.5;
connector_length = 20;
connector_hinge_r = m3_diameter/2+3.5;

connector_thickness = 5;


module connector_half(nuttrap=0)
{	
	difference()
	{
		union()
		{
			cube([connector_r,connector_length,connector_thickness]);
			translate([connector_r,0,0])
			{
				cylinder(r=connector_r, h=connector_thickness);
				translate([0,connector_length,0])
				cylinder(r=connector_r, h=connector_thickness);
			}
		}
		translate([connector_r,0,-.1])
		{
			cylinder(r=m3_diameter/2,h=connector_thickness + .2, $fn=20);
			if (nuttrap == 1)
			{
				translate([0,0,connector_thickness-2])
					cylinder(h=3,r=m3_nut_diameter/2+.5,$fn=6);
				translate([0,connector_length,connector_thickness-2])
					cylinder(h=3,r=m3_nut_diameter/2+.5,$fn=6);
			}
			
			translate([0,connector_length,0])
			cylinder(r=m3_diameter/2,h=connector_thickness + .2, $fn=20);
			
		}
	}

}


module connector()
{	
   union()
   {
		difference()
		{
			union()
			{
				// mount connector hinge
				translate(idler_fulcrum)
				rotate([0,0,0])
				{
					cylinder(h=idler_short_side,r=connector_r,center=true,$fn=60);
					translate([-connector_length/2,0,0])
					cube([connector_length,connector_r*2,idler_short_side],center=true);
					translate([-connector_length,0,0])
					cylinder(h=idler_short_side,r=connector_r,center=true,$fn=60);
				}
			}

			//connector hole.
			translate(idler_fulcrum)
			rotate(180/8)
			cylinder(h=idler_short_side+2,r=m3_diameter/2-0.1,center=true,$fn=8);

			translate(idler_fulcrum + [-connector_length,0,0])
			rotate(180/8)
			cylinder(h=idler_short_side+2,r=m3_diameter/2-0.1,center=true,$fn=8);

			
			
			//Nut trap for fulcrum screw.
			translate(idler_fulcrum+[0,0,idler_short_side/2-idler_hinge_width-1])
			rotate(360/16)
			cylinder(h=3,r=m3_nut_diameter/2+.5,$fn=6); // mrice
	 
			translate(idler_fulcrum+[0,0,idler_short_side/2-idler_hinge_width-1] + [-connector_length,0,0])
			rotate(360/16)
			cylinder(h=3,r=m3_nut_diameter/2+.5,$fn=6); // mrice
	 
	 
			//Slot for connector mount.
			translate(idler_fulcrum + [-connector_length+1,0,0])
			translate(idler_fulcrum + [-connector_length+1,0,0])
			{
				cylinder(h=idler_short_side-2*idler_hinge_width,
					r=connector_hinge_r+0.5,center=true,$fn=60);
				rotate(-90)
				translate([0,-connector_hinge_r-0.5,0])
				cube([connector_hinge_r*2+1,connector_hinge_r*2+1,
					idler_short_side-2*idler_hinge_width],center=true);
			}

			mirror([1,0,0])
			translate(idler_fulcrum - [-connector_length+5,0,0])
			{
				cylinder(h=idler_short_side-2*idler_hinge_width,
					r=connector_hinge_r+0.5,center=true,$fn=60);
				rotate(-90)
				translate([0,-connector_hinge_r-0.5,0])
				cube([connector_hinge_r*2+1,connector_hinge_r*2+1,
					idler_short_side-2*idler_hinge_width],center=true);
			}
			
		}
	}
}




module wade(
	hotend_mount=default_extruder_mount,
	mounting_holes=default_mounting_holes)
{
	
	difference ()
	{
		union()
		{
			// The wade block.
			cube([wade_block_width,wade_block_height,wade_block_depth]);

			//support
			fulcrum_support();
			
			// Filler between wade block and motor mount.
			translate([10-2,0,0])
			cube([wade_block_width,
				wade_block_height,
				motor_mount_thickness]);

			// Round the ends of the base
			//LAR - only round one end.
			translate([base_length-base_leadout,0,0])
			cylinder(r=base_thickness/2,h=wade_block_depth+base_extra_depth,$fn=20);
						
			//Provide the bevel betweeen the base and the wade block.
			render()
			difference()
			{
				translate([-block_bevel_r,0,0])
				cube([block_bevel_r*2+wade_block_width,
					base_thickness/2+block_bevel_r,wade_block_depth+base_extra_depth]);				
				translate([-block_bevel_r,block_bevel_r+base_thickness/2])
				cylinder(r=block_bevel_r,h=wade_block_depth+base_extra_depth,$fn=60);
				translate([wade_block_width+block_bevel_r,
					block_bevel_r+base_thickness/2])
				cylinder(r=block_bevel_r,h=wade_block_depth+base_extra_depth,$fn=60);
			}

			// The idler hinge.
			translate(idler_fulcrum)
			{
				translate([idler_hinge_r,0,0])
				cube([idler_hinge_r*2,idler_hinge_r*2,idler_short_side-2*idler_hinge_width-0.5],
					center=true);
				rotate(-30)
				{
					cylinder(r=idler_hinge_r,
						h=idler_short_side-2*idler_hinge_width-0.5,
						center=true,$fn=60);
					translate([idler_hinge_r,0,0])
					cube([idler_hinge_r*2,idler_hinge_r*2,
						idler_short_side-2*idler_hinge_width-0.5],
						center=true);
				}
			}

			//LAR - Second extruder mount top
			translate(idler_fulcrum + extruder_mount_top_offset)
			{
				translate([idler_hinge_r,0,0])
				cube([idler_hinge_r*2,idler_hinge_r*2,idler_short_side-2*idler_hinge_width-0.5],
					center=true);
				rotate(-30)
				{
					cylinder(r=idler_hinge_r,
						h=idler_short_side-2*idler_hinge_width-0.5,
						center=true,$fn=60);
					translate([idler_hinge_r,0,0])
					cube([idler_hinge_r*2,idler_hinge_r*2,
						idler_short_side-2*idler_hinge_width-0.5],
						center=true);
				}
			}
			//LAR - Second extruder mount bottom
			translate(idler_fulcrum + extruder_mount_bottom_offset)
			{
				translate([idler_hinge_r,0,0])
				cube([idler_hinge_r*2,idler_hinge_r*2,idler_short_side-2*idler_hinge_width-0.5],
					center=true);
				rotate(-30)
				{
					cylinder(r=idler_hinge_r,
						h=idler_short_side-2*idler_hinge_width-0.5,
						center=true,$fn=60);
					translate([idler_hinge_r,0,0])
					cube([idler_hinge_r*2,idler_hinge_r*2,
						idler_short_side-2*idler_hinge_width-0.5],
						center=true);
				}
			}
			


			//The base.
			translate([-base_leadout,-base_thickness/2,0])
			//LAR - Lengthen base by 1
			cube([base_length+1,base_thickness,wade_block_depth+base_extra_depth]);
			//Base aligement helper
			//translate([-base_leadout,-base_thickness/2,wade_block_depth+base_extra_depth])
			//cube([base_length,1,layer_thickness]);
			

			motor_mount ();
		}

		block_holes(mounting_holes=mounting_holes);
		motor_mount_holes ();

		translate([large_wheel_translation[0]-filament_feed_hole_offset,
			-base_thickness/2,wade_block_depth/2])
		rotate([-90,0,0])
		{
			if (in_mask(hotend_mount,jhead_mount))
				wildseyed_mount_holes(insulator_d=16);
		}
	}
}

function in_mask(mask,value)=(mask%(value*2))>(value-1); 

//block_holes();

module block_holes(mounting_holes=default_mounting_holes)
{
echo("bhmh", mounting_holes)
	
	
	//Round off the top of the block. 
	translate([0,wade_block_height-block_bevel_r,-1])
	render()
	difference()
	{
		translate([-1,0,0])
		cube([block_bevel_r+1,block_bevel_r+1,wade_block_depth+2]);
		translate([block_bevel_r,0,0])
		cylinder(r=block_bevel_r,h=wade_block_depth+2,$fn=40);
	}

	//carriage mounting holes
	//LAR - Adjusted to 24mm mount (-25 and 1)
	translate([-48.5+64+4,1,3]) 
	{
		translate([-25,0,0]) { //-46
			translate([0,0,layer_thickness+24]) 
			  cylinder(r=m3_diameter/2, h=wade_block_depth+0.2+base_extra_depth, center=true,$fn=20);
			  cylinder(r=m3_nut_diameter/2+0.5, h=20, center=true,$fn=20);
		}
		
	#	translate([1,0,0]) { //-22
			translate([0,0,layer_thickness+24]) 
			  cylinder(r=m3_diameter/2, h=wade_block_depth+0.2+base_extra_depth, center=true,$fn=20);
			  cylinder(r=m3_nut_diameter/2+0.5, h=20, center=true,$fn=20);
		}
	}

	// Idler fulcrum hole.
	translate(idler_fulcrum+[0,0,layer_thickness])
	cylinder(r=m3_diameter/2,h=idler_short_side-2*idler_hinge_width-0.5,center=true,$fn=16);

	translate(idler_fulcrum+[0,0,idler_short_side/2-idler_hinge_width-1])
	cylinder(r=m3_nut_diameter/2+0.25,h=1,$fn=40);
	
	
	//LAR - Second extruder mount top hole
	translate(idler_fulcrum+extruder_mount_top_offset+[0,0,layer_thickness])
	cylinder(r=m3_diameter/2,h=idler_short_side-2*idler_hinge_width-0.5,center=true,$fn=16);

	translate(idler_fulcrum+[0,0,idler_short_side/2-idler_hinge_width-1])
	cylinder(r=m3_nut_diameter/2+0.25,h=1,$fn=40);
	
	//LAR - Second extruder mount bottom hole
	translate(idler_fulcrum+extruder_mount_bottom_offset+[0,0,layer_thickness])
	cylinder(r=m3_diameter/2,h=idler_short_side-2*idler_hinge_width-0.5,center=true,$fn=16);

	translate(idler_fulcrum+[0,0,idler_short_side/2-idler_hinge_width-1])
	cylinder(r=m3_nut_diameter/2+0.25,h=1,$fn=40);
	
	

	//Rounded cutout for idler hinge.
	render()
	translate(idler_fulcrum)
	difference()
	{
		cylinder(r=idler_hinge_r+0.5,h=idler_short_side+0.5,center=true,$fn=60);
		cylinder(r=idler_hinge_r+1,h=idler_short_side-2*idler_hinge_width-0.5,center=true);
	}

	//LAR - Rounded cutout for 2nd extruder mount
	translate(idler_fulcrum + extruder_mount_top_offset)
	difference()
	{
		cylinder(r=idler_hinge_r+0.5,h=idler_short_side+0.5,center=true,$fn=60);
		cylinder(r=idler_hinge_r+1,h=idler_short_side-2*idler_hinge_width-0.5,center=true);
	}
	translate(idler_fulcrum + extruder_mount_bottom_offset)
	difference()
	{
		cylinder(r=idler_hinge_r+0.5,h=idler_short_side+0.5,center=true,$fn=60);
		cylinder(r=idler_hinge_r+1,h=idler_short_side-2*idler_hinge_width-0.5,center=true);
	}
	
	
	//translate(motor_mount_translation)
	translate(large_wheel_translation)
	{

			// Open the top to remove overhangs and to provide access to the hobbing.
			translate([-wade_block_width+2,0,9.5])
			cube([wade_block_width,
				wade_block_height-large_wheel_translation[1]+1,
				wade_block_depth]);
		
			translate([0,0,-1])
			b608(h=9);
		
			translate([0,0,20])
			b608(h=9);
		
			//LAR - Extend support for filamanet up to the hobbed bolt.
			//translate([-13,0,9.5])
			translate([-15,0,9.5])
			b608(h=wade_block_depth);
		
			translate([0,0,8+layer_thickness])
			cylinder(r=m8_clearance_hole/2,h=wade_block_depth-(8+layer_thickness)+2);	

			translate([0,0,20-2])
			cylinder(r=16/2,h=wade_block_depth-(8+layer_thickness)+2);	

			// Filament feed.
			translate([-filament_feed_hole_offset,0,wade_block_depth/2])
			rotate([90,0,0])
			rotate(360/16)
			cylinder(r=filament_feed_hole_d/2,h=wade_block_depth*3+elevation,center=true,$fn=8);	

			//Widened opening for hobbed bolt access.
			translate([2,wade_block_height/2+2,wade_block_depth/2+0.2])
			rotate([90,0,0])
			rotate(-45)
			union()
			{
			cylinder(r=5,h=wade_block_height,center=true,$fn=30);	
			translate([-5,0,0])
			cube([10,10,wade_block_height],center=true);
			}

			// Mounting holes on the base.
			//translate([0,-base_thickness/2,0])
if(0) {
			translate(
				(mounting_holes==mounting_holes_legacy)?[-3.4,0,-1]:[0,0,0])
			for (mount=[0:1])
			{
				translate([-filament_feed_hole_offset+25*((mount<1)?1:-1),
					-large_wheel_translation[1]-1-base_thickness/2,wade_block_depth/2])
				rotate([-90,0,0])
				rotate(360/16)
				cylinder(r=m4_diameter/2,h=base_thickness+2,$fn=8);	
	
				translate([-filament_feed_hole_offset+25*((mount<1)?1:-1),
					-large_wheel_translation[1],
					wade_block_depth/2])
				rotate([-90,0,0])
			//fixme: (correct height
				//cylinder(r=m4_nut_diameter/2,h=base_thickness,$fn=6);	
				cylinder(r=m4_nut_diameter/2,h=29.3,$fn=6);
			}
}

	}

	// Idler mounting holes and nut traps.
	for (idle=[-1,1])
	{
		translate([0,
			idler_mounting_hole_up+large_wheel_translation[1],
			wade_block_depth/2+idler_mounting_hole_across*idle])
		rotate([0,90,0])
		{
			rotate([0,0,180/8])
			translate([0,0,-1])
			cylinder(r=m4_diameter/2,h=wade_block_depth+6,$fn=8);	
			rotate([0,0,180/6])
			translate([0,0,wade_block_width-idler_nut_trap_depth])
			cylinder(r=m4_nut_diameter/2,h=idler_nut_thickness,$fn=6);	

			translate([0,10/2,wade_block_width-idler_nut_trap_depth+idler_nut_thickness/2])
			cube([m4_nut_diameter*cos(30),10,idler_nut_thickness],center=true);
		}
	}
}

module motor_mount()
{
	linear_extrude(height=motor_mount_thickness)
	{
		barbell (motor_hole(1),motor_hole(2),nema17_support_d/2, nema17_support_d/2,20,160);
		barbell (motor_hole(2),motor_hole(3),nema17_support_d/2, nema17_support_d/2,20,160);

		// Connect block to top of motor mount.
		barbell(block_top_right-[0,5],motor_hole(1),5,nema17_support_d/2,100,60);

		//Connect motor mount to base.
		//LAR - change y of this to 20 from 0
		barbell([base_length-base_leadout,
			20],motor_hole(3),base_thickness/2,
			nema17_support_d/2,100,60);
	}

}

module motor_mount_holes()
{
	radius=4/2;
	slot_left=1;
	slot_right=2;

	{
		translate([0,0,screw_head_recess_depth+layer_thickness])
		for (hole=[0:3])
		translate([motor_hole(hole)[0],motor_hole(hole)[1],0])
		rotate([0,0,25])
		{
			translate([-slot_left,0,0])
			cylinder(h=motor_mount_thickness-screw_head_recess_depth,r=radius,$fn=16);
			translate([slot_right,0,0])
			cylinder(h=motor_mount_thickness-screw_head_recess_depth,r=radius,$fn=16);

			translate([-slot_left,-radius,0])
			cube([slot_left+slot_right,radius*2,motor_mount_thickness-screw_head_recess_depth]);
		}

		translate([0,0,-1])
		for (hole=[0:3])
		translate([motor_hole(hole)[0],motor_hole(hole)[1],0])
		rotate([0,0,25])
		{
			translate([-slot_left,0,0])
			cylinder(h=screw_head_recess_depth+1,
				r=screw_head_recess_diameter/2,$fn=16);
			translate([slot_right,0,0])
			cylinder(h=screw_head_recess_depth+1,
				r=screw_head_recess_diameter/2,$fn=16);

			translate([-slot_left,-screw_head_recess_diameter/2,0])
			cube([slot_left+slot_right,
				screw_head_recess_diameter,
				screw_head_recess_depth+1]);
		}
	}
}

module wadeidler() 
{

	guide_height=12.3;
	//LAR - longer guide.
	guide_length=16;

   union()
   {
           // thumb saver
			translate(idler_axis+[-idler_height/2+2,+idler_long_side/2-idler_long_bottom,0])
             translate([-idler_height/4,20,0]) 
             { 
                     cube([idler_height/2,8,idler_short_side*.5],center=true);
                     translate([0,0,idler_short_side/4]) rotate([0,90,0]) cylinder(h=idler_height/2,r=4,center=true);
                     translate([0,0,-idler_short_side/4]) rotate([0,90,0]) cylinder(h=idler_height/2,r=4,center=true);
             }

	difference()
	{
		union()
		{
			//The idler block.
			translate(idler_axis+[-idler_height/2+2,+idler_long_side/2-idler_long_bottom,0])
			{
			cube([idler_height,idler_long_side,idler_short_side],center=true);
			
			//Filament Guide.
			translate([guide_height/2+idler_height/2-1,idler_long_side/2-guide_length/2,0])
			//LAR - Add 4 to the height.
			cube([guide_height+5,guide_length,8],center=true);
			}

			// The fulcrum Hinge
			translate(idler_fulcrum)
			rotate([0,0,-30])
			{
				cylinder(h=idler_short_side,r=idler_hinge_r,center=true,$fn=60);
				translate([-idler_end_length/2,0,0])
				cube([idler_end_length,idler_hinge_r*2,idler_short_side],center=true);
			}
		}

		//Filament Path	
		translate(idler_axis+[2+guide_height,+idler_long_side-idler_long_bottom-guide_length/2,0])
		{
		cube([7,guide_length+2,filament_diameter+0.5],center=true);
		translate([-7/2,0,0])
		rotate([90,0,0])
		cylinder(h=guide_length+4,r=(filament_diameter+0.5)/2,center=true,$fn=16);
		}

		//Back of idler.
		translate(idler_axis+[-idler_height/2+2-idler_height,
			idler_long_side/2-idler_long_bottom-10,0])
		cube([idler_height,idler_long_side,idler_short_side+2],center=true);

		//Slot for idler fulcrum mount.
		translate(idler_fulcrum)
		{
			cylinder(h=idler_short_side-2*idler_hinge_width,
				r=idler_hinge_r+0.5,center=true,$fn=60);
			rotate(-30)
			translate([0,-idler_hinge_r-0.5,0])
			cube([idler_hinge_r*2+1,idler_hinge_r*2+1,
				idler_short_side-2*idler_hinge_width],center=true);
		}

		//Bearing cutout.
		translate(idler_axis)
		{
			difference()
			{
				cylinder(h=idler_608_height,r=idler_608_diameter/2,
					center=true,$fn=60);
				for (i=[0,1])
				rotate([180*i,0,0])
				translate([0,0,.5+6.9/2])
				cylinder(r1=12/2,r2=16/2,h=2);
			}
			cylinder(h=idler_short_side-6,r=m8_diameter/2-0.0/*NotTight*/,
				center=true,$fn=20);
		}

		//Fulcrum hole.
		translate(idler_fulcrum)
		rotate(180/8)
		cylinder(h=idler_short_side+2,r=m3_diameter/2-0.1,center=true,$fn=8);

		//Nut trap for fulcrum screw.
		translate(idler_fulcrum+[0,0,idler_short_side/2-idler_hinge_width-1])
		rotate(360/16)
		cylinder(h=3,r=m3_nut_diameter/2+.5,$fn=6); // mrice
 
		for(idler_screw_hole=[-1,1])
		translate(idler_axis+[2-idler_height,0,0])
		{
			//Screw Holes.
			translate([-1,idler_mounting_hole_up,
				idler_screw_hole*idler_mounting_hole_across])
			rotate([0,90,0])
			{
				cylinder(r=idler_mounting_hole_diameter/2,h=idler_height+2,$fn=16);
				translate([0,idler_mounting_hole_elongation,0])
				cylinder(r=idler_mounting_hole_diameter/2,h=idler_height+2,$fn=16);
				translate([-idler_mounting_hole_diameter/2,0,0])
				cube([idler_mounting_hole_diameter,idler_mounting_hole_elongation,
					idler_height+2]);
			}

			// Rounded corners.
			render()
			translate([idler_height/2,idler_long_top,
				idler_screw_hole*(idler_short_side/2)])
			difference()
			{
				translate([0,-idler_corners_radius/2+0.5,-idler_screw_hole*(idler_corners_radius/2-0.5)])
				cube([idler_height+2,idler_corners_radius+1,idler_corners_radius+1],
					center=true);
				rotate([0,90,0])
				translate([idler_screw_hole*idler_corners_radius,-idler_corners_radius,0])
				cylinder(h=idler_height+4,r=idler_corners_radius,center=true,$fn=40);
			}
		}
	}
}
}

module b608(h=8)
{
	translate([0,0,h/2]) cylinder(r=hole_for_608/2,h=h,center=true,$fn=60);
}

module barbell (x1,x2,r1,r2,r3,r4) 
{
	x3=triangulate (x1,x2,r1+r3,r2+r3);
	x4=triangulate (x2,x1,r2+r4,r1+r4);
	render()
	difference ()
	{
		union()
		{
			translate(x1)
			circle (r=r1);
			translate(x2)
			circle(r=r2);
			polygon (points=[x1,x3,x2,x4]);
		}
		
		translate(x3)
		circle(r=r3,$fa=5);
		translate(x4)
		circle(r=r4,$fa=5);
	}
}

function triangulate (point1, point2, length1, length2) = 
point1 + 
length1*rotated(
atan2(point2[1]-point1[1],point2[0]-point1[0])+
angle(distance(point1,point2),length1,length2));

function distance(point1,point2)=
sqrt((point1[0]-point2[0])*(point1[0]-point2[0])+
(point1[1]-point2[1])*(point1[1]-point2[1]));

function angle(a,b,c) = acos((a*a+b*b-c*c)/(2*a*b)); 

function rotated(a)=[cos(a),sin(a),0];

//========================================================
// Modules for defining holes for hotend mounts:
// These assume the extruder is verical with the bottom filament exit hole at [0,0,0].

//wildseyed_mount_holes(insulator_d=16);
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

module fulcrum_support() {
	fulcrum_support_int();
	translate(extruder_mount_top_offset)
	fulcrum_support_int();
	translate(extruder_mount_bottom_offset)
	fulcrum_support_int();
}

module fulcrum_support_int() {
    // The idler hinge support.
	translate(idler_fulcrum)
	{
		rotate(-15)
		translate([-(idler_hinge_r+3),-idler_hinge_r-2,-wade_block_depth/2])
		difference()
		{
		cube([idler_hinge_r+3,	idler_hinge_r*2+4,	wade_block_depth/2-	idler_short_side/2+idler_hinge_width+0.25+layer_thickness]);
		translate([idler_hinge_r+2,(idler_hinge_r*2+4)/2,layer_thickness*3])
		cylinder(r=idler_hinge_r+1,h=10,$fn=50);
		}
		
		rotate(-15) translate([-(idler_hinge_r+3),-idler_hinge_r-2,
			-idler_short_side/2+idler_hinge_width+0.25])
		cube([idler_hinge_r+3+15,
			idler_hinge_r*2+4,
			layer_thickness]);

		rotate(-15) translate([-(idler_hinge_r+3),-idler_hinge_r-2,
			-wade_block_depth/2])
		cube([idler_hinge_r+3+15,
			idler_hinge_r*2+4,
			layer_thickness]);

   }
}



