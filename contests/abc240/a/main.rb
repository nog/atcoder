a, b = gets.split.map(&:to_i)

if a == b + 1
elsif b == a + 1
elsif a == 10 && b == 1
elsif b == 10 && a == 1
else
  puts 'No'
  exit
end

puts 'Yes'