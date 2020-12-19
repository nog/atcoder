N = gets.to_i

require 'prime'

class Integer
  # 素数指数表現
  def prime_decomposition
    result = Hash.new(0)
    primes = Prime.each(Float::INFINITY).lazy
    num = self

    div = 1

    while num / div != 0
      div = primes.next
      count = 0
      while num % div == 0
        num /= div
        count += 1
      end
      result[div] = count unless count.zero?
    end

    result
  end
end

class Array
  def lcm
    numerator = self.inject(:*)

    result = Hash.new(0)
    num = 1

    self.each do |num|
      tmp = num.prime_decomposition

      tmp.each do |key,value|
        result[key] = [result[key],value].max
      end
    end

    result.each do |key,value|
      num *= key**value
    end

    num
  end
end

puts (2..N).to_a.lcm + 1