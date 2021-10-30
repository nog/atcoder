N = gets.to_i
XY = []
lines = {}
result = 0
N.times do |i|
  x,y = XY[i] = gets.split.map(&:to_i)
end

(N-2).times do |i|
  x1, y1 = XY[i]
  i.upto(N-2) do |j|
    x2, y2 = XY[j]
    j.upto(N-1) do |k|
      x3, y3 = XY[k]
      if (x2 - x1) * (y3 - y1) != (x3 - x1) * (y2 - y1)
        result += 1
      end
    end
  end
end
puts result