S = gets.chomp

if S.match(/^[A-Z][1-9][0-9]{5}[A-Z]$/)
  puts 'Yes'
else
  puts 'No'
end