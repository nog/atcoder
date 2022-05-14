H, W, N = gets.split.map(&:to_i)
SX, SY = gets.split.map(&:to_i)
GX, GY = gets.split.map(&:to_i)

mapx = Hash.new
mapy = Hash.new
mapx_sorted = {}
mapy_sorted = {}

history = Hash.new

N.times do |i|
  x,y = gets.split.map(&:to_i)
  mapx[x] ||= []
  mapx[x].push(y)
  mapy[y] ||= []
  mapy[y].push(x)
end

queue = [[SX, SY, 0]]
# warn mapx.inspect
# warn mapy.inspect
while(x,y,c = queue.shift) do
  # warn "x:#{x} y:#{y}"
  next if history[x] && history[x][y]
  if GX == x && GY == y
    puts c
    exit
  end
  history[x] ||= {}
  history[x][y] = true
  unless mapx_sorted[x]
    mapx[x] ||= []
    mapx[x].sort!
    mapx_sorted[x] = true
  end
  unless mapy_sorted[y]
    mapy[y] ||= []
    mapy[y].sort!
    mapy_sorted[y] = true
  end
  mx = mapx[x]
  nc = c+1
  if mx.size > 0
    i = mx.bsearch_index{|m| m > y }
    if !i
      queue.push([x, mx[-1] + 1, nc])
    elsif i == 0
      queue.push([x, mx[0] - 1, nc])
    else
      queue.push([x, mx[i] - 1, nc])
      queue.push([x, mx[i-1] + 1, nc])
    end
  end
  my = mapy[y]
  if my.size > 0
    i = my.bsearch_index{|m| m > x }
    if !i
      queue.push([my[-1] + 1, y, nc])
    elsif i == 0
      queue.push([my[0] -1, y, nc])
    else
      queue.push([my[i] -1, y, nc])
      queue.push([my[i-1] +1, y, nc])
    end
  end
end

puts -1