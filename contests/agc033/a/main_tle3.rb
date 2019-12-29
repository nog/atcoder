H, W = gets.split(' ').map(&:to_i)
str = $stdin.read
map = Array.new(H) do
  Array.new(W, 0)
end
blacks = []
index = 0
result = 1
dxy = [[0,1],[0,-1],[1,0],[-1,0]]
while(index = str.index('#', index)) do
  h = index / (W + 1) 
  w = index % (W + 1)
  map[h][w] = 1
  blacks.push([h, w, 2])
  index += 1
end
while(q = blacks.shift) do
  h, w, dis = q
  4.times do |i|
    y, x = h + dxy[i][0], w + dxy[i][1]
    next if x < 0 || x >= H || y < 0 || y >= W
    next if map[y][x] > 0
    map[y][x] = dis
    blacks.push [y,x, dis + 1]
    result = dis
  end
end
puts (result - 1)