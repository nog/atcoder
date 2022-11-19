S = gets.chomp.split('')
T = gets.chomp.split('')

sl = []
tl = []
S.each do |s|
  last = sl[-1]
  if last && last[0] == s
    last[1] += 1
  else
    sl.push([s, 1])
  end
end

T.each do |t|
  last = tl[-1]
  if last && last[0] == t
    last[1] += 1
  else
    tl.push([t,1])
  end
end

if sl.size != tl.size
  puts 'No'
  exit
end

sl.size.times do |i|
  s, sc  = sl[i]
  t, tc  = tl[i]
  if s != t
    puts 'No'
    exit
  end
  next if sc == tc
  if tc < sc
    puts 'No'
    exit
  end
  if sc == 1
    puts 'No'
    exit
  end
end

puts 'Yes'