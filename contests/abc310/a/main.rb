N, P, Q = gets.split.map(&:to_i)
D = gets.split.map(&:to_i)

res = [P, D.min + Q].min
puts res