h1, m1, h2, m2, k = gets.split.map(&:to_i)

hour = h2 - h1
minutes = m2 - m1 + ( hour * 60 )
result = minutes - k
if result < 0
  result = 0
end
puts result