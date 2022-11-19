N = gets.to_i

@map = Array.new(N){ Array.new(N) }
min = 1
N.times do |i|
  next if i.odd?
  N.times do |j|
    @map[i][j] = min
    min += 1
  end
end
N.times do |i|
  next if i.even?
  N.times do |j|
    @map[i][j] = min
    min += 1
  end
end

@map.each do |line|
  puts line.join(' ')
end