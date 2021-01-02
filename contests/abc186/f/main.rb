H, W, M = gets.split.map(&:to_i)

bottoms = Array.new W+1, H+1 
lines = Array.new(H+1){ [] }
M.times do |i|
    y, x = gets.split.map(&:to_i)
    if bottoms[x] > y
        bottoms[x] = y
    end
    lines[y].push(x)
end

result = 0

lines[1].sort!
warn lines[1].inspect
BOTTOM_W = lines[1].first ? (lines[1].first) -1 : W

1.upto(BOTTOM_W) do |w|
    result += bottoms[w] - 1
end

blocks = []
blocks_hash = {}
1.upto(H) do |h|
    line = lines[h].sort
    if line.size > 0
        left = line[0]
        if left > BOTTOM_W
            result += left - BOTTOM_W - 1
            left = BOTTOM_W + 1
        end
        blocks.sort!
        blocks.each do |b|
            break if left <= b
            result += 1
        end
        line.each do |l|
            break if l > BOTTOM_W
            next if blocks_hash[l]
            blocks.push(l)
            blocks_hash[l] = true
        end
    else
        result += W - BOTTOM_W + blocks.size
    end
end

puts result