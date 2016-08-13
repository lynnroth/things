//dual extruder test
$fn=20;

size = 20;

yellow = 1;
blue = 0;


difference()
{
    union()
    {
        layer(0);
        rotate([0,0,90])
        layer(2);
        rotate([0,0,0])
        layer(4);
        rotate([0,0,90])
        layer(6);
        rotate([0,0,0])
        layer(8);
        rotate([0,0,90])
        layer(10);
    }
    translate([0,0,-1])
    cylinder(r=size/4, h=14);
}

module layer(z = 0)
{
    translate([-size/2,-size/2,z])
    {
        if (yellow==1)
        {
            color ("yellow") 
            {
                part();
            }
        }
        
        if (blue == 1)
        {
            color ("blue") 
            {	
                translate([0,size/2,0])
                    part();
            }
        }
    }
}

module part()
{
    cube([size,size/2,2]);
}
