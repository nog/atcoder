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
	N := io.NextInt()
	F := make([]int, N)
	P := make([][11]int, N)
	for i := 0; i < N; i++ {
		x := 0
		for j := uint(0); j < 10; j++ {
			if io.NextInt() == 1 {
				x += (1 << j)
			}
		}
		F[i] = x
	}
	for i := 0; i < N; i++ {
		for j := 0; j < 11; j++ {
			P[i][j] = io.NextInt()
		}
	}
	bitMax := 1 << 10
	var maxPoint int
	for bit := 1; bit < bitMax; bit++ {
		point := 0
		for i, f := range F {
			count := bitCount(f & bit)
			point += P[i][count]
		}
		if bit == 1 || point > maxPoint {
			maxPoint = point
		}
	}
	fmt.Println(maxPoint)
}

func bitCount(bit int) int {
	bit = bit - ((bit >> 1) & 0x55555555)
	bit = (bit & 0x33333333) + ((bit >> 2) & 0x33333333)
	bit = (bit + (bit >> 4)) & 0x0f0f0f0f
	bit = bit + (bit >> 8)
	bit = bit + (bit >> 16)
	return bit & 0x3f
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
