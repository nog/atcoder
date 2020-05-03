n = gets.to_i
hash = {}
n.times do |i|
  hash[gets.chomp] = 1
end

puts hash.keys.size