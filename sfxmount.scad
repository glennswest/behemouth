border = 1;

atx_width = 150-border*2;
atx_height = 80-border*2;

ridge = 3;

atx_screws = [ [8, 8+3, 0], [140, 8+3, 0], [ 8, 64+3, 0], [140, 64+3, 0] ];

sfx_width = 125.0;
sfx_height = 63.3;

sfx_screws = [ [6-border, 6-border, 0.0], [6-border, 51.5+6-border, 0.0],
		[6+88+25-border, 31.6-border, 0.0] ];
		
screw_r = 3.5052/2;

plate_d = 5.0;
plate_m = 0.05;

adaptor();

module adaptor()
{
	union()
	{
				cube([ridge, atx_height, plate_d*2]);
				cube([atx_width, ridge, plate_d*2]);
				translate([atx_width-ridge, 0.0, 0.0]) cube([ridge, atx_height, plate_d*2]);
				translate([0.0, atx_height-ridge, 0.0]) cube([atx_width, ridge, plate_d*2]);
		translate([atx_width, 0.0, 0]) mirror([1.0, 0.0, 0.0]) difference()
		{
			union()
			{
				cube([atx_width, atx_height, plate_d]);
			}
			union()
			{
				// mount holes
				translate([0.0, 0.0, -plate_m]) for(i=[0:1:3])
				{
					translate(atx_screws[i]) cylinder(plate_d+plate_m*2,
							screw_r, screw_r, $fn=15);
                    translate([0,0,3+plate_m]) translate(atx_screws[i]) cylinder(plate_d+plate_m,
							screw_r*2, screw_r*2, $fn=15);
				}
				// SFX holes
				translate([(atx_width-sfx_width)/2, (atx_height-sfx_height)/2, -plate_m]) for(i=[0:1:2])
				{
					translate(sfx_screws[i]) cylinder(plate_d+plate_m*2,
							screw_r, screw_r, $fn=15);
                   translate([0,0,0-plate_d/2]) translate(sfx_screws[i]) cylinder(plate_d+plate_m*2,
							4, 4, $fn=15);
				}
				// SFX cutouts
				translate([(atx_width-sfx_width)/2, (atx_height-sfx_height)/2, -plate_m]) 
				{
					translate([10.0, 3.0, 0.0]) cube([sfx_width-10.0*2,
							sfx_height-3.0*2, plate_d+plate_m*2]);
				 	translate([3.0, 10.0+1, 0.0]) cube([sfx_width-3.0-10.0,
							sfx_height-10.0*2-2, plate_d+plate_m*2]);
				 	translate([10.0, 3.0, 0.0]) cube([sfx_width-10.0-3.0,
							31.6-5.0-3.0-2, plate_d+plate_m*2]);
					translate([10.0, sfx_height-(31.6-5.0-3.0)-3.0, 0.0]) cube([sfx_width-10.0-3.0,
							31.6-5.0-3.0, plate_d+plate_m*2]);
				}
			}
		}
	}
}
