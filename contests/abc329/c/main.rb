N = gets.to_i
S = gets.chomp

hash = {}
bs = nil
x = ""
c = 0
S.split('').each do |s|
    if bs == s
        c += 1
    else
        bs = s
        c = 1
    end
    hash[s] = c if (hash[s] || 0) < c
end

puts hash.values.sum