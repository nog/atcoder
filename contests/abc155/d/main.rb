N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
zero = 0
minus = []
plus = []
A.each do |a|
  if a == 0
    zero += 1
  elsif a > 0
    plus.push a 
  else
    minus.push a 
  end
end

minus_count = minus.size * plus.size
zero_count = zero * (N -1)
plus_count = (minus.size * ( minus.size - 1)) / 2 + (plus.size * (plus.size - 1)) / 2

if K <= minus_count
  
elsif K <= minus_count + zero_count
  puts 0
end