x, y, a, b, c = gets.split.map(&:to_i)
_p = p
p = gets.split.map(&:to_i).sort.reverse
q = gets.split.map(&:to_i).sort.reverse
r = gets.split.map(&:to_i).sort.reverse

mix = (p[0...x] + q[0...y] + r).sort.reverse

result = 0
(x+y).times do |i|
  result += mix[i]
end
puts result