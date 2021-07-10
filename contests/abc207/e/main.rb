N = gets.to_i
A = gets.split.map(&:to_i)

dp = Array.new N
dp[0] = [[],[1]]

1.upto(N-1) do |i|
  d = [[],[1]]
  bd = dp[i-1]
  a = A[i]
  bd.each.with_index do |l,i|
    next if l.size == 0
    am = a % i
  end
end