N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort
asum = A.sum

hash = {}
A.each do |a|
  d = a % M
  hash[d] ||= []
  hash[d].push(a)
end

deleted = 0

# warn hash.inspect

# while(hash.keys.size == M) do
#   hash.keys.each do |k|
#     deleted += hash[k].pop
#     if hash[k].size == 0
#       hash.delete(k)
#     end
#   end
# end

keys = hash.keys.sort
ksize = keys.size
# warn "keys:#{keys.inspect} asum:#{asum}"
keys *= 2

i = 0
result = deleted

# warn "deleted:#{deleted}"
while(i < ksize) do
  s = i
  sum = deleted
  while(i - s + 1 <= ksize) do
    k = keys[i]
    sum += hash[k].sum
    if keys[i+1] == (k+1) % M
      i += 1
    else
      break
    end
  end
  # warn "s:#{s} i:#{i} sum:#{sum}"
  if result < sum
    result = sum
  end
  i += 1
end

puts asum - result