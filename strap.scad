height = 3;
difference() 
{
    union()
    {
        cylinder(height, d = 5.4, $fn=20);
        translate(v = [5, 0, 0])
        {
            cylinder(height, d = 5.4, $fn=20);
        } 
        translate(v = [0, -2.7, 0])
        {
            cube(size = [5, 5.4, height]);
        } 
    }
    cylinder(h = height + 0.1, r = 1.2, $fn=20);
    translate(v = [5.2, 0, 0])
    {
        cylinder(h = height + 0.1, r = 0.6, $fn=20);
    } 
    translate(v = [0,0,2.1]) 
    {
        cylinder(h = height - 2, r = 1.7, $fn=20);
    }

}