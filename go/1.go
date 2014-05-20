package main

import "fmt"

func main() {
	var x int
	for y := 0; y < 1000; y++ {
		if y%3 == 0 || y%5 == 0 {
			x += y
		}
	}
	fmt.Println(x)
}
