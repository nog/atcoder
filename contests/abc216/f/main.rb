N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
MAXA = A.max

MOD = 998244353
AB = Array.new N
N.times do |i|
  AB[i] = [A[i], B[i]]
end
AB.sort_by!{|ab| ab[0] }
sums = Array.new(MAXA + 1, 0)
sums[0] = 1
result = 0

N.times do |i|
  a, b = AB[i]
  if b <= a
    result += sums[0..(a-b)].sum
  end
  sums[b..MAXA-b] = sums[b..MAXA-b].map.with_index{|_, x| sums[x+b] + sums[x]}
  # warn sums.inspect
end

puts result % MOD