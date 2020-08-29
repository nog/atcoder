N = gets.split('').map(&:to_i)

if N.sum % 9 == 0
    puts 'Yes'
else
    puts 'No'
end