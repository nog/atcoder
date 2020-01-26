ARG_N = gets.to_i
arms = Array.new ARG_N
ARG_N.times do |i|
  arms[i] = gets.split.map(&:to_i)
end
arms = arms.sort_by{|a| a[0]}

dp = []
dp[0] = - 10**9+1
ARG_N.times do |i|
  arm = arms[i]
  left = arm[0] - arm[1]
  right = arm[0] + arm[1]
  if dp[-1] <= left
    dp.push right
  end

  if right < dp[-1] && dp[-2] < left
    dp[-1] = right
  end
end

puts dp.length - 1