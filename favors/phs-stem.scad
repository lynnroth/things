translate([2,2,0])
minkowski()
{
    cube([48,38,2]);
    cylinder(r=2,h=1);
}
translate([26,22,2])linear_extrude(3)text("PHS", size=15, font="britannic bold", halign="center");
translate([26,5,2])linear_extrude(3)text("STEM", font="britannic bold", size=15, halign="center");