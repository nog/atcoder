N = gets.to_i
H = gets.split.map(&:to_i)

max = H.max

i = H.find_index(max)
puts i+1