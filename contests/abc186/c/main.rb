N = gets.to_i
SEVEN = "7"

result = 0
1.upto(N) do |i|
    next if i.to_s.include?(SEVEN)
    next if i.to_s(8).include?(SEVEN)
    result += 1
end

puts result