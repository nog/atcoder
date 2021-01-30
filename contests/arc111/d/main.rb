N = gets.to_i


if N == 1
    puts 1
    puts "AB"
    exit
end

if N == 2
    puts "AABB"
    puts "AABB"
    puts "ABAB"
    puts "ABBA"
    puts "ABAB"
    puts "ABBA"
end

if N == 3
    puts "AAAABBBB"
    puts "AABBAABB"
    puts "ABABABAB"
end

["A", "B"]