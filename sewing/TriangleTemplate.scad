diameter_inches = 2;
diameter = diameter_inches * 25.4;
radius = diameter/2;
height = 3;
holediameter = 3;
//¼   ½   ¾
//2, 2.5, 3, 3.5

text = "2\"";
difference()
{
    cylinder(d=diameter, h = height, $fn=60);
    label();
    //notches();
    hole();
};


module label()
{
    translate([0,0,height - 1])
    {
        linear_extrude(height = 5) 
        {
              text( 
                    text, 
                    size = 15,
                    halign = "center", 
                    valign = "center");
        };
    }
}

module hole()
{
    //translate([-(radius - 4) / sqrt(2),(radius - 4) / sqrt(2),0], $fn=20)
    translate([0,(radius - 4),0], $fn=20)
    {
        cylinder(d=holediameter, h= height + 1);
    };
}

notchsize = 1;

module notches()
{
    translate([radius, 0, 0])
    {
        rotate([0,0,45])
        {
            cube([notchsize,notchsize,height * 2], center=true);
        }
    }
    translate([-radius, 0, 0])
    {
        rotate([0,0,45])
        {
            cube([notchsize,notchsize,height * 2], center=true);
        }
    }
    translate([0, radius, 0])
    {
        rotate([0,0,45])
        {
            cube([notchsize,notchsize,height * 2], center=true);
        }
    }
    translate([0, -radius, 0])
    {
        rotate([0,0,45])
        {
            cube([notchsize,notchsize,height * 2], center=true);
        }
    }
    
}



