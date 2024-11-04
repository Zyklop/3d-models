module Socket() {
  difference() {
    cylinder(h = 18.5, r = 3, $fn = 50);
    translate(v = [0,0,10.5]) {
        cylinder(h = 8, r = 1.25, $fn = 30);
    } 
  }
}
difference() {
    union() {
        cube(size = [100, 80, 5]);
        translate(v = [96.5, 3.5, 5]) { 
            Socket();
        }
        translate(v = [39.5, 3.5, 5]) { 
            Socket();
        }
        translate(v = [96.5, 52.5, 5]) { 
            Socket();
        }
        translate(v = [39.5, 52.5, 5]) { 
            Socket();
        }
            rotate([90,0,90]){
                linear_extrude(100) {
                    polygon([[80,0], [80,5], [110, 4], [110, 0]]);
                } 
        } 
        translate([4, 84, 4]){ 
            cylinder(h = 4, r = 1, $fn = 10);
        }
    }
    translate([95, 85, 0]) {
        cylinder(h = 5, r = 2, $fn = 30);
    } 
}
