module clitable

import arrays

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
fn calculate_column_widths(table [][]string, columns []Column) []int {
	mut widths := table[0].map(it.len)
	for row in table {
		for i, cell in row {
			if cell.len > widths[i] {
				widths[i] = cell.len
			}
		}
	}
	for i, column in columns {
		if column.width != none {
			widths[i] = column.width or { 0 }
		}
	}
	return widths
}

// Create a formatted string for a row based on column widths
fn format_row(row []string, widths []int, border_style BorderStyle, padding int) string {
	mut row_wrapped := [][]string{}
	for i, cell in row {
		lines := arrays.chunk(cell.split(''), widths[i]).map(it.join(''))
		row_wrapped << lines
	}
	max_len := arrays.max(row_wrapped.map(it.len)) or { panic(err) }
	mut lines := []string{}
	for i in 0 .. max_len {
		mut sub_row := []string{}
		for sub_cell in row_wrapped {
			sub_row << sub_cell[i] or { '' }
		}
		mut formatted_row := ''
		for j, sub_cell in sub_row {
			formatted_row += ' '.repeat(padding) + sub_cell.trim_space() +
				' '.repeat(widths[j] - sub_cell.trim_space().len) + ' '.repeat(padding) +
				border_style.light_vertical
		}
		lines << border_style.light_vertical + formatted_row
	}
	return lines.join('\n')
}

// print_table pretty prints a table to the console
pub fn print_table(table Table) {
	columns := table.columns
	column_names := table.columns.map(|c| c.name)
	rows := arrays.append([column_names], table.rows.map(|r| r.values))
	padding := table.padding
	border_style := table.border.get_style()

	if rows.len == 0 {
		println('Empty table')
		return
	}

	// Calculate column widths
	widths := calculate_column_widths(rows, columns)

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
	println(format_row(rows[rows.len - 1], widths, border_style, padding))

	// Print bottom border
	print_horizontal_border(widths, HorizontalBorder.bottom, border_style, padding)
}

// print_structs pretty prints an array of structs as a table
pub fn print_structs[T](structs []T) {
	table := table_from_structs(structs)
	print_table(table)
}
