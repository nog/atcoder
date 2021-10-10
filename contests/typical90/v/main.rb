A, B, C = gets.split.map(&:to_i)

gcd = A.gcd(B).gcd(C)
puts ((A + B + C) / gcd ) - 3