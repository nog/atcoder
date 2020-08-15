N, D = gets.split.map(&:to_i)
res = 0
N.times do
    x, y = gets.split.map(&:to_i)
    if x**2 + y**2 <= D**2
        res += 1
    end
end

puts res