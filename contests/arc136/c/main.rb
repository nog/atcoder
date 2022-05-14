N = gets.to_i
A = gets.split.map(&:to_i)

max = A.max

sum = 0
N.times do |i|
  sum += (A[i] - A[i-1]).abs
end

puts [sum/2, max].max