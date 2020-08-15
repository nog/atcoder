N = gets.to_i
L = gets.split.map(&:to_i).sort

result = 0
L.combination(3).each do |a,b,c|
    if a == b || a == c || b == c
        next
    end
    if a < b + c && b < a + c && c < a + b
        result += 1
    end
end

puts result