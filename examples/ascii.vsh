import clitable

mut table := clitable.Table{
	border: clitable.Border.ascii
}

table.add_column('Name')
table.add_column('Age')
table.add_column('Occupation')

table.add_row(['Alice', '30', 'Engineer'])
table.add_row(['Bob', '24', 'Designer'])
table.add_row(['Charlie', '29', 'Teacher'])

clitable.print_table(table)

// Output:
// +---------+-----+------------+
// | Name    | Age | Occupation |
// +---------+-----+------------+
// | Alice   | 30  | Engineer   |
// +---------+-----+------------+
// | Bob     | 24  | Designer   |
// +---------+-----+------------+
// | Charlie | 29  | Teacher    |
// +---------+-----+------------+
