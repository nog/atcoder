S1 = gets.chomp
S2 = gets.chomp
S3 = gets.chomp

cons = %w{ABC ARC AGC AHC}

cons -= [S1, S2, S3]

puts cons[0]