module Socket() {
  difference() {
    cylinder(h = 18.5, r = 3, $fn = 50);
    translate(v = [0,0,10.5]) {
        cylinder(h = 13, r = 1.25, $fn = 30);
    } 
  }
}
difference() {
    union() {
        //cube(size = [100, 80, 5]);
        linear_extrude(5) {
            union() {
                polygon([[0,80], [35.6, 3.5], [41.6, 3.5], [6, 80]]);
                polygon([[35.6,80], [35.6, 3.5], [41.6, 3.5], [41.6, 80]]);
                polygon([[94,80], [94, 3.5], [100, 3.5], [100, 80]]);
                polygon([[38.6, 0.5], [97, 0.5], [97, 6.5], [38.6, 6.5]]);
                polygon([[6.1, 80], [94, 3.5], [100, 3.5], [12, 80]]);
                polygon([[88, 80], [37, 3.5], [43, 3.5], [93.9, 80]]);
            }
        } 
        translate(v = [97, 3.5, 0]) { 
            Socket();
        }
        translate(v = [38.6, 3.5, 0]) { 
            Socket();
        }
        translate(v = [97, 52.5, 0]) { 
            Socket();
        }
        translate(v = [38.6, 52.5, 0]) { 
            Socket();
        }
            rotate([90,0,90]){
                linear_extrude(100) {
                    polygon([[80,0], [80,5], [140, 3], [140, 0]]);
                } 
        } 
        translate([6, 84, 4]){ 
            cylinder(h = 4, r = 1, $fn = 10);
        }
    }
    translate([94, 85, 0]) {
        cylinder(h = 5, r = 2, $fn = 30);
    } 
    translate([12, 90, 0]) {
        cube([23.6, 60, 5]);
    } 
    translate([41.6, 90, 0]) {
        cube([45, 60, 5]);
    } 
}
