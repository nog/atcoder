N = gets.to_i
A = gets.split.map(&:to_i)

# a以下の数のハッシュ
xhash = {}
counts = {}
sum = 0
A.sort.each do |a|
  sum += 1
  counts[a] ||= 0
  counts[a] += 1
  xhash[a] = sum
end

result = 0
warn xhash.inspect
warn counts.inspect
1.upto(N-2) do |j|
  a = A[j]
  res = (xhash[a] - counts[a]) * (N - xhash[a])
  warn "j:#{j} a:#{a} res:#{res}"
  result += res
end

puts result