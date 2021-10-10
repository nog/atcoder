N, M = gets.split.map(&:to_i)
k = Array.new(M)
a = Array.new(M)
hash = {}
queue = []
M.times do |i|
  k[i] = gets.to_i
  a[i] = gets.split.map(&:to_i)
  l = a[i].last
  x = i
  if hl = hash[l]
    a[hl].pop
    a[x].pop
    k[hl] -= 1
    k[x] -= 1
    queue.push(hl)
    queue.push(x)
    hash.delete(l)
  else
    hash[l] = x
  end
end
# warn queue.inspect
while(q = queue.shift) do
  # warn hash.inspect
  # warn q.inspect
  b = a[q].last
  if b && hb = hash[b]
    a[q].pop
    a[hb].pop
    k[q] -= 1
    k[hb] -= 1
    queue.push(q)
    queue.push(hb)
    hash.delete(b)
  else
    hash[b] = q
  end
end

if k.all?(0)
  puts 'Yes'
else
  puts 'No'
end