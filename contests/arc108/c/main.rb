N, M = gets.split.map(&:to_i)
points = Array.new(N){ [] }
results = Array.new N 

M.times do  |i|
    u, v, c = gets.split.map(&:to_i)
    u -= 1
    v -= 1
    points[u].push [v, c]
    points[v].push [u, c]
end

queue = []
results[0] = points[0][0][1]
points[0].each do |v, c|
    queue.push([0, v, c])
end

while q = queue.shift do
    u, v, c = q
    if results[u] == c
        results[v] = (c == 1) ? 2 : 1
    else
        results[v] = c
    end
    points[v].each do |nv, nc|
        next if results[nv]
        queue.push([v, nv, nc])
    end
end

N.times do |i|
    puts results[i]
end