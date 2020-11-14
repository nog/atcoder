N = gets.to_i
A = gets.split.map(&:to_i)

sumA = Array.new N+1, 0 
maxA = Array.new N+1, 0

def max a,b
    a > b ? a : b
end

N.times do |i|
    sumA[i+1] += sumA[i] + A[i]
    maxA[i+1] = max(maxA[i], sumA[i+1])
end

result = 0
current = 0
(N+1).times do |i|
    result = max(result, current + maxA[i])
    current += sumA[i]
end

puts result