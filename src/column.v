module clitable

pub struct Column {
pub mut:
	name  string
	width ?int
}

fn Column.new(name string) Column {
	return Column{
		name: name
	}
}
