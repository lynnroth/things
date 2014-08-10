hosedia = 82/2;
hose_depth = 25;
window_width = 30;
window_length = 150;
window_depth = 25;

difference()
{
	hull()
	{
	cylinder(r=hosedia, h=hose_depth);
	translate([-window_width/2, -window_length/2,60])
	cube([window_width, window_length, window_depth]);
	}
	hull()
	{
	cylinder(r=hosedia - 3, h=hose_depth + 1);
	translate([-window_width/2, -window_length/2,60])
	cube([window_width - 3, window_length - 3, window_depth + 1]);
	}
}