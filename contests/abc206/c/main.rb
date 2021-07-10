N = gets.to_i 
A = gets.split.map(&:to_i)

hash = {}
result = 0

N.times do |i|
  a = A[i]
  hash[a] ||= 0
  result += i - hash[a]
  hash[a] += 1
  # warn "i:#{i} result:#{result}"
end

puts result