module clitable

import arrays

// Box drawing characters
const light_horizontal = '─'
const light_vertical = '│'
const light_down_and_right = '┌'
const light_down_and_left = '┐'
const light_up_and_right = '└'
const light_up_and_left = '┘'
const light_vertical_and_right = '├'
const light_vertical_and_left = '┤'
const light_down_and_horizontal = '┬'
const light_up_and_horizontal = '┴'
const light_vertical_and_horizontal = '┼'

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

// Print a border line
fn print_border(widths []int, acc string, padding int, middle_drawing string, end_drawing string) {
	if widths.len == 1 {
		println(acc + clitable.light_horizontal.repeat(widths[0] + (padding * 2)) + end_drawing)
	} else {
		print_border(widths[1..], acc + clitable.light_horizontal.repeat(widths[0] +
			(padding * 2)) + middle_drawing, padding, middle_drawing, end_drawing)
	}
}

// Print the top border of the table
fn print_top_border(widths []int, acc string, padding int) {
	print_border(widths, acc, padding, clitable.light_down_and_horizontal, clitable.light_down_and_left)
}

// Print a separator line between rows
fn print_separator_line(widths []int, acc string, padding int) {
	print_border(widths, acc, padding, clitable.light_vertical_and_horizontal, clitable.light_vertical_and_left)
}

fn print_bottom_border(widths []int, acc string, padding int) {
	print_border(widths, acc, padding, clitable.light_up_and_horizontal, clitable.light_up_and_left)
}

// Create a formatted string for a row based on column widths
fn format_row(row []string, widths []int, padding int) string {
	mut formatted_row := ''
	for i, cell in row {
		formatted_row += ' '.repeat(padding) + cell + ' '.repeat(widths[i] - cell.len) +
			' '.repeat(padding) + clitable.light_vertical
	}
	return clitable.light_vertical + formatted_row
}

// Print the table
pub fn print_table(table Table) {
	columns := table.columns.map(|c| c.name)
	rows := arrays.append([columns], table.rows.map(|r| r.values))
	padding := table.padding

	if rows.len == 0 {
		println('Empty table')
		return
	}

	// Calculate column widths
	widths := calculate_column_widths(rows)

	// Print top border
	print_top_border(widths, clitable.light_down_and_right, padding)

	// Print header row
	println(format_row(rows[0], widths, padding))

	// Print separator line
	print_separator_line(widths, clitable.light_vertical_and_right, padding)

	// Print data rows except the last one
	for row in rows[1..rows.len - 1] {
		println(format_row(row, widths, padding))
		print_separator_line(widths, clitable.light_vertical_and_right, padding)
	}

	// Print last row without separator line
	println(format_row(rows[rows.len - 1], widths, padding))

	// Print bottom border
	print_bottom_border(widths, clitable.light_up_and_right, padding)
}
