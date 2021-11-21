N, Q = gets.split.map(&:to_i)

after = {}
before = {}

Q.times do |i|
  q = gets.split.map(&:to_i)
  type = q.shift
  if type == 1
    x, y = q
    after[x] = y
    before[y] = x
  elsif type == 2
    x, y = q
    after.delete(x)
    before.delete(y)
  elsif type == 3
    x = q.shift
    t = x
    res = [x]
    while(before[t]) do
      t = before[t]
      res.unshift(t)
    end
    l = x
    while(after[l]) do
      l = after[l]
      res.push(l)
    end

    puts res.size.to_s + " " + res.join(' ')
  else
    raise
  end
end