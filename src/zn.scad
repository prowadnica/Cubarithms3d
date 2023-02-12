$fa = 0.01; $fs = 0.1; 

$width=10;

$dotHeight = 0.8;
$dotBase = 1.3;
$dotWidth= 2.3;

module brailleDot() {
scale([$dotBase, $dotBase, $dotHeight*2])
difference() {
sphere(d=1);
translate([0,0,-1])
cylinder(d=1,h=1);
}
}

module braillePoints(p) {
l=$dotWidth/2;
r=$dotWidth;
for(i = [0: len(p)-1]) {
if(p[i]==1)
translate([-l,r,0]) brailleDot();
if(p[i]==2)
translate([-l,0,0]) brailleDot();
if(p[i]==3)
translate([-l,-r,0]) brailleDot();
if(p[i]==4)
translate([l,r,0]) brailleDot();
if(p[i]==5)
translate([l,0,0]) brailleDot();
if(p[i]==6)
translate([l,-r,0]) brailleDot();
}
}

module zn() {

difference() {
translate([0,0,-$dotHeight*0.75/2,])
cube([$width,$width,$width+$dotHeight*0.75], true);
translate([0, 0, -$width/2-$dotHeight*0.75])
cylinder(d=7, h=$dotHeight*0.75);
}

translate([0, 0, $width/2])
cylinder(d=7, h=$dotHeight*0.8);

translate([0, -$width/2, 0])
rotate([90,0,0])
braillePoints([1,3,4,6]);

translate([0, $width/2, 0])
rotate([-90,0,0])
braillePoints([1,3,4,5,6]);

translate([-$width/2, 0, 0])
rotate([-90, 0, 0])
rotate([0, -90, 0])
braillePoints([1, 3, 5, 6]);

translate([$width/2, 0, 0])
rotate([-90, 0, 0])
rotate([0, 90, 0])
braillePoints([2, 3, 4, 5]);
}

zn();