X, Y = gets.split.map(&:to_i)

if (X - Y).abs < 3
    puts 'Yes'
else
    puts 'No'
end