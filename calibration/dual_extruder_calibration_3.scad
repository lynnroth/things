//dual extruder test
yellow = 0;
blue = 1;
u = 50;
h = .3;
layers=4;
difference()
{
    main();
    cube([u/2+1,u/2+1,30]);
    cylinder(r1=u/8, r2=u/2, h=2, $fn=40);
}


module main()
{
    color("yellow")
    if (yellow == 1)
    {
        layer(1);
        layer(3);
        
        translate([u/2,-u/2,0])
            cube([u/5,u/5,layers*h]);
    }



    color("blue")
    if (blue == 1)
    {
        layer(0);
        layer(2);
        translate([-u/2,u/2,0])
            cube([u/5,u/5,layers*h]);
    }
}

module layer(a)
{
    translate([-u/2,-u/2, a * h])
        cube([u, u, h]);
}