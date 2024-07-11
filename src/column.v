module clitable

pub struct Column {
	name string
}

fn Column.new(name string) Column {
	return Column{
		name: name
	}
}
