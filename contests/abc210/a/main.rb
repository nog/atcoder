N, A, X, Y = gets.split.map(&:to_i)

result = N * X
if N > A
  result -= (X - Y) * (N - A)
end

puts result