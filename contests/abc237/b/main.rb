H, W = gets.split.map(&:to_i)
A = Array.new H
H.times do |i|
  A[i] = gets.split.map(&:to_i)
end

b = A.transpose

b.each do |l|
  puts l.join(' ')
end