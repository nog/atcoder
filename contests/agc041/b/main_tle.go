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
	n, m, v, p := io.NextInt(), io.NextInt(), io.NextInt(), io.NextInt()
	aList := make([]int, n)
	baseList := make([]int, n)
	for i := range aList {
		baseList[i] = io.NextInt()
	}
	copy(aList, baseList)
	sort.Ints(aList)
	line := aList[len(aList)-p] - m
	if v-p <= 0 {
		result := 0
		for _, a := range aList {
			if a >= line {
				result++
			}
		}
		fmt.Println(result)
		return
	}
	// pp.Print(aList)
	for i := 0; i < p-1; i++ {
		aList[len(aList)-1-i] += m
	}
	// pp.Print(aList)
	for j := 0; j < m; j++ {
		for i := 0; i < v-p; i++ {
			aList[i] = aList[i] + 1
		}
		sort.Ints(aList)
	}
	// pp.Print(aList)
	line = aList[len(aList)-p] - m
	// pp.Print(line)
	result := 0
	for _, a := range baseList {
		if a > line {
			result++
		}
	}
	fmt.Println(result)
	return
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
