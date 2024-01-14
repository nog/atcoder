N, M = gets.split.map(&:to_i)
A = []
M.times do
  A.push(gets.split.map(&:to_i))
end

hash = {}

A.each do |line|
  (N-1).times do |i|
    a, b = line[i], line[i+1]
    a, b = b, a if b < a
    hash[a] ||= {}
    hash[a][b] = true
  end
end
res = 0
1.upto(N-1) do |i|
  (i+1).upto(N) do |j|
    res += 1 unless hash[i] && hash[i][j]
  end
end

puts res