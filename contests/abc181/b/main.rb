N = gets.to_i
A = Array.new N 
B = Array.new N 
N.times do |i|
    A[i], B[i] = gets.split.map(&:to_i)
end

result = 0
N.times do |i|
    result += (A[i] + B[i]) * ( B[i] - A[i] + 1) / 2
end

puts result