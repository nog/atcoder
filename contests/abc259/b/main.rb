A, B, D = gets.split.map(&:to_i)

rad = (Math::PI*(D.to_f/180))

x = A * Math.cos(rad) - B * Math.sin(rad)
y = A * Math.sin(rad) + B * Math.cos(rad)

puts "#{x} #{y}"