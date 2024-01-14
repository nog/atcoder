N, M , H, K = gets.split.map(&:to_i)
S = gets.chomp.split('')

items = {}
M.times do 
  x, y = gets.split.map(&:to_i)
  items[x] ||= {}
  items[x][y] = true
end

x, y = 0, 0
k = H
S.each do |s|
  if s == "L"
    x -= 1
  elsif s == "R"
    x += 1
  elsif s == "U"
    y += 1
  elsif s == "D"
    y -= 1
  else
    raise
  end
  k -= 1
  if k < 0
    puts "No"
    exit
  end
  
  if items[x] && it = items[x][y]
    if k < K
      k = K
      items[x][y] = false
    end
  end
  # warn "x:#{x} y:#{y} k:#{k}"
end

puts "Yes"