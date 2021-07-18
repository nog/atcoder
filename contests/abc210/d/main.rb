H, W, C = gets.split.map(&:to_i)
A = Array.new H
H.times do |i|
  A[i] = gets.split.map(&:to_i)
end
result = 10**20

dp = Array.new(H){ Array.new(W) }
dp[0][0] = A[0][0]

1.upto(W-1) do |w|
  dp[0][w] = [dp[0][w-1] + C, A[0][w]].min
end

1.upto(H-1) do |h|
  dp[h][0] = [dp[h-1][0] + C, A[h][0]].min
  1.upto(W-1) do |w|
    dp[h][w] = [dp[h-1][w] + C, dp[h][w-1] + C, A[h][w]].min
  end
end


1.upto(W-1) do |w|
  result = [result, dp[0][w-1] + C + A[0][w]].min
end


1.upto(H-1) do |h|
  result = [dp[h-1][0] + C + A[h][0], result].min
  1.upto(W-1) do |w|
    a = A[h][w]
    result = [result, dp[h-1][w] + C + a, dp[h][w-1] + C + a ].min
  end
end

A.reverse!
dp = Array.new(H){ Array.new(W) }
dp[0][0] = A[0][0]

1.upto(W-1) do |w|
  dp[0][w] = [dp[0][w-1] + C, A[0][w]].min
end

1.upto(H-1) do |h|
  dp[h][0] = [dp[h-1][0] + C, A[h][0]].min
  1.upto(W-1) do |w|
    dp[h][w] = [dp[h-1][w] + C, dp[h][w-1] + C, A[h][w]].min
  end
end


1.upto(W-1) do |w|
  result = [result, dp[0][w-1] + C + A[0][w]].min
end


1.upto(H-1) do |h|
  result = [dp[h-1][0] + C + A[h][0], result].min
  1.upto(W-1) do |w|
    a = A[h][w]
    result = [result, dp[h-1][w] + C + a, dp[h][w-1] + C + a ].min
  end
end

puts result