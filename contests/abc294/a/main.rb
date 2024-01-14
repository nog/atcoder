N = gets.to_i
A = gets.split.map(&:to_i)

puts A.find_all{|a| a.even? }.join(' ')