N, M = gets.split.map(&:to_i)
H = gets.split.map(&:to_i).sort
W = gets.split.map(&:to_i).sort

oddsum = Array.new(N/2+1)
evensum = Array.new(N/2+1)
oddsum[0] = 0
evensum[0] = 0
N.times do |i|
    if i.odd?
        oddsum[(i/2)+1] = oddsum[i/2] + H[i]
    else
        evensum[(i/2)+1] = evensum[i/2] + H[i]
    end
end

result = 9999999999999999999999999
i = 0
W.each do |w|
    break unless H[i]
    while(H[i] && H[i] < w)
        i+=1
    end
    res = 0
    if i.even?
        res += oddsum[i/2]
        res -= evensum[i/2]
        res -= w
        res += evensum[-1] - evensum[i/2]
        res -= oddsum[-1] - oddsum[i/2]
    else
        res += oddsum[i/2]
        res -= evensum[(i/2)+1]
        res += w
        res += evensum[-1] - evensum[i/2+1]
        res -= oddsum[-1] - oddsum[i/2]
    end
    if res < result
        result = res
    end
end

puts result