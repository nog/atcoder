N = gets.to_i
LR = []
N.times do |i|
  LR.push(gets.split.map(&:to_i))
end
LR.sort!
l, r = LR.shift

LR.each do |nl, nr|
  if r < nl
    puts [l,r].join(' ')
    l, r = nl, nr
  else
    r = nr if r < nr
  end
end

puts [l,r].join(' ')