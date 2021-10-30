S = gets.chomp

len = S.length
list = []
s2 = S + S

len.times do |i|
  list.push(s2[i..(i+len-1)])
end

list.sort!
puts list[0]
puts list[-1]