N = gets.to_i
S = gets.split('')
MOD = 998244353

list = []
N.times do |i|
  if S[i] == '.'
    list.push(i)
  end
end

require 'prime'
primes = Prime.prime_division(N)
result = 1
if list.size == 0
  result += 1
end

primes.each do |pr, c|
  d = N / pr
  xlist = list.map{|x| x % d }.uniq
  c = 2.pow(d-xlist.size, MOD)
  c -= list.size == 0 ? 2 : 1
  c = 0 if c < 0
  result = result + c % MOD
end

puts result % MOD