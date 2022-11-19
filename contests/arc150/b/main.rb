T = gets.to_i
T.times do
  a, b = gets.split.map(&:to_i)
  y = 0
  res = 99999999999999999
  while(y < res) do
    k = (b + y) / a
    unless  k == 0
    unless (b+y) % k == 0
      y += 1
      next
    end
    x = (b+y) / k - a
    r = x + y
    res = r if r < res
    warn "res:#{res} x:#{x} y:#{y} r:#{r}" if a < 10000
    y += 1
  end
  puts res
end