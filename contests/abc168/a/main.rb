n = gets.to_i
n2 = n % 10
if n2 == 3
  puts "bon"
elsif [0,1,6,8].include? n2
  puts "pon"
else
  puts "hon"
end