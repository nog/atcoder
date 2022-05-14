N = gets.to_i
XY = Array.new N
N.times do |i|
  XY[i] = gets.split.map(&:to_i)
end
S = gets.chomp

hist = {}
N.times do |i|
  to = S[i]
  x, y = XY[i]
  hr, hl = (hist[y] || [10**9, 0])
  if to == "L"
    hl = x if hl < x
  else
    hr = x if x < hr 
  end
  hist[y] = [hr, hl]
end
hist.each do |k, v|
  if v[0] < v[1]
    puts 'Yes'
    exit
  end
end
puts 'No'