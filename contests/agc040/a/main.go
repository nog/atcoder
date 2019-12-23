package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
)

var rdr = bufio.NewReaderSize(os.Stdin, 1000000)

func readLine() string {
	buf := make([]byte, 0, 1000000)
	for {
		l, p, e := rdr.ReadLine()
		if e != nil {
			panic(e)
		}
		buf = append(buf, l...)
		if !p {
			break
		}
	}
	return string(buf)
}

func main() {
	s := readLine()
	fmt.Println(abc040a(s))
}

func abc040a(s string) int64 {
	result := int64(0)
	combos := []int64{}
	combo := int64(0)
	prev := byte('?')
	for i := range s {
		str := s[i]
		if prev == str {
			combo++
		} else {
			if prev == '>' {
				combos = append(combos, -combo)
			} else {
				combos = append(combos, +combo)
			}
			combo = 1
		}
		prev = str
	}
	if prev == '>' {
		combos = append(combos, -combo)
	} else {
		combos = append(combos, +combo)
	}
	// pp.Print(combos)
	for i, combo := range combos {
		if combo == 0 {
			continue
		}
		c := int64(math.Abs(float64(combo)))
		if combo > 0 {
			if len(combos) == i+1 {
				result += (c + 1) * c / 2
			} else if combo+combos[i+1] < 0 {
				result += (c - 1) * c / 2
			} else {
				result += (c + 1) * c / 2
			}
		} else {
			if combo+combos[i-1] < 0 {
				result += (c + 1) * c / 2
			} else {
				result += (c - 1) * c / 2
			}
		}
	}
	return result
}
