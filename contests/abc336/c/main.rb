N = gets.to_i
puts (N-1).to_s(5).gsub("4", "8").gsub("3", "6").gsub("2", "4").gsub("1", "2")