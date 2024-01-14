N = gets.to_i

yaku = []
1.upto(9) do |j|
    yaku.push(j) if N % j == 0
end

result = []
0.upto(N) do |i|
    r = nil
    yaku.each do |j|
        if i % (N/j) == 0
            r = j
            break
        end
    end
    result.push(r || '-')
end

puts result.join('')