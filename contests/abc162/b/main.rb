n = gets.to_i
result = 0
1.upto(n) do |i|
  if i % 3 == 0
    next
  elsif i % 5 == 0
    next
  end
  result += i
end

puts result
