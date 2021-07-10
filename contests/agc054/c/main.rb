N, K = gets.split.map(&:to_i)
P = gets.split.map(&:to_i)
MOD = 998244353

result = 1
before = N
(N-2).downto(0) do |i|
  if P[i] == i + 1 - K
    cur = P[i]
    k = 1
    while(i+k < N && P[i+k] > cur) do
      k += 1
    end
    result = result * k % MOD
    before = i
  end
end
puts result