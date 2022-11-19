list = gets.split.map(&:to_i)

hash = {}
list.each do |k|
  hash[k] ||= 0
  hash[k] += 1
end

if hash.keys.size != 2
  puts 'No'
  exit
end

k = hash.keys.first

if hash[k] == 2 || hash[k] == 3
  puts 'Yes'
else
  puts 'No'
end