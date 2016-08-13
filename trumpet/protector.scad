$fn=30;

inside_rad = 8;
thickness = .8;
length = 40;



difference()
{
    cylinder(r=inside_rad, h=length);
    translate([0,0,-1])cylinder(r=inside_rad-thickness, h=length+2);
}