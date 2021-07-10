N = gets.to_i

llist = []
rlist = []
N.times do
  t, l, r = gets.split.map(&:to_i)
  l *= 2
  r *= 2
  if t == 2
    r -= 1
  elsif t == 3
    l += 1
  elsif t == 4
    r -= 1
    l += 1
  end
  llist.push(l)
  rlist.push(r)
end

llist.sort!
rlist.sort!

result = 0
cnt = 0
llist.each do |l|
  while(rlist[0] < l) do
    rlist.shift
    cnt -= 1
  end
  result += cnt
  cnt += 1
end

puts result