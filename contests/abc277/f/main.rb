H, W = gets.split.map(&:to_i)
A = Array.new(H)
a1 = Array.new(H)
H.times do |i|
  line  = gets.split.map(&:to_i)
  max = line.max
  min = max
  line.each do |a|
    next a == 0
    min = a if a < min
  end
  a1[i] = [min, max, line]
  A[i] = line
end

a1.sort!

smallers = {}
max = 1
H.times do |i|
  lmin, lmax, line = a1[i]
  if lmin < max
    puts 'No'
    exit
  end
  max = lmax
  line.sort.each.with_index do |l, i|
  end
end