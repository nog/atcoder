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
	field := make([][]int, H+2)
	dxy := [4][2]int{[2]int{0, 1}, [2]int{0, -1}, [2]int{1, 0}, [2]int{-1, 0}}
	// 1< スタートからの距離(スタート1)
	// 0 移動可能未踏
	// -2 壁
	blockCount := 0
	for h := range field {
		field[h] = make([]int, W+2)
		if h == 0 || h == H+1 {
			for w := range field[h] {
				field[h][w] = -2
			}
		} else {
			field[h][0] = -2
			line := io.Next()
			for _w, s := range line {
				w := _w + 1
				if s == '#' {
					blockCount++
					field[h][w] = -2
				}
			}
			field[h][W+1] = -2
		}
	}
	q := [][2]int{}
	field[1][1] = 1
	q = append(q, [2]int{1, 1})

	qq := q[0]
	for {
		q = q[1:]
		y, x := qq[0], qq[1]
		for _, d := range dxy {
			dy, dx := d[0], d[1]
			if field[y+dy][x+dx] != 0 {
				continue
			}
			q = append(q, [2]int{y + dy, x + dx})
			field[y+dy][x+dx] = field[y][x] + 1
		}
		if len(q) == 0 {
			break
		}
		qq = q[0]
	}
	if field[H][W] == 0 {
		fmt.Println(-1)
	} else {
		fmt.Println(H*W - field[H][W] - blockCount)
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
