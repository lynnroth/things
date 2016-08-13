difference()
{
    cube([30,30,30]);
    translate([10,10,10])
        cube([10,10,30]);
    translate([10,10,10])
        cube([10,30,10]);
     translate([10,10,10])
        cube([30,10,10]);
}