N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

hash = Hash.new 0
A.each do |a|
    hash[a] += 1
end

keys = hash.keys.sort
result = 0
max = [K, hash[0]].min
if max == 0
    puts 0
    exit
end
1.upto(30000) do |i|
    if hash[i] == 0
        result += i * max
        break
    end
    ne = hash[i]
    if ne > max
        ne = max
    end
    result += i * (max - ne)
    max = ne
end

puts result