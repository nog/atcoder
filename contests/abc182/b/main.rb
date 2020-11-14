N = gets.to_i
A = gets.split.map(&:to_i)

require 'prime'

hash = {}
A.each do |a|
    a.prime_division.each do |a, b|
        if hash[a]
            hash[a] += 1
        else
            hash[a] = 1
        end
    end
end

result = nil
count = 0

hash.keys.each do |k|
    if hash[k] > count
        result = k
        count = hash[k]
    end
end

puts result