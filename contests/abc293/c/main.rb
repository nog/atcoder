H, W = gets.split.map(&:to_i)

map = Array.new H + 2
stats = Array.new(H+2){ Array.new(W+2){ Array.new }}
map[0] = Array.new W+2, 0
H.times do |h|
  l = gets.split(' ').map(&:to_i)
  l.unshift(0)
  l.push(0)
  map[h+1] = l
end

stats[1][0] = [{ 0 => true}]
map[H+1] = Array.new W+2, 0

1.upto(H) do |h|
  line = map[h]
  s0 = stats[h-1]
  s1 = stats[h]
  1.upto(W) do |w|
    x = line[w]
    list = []
    (s0[w] + s1[w-1]).each do |h|
      next if h[x]
      h2 = h.dup
      h2[x] = true
      list.push(h2)
    end
    s1[w] = list
  end
end
# warn stats.inspect

puts stats[H][W].size