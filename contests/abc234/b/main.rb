N = gets.to_i
XY = []
result2 = 0
N.times do |i|
  x, y = gets.split.map(&:to_i)
  XY.each do |x2, y2|
    len2 = (x2 - x)**2 + (y2 - y)**2
    result2 = len2 if len2 > result2
  end
  XY.push([x,y])
end

puts result2**0.5