N, X = gets.split.map(&:to_i)
S = gets.chomp

result = X
N.times do |i|
    if S[i] == 'o'
        result += 1
    else
        result -= 1
    end
    result = 0 if result < 0
end

puts result