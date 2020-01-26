H = gets.to_i
W = gets.to_i
N = gets.to_i

x = H > W ? H : W
puts (N.to_f / x).ceil