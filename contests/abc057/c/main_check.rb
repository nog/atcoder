# 最初に書いたのがどういう時にWAになるのか確認用スクリプト

require 'prime'
def main_a n
  a = b = 1
  primes = Prime.prime_division(n)
  primes.reverse.each do |pair|
    prime = pair[0]
    count = pair[1]
    count.times do
      if a <= b
        a = a * prime
      else
        b = b * prime
      end
    end
  end
  
  if a <= b
    return Math.log10(b).to_i + 1
  else
    return Math.log10(a).to_i + 1
  end
end

def main_b n
  max = Math.sqrt(n).to_i
  result = Math.log10(n).to_i + 1
  max.times do |i|
    i = i+1
    next if n % i > 0
    r = Math.log10(n / i).to_i + 1
    result = r if r < result
  end
  return result
end

1.upto(10000) do |i|
  if main_a(i) != main_b(i)
    puts i
  end
end