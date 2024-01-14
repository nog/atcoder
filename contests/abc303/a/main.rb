N = gets.to_i
S = gets.chomp.gsub("1", "l").gsub("0", "o")
T = gets.chomp.gsub("1", "l").gsub("0", "o")

puts (S == T) ? 'Yes' : 'No'