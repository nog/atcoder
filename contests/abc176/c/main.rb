N = gets.to_i
A = gets.split.map(&:to_i)

before = 0
result = 0
A.each do |a|
    if a < before
        result += before - a
        a = before
    end
    before = a
end

puts result