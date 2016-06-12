

screw_spacing = 30;
screw_half = screw_spacing / 2;
endstop_size = 12;
endstop_radius = endstop_size / 2;
endstop_spacing = 4.5;
endstop_spacing_half = endstop_spacing / 2;

use <MCAD/nuts_and_bolts.scad>;
$fn=256;

pulley();
translate([0,40,20]) rotate([180,0,0]) mount();

module mount(){
    
 difference(){
    translate([-20,-5,0]) cube([40,15,12]);
    translate([-20.1,-5.1,5]) cube([40.2,12.2,2]);
    translate([0-screw_half,0,0.8]) boltHole(3,length=20);
    translate([screw_half,0,0.8]) boltHole(3,length=20);
    translate([0-screw_half,0,11.5]) nutHole(3.2);
    translate([screw_half,0,11.5]) nutHole(3.2);
    }
  }

module pulley()
{
   difference(){
    translate([-20,12,-1]) cube([40,20,14]);
    translate([-20.1,-5.1,5]) cube([40.2,12.2,2]);
    translate([-10,11.1,2.5]) cube([20,12.2,7]);
    translate([0,12 + endstop_radius,1.5]) cylinder(r=endstop_radius,h=9);
    translate([0,18,0.2]) boltHole(3,length=20);
    translate([0,18,11.7]) nutHole(3.2);
  }
}
   
    
    

