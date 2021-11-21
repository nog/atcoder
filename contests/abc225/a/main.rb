S = gets.chomp

list = S.split('')
hash = {}
list.each do |s|
  hash[s] ||= 0
  hash[s] += 1
end

if hash.keys.size == 1
  puts 1
elsif hash.keys.size == 2
  puts 3
else
  puts 6
end