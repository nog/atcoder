N, M = gets.split.map(&:to_i)
A = Array.new(N)
N.times do |i|
  A[i] = gets.split.map(&:to_i)
end

@field = Array.new(N).map{ Array.new(N) }
@field[0][0] = 0
@field[0][N-1] = 1
@field[N-1][0] = 2
@field[N-1][N-1] = 3
def print_field field
  field.each do |f|
    p f
  end
end

def find_point color, points
  ds = [['U', [-1,0]], ['D', [1,0]], ['L', [0,-1]], ['R', [0,1]]].shuffle
  points.shuffle.each do |po|
    y, x = po[0], po[1]
    ds.each do |dd|
      5.times do |i|
        ny = y + (dd[1][0] * (i+1))
        nx = x + (dd[1][1] * (i+1))
        break if ny < 0 || nx < 0 || nx >= N || ny >= N
        if i == 0
          break if ny < y && ny < 5
          break if nx < x && nx < 5
          break if x < nx && nx > N-5
          break if y < ny && ny > N-5
        end
        if A[ny][nx] == color && @field[ny][nx] != color
          return [po, dd]
        end
      end
    end

  end
  return nil
end

points = [[[0,0]], [[0,N-1]], [[N-1,0]], [[N-1,N-1]]]
ds = [['U', [-1,0]], ['D', [1,0]], ['L', [0,-1]], ['R', [0,1]]]
M.times do |i|
  # print_field @field
  color = i % 4
  ta = find_point(color, points[color])
  unless ta
    puts -1
    next
  end
  po = ta[0]
  d = ta[1]
  puts "#{po.join(' ')} #{d[0]}"
  5.times do |i|
    dy, dx = d[1][0], d[1][1]
    y = po[0] + (i+1) * dy
    x = po[1] + (i+1) * dx
    if x >= 0 && y >= 0 && x < N && y < N
      ocolor = @field[y][x]
      @field[y][x] = color
      if ocolor
        points[ocolor].delete([y,x])
      end
      points[color].push([y, x])
    else
      break
    end
  end
  points[color] = points[color].uniq
end