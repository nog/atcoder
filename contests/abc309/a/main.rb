A, B = gets.split.map(&:to_i)

if A != (B - 1)
    puts 'No'
    exit
end

if (A % 3) == 0
    puts 'No'
    exit
end

puts 'Yes'