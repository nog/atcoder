H, W = gets.split.map(&:to_i)
S = Array.new H+2
S[0] = [-3] * (W + 2)
S[-1] = [-3] * (W + 2)

ROAD = -1
BLOCK = -2
WALL = -3
H.times do |i|
  s = gets.chomp.split('').map{|x|
    if x == '.'
      ROAD
    elsif x == '#'
      BLOCK
    else
      raise
    end
  }
  s.unshift(WALL)
  s.push(WALL)
  S[i+1] = s
end

step_queue = [[1,1]]
bomb_queue = []
count = 0
S[1][1] = 0

while(S[H][W] == ROAD) do
  while(h, w = step_queue.shift) do
    [[h-1,w],[h+1,w],[h,w-1],[h,w+1]].each do |nh, nw|
      s = S[nh][nw]
      if s == ROAD
        S[nh][nw] = count
        step_queue.push([nh, nw])
      elsif s == BLOCK
        S[nh][nw] = count + 1
        bomb_queue.push([nh,nw])
      end
    end
  end
  
  count += 1
  while(h, w = bomb_queue.shift) do
    step_queue.push([h,w])
    [[h-1,w-1],[h-1,w],[h-1,w+1],[h,w-1],[h,w+1],[h+1,w-1],[h+1,w],[h+1,w+1]].each do |nh, nw|
      s = S[nh][nw]
      if s == ROAD
        S[nh][nw] = count
        step_queue.push([nh,nw])
      elsif s == BLOCK
        S[nh][nw] = count
        step_queue.push([nh,nw])
      end
    end
  end
end

puts S[H][W]