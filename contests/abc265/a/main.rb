X, Y, N = gets.split.map(&:to_i)

results = []

results.push(X*N)
results.push(Y*(N/3)+ X * (N % 3))

puts results.min