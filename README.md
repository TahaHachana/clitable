# V package for pretty printing tabular data

This package provides a simple API for pretty printing tabular data in V.

## Installation

`v install --git https://github.com/TahaHachana/clitable`

## Example:

```v
import clitable

mut table := clitable.Table{}

table.add_column('Name')
table.add_column('Age')
table.add_column('Occupation')

table.add_row(['Alice', '30', 'Engineer'])
table.add_row(['Bob', '24', 'Designer'])
table.add_row(['Charlie', '29', 'Teacher'])

clitable.print_table(table)

// Output:
// ┌─────────┬─────┬────────────┐
// │ Name    │ Age │ Occupation │
// ├─────────┼─────┼────────────┤
// │ Alice   │ 30  │ Engineer   │
// ├─────────┼─────┼────────────┤
// │ Bob     │ 24  │ Designer   │
// ├─────────┼─────┼────────────┤
// │ Charlie │ 29  │ Teacher    │
// └─────────┴─────┴────────────┘
```

## Ascii border

```v
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
```

## Print a struct array

```v
import clitable

struct Person {
	name       string
	age        int
	occupation string
}

persons := [
	Person{
		name: 'Alice'
		age: 30
		occupation: 'Engineer'
	},
	Person{
		name: 'Bob'
		age: 24
		occupation: 'Designer'
	},
	Person{
		name: 'Charlie'
		age: 29
		occupation: 'Teacher'
	},
]

clitable.print_structs(persons)

// Output:
// ┌─────────┬─────┬────────────┐
// │ name    │ age │ occupation │
// ├─────────┼─────┼────────────┤
// │ Alice   │ 30  │ Engineer   │
// ├─────────┼─────┼────────────┤
// │ Bob     │ 24  │ Designer   │
// ├─────────┼─────┼────────────┤
// │ Charlie │ 29  │ Teacher    │
// └─────────┴─────┴────────────┘
```