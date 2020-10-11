N = gets.to_i

result = 0

1.upto(N-1) do |a|
    result += (N-1) / a
end

puts result