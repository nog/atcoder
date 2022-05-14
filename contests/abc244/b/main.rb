N = gets.to_i
T = gets.chomp.split('')

dlist = [
  [1,0],
  [0,-1],
  [-1,0],
  [0,1]
]
cur = 0

x = 0
y = 0

T.each do |t|
  if t == 'R'
    cur = (cur + 1) % 4
  elsif t == 'S'
    dx, dy = dlist[cur]
    x += dx
    y += dy
  else
    raise
  end
end

puts [x, y].join(' ')