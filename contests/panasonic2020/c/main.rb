require "bigdecimal/math"
A, B, C = gets.split.map(&:to_i)

if C > A + B + (2 * BigMath::sqrt(BigDecimal(A*B), 1000))
  puts 'Yes'
else
  puts 'No'
end