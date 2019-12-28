h, w = gets.chomp.split(' ').map(&:to_i)
map = []
h.times do
  map.push(gets.chomp.split('').map{|c| c == '#'})
end
result = 0
while true do
  finish = true
  next_map = map.map{|line| line.dup}
  map.size.times do |dh|
    line = map[dh]
    line.size.times do |dw|
      x = line[dw]
      if x
        dh + 1 < map.size && next_map[dh+1][dw] = true
        dh - 1 >= 0 && next_map[dh-1][dw] = true
        dw + 1 < line.size && next_map[dh][dw +1] = true
        dw -1 >=0 && next_map[dh][dw-1] =true
      else
        finish = false
      end
    end
  end
  unless finish
    result += 1
    map = next_map
  else
    break
  end
end
puts result