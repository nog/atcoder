P = gets.split.map(&:to_i)

puts P.map{|x| ('a'.ord + x - 1).chr }.join('')