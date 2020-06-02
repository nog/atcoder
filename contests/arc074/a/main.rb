h, w = gets.split.map(&:to_i)

if h % 3 == 0 || w % 3 == 0
  puts 0
  exit
end

result = []

def calc h, w, h1, w1
  h2, w2 = h, w
  if h == h1
    w2 = w - w1
  else
    h2 = h - h1
  end
  a = h1 * w1
  if h2 % 2 == 0 || w2 % 2 == 0
    return (a - h2 * w2 / 2).abs
  end

  b1 = h2 / 2 * w2
  c1 = (h2.to_f / 2).ceil * w2
  b2 = w2 / 2 * h2
  c2 = (w2.to_f / 2).ceil * h2
  abc1 = [a, b1, c1]
  abc2 = [a, b2, c2]
  return [abc1.max - abc1.min, abc2.max - abc2.min].min
end

h11 = (h.to_f / 3).ceil
w11 = w
result.push(calc(h, w, h11, w11))

h21 = (h.to_f / 3).floor
w21 = w
result.push(calc(h, w, h21, w21))

h31 = h
w31 = (w.to_f / 3).ceil
result.push(calc(h, w, h31, w31))

h41 = h
w41 = (w.to_f / 3).floor
result.push(calc(h, w, h41, w41))

warn result.inspect
puts result.min