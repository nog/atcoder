n, k = gets.split.map(&:to_i)
sunukes = (1..n).to_a
d = Array.new k
a = Array.new k
k.times do |i|
  d[i] = gets.to_i
  a[i] = gets.split.map(&:to_i)
  sunukes = sunukes - a[i]
end

puts sunukes.size