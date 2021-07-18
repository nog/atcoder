N, K = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)

count = Hash.new 0
pat = 0
K.times do |i|
  c = C[i]
  count[c] += 1
  if count[c] == 1
    pat += 1
  end
end

result = pat

K.upto(N-1) do |i|
  b = i - K
  bc = C[b]
  count[bc] -= 1
  if count[bc] == 0
    pat -= 1
  end

  c = C[i]
  count[c] += 1
  if count[c] == 1
    pat += 1
  end

  if pat > result
    result = pat
  end
end

puts result