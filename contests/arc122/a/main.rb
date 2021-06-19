N = gets.to_i
A = gets.split.map(&:to_i)

MOD = 10**9+7
plus = Array.new N-1
minus = Array.new N-1

plus[0] = 1
minus[0] = 1
result = 0
(N-2).times do |i|
    plus[i+1] = plus[i] + minus[i]
    minus[i+1] = plus[i]
end

sum = plus[N-2] + minus[N-2]
warn plus.inspect
warn minus.inspect

result = (A[N-1] * (plus[N-2] - minus[N-2])) % MOD
pl = plus[N-2]
mi = minus[N-2]

(N-2).downto(1) do |i|
    _pl = plus[i-1]
    _mi = minus[i-1]
    mi = pl * _mi / (_pl + _mi)
    pl = sum - mi
    result = ( result + (A[i] * (pl - mi))) % MOD
end

result = (result + (A[0] * sum)) % MOD
puts result