N, X, Y = gets.split.map(&:to_i)
PT = []
(N-1).times do
    PT.push(gets.split.map(&:to_i))
end
Q = gets.to_i

results = []
8.times do |i|
    q = i
    PT.each do |_p, _t|
        if q % _p > 0
            q += _p - (q % _p)
        end
        q += _t
    end
    results.push(q)
end

Q.times do
    q = gets.to_i
    q += X
    q += results[q%8]
    puts q + Y
end