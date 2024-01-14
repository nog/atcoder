N = gets.to_i
A = gets.split.map(&:to_i)

hash = {}
A.each do |a|
    hash[a] = true
end

max = hash.keys.max
hash.delete(max)

puts hash.keys.max