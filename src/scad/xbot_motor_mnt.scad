xbot_motor_mount();

module xbot_motor_mount() {
	difference() {
		union() {
			// body
			cylinder(r = 13.25, h = 24, center = true, $fn=24);
			// feet
			for (i = [-8.5, 8.5]) {
				translate([i, 0, -14]) cube([4, 15, 9.5], center=true);
			}
		}
		translate([-6, -20, -3]) cube([12.75, 40, 50], center=false);
		translate([-6, -7.5, -10]) cube([12.75, 30, 50], center=false);
	}
}