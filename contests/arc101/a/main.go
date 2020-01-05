package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"
)

func main() {
	io := newIo()
	defer io.Flush()
	N, K := io.NextInt(), io.NextInt()
	Xplus := []int{}
	Xminus := []int{}
	for i := 0; i < N; i++ {
		x := io.NextInt()
		if x < 0 {
			Xminus = append(Xminus, -x)
		} else if x == 0 {
			K--
		} else {
			Xplus = append(Xplus, x)
		}
	}
	if K == 0 {
		fmt.Println(0)
		return
	}
	if K == 1 {
		result := Xplus[0]
		if Xminus[0] < result {
			result = Xminus[0]
		}
		fmt.Println(result)
		return
	}
	if len(Xminus) > K {
		Xminus = Xminus[len(Xminus)-K:]
	}
	if len(Xplus) > K {
		Xplus = Xplus[0:K]
	}
	if len(Xminus) == 0 {
		fmt.Println(Xplus[K-1])
		return
	}
	if len(Xplus) == 0 {
		fmt.Println(Xminus[0])
		return
	}
	X := append(Xminus, Xplus...)
	result := X[0] + X[K-1] + int(math.Min(float64(X[0]), float64(X[K-1])))
	log("fresult", result)
	for i := 0; i < len(X)-(K-1); i++ {
		a := X[i]
		b := X[i+(K-1)]
		var r int
		if a < b {
			r = 2*a + b
		} else {
			r = 2*b + a
		}
		if r < result {
			result = r
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
