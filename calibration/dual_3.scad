red = 1;
green = 0;

length = 30;
width = 1;
layer_height = .3;
layers_per_color = 2;
height_per_color = layer_height * layers_per_color;

module l()
{
    translate([-length/2,-width/2,0])
    {
        cube([length, width, height_per_color]);
        translate([length,sqrt(.5),0])
        {
            rotate([0,0,135])
                cube([length/4,width, height_per_color]);
            rotate([0,0,-135])
                cube([length/4,width, height_per_color]);
        }
    
       translate([length/3,-length/3,0])
        rotate([0,0,90])
         cube([length, width, height_per_color]);
    }
    
}

if (green == 1)
color("green")
for (i=[0,2])
{
    translate([0,0,i*height_per_color])
    l();
}

if (red == 1)
color("red")
for (i=[1,3])
{
    translate([0,0,i*height_per_color])
    l();
}