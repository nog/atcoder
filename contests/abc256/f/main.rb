N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
queries = Array.new(N){ Array.new }
Q.times do |i|
  q, x, v = gets.split.map(&:to_i)
  queries[x-1].push([q,v,i])
end
MOD = 998244353
b, c, d = 0, 0, 0
result = Array.new Q
warn queries.inspect
N.times do |i|
  a = A[i]
  b = (b + a) % MOD
  c = (c + b) % MOD
  d = (d + c) % MOD
  queries[i].each do |q, v, i|
    if q == 2
      result[i] = d 
    else
      diff = v - a
      b = (b+diff) % MOD
      c = (c+diff) % MOD
      d = (d+diff) % MOD
    end
  end
end

result.each do |r|
  puts r if r 
end