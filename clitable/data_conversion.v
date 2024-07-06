module clitable

// 2D string array from struct array
fn structs_to_2darrary[T](structs []T) [][]string {
	mut headers := []string{}
	$for field in T.fields {
		headers << field.name
	}
	mut rows := [][]string{}
	rows << headers

	for s in structs {
		mut values := []string{}
		$for field in T.fields {
			$if field.typ is string {
				values << s.$(field.name)
			} $else {
				values << s.$(field.name).str()
			}
		}
		rows << values
	}
	return rows
}
