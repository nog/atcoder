N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort!
max = (A.sum / K) + 1
result = (0..max).bsearch do |res|
  sum = 0
  A.each do |a|
    sum += a < res ? a : res
  end
  if sum >= res * K 
    false
  else
    true
  end
end

puts result - 1