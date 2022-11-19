N, M = gets.split.map(&:to_i)

field = Array.new(N){ Array.new(N, -1)}
field[0][0] = 0

_dlist = []
0.upto(M) do |h|
  h2 = h**2
  break if h2 > M
  0.upto(M) do |w|
    h2w2 = h2 + (w**2)
    break if h2w2 > M
    if h2w2 == M
      _dlist.push([h, w])
    end
  end
end
dlist = []
_dlist.each do |h, w|
  [h, -h].uniq.each do |dh|
    [w, -w].uniq.each do |dw|
      dlist.push([dh, dw])
    end
  end
end

# warn dlist.inspect

queue = [[0,0,0]]

while(c, i, j = queue.shift) do
  dlist.each do |di, dj|
    k = i + di
    l = j + dj
    next if k < 0 || k >= N
    next if l < 0 || l >= N
    next if field[k][l] != -1
    field[k][l] = c + 1
    queue.push([c+1, k, l])
  end
end

field.each do |line|
  puts line.join(' ')
end