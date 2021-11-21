N = gets.to_i

xy = Array.new N
N.times do |i|
  xy[i] = gets.split.map(&:to_i)
end
xy.sort!
hash = {}
result = 0

N.times do |i|
  x1, y1 = xy[i]
  (i+1).upto(N-1) do |j|
    x2, y2 = xy[j]
    d = nil
    if y2 - y1 == 0
      d = Float::INFINITY
    else
      d = Rational(x2 - x1, y2 - y1)
    end
    next if hash[d]
    hash[d] = true
    result += 1
  end
end
puts result * 2