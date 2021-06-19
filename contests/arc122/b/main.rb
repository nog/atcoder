N = gets.to_i
A = gets.split.map(&:to_i).sort

l = 2 * A[0]
r = 2 * A[-1]
c = (l+r) / 2

c1 = (l+c) / 2
c2 = (c+r) / 2


