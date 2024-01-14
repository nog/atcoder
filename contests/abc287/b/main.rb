N, M = gets.split.map(&:to_i)

hash = {}
N.times do
  s = gets.chomp[-3..-1]
  hash[s] ||= 0
  hash[s] += 1
end

res = 0

M.times do
  s = gets.chomp
  res += hash[s] || 0
  hash[s] = 0
end

puts res