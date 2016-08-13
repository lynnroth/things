$fn=60;
abs = 1;
nf = 0;

diameter = 50;
width = 5;

tire_thickness = 5;
axel_radius = 4.2;
rim_thickness = 1.5;
hub_thickness = 4;

spokes = 6;
spokewidth = 2;

radius = diameter/2;

if (abs == 1 )
{    
    color("black")
    {
        difference()
        {
            union()
            {
            difference()
            {
                union()
                {
                    cylinder(r=radius, h=width);
                   
                }
                translate([0,0,-.5])
                {
                    difference()
                    {
                        cylinder(r=radius-rim_thickness, h=width+1);
                        cylinder(r=axel_radius+hub_thickness, h=width+1);
                    }
                }
            }
            
            for(i=[0:spokes])
                    {
                        rotate([0,0,i*360/spokes])
                            translate([0,-spokewidth/2,0])
                            cube([radius,spokewidth,width]);
                    }
                }
            translate([0,0,-.5])
                cylinder(r=axel_radius, h=width+1);
        }
        
    }
    
}

if (nf == 1)
{
    color("red")
    {
        difference()
        {
            
            cylinder(r=radius+tire_thickness, h=width-.01);
            translate([0,0,-.5])
                cylinder(r=radius, h=width+1);
        }
    }
}