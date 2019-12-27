n = gets.chomp.to_i
v = gets.chomp.split(" ")
a_map = {}
b_map = {}
v.each_slice(2) do |pair|
  a_map[pair[0]] ||= 0
  b_map[pair[1]] ||= 0
  a_map[pair[0]] += 1 
  b_map[pair[1]] += 1 
end

a_max = a_map.max{|a,b| a[1] <=> b[1]}
b_max = b_map.max{|a,b| a[1] <=> b[1]}
if a_max[0] == b_max[0]
  b_map.delete b_max[0]
  b_second = b_map.max{|a,b| a[1] <=> b[1]} || [nil, 0]
  a_map.delete a_max[0]
  a_second = a_map.max{|a,b| a[1] <=> b[1]} || [nil, 0]

  if a_max[1] + b_second[1] >= b_max[1] + a_second[1]
    puts n - a_max[1] - b_second[1]
  else
    puts n - b_max[1] - a_second[1]
  end
else
  puts n - a_max[1] - b_max[1]
end
