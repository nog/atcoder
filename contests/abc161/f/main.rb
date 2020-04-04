n = gets.to_i

require 'prime'
def divisor_list x
  return [1] if x == 1
  Prime.prime_division(x).map do |e|
    Array.new(e[1]+1).map.with_index do |element, i|
      e[0]**i
    end
  end.inject{|p,q| p.product(q)}.map do |a|
    [a].flatten.inject(&:*)
  end.sort
end

divisors = divisor_list(n-1) + divisor_list(n)
results = [2, n , *divisors].uniq

def is_result? n, x
  return false if x < 2
  nn = n
  while(nn % x == 0) do
    nn = nn / x
  end
  nn = nn % x
  if nn == 1
    true
  else
    false
  end
end
puts results.find_all{|z| is_result?(n, z) }.size