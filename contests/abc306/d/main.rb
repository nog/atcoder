N = gets.to_i

d = [0, 0]

N.times do
  x, y = gets.split.map(&:to_i)
  nd = d.dup
  if x == 0
    nd[0] = [d[0] + y, d[1] + y, d[0]].max
  else
    nd[1] = [d[0] + y, d[1]].max
  end
  d = nd
end

puts d.max

