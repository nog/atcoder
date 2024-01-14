N, M, P = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort
B = gets.split.map(&:to_i).sort
bsum = B.sum

res = 0
A.each.with_index do |a, j|
    while(B[0] && B[-1] + a >= P) do
        b = B.pop
        bsum -= b
        res += (N - j) * P
    end

    res += a * B.size + bsum
end

puts res