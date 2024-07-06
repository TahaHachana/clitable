module clitable

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
fn calculate_column_widths(table Table) []int {
	cols := table.columns.map(|c| c.name)
	rows := table.rows
	mut cols_and_rows := [][]string{}
	cols_and_rows << cols
	for row in rows {
		cols_and_rows << row.values
	}
	mut widths := []int{len: rows.len, init: 0}
	for x in cols_and_rows {
		for i, cell in x {
			if cell.len > widths[i] {
				widths[i] = cell.len
			}
		}
	}
	return widths
}

// Create a formatted string for a row based on column widths
fn format_row(row []string, widths []int) string {
	mut formatted_row := ''
	for i, cell in row {
		formatted_row += cell + ' '.repeat(widths[i] - cell.len) + '  '
	}
	return formatted_row
}

// Print the table
pub fn print_table(table Table) {
	columns := table.columns.map(|c| c.name)
	rows := table.rows
	if rows.len == 0 {
		println('Empty table')
		return
	}

	// Calculate column widths
	widths := calculate_column_widths(table)

	// Print header row
	println(format_row(columns, widths))

	// Print separator line
	mut separator_line := ''
	for width in widths {
		separator_line += '-'.repeat(width) + '--'
	}
	println(separator_line)

	// Print data rows
	for row in rows {
		println(format_row(row.values, widths))
		println(separator_line)
	}
}
