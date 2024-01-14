N = gets.to_i

counts = Array.new(N+1, 0)

1.upto(N) do |a|
  a2 = a.pow(2)
  counts[a2] += 1 if a2 <= N
  (a+1).upto(N/a) do |b|
    counts[a*b] += 2
  end
end
res = 0
1.upto(N) do |i|
  res += counts[i] * counts[N-i]
end

puts res