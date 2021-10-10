X, Y = gets.split('.').map(&:to_i)

if Y <= 2
  puts "#{X}-"
elsif Y <= 6
  puts "#{X}"
else
  puts "#{X}+"
end