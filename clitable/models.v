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
	border  BorderStyle = square_border_style
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
