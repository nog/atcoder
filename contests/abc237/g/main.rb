N, Q, X = gets.split.map(&:to_i)
P = gets.split.map(&:to_i)

list = P.map do |x|
  (x == X) ? 0 : (x < X ? -1 : 1)
end
Q.times do |i|
  c, l, r = gets.split.map(&:to_i)
  l -= 1
  r -= 1
  dlist = list[l..r]
  micount = dlist.count(-1)
  plcount = dlist.count(1)
  xcount = dlist.size - micount - plcount
  if c == 1
    list.fill(-1, l...l+micount)
    list.fill(0, l+micount...l+micount+xcount)
    list.fill(1, l+micount+xcount...l+micount+xcount+plcount)
  else
    list.fill(1, l...l+plcount)
    list.fill(0, l+plcount...l+plcount+xcount)
    list.fill(-1, l+plcount+xcount...l+plcount+xcount+micount)
  end
end

puts list.index(0) + 1