package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
)

var sc = bufio.NewScanner(os.Stdin)

func main() {
	n := nextInt()
	sList := nextInts(n)

	sum := 0

	for _, s := range sList {
		sum += s
	}
	if sum%10 != 0 {
		fmt.Println(sum)
		return
	}
	sort.Ints(sList)
	for _, s := range sList {
		result := sum - s
		if result%10 != 0 {
			fmt.Println(result)
			return
		}
	}
	fmt.Println(0)
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
