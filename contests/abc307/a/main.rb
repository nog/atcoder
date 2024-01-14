N = gets.to_i
A = gets.split.map(&:to_i)

sum = 0
s = 0
res = []
A.each.with_index do |a, i|
  if (i % 7) == 0
    res.push(s)
    s = 0
  end
  s += a
end

if N % 7 != 0
  res.push(s)
end
res.shift
puts res.join(' ')