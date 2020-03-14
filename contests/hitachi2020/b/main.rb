A, B, M = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

min = a.min + b.min
M.times do |i|
  x, y, c = gets.split.map(&:to_i)
  price = a[x-1] + b[y-1] - c
  if price < min
    min = price
  end
end

puts min