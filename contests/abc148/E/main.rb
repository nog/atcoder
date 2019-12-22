#! /bin/env ruby

N = gets.chomp.to_i

if N.odd?
  puts 0
  exit
end
result = 0
x = 10
while N >= x
  result += (N / x)
  x = x * 5
end

puts result