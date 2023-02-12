$fa = 0.01; $fs = 0.1; 
$width=10;
$height=0.8;

module oper(s) {
linear_extrude($height)
text(s, size=$width, valign="center", halign="center", font="Arial:style=Regular");
}

module op() {
difference() {
translate([0,0,-$height*0.75/2,])
cube([$width,$width,$width+$height*0.75], true);
translate([0, 0, -$width/2-$height*0.75])
difference() {
cylinder(d=7, h=$height*0.75);
translate([-7/2, 0, 0])
cube([7, 7/2, $height*0.75]);
}
}

translate([0, 0, $width/2])
oper("=");

translate([0, -$width/2, 0])
rotate([90,0,0])
oper("+");

translate([0, $width/2, 0])
rotate([-90,0,0])
oper("-");

translate([-$width/2, 0, 0])
rotate([0,-90,0])
oper("×");

translate([$width/2, 0, 0])
rotate([0,90,0])
oper("÷");
}