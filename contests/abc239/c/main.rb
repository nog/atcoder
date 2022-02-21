x1, y1, x2, y2 = gets.split.map(&:to_i)

p1 = [x1,y1]
p2 = [x2,y2]

dlist = [
  [1,2],
  [2,1],
  [2,-1],
  [1,-2],
  [-1,-2],
  [-2,-1],
  [-2,1],
  [-1,2]
]

p1list = dlist.map do |po|
  po = po.dup
  po[0] += p1[0]
  po[1] += p1[1]
  po
end
p2list = dlist.map do |po|
  po = po.dup
  po[0] += p2[0]
  po[1] += p2[1]
  po
end

# warn p1.inspect
# warn p2.inspect
# warn dlist.inspect
# warn p1list.inspect
# warn p2list.inspect
# warn (p1list & p2list).inspect

if (p1list & p2list).size > 0
  puts 'Yes'
else
  puts 'No'
end