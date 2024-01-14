N = gets.to_i
hash = {}
N.times do
    s, c = gets.split.map(&:to_i)
    hash[s] = c
end

hash.keys.sort.each do |k|
    kk = k
    while((c = hash[kk]) > 1) do
        hash[kk] = c % 2
        kk *= 2
        hash[kk] ||= 0
        hash[kk] += c / 2
    end
end

puts hash.values.sum