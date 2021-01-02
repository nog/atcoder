N = gets.to_i
A = gets.split.map(&:to_i).sort

result = 0
N.times do |i|
    result += i * A[i]
    result -= (N - 1 - i) * A[i]
end

puts result