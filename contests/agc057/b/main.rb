N, X = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort

max = A[-1]
min = A[0]

result = max - min
if result < X
  puts 0
  exit
end

list = A.map do |a|
  mi = a
  ma = a
end