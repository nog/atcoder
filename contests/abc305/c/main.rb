H, W = gets.split.map(&:to_i)
map = Array.new
H.times do
  map.push(gets.split(''))
end

hcounts = []
H.times do |i|
  hcounts.push map[i].count('#')
end

hmax = hcounts.max
h = hcounts.find_index(hmax -1) + 1

map = map.transpose

wcounts = []
W.times do |i|
  wcounts.push map[i].count('#')
end
wmax = wcounts.max
w = wcounts.find_index(wmax-1) + 1
puts "#{h} #{w}"