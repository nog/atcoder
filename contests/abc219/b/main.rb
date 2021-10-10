S1 = gets.chomp
S2 = gets.chomp
S3 = gets.chomp
S = [S1, S2, S3]
T = gets.chomp.split('').map(&:to_i)

puts T.map{|t| S[t-1]}.join('')