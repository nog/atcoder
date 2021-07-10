N = gets.to_i


result = (1...10**9).bsearch do |i|
  i * ( i + 1 ) / 2 >= N
end

puts result