N = gets.to_i

list = []
N.times do |i|
  list = list + [i+1] + list
end

puts list.join(' ')