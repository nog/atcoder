n = gets.to_i

require 'prime'

result = 0

primes = n.prime_division

primes.each do |pr, count|
  i = 1
  while count >= i do
    count -= i
    i += 1
    result += 1
  end
end

puts result