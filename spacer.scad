$fn=50;

module spacer()
{
    difference(){
        cylinder(r=4.5,h=23);
        translate([0,0,-.1]) cylinder(r=2,h=24.2);
    }
}

translate([0,-10,0]) spacer();
//translate([0,-20,0]) spacer();
//translate([0,10,0]) spacer();
//translate([0,20,0]) spacer();

