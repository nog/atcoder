package main

import (
	"reflect"
	"testing"
)

func Test_createTree(t *testing.T) {
	type args struct {
		currentNode *node
		edges       [][2]int
	}
	tests := []struct {
		name string
		args args
	}{
		{
			"sample",
			args{
				&node{number: 1, parent: &node{}},
				[][2]int{
					[2]int{1, 2},
					[2]int{2, 3},
					[2]int{2, 4},
					[2]int{3, 5},
					[2]int{1, 6},
				},
			},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			createTree(tt.args.currentNode, tt.args.edges)
			// pp.Print(tt.args.currentNode)
		})
	}
}

func Test_abc146d(t *testing.T) {
	type args struct {
		n     int
		edges [][2]int
	}
	tests := []struct {
		name  string
		args  args
		want  int
		want1 []int
	}{
		{
			args:  args{3, [][2]int{[2]int{1, 2}, [2]int{2, 3}}},
			want:  2,
			want1: []int{1, 2},
		},
		{
			args:  args{8, [][2]int{[2]int{1, 2}, [2]int{2, 3}, [2]int{2, 4}, [2]int{2, 5}, [2]int{4, 7}, [2]int{5, 6}, [2]int{6, 8}}},
			want:  4,
			want1: []int{1, 2, 3, 4, 1, 1, 2},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, got1 := abc146d(tt.args.n, tt.args.edges)
			if got != tt.want {
				t.Errorf("abc146d() got = %v, want %v", got, tt.want)
			}
			if !reflect.DeepEqual(got1, tt.want1) {
				t.Errorf("abc146d() got1 = %v, want %v", got1, tt.want1)
			}
		})
	}
}
