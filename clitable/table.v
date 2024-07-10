module clitable

import arrays

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

fn print_horizontal_border(widths []int, border HorizontalBorder, border_style BorderStyle, padding int) {
	mut acc := ''
	for i, width in widths {
		if i == 0 {
			acc += match border {
				.top { border_style.light_down_and_right }
				.separator { border_style.light_vertical_and_right }
				.bottom { border_style.light_up_and_right }
			}
		} else {
			acc += match border {
				.top { border_style.light_down_and_horizontal }
				.separator { border_style.light_vertical_and_horizontal }
				.bottom { border_style.light_up_and_horizontal }
			}
		}
		acc += border_style.light_horizontal.repeat(width + (padding * 2))
	}
	acc += match border {
		.top { border_style.light_down_and_left }
		.separator { border_style.light_vertical_and_left }
		.bottom { border_style.light_up_and_left }
	}
	println(acc)
}

// Calculate the maximum width of each column
fn calculate_column_widths(table [][]string) []int {
	mut widths := []int{len: table[0].len, init: 0}
	for row in table {
		for i, cell in row {
			if cell.len > widths[i] {
				widths[i] = cell.len
			}
		}
	}
	return widths
}

// Create a formatted string for a row based on column widths
fn format_row(row []string, widths []int, border_style BorderStyle, padding int) string {
	mut formatted_row := ''
	for i, cell in row {
		formatted_row += ' '.repeat(padding) + cell + ' '.repeat(widths[i] - cell.len) +
			' '.repeat(padding) + border_style.light_vertical
	}
	return border_style.light_vertical + formatted_row
}

// Print the table
pub fn print_table(table Table) {
	columns := table.columns.map(|c| c.name)
	rows := arrays.append([columns], table.rows.map(|r| r.values))
	padding := table.padding
	border_style := table.border

	if rows.len == 0 {
		println('Empty table')
		return
	}

	// Calculate column widths
	widths := calculate_column_widths(rows)

	// Print top border
	print_horizontal_border(widths, HorizontalBorder.top, border_style, padding)

	// Print header row
	println(format_row(rows[0], widths, border_style, padding))

	// Print separator line
	print_horizontal_border(widths, HorizontalBorder.separator, border_style, padding)

	// Print data rows except the last one
	for row in rows[1..rows.len - 1] {
		println(format_row(row, widths, border_style, padding))
		print_horizontal_border(widths, HorizontalBorder.separator, border_style, padding)
	}

	// Print last row without separator line
	println(format_row(rows[rows.len - 1], widths,  border_style,padding))

	// Print bottom border
	print_horizontal_border(widths, HorizontalBorder.bottom, border_style, padding)
}

pub fn print_structs[T](structs []T) {
	table := table_from_structs(structs)
	print_table(table)
}
