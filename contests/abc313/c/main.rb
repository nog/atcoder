N = gets.to_i
A = gets.split.map(&:to_i).sort

sum = A.sum
t = sum / N

res = 0
res2 = 0
A.each do |a|
    if t <= a
        res2 += a - (t+1)
    else
        res += t - a
    end
end

puts [res, res2].max