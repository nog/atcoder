A, B = gets.split.map(&:to_i)

if A + B >= 15 && B >= 8
    puts 1
elsif A + B >= 10 && B >= 3
    puts 2
elsif A + B >= 3
    puts 3
else
    puts 4
end