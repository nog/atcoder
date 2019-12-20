package main

import (
	"testing"
)

func Test_price(t *testing.T) {
	type args struct {
		a int64
		b int64
		n int64
	}
	tests := []struct {
		name string
		args args
		want int64
	}{
		{"sample1", args{10, 7, 10}, 114},
		{"sample2", args{10, 7, 100}, 1021},
		{"sample3", args{10, 7, 12345}, 123485},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := price(tt.args.a, tt.args.b, tt.args.n); got != tt.want {
				t.Errorf("price() = %v, want %v", got, tt.want)
			}
		})
	}
}

func Test_abc146c(t *testing.T) {
	type args struct {
		a int64
		b int64
		x int64
	}
	tests := []struct {
		name string
		args args
		want int64
	}{
		{"sample1", args{10, 7, 100}, 9},
		{"sample2", args{2, 1, 100000000000}, 1000000000},
		{"sample3", args{1000000000, 1000000000, 100}, 0},
		{"sample4", args{1234, 56789, 314159265}, 254309},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := abc146c(tt.args.a, tt.args.b, tt.args.x); got != tt.want {
				t.Errorf("abc146c() = %v, want %v", got, tt.want)
			}
		})
	}
}
