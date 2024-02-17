thickness = 3;
inside_width = 46;
depth = 2;
border = 3;
height = 16;
total_width = inside_width + border * 2;
support_width = 20;
top_border = 15;

module holder(){
    union() {
        cube([support_width, thickness, height]);
        translate(v = [height, thickness, 0])
        {
            rotate(a = [0, 90, 0])
            {
                translate([-support_width + thickness, 0, -height]) 
                { 
                    linear_extrude(height = support_width) 
                    {
                        polygon([[0, thickness * 2], [thickness * 1.2, -thickness], [0, -thickness]]);
                    }
                }
            }
            cube([support_width, thickness]);
        } 
    }
}

union() 
{
    difference() 
    {
        cube([total_width, total_width + top_border, thickness]);
        translate([border, border, thickness - depth])
        {
            cube([inside_width, inside_width, depth]);
        } 
    }
    
    translate(v = [total_width  / 2 - support_width / 2 , 0, 0])
    {
        holder();
    } 
    translate([0, inside_width / 2 + support_width /2, 0 ])
    {
        rotate([0, 0, 270])
        {
            holder();
        } 
    } 
    translate([total_width, inside_width / 2 - support_width /2, 0 ])
    {
        rotate([0, 0, 90])
        {
            holder();
        } 
    } 
}