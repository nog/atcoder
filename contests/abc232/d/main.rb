H, W = gets.split.map(&:to_i)
map = Array.new H+2
H.times do |i|
  map[i+1] = ["#", *gets.chomp.split(''), '#']
end
map[0] = ["#"] * (W+2)
map[-1] = ["#"] * (W+2)

result = 1
queue = [[1,1,1]]

done =  Array.new 200*200

while(h, w, c = queue.shift) do
  if c > result
    result = c
  end

  if map[h][w+1] == '.'
    k = h*1000 +w+1
    unless done[k]
      done[k] = true
      queue.push([h,w+1,c+1])
    end
  end
  if map[h+1][w] == '.'
    k = (h+1)*1000 + w
    unless done[k]
      done[k] = true
      queue.push([h+1,w,c+1])
    end
  end
end

puts result