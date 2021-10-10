N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort

sum = A.sum
min = A.max
max = (sum + K) / N

cur = max
r= (1..max).bsearch do |cur|
  warn cur
  s = 0
  result = true
  # warn cur
  A.each do |a|
    s += (cur - (a % cur)) % cur
      # warn "a:#{a} s:#{s}"
    if s > K
      # warn "s:#{s}"
      result = false
      break
    end
  end
  ! result
end
puts r