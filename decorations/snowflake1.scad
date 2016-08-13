count = 3;
s(count = 6, length = 40, iterations = 4);
width = 8;
module s(count = 4, length = 40, iterations = 3)
{
    if (iterations > 0 )
    {
        for (i=[1:count])
	{
		
		rotate([0,0,360/count * i])
		{
			line(length = length, width = iterations);
			translate([length,0,0])
			s(count = 6, length = length/2, iterations = iterations - 1);
		}
		
	}
    }
}


module line(length = 20, width = 5, thickness = 5)
{
	translate([length /2,0,thickness/2])cube([length,width,thickness], center=true);
}
