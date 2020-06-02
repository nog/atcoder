n = gets.to_i
@n = n
a = Array.new n 
b = Array.new n 
c = {}
zerozero = 0
MOD = 1000000007
n.times do |i|
  _a, _b = gets.split.map(&:to_i)
  a[i] = _a
  b[i] = _b
  if _a == 0 && _b == 0
    zerozero += 1
  elsif _a == 0
    c[[0,-1]] ||= 0
    c[[0,-1]] += 1
  elsif _b == 0
    c[[1,0]] ||= 0
    c[[1,0]] += 1
  else
    if _a < 0
      _a = - _a
      _b = - _b
    end
    gcd = _a.gcd(_b)
    _a /= gcd 
    _b /= gcd
    c[[_a,_b]] ||= 0
    c[[_a,_b]] += 1
  end
end

result = 1
c.each do |(_a, _b), count|
  if _b < 0
    _a = - _a
    _b = - _b
  end
  if pair_count = c[[_b,- _a]]
    c.delete([_b,-_a])
    result *= (2**count - 1) + (2**pair_count -1) + 1
  else
    result *= (2**count)
  end
  result %= MOD
end

result += zerozero
result -= 1 # 何も選ばない時
result %= MOD
puts result 