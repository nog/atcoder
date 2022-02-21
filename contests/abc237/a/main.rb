N = gets.to_i
MAX = 2**31

if (- MAX) <= N && N < MAX
  puts 'Yes'
else
  puts 'No'
end