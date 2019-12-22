package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	var sc = bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)
	sc.Scan()
	n, _ := strconv.Atoi(sc.Text())
	edges := make([][2]int, n-1)
	for i := range edges {
		var a, b int
		sc.Scan()
		a, _ = strconv.Atoi(sc.Text())
		sc.Scan()
		b, _ = strconv.Atoi(sc.Text())
		edges[i] = [2]int{a, b}
	}
	colorSize, colors := abc146d(n, edges)
	fmt.Println(colorSize)
	for _, color := range colors {
		fmt.Println(color)
	}
}

func abc146d(n int, edges [][2]int) (int, []int) {
	var colorSize int
	colors := make([]int, len(edges))
	root := &node{number: 0, parentEdge: -1}
	start := &node{number: 1, parent: root, parentEdge: -1}
	createTree(start, edges)
	setColors(start, edges, colors)
	for _, color := range colors {
		if color > colorSize {
			colorSize = color
		}
	}
	// pp.Print(colors)
	return colorSize, colors
}

func setColors(currentNode *node, edges [][2]int, colors []int) {
	// pp.Print(currentNode)
	ngColor := 0 // rootとだけ使うColor
	if currentNode.parent.number != 0 {
		ngColor = colors[currentNode.parentEdge]
	}
	color := 1
	for i, child := range currentNode.childNodes {
		if color == ngColor {
			color++
		}
		colors[currentNode.childEdges[i]] = color
		color++
		setColors(child, edges, colors)
	}
}

type node struct {
	parent     *node
	parentEdge int
	number     int
	childEdges []int
	childNodes []*node
}

func createTree(currentNode *node, edges [][2]int) {
	for i, edge := range edges {
		if edge[0] == currentNode.number || edge[1] == currentNode.number {
			if edge[0] == currentNode.parent.number || edge[1] == currentNode.parent.number {
				continue
			}
			child := edge[0]
			if currentNode.number == edge[0] {
				child = edge[1]
			}
			currentNode.childEdges = append(currentNode.childEdges, i)
			childNode := &node{parent: currentNode, number: child, parentEdge: i}
			createTree(childNode, edges)
			currentNode.childNodes = append(
				currentNode.childNodes,
				childNode,
			)
		}
	}
}
