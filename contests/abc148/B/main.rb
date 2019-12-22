#! /bin/env ruby

N = gets.chomp.to_i
S, T = gets.chomp.split

result = ""
N.times do |i|
  result += S[i] + T[i]
end

puts result