N, M = gets.split.map(&:to_i)
L = gets.split.map(&:to_i)
max = L.max

res = (max..10**15).bsearch do |r|
    c = 0
    x = 0
    L.each do |l|
        if x == 0
            x += l
        elsif x + l + 1 > r
            x = l
            c += 1
        else
            x += l + 1
        end
        if c >= M
            # warn "XX r:#{r} c:#{c} x:#{x}"
            break
        end
    end
    c < M
end
puts res