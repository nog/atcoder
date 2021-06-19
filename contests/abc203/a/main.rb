a, b, c = gets.split.map(&:to_i)

hash = {}
hash[a] ||= 0
hash[a] += 1
hash[b] ||= 0
hash[b] += 1
hash[c] ||= 0
hash[c] += 1

if hash.keys.size == 3
    puts 0
else
    hash.keys.each do |k|
        if hash[k] == 1 || hash[k] == 3
            puts k
            exit
        end
    end
end