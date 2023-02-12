$fieldWidth=11.4;
$baseHeight=0.8;
$fieldHeight=0.8;
$borderWidth=1;
$borderHeight=6.6;
$edgeWidth=0.5;

$width=16;
$height=16;

module board(center=true) {
x=(center)?(-($borderWidth*($width)+$fieldWidth*$width+$edgeWidth*2)/2):(0);
y=(center)?(-($borderWidth*($height)+$fieldWidth*$height+$edgeWidth*2)/2):(0);
z=(center)?(-($fieldHeight+$borderHeight)/2):(0);
translate([x, y, z]) {
union() {
w=$borderWidth*($width)+$fieldWidth*$width+$edgeWidth*2;
h=$borderWidth*($height)+$fieldWidth*$height+$edgeWidth*2;
cube([w, h, $baseHeight]);
translate([0, 0, $baseHeight]) {
cube([w, $edgeWidth, $fieldHeight+$borderHeight]);
cube([$edgeWidth, h, $fieldHeight+$borderHeight]);
translate([w-$edgeWidth, 0, 0])
cube([$edgeWidth, h, $fieldHeight+$borderHeight]);
translate([0, h-$edgeWidth, 0])
cube([w, $edgeWidth, $fieldHeight+$borderHeight]);
}
for( i = [0:$width-1]) {
for( j = [0:$height-1]) {
x=$edgeWidth+i*($fieldWidth+$borderWidth);
y=$edgeWidth+j*($fieldWidth+$borderWidth);
translate([x,y,$baseHeight]) {
difference() {
cube([$fieldWidth+$borderWidth, $fieldWidth+$borderWidth, $fieldHeight+$borderHeight]);
translate([$borderWidth/2, $borderWidth/2, $fieldHeight])
cube([$fieldWidth, $fieldWidth, $borderHeight]);
translate([$borderWidth/2+$fieldWidth*0.15, $borderWidth/2+$fieldWidth*0.15, 0])
cube([$fieldWidth*0.7, $fieldWidth*0.7, $fieldHeight]);
}
}
}
}
}
}
}

board();