N, M = gets.split.map(&:to_i)
warn N
warn M
x = 10.pow(N, M**2)
puts (x / M) % M