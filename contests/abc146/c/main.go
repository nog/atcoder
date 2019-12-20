package main

import (
	"fmt"
	"math"
)

func main() {
	var a, b, x int64
	fmt.Scan(&a, &b, &x)
	fmt.Println(abc146c(a, b, x))
}

func abc146c(a int64, b int64, x int64) int64 {
	var n, d, max int64
	n = 1
	d = 1
	max = 1000000000
	for {
		p := price(a, b, n*10)
		if p < x {
			n = n * 10
			if n >= max {
				return max
			}
			continue
		}
		break
	}
	if n > 100 {
		d = n / 10
	}
	if n == 1 {
		n = 0
	}
	for {
		p := price(a, b, n+d)
		if x < p {
			if d == 1 {
				return n
			}
			d = d / 10
			continue
		}

		n = n + d
		continue
	}
}

func price(a int64, b int64, n int64) int64 {
	var result int64
	result = a*n + b*(int64(math.Log10(float64(n)))+1)
	return result
}
