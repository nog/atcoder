N = gets.to_i

list = []
N.times do |i|
    s = gets.chomp
    c = s.count('o')
    list.push([-c, i])
end

list.sort!
puts list.map{|a,b| b + 1}.join(' ')