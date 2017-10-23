$fn=60;
rad1 = 25;
height = 5;
wall = 3;

difference()
{
    cylinder(r=rad1, h=5);
    translate([0,0,-.5])cylinder(r=rad1-wall, h=6);
}

for(i = [0,120,180,240])
{
rotate([0,0,i])translate([-wall/2,0,0])cube([wall,rad1,height]);
}
