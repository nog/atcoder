package main

import "fmt"

func main() {
	var n int
	var s string
	fmt.Scan(&n)
	fmt.Scan(&s)
	fmt.Println(abc146b(n, s))
}

func abc146b(n int, s string) string {
	var result string
	aInt := int("A"[0])
	zInt := int("Z"[0])
	for i := range s {
		char := s[i]
		if int(char)+n <= zInt {
			result += string(int(char) + n)
		} else {
			result += string(int(char) + n - zInt + aInt - 1)
		}
	}
	return result
}
