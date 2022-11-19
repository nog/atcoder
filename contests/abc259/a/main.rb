N, M, X, T, D = gets.split.map(&:to_i)

if M >= X
  puts T
  exit
end

puts T - ((X - M) * D)