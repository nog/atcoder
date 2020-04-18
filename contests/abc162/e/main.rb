N, K = gets.split.map(&:to_i)
MOD = 10**9+7
result = 0
result += K * (1 + K) / 2
require 'prime'
def divisor_list x
  divisors = [1]
  primes = []
  Prime.prime_division(x).each do |prime|
    prime[1].times {primes << prime[0]}
  end

  1.upto(primes.size) do |i|
    primes.combination(i) do |prime|
      divisors << prime.inject{|a,b| a *= b}
    end
  end

  divisors.uniq!
  divisors.sort!
  return divisors
rescue ZeroDivisionError
  return
end

MEMO = {}
1.upto(K) do |i|
  MEMO[i] = divisor_list(i)
end