package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

type node struct {
	childEdges []int
}

type edge struct {
	from int
	to   int
}

var n int
var nodes map[int]*node
var edges []*edge
var colors []int
var colorSize int

func main() {
	var sc = bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)
	sc.Scan()
	n, _ = strconv.Atoi(sc.Text())
	nodes = map[int]*node{}
	edges = make([]*edge, n-1)
	colors = make([]int, n-1)
	for i := range edges {
		var a, b int
		sc.Scan()
		a, _ = strconv.Atoi(sc.Text())
		sc.Scan()
		b, _ = strconv.Atoi(sc.Text())
		edges[i] = &edge{a, b}
		_, exists := nodes[a]
		if !exists {
			nodes[a] = &node{[]int{}}
		}
		_, exists = nodes[b]
		if !exists {
			nodes[b] = &node{[]int{}}
		}
		nodes[a].childEdges = append(nodes[a].childEdges, i)
	}
	// pp.Print(edges)
	abc146d()
	fmt.Println(colorSize)
	for _, color := range colors {
		fmt.Println(color)
	}
}

func abc146d() {
	// pp.Print(nodes)
	current := 1
	parentColor := 0
	setColor(current, parentColor)
}

func setColor(current int, parentColor int) {
	color := 1
	for _, e := range nodes[current].childEdges {
		if color == parentColor {
			color++
		}
		colors[e] = color
		if color > colorSize {
			colorSize = color
		}
		setColor(edges[e].to, color)
		color++
	}
}
