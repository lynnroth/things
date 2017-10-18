translate([2,2,0])
minkowski()
{
    cube([48,38,2]);
    cylinder(r=2,h=1);
}
translate([25,25,2])linear_extrude(2)text("PHS", font="britannic bold", halign="center");
translate([25,10,2])linear_extrude(2)text("STEM", font="britannic bold", halign="center");