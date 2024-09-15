import clitable

mut table := clitable.Table{
	border: clitable.Border.ascii
}

table.add_column('Name')
table.add_column('Age')
table.add_column('Occupation')
table.columns[2].width = 15

table.add_row(['Alice', '30', 'Senior Software Engineer'])
table.add_row(['Bob', '24', 'Designer'])
table.add_row(['Charlie', '29', 'Teacher'])

clitable.print_table(table)
