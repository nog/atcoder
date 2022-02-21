S = gets.chomp.split('')
K = gets.to_i

list = []
S.each.with_index do |s, i|
  if s == 'Y'
    list.push(i)
  end
end
result = 1
size = list.size
right = []
left = []
left_cost = 0
right_cost = 0
centor = list[0]
i = 1
while(i<N) do
  x = list[i]
  right_cost += x - centor - 1 - right.size
  right.push(x)
  i += 1
end