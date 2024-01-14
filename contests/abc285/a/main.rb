A, B = gets.split.map(&:to_i).sort

def yes
  puts 'Yes'
  exit
end

def no
  puts 'No'
  exit
end

if B == A * 2 || B == A * 2 + 1
  yes 
else
  no 
end