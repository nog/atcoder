N = gets.to_i
W = gets.chomp.split
list = ["and", "not", "that", "the", "you"]
if W.find{|x| list.include?(x) }
  puts 'Yes'
else
  puts 'No'
end