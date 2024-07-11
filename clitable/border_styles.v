module clitable

// Square style box drawing characters
const square_border_style = BorderStyle{
	light_horizontal: '─'
	light_vertical: '│'
	light_down_and_right: '┌'
	light_down_and_left: '┐'
	light_up_and_right: '└'
	light_up_and_left: '┘'
	light_vertical_and_right: '├'
	light_vertical_and_left: '┤'
	light_down_and_horizontal: '┬'
	light_up_and_horizontal: '┴'
	light_vertical_and_horizontal: '┼'
}

// Rounded corners box drawing characters
const rounded_border_style = BorderStyle{
	light_horizontal: '─'
	light_vertical: '│'
	light_down_and_right: '╭'
	light_down_and_left: '╮'
	light_up_and_right: '╰'
	light_up_and_left: '╯'
	light_vertical_and_right: '├'
	light_vertical_and_left: '┤'
	light_down_and_horizontal: '┬'
	light_up_and_horizontal: '┴'
	light_vertical_and_horizontal: '┼'
}

// Ascii style box drawing characters
const ascii_border_style = BorderStyle{
	light_horizontal: '-'
	light_vertical: '|'
	light_down_and_right: '+'
	light_down_and_left: '+'
	light_up_and_right: '+'
	light_up_and_left: '+'
	light_vertical_and_right: '+'
	light_vertical_and_left: '+'
	light_down_and_horizontal: '+'
	light_up_and_horizontal: '+'
	light_vertical_and_horizontal: '+'
}

// Double line style box drawing characters
const double_border_style = BorderStyle{
	light_horizontal: '═'
	light_vertical: '║'
	light_down_and_right: '╔'
	light_down_and_left: '╗'
	light_up_and_right: '╚'
	light_up_and_left: '╝'
	light_vertical_and_right: '╠'
	light_vertical_and_left: '╣'
	light_down_and_horizontal: '╦'
	light_up_and_horizontal: '╩'
	light_vertical_and_horizontal: '╬'
}