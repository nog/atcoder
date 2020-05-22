n = gets.to_i
@n = n
a = Array.new n 
b = Array.new n 
c = Array.new n
d = {}
e = {}
MOD = 1000000007
n.times do |i|
  a[i], b[i] = gets.split.map(&:to_i)
  c[i] = a[i].to_f / b[i]
  d[c[i]] ||= []
  d[c[i]].push(i)
  if d[1/-c[i]]
    e[i] = d[1/-c[i]]
    d[-1/c[i]].each do |_d|
      e[_d] = d[c[i]]
    end
  end
end

max = 20001
@fac = Array.new max
@finv = Array.new max
@inv = Array.new max
@fac[0] = 1
@fac[1] = 1
@finv[0] = 1
@finv[1] = 1
@inv[1] = 1
2.upto(20000) do |i|
  @fac[i] = @fac[i - 1] * i % MOD;
  @inv[i] = MOD - @inv[MOD % i] * (MOD / i) % MOD;
  @finv[i] = @finv[i - 1] * @inv[i] % MOD;
end

def com n, k
  @fac[n] * ( @finv[k] * @finv[n-k] % MOD ) % MOD
end

p e
anti = 0
e.each do |k, ar|
  anti += ar.size
end
anti = anti / 2

result = n

2.upto(n) do |i|
  result += com n, i
  result -= anti * com(n - 2, i - 2)
end
puts result