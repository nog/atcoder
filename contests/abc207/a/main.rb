A, B, C = gets.split.map(&:to_i)

x = [A,B,C].sort
puts x[1] + x[2]