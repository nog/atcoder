N = gets.to_i 
A = gets.split.map(&:to_i)

a = A.sort[-2]

puts A.find_index(a) + 1