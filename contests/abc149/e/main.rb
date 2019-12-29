N,M = gets.split(" ").map(&:to_i)
A = gets.chomp.split(" ").map(&:to_i).sort.reverse
diffA = A.map.with_index{|a,i| a - A[i]}

left = 0
right = 0
result = 0
used = {}
max_left, max_right = 0, 0
M.times do |i|
  left , right = 0 , 0
end
puts result