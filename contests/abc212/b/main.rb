X1, X2, X3, X4 = gets.split('').map(&:to_i)

if [X1 , X2 , X3 , X4].uniq.size == 1
  puts 'Weak'
elsif ((X1 + 1) % 10 )== X2 && ((X2 + 1) % 10 == X3) && (X3 + 1) % 10 == X4 
  puts 'Weak'
else
  warn (X1 + 1) % 10
  puts 'Strong'
end