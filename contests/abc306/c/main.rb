N = gets.to_i
A = gets.split.map(&:to_i)

counts = Array.new(N+1, 0)

res = []
(3*N).times do |i|
  a = A[i]
  counts[a] += 1
  if counts[a] == 2
    res.push(a)
  end
end

puts res.join(' ')