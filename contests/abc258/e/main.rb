N, Q, X = gets.split.map(&:to_i)
W = gets.split.map(&:to_i)
wsum = W.sum
cur = 0
nexts = {}
list = []
counts = {}

w = 0
wsumlist = [0]
W.each do |_w|
  w += _w
  wsumlist.push(w)
end
W.each do |_w|
  w += _w
  wsumlist.push(w)
end
# warn wsumlist.inspect
while(nexts[cur] == nil) do
  list.push(cur)
  count = 0
  x = X % wsum
  count += (X / wsum) * N
  lim = x + wsumlist[cur]
  i = wsumlist.bsearch_index{|x| x >= lim }
  # warn "X:#{X} x:#{x} cur:#{cur} lim:#{lim} i:#{i}"
  count += (i-cur)
  # while(x > 0) do
  #   # warn "x:#{x}"
  #   x -= W[c]
  #   c = (c + 1) % N
  #   count += 1
  # end
  nexts[cur] = (i) % N
  counts[cur] = count
  cur = (i) % N
end

# warn nexts.inspect
# warn list.inspect
# warn counts.inspect

c = 0
hige_size = 0
while(c != cur) do
  hige_size += 1
  c = nexts[c]
end
lsize = list.size - hige_size
# warn "hige_size:#{hige_size} lsize:#{lsize}"
Q.times do
  k = (gets.to_i - 1)
  if k <= hige_size
    puts counts[list[k]]
    next
  end
  k -= hige_size
  k = k % lsize
  l = list[k+hige_size]
  # warn "l:#{l}"
  puts counts[l]
end