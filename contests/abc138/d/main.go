package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	io := newIo()
	defer io.Flush()
	N, Q := io.NextInt(), io.NextInt()
	points := map[int]int{}
	edges := map[int][]int{}
	for i := 0; i < N-1; i++ {
		a, b := io.NextInt(), io.NextInt()
		edges[a] = append(edges[a], b)
		edges[b] = append(edges[b], a)
	}
	for i := 0; i < Q; i++ {
		a, point := io.NextInt(), io.NextInt()
		points[a] = points[a] + point
	}
	visits := map[int]bool{}
	visits[1] = true
	totalPoints := make([]int, N+1)
	totalPoints[1] = points[1]
	q := []int{1}
	for len(q) > 0 {
		qq := q[0]
		q = q[1:]
		currentPoint := totalPoints[qq]
		for _, edge := range edges[qq] {
			_, exists := visits[edge]
			if exists {
				continue
			}
			visits[edge] = true
			totalPoints[edge] = currentPoint + points[edge]
			q = append(q, edge)
		}
	}
	io.PrintIntLn(totalPoints[1:])
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
