N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort.reverse
max = A.shift
max_count = 1
k = K
result = 0
A.push(0)
while k > 0 do
  break if max == 0
  while(max == A[0]) do
    A.shift
    max_count += 1
  end
  if (k / max_count) == 0
    result += max * k
    break
  end
  # warn max
  # warn A[0]
  max_diff = max - A[0]
  diff = max_diff
  if max_diff * max_count > k
    diff = k / max_count
  end

  result += max_count * (max + max - diff + 1) * diff / 2
  max -= diff
  k -= max_count * diff
end

puts result