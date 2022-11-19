N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
dp = Array.new N + 1
dp[0] = 0
1.upto(N) do |i|
  c = 0
  A.each do |a|
    break if a > i
    if a == i
      c = a
      break
    end
    c = [i - dp[i-a], c].max
  end
  dp[i] = c
end

puts dp[N]