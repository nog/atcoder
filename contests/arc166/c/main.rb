MOD = 998244353

t = gets.to_i

fib = [1,1,2]
l1 = 1
l2 = 2

(2*(10**6)+1).times do
    l = l1 + l2 % MOD
    fib.push(l)
    l1 = l2
    l2 = l
end
xx = []
l = 1
((10**6)+1).times do |i|
    l = l * fib[2*(i)] % MOD
    xx.push(l)
end
t.times do
  h, w = gets.split.map(&:to_i)
  small, large = [h,w].sort

  puts xx[small].pow(2, MOD) * fib[small*2+1].pow(large - small, MOD) % MOD

end