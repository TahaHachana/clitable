module clitable

enum HorizontalBorder {
	top
	separator
	bottom
}

struct BorderStyle {
	light_horizontal              string
	light_vertical                string
	light_down_and_right          string
	light_down_and_left           string
	light_up_and_right            string
	light_up_and_left             string
	light_vertical_and_right      string
	light_vertical_and_left       string
	light_down_and_horizontal     string
	light_up_and_horizontal       string
	light_vertical_and_horizontal string
}

pub enum Border {
	square
	rounded
	ascii
	double
	heavy
}

fn (b Border) get_style() BorderStyle {
	return match b {
		.square { square_border_style }
		.rounded { rounded_border_style }
		.ascii { ascii_border_style }
		.double { double_border_style }
		.heavy { heavy_border_style }
	}
}
