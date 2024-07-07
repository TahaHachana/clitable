module clitable

import arrays

// Box drawing characters
const box_drawing_light_horizontal = '─'
const box_drawing_light_vertical = '│'
const box_drawing_light_down_and_right = '┌'
const box_drawing_light_down_and_left = '┐'
const box_drawing_light_up_and_right = '└'
const box_drawing_light_up_and_left = '┘'
const box_drawing_light_vertical_and_right = '├'
const box_drawing_light_vertical_and_left = '┤'
const box_drawing_light_down_and_horizontal = '┬'
const box_drawing_light_up_and_horizontal = '┴'
const box_drawing_light_vertical_and_horizontal = '┼'

pub fn (mut t Table) add_column(name string) {
	t.columns << Column.new(name)
}

pub fn (mut t Table) add_row(values []string) {
	if t.columns.len != values.len {
		panic('Number of values does not match number of columns')
	}
	t.rows << Row.new(values)
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

// Print a border line
fn print_border(widths []int, acc string, middle_drawing string, end_drawing string) {
	if widths.len == 1 {
		println(acc + clitable.box_drawing_light_horizontal.repeat(widths[0] + 2) + end_drawing)
	} else {
		print_border(widths[1..], acc + clitable.box_drawing_light_horizontal.repeat(widths[0] +
			2) + middle_drawing, middle_drawing, end_drawing)
	}
}

// Print the top border of the table
fn print_top_border(widths []int, acc string) {
	print_border(widths, acc, clitable.box_drawing_light_down_and_horizontal, clitable.box_drawing_light_down_and_left)
}

// Print a separator line between rows
fn print_separator_line(widths []int, acc string) {
	print_border(widths, acc, clitable.box_drawing_light_vertical_and_horizontal, clitable.box_drawing_light_vertical_and_left)
}

fn print_bottom_border(widths []int, acc string) {
	print_border(widths, acc, clitable.box_drawing_light_up_and_horizontal, clitable.box_drawing_light_up_and_left)
}

// Create a formatted string for a row based on column widths
fn format_row(row []string, widths []int) string {
	mut formatted_row := ''
	for i, cell in row {
		formatted_row += ' ' + cell + ' '.repeat(widths[i] - cell.len) + ' ' +
			clitable.box_drawing_light_vertical
	}
	return clitable.box_drawing_light_vertical + formatted_row
}

// Print the table
pub fn print_table(table Table) {
	columns := table.columns.map(|c| c.name)
	rows := arrays.append([columns], table.rows.map(|r| r.values))

	if rows.len == 0 {
		println('Empty table')
		return
	}

	// Calculate column widths
	widths := calculate_column_widths(rows)

	// Print top border
	print_top_border(widths, clitable.box_drawing_light_down_and_right)

	// Print header row
	println(format_row(rows[0], widths))

	// Print separator line
	print_separator_line(widths, clitable.box_drawing_light_vertical_and_right)

	// Print data rows except the last one
	for row in rows[1..rows.len - 1] {
		println(format_row(row, widths))
		print_separator_line(widths, clitable.box_drawing_light_vertical_and_right)
	}

	// Print last row without separator line
	println(format_row(rows[rows.len - 1], widths))

	// Print bottom border
	print_bottom_border(widths, clitable.box_drawing_light_up_and_right)
}
