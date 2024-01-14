N = gets.to_i
AB = []
list = []
N.times do |i|
    a, b = gets.split.map(&:to_i)
    list.push [-Rational(a, a+b), i]
end

list.sort!
puts list.map{|_,i| i+ 1}.join(' ')