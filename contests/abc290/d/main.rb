T = gets.to_i
T.times do
  n, d, k = gets.split.map(&:to_i)
  lcm = n.lcm(d)
  cnt = lcm / d
  if cnt >= k
    puts (k-1) * d % n
    next
  end
  m = k % cnt
  l = (k-1) / cnt

  # warn "n:#{n} d:#{d} k:#{k} lcm:#{lcm} cnt:#{cnt} m:#{m} l:#{l}"
  puts (l + (m-1) * d) % n
end