N, M = gets.split.map(&:to_i)
C = gets.chomp.split
D = gets.chomp.split
P = gets.split.map(&:to_i)

chash = {}
D.each.with_index do |d, i|
    chash[d] = i
end

res = 0
C.each do |c|
    if chash[c]
        res += P[chash[c]+1]
    else
        res += P[0]
    end
end

puts res