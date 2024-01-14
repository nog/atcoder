N = gets.to_i
hash = {}
res = 0
N.times do 
    s = gets.chomp
    s = [s, s.reverse].min
    next if hash[s]
    hash[s] = true
    res += 1
end

puts res