S1 = gets.chomp.split('')
S2 = gets.chomp.split('')


if S1[0] == '.' && S2[1] == '.'
  puts 'No'
elsif S1[1] == '.' && S2[0] == '.'
  puts 'No'
else
  puts 'Yes'
end