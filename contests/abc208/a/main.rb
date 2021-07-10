A, B = gets.split.map(&:to_i)

if A * 1 > B
  puts 'No'
elsif A * 6 < B
  puts 'No'
else
  puts 'Yes'
end