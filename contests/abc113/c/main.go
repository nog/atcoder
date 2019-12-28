package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

func main() {
	io := newIo()
	defer io.Flush()
	_, m := io.NextInt(), io.NextInt()
	yearCity := make(map[int]int)
	cityYear := make([]int, m)
	cityPref := make([]int, m)
	prefYears := make(map[int][]int)
	cityRates := make([]int, m)
	for city := 0; city < m; city++ {
		pref, year := io.NextInt(), io.NextInt()
		yearCity[year] = city
		cityYear[city] = year
		cityPref[city] = pref
		prefYears[pref] = append(prefYears[pref], year)
	}
	for _, years := range prefYears {
		sort.Ints(years)
		for i, year := range years {
			rate := i + 1
			city := yearCity[year]
			cityRates[city] = rate
		}
	}
	for city := 0; city < m; city++ {
		pref := cityPref[city]
		rate := cityRates[city]
		fmt.Printf("%06d", pref)
		fmt.Printf("%06d", rate)
		fmt.Println("")
	}
}

type io struct {
	reader    *bufio.Reader
	writer    *bufio.Writer
	tokens    []string
	nextToken int
}

func newIo() *io {
	return &io{
		reader: bufio.NewReader(os.Stdin),
		writer: bufio.NewWriter(os.Stdout),
	}
}

func (io *io) Flush() {
	err := io.writer.Flush()
	if err != nil {
		panic(err)
	}
}

func (io *io) NextLine() string {
	var buffer []byte
	for {
		line, isPrefix, err := io.reader.ReadLine()
		if err != nil {
			panic(err)
		}
		buffer = append(buffer, line...)
		if !isPrefix {
			break
		}
	}
	return string(buffer)
}

func (io *io) Next() string {
	for io.nextToken >= len(io.tokens) {
		line := io.NextLine()
		io.tokens = strings.Fields(line)
		io.nextToken = 0
	}
	r := io.tokens[io.nextToken]
	io.nextToken++
	return r
}

func (io *io) NextInt() int {
	i, err := strconv.Atoi(io.Next())
	if err != nil {
		panic(err)
	}
	return i
}

func (io *io) NextFloat() float64 {
	i, err := strconv.ParseFloat(io.Next(), 64)
	if err != nil {
		panic(err)
	}
	return i
}

func (io *io) PrintLn(a ...interface{}) {
	fmt.Fprintln(io.writer, a...)
}

func (io *io) Printf(format string, a ...interface{}) {
	fmt.Fprintf(io.writer, format, a...)
}

func (io *io) PrintIntLn(a []int) {
	b := []interface{}{}
	for _, x := range a {
		b = append(b, x)
	}
	io.PrintLn(b...)
}

func (io *io) PrintStringLn(a []string) {
	b := []interface{}{}
	for _, x := range a {
		b = append(b, x)
	}
	io.PrintLn(b...)
}

func log(name string, value interface{}) {
	fmt.Fprintf(os.Stderr, "%s=%+v\n", name, value)
}
