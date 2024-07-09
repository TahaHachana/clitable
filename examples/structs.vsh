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
