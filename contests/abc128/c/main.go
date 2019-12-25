package main

import (
	"fmt"
)

func debug(x interface{}) {
	// pp.Print(x)
}

type light struct {
	switches []int
	count    int
}

func main() {
	var n, m int
	fmt.Scan(&n, &m)

	lights := make([]*light, m)
	for i := range lights {
		var lightsSize int
		fmt.Scan(&lightsSize)
		l := new(light)
		l.switches = make([]int, lightsSize)
		for i := range l.switches {
			var v int
			fmt.Scan(&v)
			l.switches[i] = v
		}
		lights[i] = l
	}

	for _, l := range lights {
		var count int
		fmt.Scan(&count)
		l.count = count
	}
	fmt.Println(abc128c(n, &lights))
}

func abc128c(n int, lights *[]*light) int {
	var result int
	result = 0
	bits := 1 << uint(n)
BITS_LOOP:
	for bit := 0; bit < bits; bit++ {
		for _, l := range *lights {
			count := 0
			for _, s := range l.switches {
				if bit&(1<<uint(s-1)) > 0 {
					count++
				}
			}
			if (count & 1) != l.count {
				continue BITS_LOOP
			}
		}
		result++
	}
	return result
}
