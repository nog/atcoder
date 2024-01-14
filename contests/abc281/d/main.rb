N, K, D = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

dp = Array.new(N+1)
dp[0] = Array.new(K+1){ Hash.new }
dp[0][0][0] = 0

N.times do |i|
  bd = dp[i]
  a = A[i]

  nd = bd.dup
  (K-1).downto(0) do |j|
    nlist = nd[j+1]
    bd[j].each do |mod, res|
      m = (mod + a) % D
      r = res + a
      nlist[m] = [nlist[m], r].compact.max
    end
  end
  dp[i+1] = nd
end

puts dp[N][K][0] || -1