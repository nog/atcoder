N, D = gets.split.map(&:to_i)
LR = Array.new N
N.times do |i|
  LR[i] = [i, *gets.split.map(&:to_i)]
end

deleted = {}
rlist = LR.sort_by{|x| x[2]}
llist = LR.sort_by{|x| x[1]}
result = 0
while(ri, rl, rr = rlist.shift) do
  next if deleted[ri]
  result += 1
  bl = rr
  br = rr + D - 1
  range = bl..br
  # warn range.inspect
  while(llist[0]) do
    # warn llist[0].inspect
    li, ll, lr = llist[0]
    range2 = ll..lr
    if range.include?(ll) || range.include?(lr) || range2.include?(rl) || range2.include?(rr)
      deleted[li] = true
      llist.shift
    else
      break
    end
  end
end

puts result