$fa = 0.01; $fs = 0.1; 

$width=10;

$dot4Height = 0.8;
$dot4Base = 2;
$dot4Width= 3;
$height=0.8;
$dot6Height = 0.8;
$dot6Base = 1.3;
$dot6Width= 2.3;

module braille4Dot() {
scale([$dot4Base, $dot4Base, $dot4Height*2])
difference() {
sphere(d=1);
translate([0,0,-1])
cylinder(d=1,h=1);
}
}

module braille4Points(p) {
l=$dot4Width/2;
for(i = [0: len(p)-1]) {
if(p[i]==1)
translate([l,l,0]) braille4Dot();
if(p[i]==2)
translate([-l,l,0]) braille4Dot();
if(p[i]==3)
translate([-l,-l,0]) braille4Dot();
if(p[i]==4)
translate([l,-l,0]) braille4Dot();
}
}

module cyf() {
translate([0,0,-$dot4Height*0.75/2,])
cube([$width,$width,$width+$dot4Height*0.75], true);
translate([0, 0, $width/2])
braille4Points([1,2,3,4]);

translate([0, -$width/2, 0])
rotate([90,0,0])
braille4Points([1,2,3]);

translate([0, $width/2, 0])
rotate([-90,0,0])
braille4Points([1]);

translate([-$width/2, 0, 0])
rotate([0,-90,0])
braille4Points([1, 3]);

translate([$width/2, 0, 0])
rotate([0,90,0])
braille4Points([1, 4]);
}

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

module braille6Dot() {
scale([$dot6Base, $dot6Base, $dot6Height*2])
difference() {
sphere(d=1);
translate([0,0,-1])
cylinder(d=1,h=1);
}
}

module braille6Points(p) {
l=$dot6Width/2;
r=$dot6Width;
for(i = [0: len(p)-1]) {
if(p[i]==1)
translate([-l,r,0]) braille6Dot();
if(p[i]==2)
translate([-l,0,0]) braille6Dot();
if(p[i]==3)
translate([-l,-r,0]) braille6Dot();
if(p[i]==4)
translate([l,r,0]) braille6Dot();
if(p[i]==5)
translate([l,0,0]) braille6Dot();
if(p[i]==6)
translate([l,-r,0]) braille6Dot();
}
}

module zn() {

difference() {
translate([0,0,-$dot6Height*0.75/2,])
cube([$width,$width,$width+$dot6Height*0.75], true);
translate([0, 0, -$width/2-$dot6Height*0.75])
cylinder(d=7, h=$dot6Height*0.75);
}

translate([0, 0, $width/2])
cylinder(d=7, h=$dot6Height*0.8);

translate([0, -$width/2, 0])
rotate([90,0,0])
braille6Points([1,3,4,6]);

translate([0, $width/2, 0])
rotate([-90,0,0])
braille6Points([1,3,4,5,6]);

translate([-$width/2, 0, 0])
rotate([-90, 0, 0])
rotate([0, -90, 0])
braille6Points([1, 3, 5, 6]);

translate([$width/2, 0, 0])
rotate([-90, 0, 0])
rotate([0, 90, 0])
braille6Points([2, 3, 4, 5]);
}

for( i = [0:3]) {
for( j = [0:1]) {
translate([i*15, j*15, 0])
if(j==0)
cyf();
else
op();
}
}