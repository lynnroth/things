$fn=60;
wall = 1.5;
diameter = 40.25;
height = 25;

radius = diameter / 2;

difference()
{
    cylinder(r=radius + wall, h=height);
    translate([0,0,wall])cylinder(r=radius, h=height+.1);
}