L1, R1, L2, R2 = gets.split.map(&:to_i)

range1 = (L1...R1).to_a
range2 = (L2...R2).to_a

puts (range1 & range2).size