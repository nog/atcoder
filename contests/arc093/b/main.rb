A, B = gets.split.map(&:to_i)

map = Array.new(100)
100.times do |i|
  map[i] = Array.new(100, i < 50 ? true : false )
end

(A-1).times do |i|
  h = (i / 50) * 2
  w = (i % 50) * 2
  map[h][w] = false
end

(B-1).times do |i|
  h = 99 - (i / 50) * 2
  w = (i % 50) * 2
  map[h][w] = true
end
warn map.inspect
puts "100 100"
map.each do |line|
  puts line.map{|x| x ? '#' : '.'}.join('')
end