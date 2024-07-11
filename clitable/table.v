module clitable

pub struct Table {
mut:
	columns []Column
	rows    []Row
pub mut:
	padding int    = 1
	border  Border = .square
}

// add_column adds a column to the table with the given name
pub fn (mut t Table) add_column(name string) {
	t.columns << Column.new(name)
}

// add_row adds a row to the table with the given values
pub fn (mut t Table) add_row(values []string) {
	if t.columns.len != values.len {
		panic('Number of values does not match number of columns')
	}
	t.rows << Row.new(values)
}
