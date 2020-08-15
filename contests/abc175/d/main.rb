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
        warn ne
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

result  = C[0]
loops.each do |l|
    warn l.inspect
    point = l[:points][0]
    cnt = l[:count]
    k = nil
    if l[:sum] > 0
        k = K % cnt
    else
        k = K > cnt ? cnt : K
    end
    cnt.times do |i|
        po = 0
        k.times do |j|
            po += l[:points][(i+j) % cnt]
            if po > point
                point = po
            end
        end
    end
    if l[:sum] > 0
        point += l[:sum] * (K / cnt)
    end
    if point > result
        result = point
    end
end

puts result