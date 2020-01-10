ARG_N, ARG_K = gets.split.map(&:to_i)
ARG_H = gets.split.map(&:to_i)

dp = Array.new(ARG_N)
dp[0] = 0
n = 1
while(n<ARG_N) do
  k = 1
  while((k<=ARG_K)&&((n-k)>=0)) do
    d = dp[n-k]+(ARG_H[n] - ARG_H[n-k]).abs
    dp[n] = d if !dp[n] || d < dp[n]
    k+=1
  end
  n+=1
end

puts dp[ARG_N-1]