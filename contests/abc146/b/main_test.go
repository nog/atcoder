package main

import "testing"

func Test_abc146b(t *testing.T) {
	type args struct {
		n int
		s string
	}
	tests := []struct {
		args args
		want string
	}{
		{args{1, "ABC"}, "BCD"},
		{args{2, "ABCXYZ"}, "CDEZAB"},
	}
	for _, tt := range tests {
		t.Run(tt.args.s, func(t *testing.T) {
			if got := abc146b(tt.args.n, tt.args.s); got != tt.want {
				t.Errorf("abc146b() = %v, want %v", got, tt.want)
			}
		})
	}
}
