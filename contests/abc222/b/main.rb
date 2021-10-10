N, P = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
res = 0

A.each do |a|
  res +=1 if a < P
end

puts res