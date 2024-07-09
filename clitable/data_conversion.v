module clitable

// Table from struct array
pub fn table_from_structs[T](structs []T) Table {
	mut columns := []Column{}
	$for field in T.fields {
		columns << Column.new(field.name)
	}
	mut rows := []Row{}

	for s in structs {
		mut values := []string{}
		$for field in T.fields {
			$if field.typ is string {
				values << s.$(field.name)
			} $else {
				values << s.$(field.name).str()
			}
		}
		rows << Row.new(values)
	}
	return Table{
		columns: columns
		rows: rows
		padding: 1
	}
}
