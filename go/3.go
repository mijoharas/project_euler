package main

import "fmt"
import "math"

func main() {
	n := 600851475143
	i := 775147
	for i > 0 {
		if isPrime(i) {
			if n%i == 0 {
				fmt.Println(i)
				return
			}
		}
		i -= 2
	}
}

func isPrime(n int) bool {
	if n == 2 {
		return true
	}
	if n%2 == 0 {
		return false
	}
	for i := 3; i < int(math.Pow(float64(n), 1.0/2.0)); i += 2 {
		if n%i == 0 {
			return false
		}
	}
	return true
}
