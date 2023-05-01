length = 30;
angle = 35;
holes = 4.5;
width = 25;
cabledia = 3;

union()
{
    difference()
    {
        cube([width * 2, 10, length / 1.5], false);
        rotate([90,0,0]) translate([width, length / 2 - 5,-10])  cylinder(10,  d = holes, $fn=100);
        rotate([90,0,0]) translate([width, length / 2 - 5,- 1.5])  cylinder(1.5,  d = holes + 3, $fn=100);
        rotate([90,0,0]) translate([width, length / 2 - 5,-10])  cylinder(5, d1 = holes * 2, d2 = 0,  $fn=100);
    };
    translate([0, sin(angle) * length, cos(angle) *  (-length)]) rotate([angle, 0, 0]) 
    difference()
    {
        cube([width * 2, 10, length], false);
        rotate([90,0,0]) translate([holes * 1.5, 10,-10])  cylinder(10, d = holes, $fn=100);
        rotate([90,0,0]) translate([width * 2 - holes * 1.5, 10,-10])  cylinder(10, d = holes, $fn=100);
        rotate([0,90,0]) translate([-10 - holes, cabledia / 2, 0])  cylinder(width * 2, d = cabledia, $fn=100);
        translate([0, -cabledia / 2, 10 - holes - cabledia / 2])  cube([width * 2, cabledia, cabledia], $fn=10);
        rotate([0,90,0]) translate([-10 + holes, cabledia / 2, 0])  cylinder(width * 2, d = cabledia, $fn=100);
        translate([0, -cabledia / 2, 10 + holes - cabledia / 2])  cube([width * 2, cabledia, cabledia], $fn=10);
    }
}