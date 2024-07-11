module clitable

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
