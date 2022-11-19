N, M = gets.split.map(&:to_i)
A, B, C, D, E, F = gets.split.map(&:to_i)
MOD = 998244353
@map = {}
M.times do 
  x, y = gets.split.map(&:to_i)
  @map[x] ||= {}
  @map[x][y] = true
end

dp = Array.new(N+1){ Array.new }
dp[0][0] = []
dp[0][0][0] = 1

res = 0
1.upto(N) do |n|
  bd = dp[n-1]
  cd = dp[n]
  # warn bd.inspect
  0.upto(n) do |a|
    cd[a] ||= []
    0.upto(n-a) do |b|
      c = n - a - b
      x = a * A + b * C + c * E
      y = a * B + b * D + c * F
      if @map[x] && @map[x][y]
        cd[a][b] = 0
      else
        x = 0
        x = x + bd[a-1][b] % MOD if a > 0
        x = x + bd[a][b-1] % MOD if b > 0
        x = x + bd[a][b] % MOD if a + b != n
        cd[a][b] = x
        if n == N
          res = (res + x) % MOD
        end
      end
    end
  end
end

puts res % MOD