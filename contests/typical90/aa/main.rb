N = gets.to_i
hash = {}
N.times do |i|
  s = gets.chomp
  next if hash[s]
  hash[s] = true
  puts i+1
end