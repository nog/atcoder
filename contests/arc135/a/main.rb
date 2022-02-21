X = gets.to_i
MOD = 998244353

@memo = {}

def f x
  return x if x <= 4
  return @memo[x] if @memo[x]
  a = x / 2
  b = (x / 2) + (x % 2)
  @memo[x] = f(a) * f(b) % MOD
end

puts f X