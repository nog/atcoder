package main

import (
	"fmt"
	"strings"
)

func main() {
	var s string
	fmt.Scan(&s)
	list := strings.Split(s, "")
	cnt := len(s)
	result := 0
	for i := 0; i < int(cnt/2); i++ {
		if list[i] == list[cnt-i] {
			result++
		}
	}
	fmt.Println(result)
}
