H, W, A, B = gets.split.map(&:to_i)

map = Array.new(H){ Array.new(W)}

queue = [[map, A, B, [0,0]]]
result = 0

def next_point map, point
    y, x = point
    y.upto(H-1) do |_y|
        0.upto(W-1) do |_x|
            return [_y, _x] unless map[_y][_x]
        end
    end
    raise
end

while(map, a, b, point = queue.shift) do
    y, x = point
    if b > 0
        if a == 0 && b == 1
            result += 1
        else
            nmap = Marshal.load(Marshal.dump(map))
            nmap[y][x] = true
            queue.push([nmap, a, b - 1, next_point(nmap, point)])
        end
    end

    if a > 0
        if x+1 < W && !map[y][x+1]
            if a == 1 && b == 0
                result += 1
            else
                nmap = Marshal.load(Marshal.dump(map))
                nmap[y][x] = true
                nmap[y][x+1] = true
                queue.push([nmap, a - 1, b, next_point(nmap, point)])
            end
        end
        if y+1 < H && !map[y+1][x]
            if a == 1 && b == 0
                result += 1
            else
                nmap = Marshal.load(Marshal.dump(map))
                nmap[y][x] = true
                nmap[y+1][x] = true
                queue.push([nmap, a - 1, b, next_point(nmap, point)])
            end
        end
    end
end

puts result