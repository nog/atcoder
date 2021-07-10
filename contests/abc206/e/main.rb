L, R = gets.split.map(&:to_i)
result = 0
require 'prime'

L.upto(R) do |x|
  list = x.prime_division
  next if list.size == 0
  list.each do |pr|
    g = pr[0]
    result += (R / g) - (L / g)
  end
end

puts result