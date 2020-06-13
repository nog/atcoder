s = gets.chomp.split('')
MOD = 2019
result = 0
hash = { 0 => 1}
d = 0

s.reverse.each_with_index do |_s, i|
  n = _s.to_i
  d = (d + n * 10.pow(i, MOD)) % MOD
  if hash[d]
    result += hash[d]
  end
  hash[d] ||= 0
  hash[d] += 1
end
puts result