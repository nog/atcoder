N, K = gets.split.map(&:to_i)
MOD = 998244353

fixed_list = Array.new N
ldiff = Array.new N, 0
rdiff = Array.new N, 0
K.times do |i|
  c, k = gets.split
  k = k.to_i
  if c == 'L'
    fixed_list[k-1] = i
    ldiff[k-1] = -1
  else
    fixed_list[k-1] = i
    rdiff[k-1] = -1
  end
end

counts = Array.new N
counts[0] = K
rdiff_sum = Array.new N, 0
N.times do |i|
  if i == 0
    rdiff_sum[i] = rdiff[i]
  else
    rdiff_sum[i] = rdiff_sum[i-1] + rdiff[i]
  end
end

ldiff_sum = Array.new N, 0
N.times do |i|
  if i == 0
    ldiff_sum[N-1-i] = ldiff[N-1-i]
  else
    ldiff_sum[N-1-i] = ldiff_sum[N-i] + ldiff[N-i-1]
  end
end
result = 1
# warn ldiff.inspect
# warn ldiff_sum.inspect
# warn rdiff.inspect
# warn rdiff_sum.inspect

xcounts = Array.new N
N.times do |i|
  if fixed_list[i]
    xcounts[i] = 1
  else
    xcounts[i] = K + ldiff_sum[i] + rdiff_sum[i]
  end
end
# warn xcounts.inspect 
N.times do |i|
  next if fixed_list[i]
  result = result * (K + ldiff_sum[i] + rdiff_sum[i] ) % MOD
end

puts result % MOD