cube([30,30,2]);
difference()
{
    cube([30,10,10]);
    translate([2,-1,2])cube([26,12,6]);
}

translate([0,20,0])
difference()
{
    cube([30,10,10]);
    translate([2,-1,2])cube([26,12,6]);
}

translate([20,0,10])
rotate([0,0,90])
difference()
{
    cube([30,10,10]);
    translate([2,-1,2])cube([26,12,6]);
}
