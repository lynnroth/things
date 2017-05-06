inmm = 25.4;

a = 9*inmm;
a2 = (a-(.25*inmm));
b = 1.5*inmm;
$fn=150;

ratio = .778;
//ratio = 1;


module assem1()
{
difference()
{
    
    union()
    {
       
        band();
        side();
        rotate([0,0,180])
            side();
    }
    translate([-6*inmm, -6*inmm, -12*inmm])
    {
        cube([12*inmm,12*inmm,12*inmm]);
    }
}
}
//assem1();
//assem2();
//translate([0,0,147])
//rotate([90,0,90])
cross();

module cross()
{
    translate([-12.5,10,0])
        cube([25,10,3]);
    translate([-5,0,0])
        cube([10,25,3]);
    translate([0,-10,0])
        scale([1.0,1.3,1.0]) cylinder(d=25, 3); 
    translate([-5,-27,0])
        cube([10,25,3]);
    
}
module assem2()
{
difference()
{
    rotate([90,0,0])
    translate([0,0,-.5*inmm])
    {
        difference()
        {
            cylinder(d=a+.5*inmm, h=1*inmm);
            cylinder(d=a+.25*inmm, h=1*inmm);
        }
    }
    difference()
    {
        scale([1.0,ratio,1.0]) cylinder(d=a* 3, h=b); 
        scale([1.0,ratio,1.0]) cylinder(d=a2, h=b+.1); 
    }
     translate([-6*inmm, -6*inmm, -12*inmm])
        {
            cube([12*inmm,12*inmm,12*inmm]);
        }
}
}

module band()
{
    difference()
    {
        scale([1.0,ratio,1.0]) cylinder(d=a+.15*inmm, h=b); 
        scale([1.0,ratio,1.0]) cylinder(d=a2, h=b+.1); 
    }
}



module side()
{
    translate([0,4,0])
    rotate([25,0,0])
    difference()
    {
        
        scale([1,ratio,1])
        {
            difference()
            {
                sphere(d=a+.25*inmm);
                sphere(d=a);
            }
        }
        translate([-6*inmm, 0, 0])
        {
            cube([12*inmm,12*inmm,12*inmm]);
        }

        translate([-6*inmm, -6*inmm, -12*inmm])
        {
            cube([12*inmm,12*inmm,12*inmm]);
        }
    }
}

