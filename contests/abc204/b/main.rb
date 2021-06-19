N = gets.to_i 
A = gets.split.map(&:to_i)

result = 0
A.each do |a|
    if a > 10
        result += a - 10
    end
end

puts result