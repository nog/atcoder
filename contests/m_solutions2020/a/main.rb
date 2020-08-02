x = gets.to_i

if x <= 599
    puts 8
elsif x <= 799
    puts 7
elsif x <= 999
    puts 6
elsif x <= 1199
    puts 5
elsif x <= 1399
    puts 4
elsif x <= 1599
    puts 3
elsif x <= 1799
    puts 2
else
    puts 1
end