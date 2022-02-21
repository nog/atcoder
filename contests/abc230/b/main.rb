S = gets.chomp

T = "oxx" * 100

if T.include?(S)
  puts 'Yes'
else
  puts 'No'
end