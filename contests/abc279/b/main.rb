S = gets.chomp
T = gets.chomp

if S.scan(T).size > 0
  puts 'Yes'
else
  puts 'No'
end