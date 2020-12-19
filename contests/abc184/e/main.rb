H, W = gets.split.map(&:to_i)
INF=999999999
field = Array.new(H+2)
steps = Array.new(H+2){ [INF] + [nil]* W + [INF]}
field[0] = [false] * (W + 2)
steps[0] = [INF] * (W + 2)
marks = {}
start = nil
gx, gy = nil
1.upto(H) do |h|
    line = gets.chomp.split('').map.with_index do |s, w|
        if s == '.'
            true
        elsif s == '#'
            steps[h][w+1] = INF
            false
        elsif s == 'S'
            start = [h, w+1]
            true
        elsif s == 'G'
            gy, gx = h, w+1
            true
        else
            marks[s] ||= []
            marks[s].push([h, w+1])
            s
        end
    end
    field[h] =[false, *line, false]
end
field[H+1] = [false] * (W + 2)
steps[H+1] = [INF] * (W + 2)

steps[start[0]][start[1]] = 0

queue = [[start[0], start[1]]]

while (y, x = queue.shift) do
    nstep = steps[y][x] + 1
    if !steps[y+1][x]
        steps[y+1][x] = nstep
        queue.push([y+1, x])
    end
    if !steps[y-1][x]
        steps[y-1][x] = nstep
        queue.push([y-1, x])
    end
    if !steps[y][x+1]
        steps[y][x+1] = nstep
        queue.push([y, x+1])
    end
    if !steps[y][x-1]
        steps[y][x-1] = nstep
        queue.push([y, x-1])
    end
    if warps = marks.delete(field[y][x])
        warps.each do |_y, _x|
            next if steps[_y][_x]
            steps[_y][_x] = nstep
            queue.push([_y, _x])
        end
    end
end
puts steps[gy][gx] || -1