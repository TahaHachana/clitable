import clitable

struct Person {
	name string
	age int
}

fn test_structs_to_2darray() {
	people := [
		Person { name: "Alice", age: 30 },
		Person { name: "Bob", age: 40 },
	]
	table := clitable.structs_to_2darrary(people)
	assert table == [
		["name", "age"],
		["Alice", "30"],
		["Bob", "40"],
	]
}