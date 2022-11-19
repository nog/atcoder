N, M, T = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
XY = Array.new(N)
M.times do |i|
  x, y = gets.split.map(&:to_i)
  XY[x] = y
end

t = T
(N-1).times do |i|
  a = A[i]
  t -= a
  if t <= 0
    puts "No"
    exit
  end
  if XY[i+2]
    t += XY[i+2]
  end
end

puts 'Yes'