height = 19.5;
head_radius = 90 / 2;
hole_radius = 21 / 2;
motor_arm_cuts = 4;
cutwidth = 5.5;
cutdepth = 2.05;

xbot_head_spacer(height, hole_radius, head_radius, motor_arm_cuts, cutwidth, cutdepth);

module xbot_head_spacer(mh, hr, topr, numcut, cutw, cutd) {
	difference() {
	union() {
	difference() {
		cylinder(r = hr, h = mh, center = false, $fn=24);
		for (i = [0 : numcut - 1]) {
			rotate([0, 0, i * 90])
			translate([(hr) / 2, 0, cutd / 2 - 0.01]) cube([hr, cutw, cutd], center=true);
		}
	}
	// round end
	translate([0, 0, -43.5]) difference() {
		translate([0, 0, mh]) sphere(r = topr);
		translate([0, 0, mh - 1.5]) cube([topr * 2, topr * 2, topr * 2], center=true);
	}
	}
	// set screw
	translate([0, 0, mh - 10 + 1.51]) 
		cylinder(r1 = 1.25, r2 = 1.65, h = 10, center = false, $fn=24);
	}
}