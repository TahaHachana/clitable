module clitable

pub struct Column {
	name string
}

fn Column.new(name string) Column {
	return Column{
		name: name
	}
}

pub struct Row {
	values []string
mut:
	current_idx int = -1
}

fn Row.new(values []string) Row {
	return Row{
		values: values
	}
}

fn (mut r Row) next() ?string {
	r.current_idx++
	if r.current_idx >= r.values.len {
		return none
	}
	return r.values[r.current_idx]
}

pub struct Table {
mut:
	columns []Column
	rows    []Row
pub mut:
	padding int = 1
}

pub fn (mut t Table) add_column(name string) {
	t.columns << Column.new(name)
}

pub fn (mut t Table) add_row(values []string) {
	if t.columns.len != values.len {
		panic('Number of values does not match number of columns')
	}
	t.rows << Row.new(values)
}
