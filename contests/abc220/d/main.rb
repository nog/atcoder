N = gets.to_i
A = gets.split.map(&:to_i)
MOD = 998244353

prev = Array.new(10, 0)
prev[A.shift] = 1

while(a = A.shift) do
  # warn "a:#{a}"
  # warn "prev:#{prev.inspect}"
  list = Array.new(10, 0)
  10.times do |a0|
    val = prev[a0]
    f = (a0 + a) % 10
    g = (a0 * a) % 10
    list[f] = list[f] + val % MOD
    list[g] = list[g] + val % MOD
  end
  prev = list
end
# warn "prev:#{prev.inspect}"

0.upto(9) do |i|
  puts prev[i] % MOD
end