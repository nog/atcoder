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
	results := make([]int, 6)
	for i := 0; i < n; i++ {
		max := nextFloat64()
		min := nextFloat64()
		if max >= 35.0 {
			results[0]++
		}
		if max >= 30.0 && max < 35.0 {
			results[1]++
		}
		if max >= 25.0 && max < 30.0 {
			results[2]++
		}
		if min >= 25 {
			results[3]++
		}
		if min < 0 && max >= 0 {
			results[4]++
		}
		if max < 0 {
			results[5]++
		}
	}
	for i, r := range results {
		fmt.Print(r)
		if i != len(results)-1 {
			fmt.Print(" ")
		} else {
			fmt.Println("")
		}
	}
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
