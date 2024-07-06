import clitable

fn main() {
	// Define table data
	table := [
		['Name', 'Age', 'Occupation'],
		['Alice', '30', 'Engineer'],
		['Bob', '24', 'Designer'],
		['Charlie', '29', 'Teacher'],
	]

	// Print the table using the vtable module
	clitable.print_table(table)
}
