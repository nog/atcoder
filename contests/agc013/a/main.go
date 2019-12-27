package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

var sc = bufio.NewScanner(os.Stdin)

func main() {
	sc.Split(bufio.ScanWords)
	n := nextInt()
	result := 1
	first := nextInt()
	last := nextInt()
	for i := 0; i < n-2; i++ {
		next := nextInt()
		if first == last {
			last = next
			continue
		} else if first > last {
			if last >= next {
				last = next
				continue
			}
		} else if first < last {
			if last <= next {
				last = next
				continue
			}
		}
		first = next
		last = nextInt()
		i = i + 1
		result++
	}
	fmt.Println(result)
}

// 引数処理
func next() string {
	sc.Scan()
	return sc.Text()
}

func nextInt() int {
	a, _ := strconv.Atoi(next())
	return a
}

func nextFloat64() float64 {
	a, _ := strconv.ParseFloat(next(), 64)
	return a
}

func nextInts(n int) []int {
	ret := make([]int, n)
	for i := 0; i < n; i++ {
		ret[i] = nextInt()
	}
	return ret
}

func nextFloats(n int) []float64 {
	ret := make([]float64, n)
	for i := 0; i < n; i++ {
		ret[i] = nextFloat64()
	}
	return ret
}

func nextStrings(n int) []string {
	ret := make([]string, n)
	for i := 0; i < n; i++ {
		ret[i] = next()
	}
	return ret
}
