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
	H, W := io.NextInt(), io.NextInt()
	Wall := make([][]int, H)
	for h := range Wall {
		Wall[h] = make([]int, W)
	}
	pointMap := make(map[int][][2]int) // point => [[from, to]]
	maxPoint := 0
	minPoint := 1000
	var C [10][10]int
	for from, line := range C {
		for to := range line {
			p := io.NextInt()
			_, exists := pointMap[p]
			if !exists {
				pointMap[p] = [][2]int{}
			}
			pointMap[p] = append(pointMap[p], [2]int{from, to})
			C[from][to] = p
			if p > maxPoint {
				maxPoint = p
			}
			if p < minPoint {
				minPoint = p
			}
		}
	}

	for h := range Wall {
		for w := range Wall[h] {
			Wall[h][w] = io.NextInt()
		}
	}
	// fmt.Println(C)
	for point := minPoint; point <= maxPoint; point++ {
		for _, route := range pointMap[point] {
			i, j := route[0], route[1]
			if point != C[i][j] {
				continue
			}
			for tj := range C[i] {
				tp := C[i][tj]
				newPoint := point + C[j][tj]
				if tp > newPoint {
					C[i][tj] = newPoint
					pointMap[newPoint] = append(pointMap[newPoint], [2]int{i, tj})
				}
			}
		}
	}

	result := 0
	for h := range Wall {
		for _, point := range Wall[h] {
			if point == -1 {
				continue
			}
			result += C[point][1]
		}
	}
	fmt.Println(result)
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
