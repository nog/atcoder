N, K = gets.split.map(&:to_i)
P = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)

loops = []
checked = {}
N.times do |i|
    next if checked[i]
    hist = []
    points = []
    be = i
    while(true) do
        ne = P[be] - 1
        hist.push(be)
        checked[ne] = true
        points.push(C[ne])
        if ne == i
            loops.push({
                count: hist.size,
                hist: hist,
                points: points,
                sum: points.sum
            })
            break
        end
        be = ne
    end
end
warn "--"

result  = -999999999999999
loops.each do |l|
    warn l.inspect
    cnt = l[:count]
    q = []
    if K <= cnt
        q.push([0, K])
    else
        if l[:sum] <= 0
            q.push([0, cnt])
        else
            q.push([K / cnt, K % cnt])
            q.push([(K / cnt) - 1, cnt])
        end
    end
    s = Array.new cnt, -999999999
    s[0] = 0
    cnt.times do |i|
        po = 0
        (cnt - 1).times do |j|
            po += l[:points][(i+j) % cnt]
            if po > s[j+1]
                s[j+1] = po
            end
        end
    end
    q.each do |qq|
        point = 0
        k = qq[1]
        lcount = qq[0]
        point = s[(lcount > 0 ? 0 : 1)..k].max
        point += l[:sum] * lcount
        result = point if point > result
    end
end

puts result