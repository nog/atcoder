s = gets.chomp.split('')

last_count = 0
while(s[-1-last_count] == 'a') do
  last_count += 1
end

first_count = 0
while(s[first_count] == 'a')
  first_count += 1
end

if first_count > last_count
  puts 'No'
  exit
end

s.insert(0, *(['a'] * ( last_count - first_count))) if last_count - first_count > 0

len = s.length
(len / 2).times do |i|
  if s[i] != s[len-1-i]
    puts 'No'
    exit
  end
end

puts 'Yes'