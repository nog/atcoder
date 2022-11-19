N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

dp = Array.new(N+1)
dp[0] = [0]
result = - 100000000000000000000
1.upto(N) do |i|
  # warn "dp:#{dp.inspect}"
  bd = dp[i-1]
  cd = [0]
  a = A[i-1]
  # warn bd.inspect
  bd.size.times do |j|
    break if j == M
    b = bd[j]
    # warn b
    x = b + (a * (j+1))
    if j+1 == M
      result = x if result < x
    end
    cd[j+1] = [x, (bd[j+1]|| -1000000000000)].max
  end
  dp[i] = cd
end
puts result