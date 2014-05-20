package main

import "fmt"

func main() {
	// lets put in some fibonnacci stuff here.
	fmt.Println(find_fibonnacci_stuff())
}

func find_fibonnacci_stuff() int {
	fib_old := 1
	fib_new := 1
	var total int
	for fib_new < 4000000 {
		fib_old, fib_new = fib_new, fib_old+fib_new
		if fib_new%2 == 0 {
			total += fib_new
		}
	}
	return total
}
