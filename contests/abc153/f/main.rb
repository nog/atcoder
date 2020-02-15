N, D, A = gets.split.map(&:to_i)
pairs = Array.new(N)
N.times do |i|
  pairs[i] = gets.split.map(&:to_i)
end
pairs = pairs.sort_by{|x| x[0] }

result = 0
damage_list = []
damage = 0
AF = A.to_f
while(pair =  pairs.shift) do
  x = pair[0]
  while damage_list.size > 0
    break if damage_list[0][0] >= x
    damage -= damage_list[0][1]
    damage_list.shift
  end
  next if damage > pair[1]
  num = ((pair[1] - damage) / AF).ceil
  result += num
  dd = num * A
  damage = damage + dd
  to = x + ( 2 * D )
  damage_list.push([to, dd])
end

puts result