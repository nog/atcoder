S1 = gets.chomp
S2 = gets.chomp
S3 = gets.chomp
S4 = gets.chomp
if [S1, S2, S3, S4].uniq.size == 4
  puts 'Yes'
else
  puts 'No'
end