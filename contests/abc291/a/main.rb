S = gets.chomp.split('')

puts S.find_index{|x| x.match(/[A-Z]/) ? true : false } + 1