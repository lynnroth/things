
width = 15;
depth = 5;
height = 15;

thickness = 1;

difference()
{
    cube([
            width+thickness*2, 
            depth+thickness*2,
            height+thickness
          ]);
    translate([thickness,thickness,thickness])
    cube([
        width, 
        depth,
        height+.1
      ]);
}