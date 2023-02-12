$fa = 0.01; $fs = 0.1; 

$width=10;

$dotHeight = 0.8;
$dotBase = 2;
$dotWidth= 3;

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
for(i = [0: len(p)-1]) {
if(p[i]==1)
translate([l,l,0]) brailleDot();
if(p[i]==2)
translate([-l,l,0]) brailleDot();
if(p[i]==3)
translate([-l,-l,0]) brailleDot();
if(p[i]==4)
translate([l,-l,0]) brailleDot();
}
}

module cyf() {
translate([0,0,-$dotHeight*0.75/2,])
cube([$width,$width,$width+$dotHeight*0.75], true);
translate([0, 0, $width/2])
braillePoints([1,2,3,4]);

translate([0, -$width/2, 0])
rotate([90,0,0])
braillePoints([1,2,3]);

translate([0, $width/2, 0])
rotate([-90,0,0])
braillePoints([1]);

translate([-$width/2, 0, 0])
rotate([0,-90,0])
braillePoints([1, 3]);

translate([$width/2, 0, 0])
rotate([0,90,0])
braillePoints([1, 4]);
}

cyf();