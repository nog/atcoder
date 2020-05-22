a, b, h, m = gets.split.map(&:to_i)

akaku = (h * (360 / 12) + m / 2.0 ) * Math::PI / 180
bkaku = m * 360 / 60 * Math::PI / 180

ax = Math.sin(akaku) * a
ay = Math.cos(akaku) * a

bx = Math.sin(bkaku) * b
by = Math.cos(bkaku) * b

nijo = (bx - ax)**2 + (by - ay) **2
puts Math.sqrt nijo