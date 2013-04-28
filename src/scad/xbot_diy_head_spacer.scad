height = 19.5;
head_radius = 90 / 2;
hole_radius = 13.5 / 2;
motor_arm_cuts = 4;
cutwidth = 5.5;
cutdepth = 2.05;

$fn = 100;

xbot_head_spacer(height, hole_radius, head_radius, motor_arm_cuts, cutwidth, cutdepth);

module xbot_head_spacer(mh, hr, topr, numcut, cutw, cutd) {
	difference() {
	union() {
	difference() {
		cylinder(r = hr * 1.5, h = 3, center = false, $fn = 50);
		for (i = [0 : numcut - 1]) {
			rotate([0, 0, i * 90])
			translate([(hr) / 2, 0, cutd / 2 - 0.01]) cube([hr * 2, cutw, cutd], center=true);
		}
	}
	//midsection
	translate([0, 0, 3 - 0.01])
		cylinder(r = hr, h = mh - 3 + 0.01, center = false, $fn = 50);
	// round end
	translate([0, 0, -topr + 0.515]) difference() {
		translate([0, 0, mh]) sphere(r = topr);
		translate([0, 0, mh - 0.515]) cube([topr * 2, topr * 2, topr * 2], center=true);
	}
	}
	// set screw
	translate([0, 0, mh - 10 + 1.51]) 
		cylinder(r1 = 1.1, r2 = 1.65, h = 10, center = false, $fn=50);
	}
}