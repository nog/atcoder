N = gets.to_i

base = 0
list = []
N.times do
  s = gets.chomp.split('')
  xcounts = 0
  point = 0
  sum = 0
  s.each do |c|
    if c == 'X'
      xcounts += 1
    else
      i = c.to_i
      sum += i
      point += (xcounts * i)
    end
  end
  base += point
  list.push([-xcounts, sum, xcounts])
end
list.sort!
warn list.inspect
result = base
xc = 0
list.each do |_, sum, xcounts|
  # warn sum
  # warn mxcounts
  # warn point
  result += (xc * sum)
  xc += xcounts
end
puts result