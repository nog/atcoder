N = gets.to_i
A = gets.split.map(&:to_i)

result = (N-1) * (A[0] ** 2)
sum = A[0]
1.upto(N-1) do |i|
    a = A[i]
    result += (N - 1) * (a ** 2)
    result -= 2 * a * sum
    sum += a
end

puts result