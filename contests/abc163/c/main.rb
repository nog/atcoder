n = gets.to_i
a = gets.split.map(&:to_i)
result = Array.new(n){ 0 }
a.each do |i|
  result[i-1] += 1
end

result.each do |r|
  puts r
end