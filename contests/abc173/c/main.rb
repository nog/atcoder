H, W, K = gets.split.map(&:to_i)
c = Array.new H
total = 0
h_count = Array.new H
H.times do |i|
    c[i] = gets.split('')
    h_count = c[i].count('#')
    total += h_count
end

result = 0
hlist = (0..H-1).to_a
wlist = (0..W-1).to_a
0.upto(H) do |hc|
    hlist.combination(hc) do |delhlist|
        dels = 0
        delhlist.each do |dh|
            dels += h_count[dh]
        end
        next if total - dels < K
        map = c.reject.with_index do |_, i|
            delhlist.include?(i)
        end
        w_count = Array.new W
        W.times do |w|
            cx = 0
            map.each do |line|
                cx += 1 if line[w] == "#"
            end
            w_count[w] = cx
        end
        0.upto(W) do |wc|
            wlist.combination(wc) do |cntlist|
                cnt = 0
                cntlist.each do |cl|
                    cnt += w_count[cl]
                end
                if cnt == K
                    result += 1
                end
            end
        end
    end
end

puts result