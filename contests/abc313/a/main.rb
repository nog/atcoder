N = gets.to_i
P = gets.split.map(&:to_i)

max = P.max
max_count = P.count(max)
target = P[0]

if target == max
    if max_count == 1
        puts 0
        exit
    else
        puts 1
        exit
    end
else
    puts max - target + 1
end