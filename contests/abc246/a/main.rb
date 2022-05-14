x1, y1 = gets.split.map(&:to_i)
x2, y2 = gets.split.map(&:to_i)
x3, y3 = gets.split.map(&:to_i)

xhash = {}
[x1,x2,x3].each do |x|
  xhash[x] ||= 0
  xhash[x] += 1
end
yhash = {}
[y1,y2,y3].each do |y|
  yhash[y] ||= 0
  yhash[y] += 1
end

x4 = nil
y4 = nil

xhash.each do |k,v|
  x4 = k if v == 1
end
yhash.each do |k,v|
  y4 = k if v == 1
end

puts [x4, y4].join(' ')