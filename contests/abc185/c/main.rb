L = gets.to_i

result = 1

ue = 1
sita = 1
1.upto(11) do |i|
    ue *= L - i
    sita *= i
end

puts ue / sita