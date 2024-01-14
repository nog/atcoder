N, M, K = gets.split.map(&:to_i)
require 'bigdecimal'
AB = []
N.times do
  AB.push(gets.split.map(&:to_i))
end

CD = []
M.times do 
  CD.push(gets.split.map(&:to_i))
end

@taka = AB.sort_by{|a,b| - Rational(a,(a+b))}
@aoki = CD.sort_by{|a,b| - Rational(a,(a+b))}

low = BigDecimal("0.0")
high = BigDecimal("100.0")

def count_pairs target,seido 
  count = 0
  j = M - 1
  N.times do |i|
    takai = @taka[i]
    while(j >= 0 && ((BigDecimal(takai[0] + @aoki[j][0]))/ (takai.sum + @aoki[j].sum)) * 100 >= target) do
      j -= 1
    end
    count += (M-1) -j
  end
  return count
end

seido = false
while((high - low) > 1e-10 ) do
  mid = (low+high) / 2
  c = count_pairs(mid, seido)
  # warn "high:#{high} low:#{low} mid:#{mid} c:#{c}"
  if c == K
    seido = true
  end
  if c >= K
    low = mid
  else
    high = mid
  end
end

puts low.to_f