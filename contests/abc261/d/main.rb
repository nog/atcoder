N, M = gets.split.map(&:to_i)
X = gets.split.map(&:to_i)
bonuses = {}
M.times do |i|
  c, y = gets.split.map(&:to_i)
  bonuses[c] = y
end

dp = Array.new(N+1){ Array.new }
dp[0][0] = 0

N.times do |i|
  bdp = dp[i]
  cdp = Array.new
  cdp[0] = bdp.max
  bdp.each.with_index do |bd, c|
    cdp[c+1] = (bd + X[i]) + (bonuses[c+1] || 0)
  end

  dp[i+1] = cdp
end

puts dp[N].max