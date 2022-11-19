N = gets.to_i
rads = []
include Math
N.times do
  x, y = gets.to_i
  r = atan2(y, x)
  rads.push([r, x**2 + y**2, x, y])
end

rads.sort!

M = gets.to_i
points = [[0,0]]
M.times do
  u, v = gets.split.map(&:to_i)
  points.push([u,v])
end

Q = gets.to_i
Q.times do
  a, b = gets.split.map(&:to_i)
  result = true
  points.each do |x,y|
    r = atan2(b - y, a - x)
    rads.each.with_index do |rad, i|
      if r < rad
        po1 = rads[i-1]
        po2 = rads[i]
        x1, y1 = po1[2], po1[3]
        x2, y2 = po2[2], po2[3]
        break
      end
    end
  end
end