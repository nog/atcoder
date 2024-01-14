N = gets.to_i 
res = 0
N.times do 
  s = gets.chomp 
  if s == 'For'
    res += 1 
  end
end

if res * 2 >= N 
  puts 'Yes'
else
  puts 'No'
end
