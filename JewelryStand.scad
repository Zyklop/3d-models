baseWidth = 100;
height = 150;
holeDist = 16;
radius = 10;

module horz_bar(){
    difference() {
        cube([baseWidth, 5, 15]);
        for (i = [radius + holeDist/2:holeDist:baseWidth-radius-holeDist/2]) {
          rotate([90, 0,0]){
            translate([i, 10, -10]){
                cylinder(h = 20, r = 1, $fn = 7);
            } 
          } 
        }
    }
}

module bridge(){
    difference() {
        rotate([0, 270, 270]) {
            linear_extrude(5){
                polygon([[0,0], [baseWidth/3, 0], [baseWidth/3, baseWidth], [0, baseWidth], [baseWidth/3-10, baseWidth/2]]);
            } 
        }
        for (i = [radius + holeDist/2:holeDist:baseWidth-radius-holeDist/2]) {
            translate([i, 5, baseWidth/3-5]){
                rotate([90, 0,0]){
                    cylinder(h = 20, r = 1, $fn = 7);
            } 
          } 
        }
    }
}

module hanger(){
    translate([-15, 0, 0]){ 
        difference() {
            union() {
                sphere(10);
                translate([15,0,0]){
                    sphere(10);
                } 
                translate([-5,0,0]){
                    rotate([0,90,0]) 
                    cylinder(h = 5, r = 15);
                } 
                rotate([270, 0, 0]){
                    translate([0,-0.5,-2.5]){ 
                        linear_extrude(height = 5){
                            polygon(points = [[-5,0], [-5, 15], [15, 30], [15, 0]]);
                        } 
                    }
                } 
            }
            translate([-10,-20,-20]) {
                cube([5, 40, 40]);
            } 
            translate([15,-20,-20]) {
                cube([20, 40, 40]);
            } 
        }
    }
}

union(){
    //rigth support
    translate([baseWidth,height,0]) {
        rotate([180, 270, 0]){
            rotate_extrude(angle = 90, convexity = 10, $fn = 100){
                translate([height, 0, 0]){
                    circle(r = 10, $fn = 30);
                }
            }
        }
    };
    //left support
    translate([0,height,0]) {
        rotate([180, 270, 0]){
            rotate_extrude(angle = 90, convexity = 10, $fn = 100){
                translate([height, 0, 0]){
                    circle(r = 10, $fn = 30);
                }
            }
        }
    };
    //lower holes
    translate([0,-7,0]) {
        for (i = [0:1:7]) {
            rotate([-i*2.85,0,0]){ 
                translate([0,0,i*14.7]){
                    rotate([-i*3.3,0,0]){
                        horz_bar();
                    } 
                } 
            }
        }
    }
    //left side
    translate([2.5,0,0]) {
        rotate([0,270,0]){
            linear_extrude(height = 5){
                polygon(points = [[0,height], [0, height-20], [height/1.5, height/4], [height/1.1, height/1.5], [height, height]]);
            } 
        } 
    }
    //right side
    translate([baseWidth + 2.5,0,0]) {
        rotate([0,270,0]){
            linear_extrude(height = 5){
                polygon(points = [[0,height], [0, height-20], [height/1.5, height/4], [height/1.1, height/1.5], [height, height]]);
            } 
        } 
    }
    translate(v = [0, height - 20, 0]){
        cube([baseWidth, 20, 2]);
    } 
    //bridges
    translate([0, height/2.5, height / 1.65]) {
        bridge();
    } 
    translate([0, height/1.7, height / 1.4]) {
        bridge();
    } 
    translate([0, height/1.27, height / 1.3]) {
        bridge();
    } 
    translate([0, height - 5, height - baseWidth/3.3]) {
        bridge();
    } 
    //left hangers
    translate([-2.5, height / 1.8, height / 1.5]){
        hanger();
    } 
    translate([-2.5, height / 1.2, height / 1.5]){
        hanger();
    } 
    //right hangers
    translate([baseWidth + 2.5, height / 1.8, height / 1.5]){
        mirror(v = [1,0,0]){ 
            hanger();
        }
    } 
    translate([baseWidth + 2.5, height / 1.2, height / 1.5]){
        mirror(v = [1,0,0]){ 
            hanger();
        }
    } 
}
