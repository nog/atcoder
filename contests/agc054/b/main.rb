N = gets.to_i
W = gets.split.map(&:to_i).sort
MOD = 998244353

def calc_fact(n)
  @finv = []
  @inv  = []
  @fact = []
  @finv[0] = @finv[1] = @inv[0] = @inv[1] = @fact[0] = @fact[1] = 1
  i = 2
  bfinv = 1
  while(i<=n) do
      @fact << @fact[-1] * i % MOD
      @inv  << inv   = @inv[MOD % i] * (MOD - MOD / i) % MOD
      @finv << bfinv = bfinv * inv % MOD
      i+=1
  end
end
calc_fact(N+10)

sum = W.sum
if sum.odd?
  puts 0
  exit
end

if (sum / 2) < W[-1]
  puts 0
  exit
end

half_n = (N.to_f / 2).ceil
half_w = sum / 2

dp = []
dp[0] = { 0 => 1}
# warn "half_w: #{half_w}"
W.each.with_index do |w, i|
  # warn "w: #{w}"
  dp.reverse.each.with_index do |whash, n|
    num = i - n
    # break if num > half_n
    d = dp[num+1] ||= {}
    whash.each do |ww, cnt|
      nw = ww + w
      next if nw > half_w
      if d[nw]
        d[nw] += cnt
      else
        d[nw] = cnt
      end
    end
  end
  # warn dp.inspect
end
# warn @fact.inspect
result = 0
dp.each.with_index do |whash, num|
  next unless whash
  next unless whash[half_w]
  cnt = whash[half_w]
  result = (result + cnt * (@fact[num] * @fact[N-num])) % MOD
end
# warn dp.inspect
puts result