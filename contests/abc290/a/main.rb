N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

res = 0

B.each do |b|
  res += A[b-1]
end

puts res