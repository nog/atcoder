package main

import "fmt"

func main() {
	var a, b int
	fmt.Scan(&a, &b)
	fmt.Println(arc039a(a, b))
}

func arc039a(a int, b int) int {
	var result, d int
	if !(a/100 == 9 && b/100 == 1) {
		if 9-(a/100) > (b/100)-1 {
			d = (9 - (a / 100)) * 100
		} else {
			d = ((b / 100) - 1) * 100
		}
	} else if !(a%100/10 == 9 && b%100/10 == 0) {
		if 9-(a%100/10) > (b % 100 / 10) {
			d = (9 - (a % 100 / 10)) * 10
		} else {
			d = (b % 100 / 10) * 10
		}
	} else {
		if 9-(a%10) > (b % 10) {
			d = 9 - (a % 10)
		} else {
			d = b % 10
		}
	}
	result = a - b + d
	return result
}
