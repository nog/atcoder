n = gets.to_i
a = Array.new n 
b = Array.new n 
n.times do |i|
  a[i], b[i] = gets.split.map(&:to_i)
end

if n.odd?
  min = a.sort[n/2]
  max = b.sort[n/2]
  puts max - min + 1
else
  a = a.sort
  b = b.sort
  min = (a[n/2] + a[n/2-1])
  max = b[n/2] + b[n/2-1]
  puts max - min + 1
end