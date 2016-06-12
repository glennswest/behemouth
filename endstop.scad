

screw_spacing = 30;
screw_half = screw_spacing / 2;
endstop_size = 13.5;
endstop_radius = endstop_size / 2;
endstop_spacing = 4.5;
endstop_spacing_half = endstop_spacing / 2;

use <MCAD/nuts_and_bolts.scad>;
$fn=256;


difference(){
    translate([-20,-5,0]) cube([40,27,12]);
    translate([-20.1,-5.1,5]) cube([40.2,12.2,2]);
    translate([0,2+endstop_spacing + endstop_radius,-.1]) cylinder(r=endstop_radius,h=20);
    translate([0-screw_half,0,0.8]) boltHole(3,length=20);
    translate([screw_half,0,0.8]) boltHole(3,length=20);
    translate([0-screw_half,0,11.5]) nutHole(3.2);
    translate([screw_half,0,11.5]) nutHole(3.2);
}