SX, SY = gets.split.map(&:to_i)
TX, TY = gets.split.map(&:to_i)
A, B, C, D = gets.split.map(&:to_i)

r = [[A,C], [B,C], [B, D], [A, D]]

if SX == TX && SY == TY
  puts 'Yes'
  exit
end

def point(from, centor)
  [
    from[0] + 2 * (centor[0] - from[0]),
    from[1] + 2 * (centor[1] - from[1])
  ]
end


list = []
l = []
r.each do |cen|
  l.push(point([SX, SY], cen))
end

list.push(l)
warn l.inspect