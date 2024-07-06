module clitable

// Calculate the maximum width of each column
pub fn calculate_column_widths(table [][]string) []int {
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
pub fn format_row(row []string, widths []int) string {
	mut formatted_row := ''
	for i, cell in row {
		formatted_row += cell + ' '.repeat(widths[i] - cell.len) + '  '
	}
	return formatted_row
}

// Print the table
pub fn print_table(table [][]string) {
	if table.len == 0 {
		println('Empty table')
		return
	}

	// Calculate column widths
	widths := calculate_column_widths(table)

	// Print header row
	println(format_row(table[0], widths))

	// Print separator line
	mut separator_line := ''
	for width in widths {
		separator_line += '-'.repeat(width) + '--'
	}
	println(separator_line)

	// Print data rows
	for row in table[1..] {
		println(format_row(row, widths))
		println(separator_line)
	}
}
