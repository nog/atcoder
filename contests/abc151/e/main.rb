ARG_N, ARG_K = gets.split.map(&:to_i)
ARG_A = gets.split.map(&:to_i)
MOD=10**9+7

@facts = Array.new(ARG_N+1)
@facts[0] = 1
ARG_N.times do |i|
  @facts[i+1] = (i+1) * @facts[i]
end

if ARG_K == 1
  puts 0
  exit
end

def comb n, r
  @facts[n] / (@facts[r] * @facts[n-r])
end

result = 0
ARG_N.times do |i|
  if ARG_N - i - ARG_K >= 0
    result = result - (ARG_A[i] * comb(ARG_N-i-1, ARG_K-1))
  end
  if i >= ARG_K
    result = result + (ARG_A[i] * comb(i, ARG_K-1))
  end
end

puts result % MOD