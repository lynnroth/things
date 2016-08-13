//dual extruder test
yellow = 1;
blue = 1;

difference()
{
    sum()
    {
        layer(0);
        rotate([0,0,90])
        layer(2);
        rotate([0,0,0])
        layer(4);
    }
    cube([3,3,20]);
}

module layer(z = 0)
{
    translate([-15,-15,z])
    {
        if (yellow==1)
        {
            color ("yellow") 
            {
                cube([30,10,2]);
                translate([0,20,0])
                    cube([30,10,2]);
            }
        }
        
        if (blue == 1)
        {
            color ("blue") 
            {	
                translate([0,10,0])
                    cube([30,10,2]);
            }
        }
    }
}
